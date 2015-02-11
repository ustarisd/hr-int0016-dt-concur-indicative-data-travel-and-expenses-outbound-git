<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xtt="urn:com.workday/xtt"
    xmlns:ws="urn:com.workday/workersync"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:etv="urn:com.workday/evt"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://exslt.org/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0">
    
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 3, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0016 Concur Indicative Data Travel and Expenses Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="ws:Worker_Sync">
        
        
        
        <File xtt:separator="&#xA;" xtt:align="left" xtt:severity="warning">


        
            <xsl:for-each select="ws:Worker">
        
        <!-- Record 100 -->
            <Record100 xtt:separator="," xtt:quotes="csv" xtt:align="left">  
                <TransactionType xtt:attribute="Record 100 Transaction Type"></TransactionType>
                <ErrorThreshold xtt:attribute="Error Threshold"></ErrorThreshold>
                <PasswordGeneration xtt:attribute="Password Generation"></PasswordGeneration>
                <ExistingRecordHandling xtt:attribute="Existing Record Handling"></ExistingRecordHandling>
                <LanguageCode xtt:attribute="Language Code"></LanguageCode>
                <ValidateExpenseGroup xtt:attribute="Validate Expense Group"></ValidateExpenseGroup>
                <ValidatePaymentGroup xtt:attribute="Validate Payment Group"></ValidatePaymentGroup>
          
            </Record100>
                
                
                <!-- Record 300 -->
                <Record300 xtt:separator="," xtt:quotes="csv" xtt:align="left">  
                    <TransactionType  xtt:attribute="Record 300 Transaction Type"></TransactionType>
                    <FirstName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:First_Name[1]"/></FirstName>
                    <MiddleName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Middle_Name[1]"/></MiddleName>
                    <LastName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Last_Name[1]"/></LastName>
                    <EmployeeID><xsl:value-of select="ws:Summary/ws:Employee_ID"/></EmployeeID>
                    <LoginID>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Email_Data/ws:Email_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Email_Data[1]/ws:Email_Address[1]"/>
                            </xsl:when>
                        </xsl:choose>
                    </LoginID>
                    <LocaleCode xtt:attribute="Locale Code"></LocaleCode>
                    <CountryCode>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Country"/>
                            </xsl:when>
                        </xsl:choose>
                    </CountryCode>
                    <LedgerCode xtt:attribute="Ledger Code"></LedgerCode>
                    <ReimbursementCurrencyCode><xsl:value-of select="ws:Compensation/ws:Base_Pay_Currency"/></ReimbursementCurrencyCode>
                    <CashAdvanceAccountcode></CashAdvanceAccountcode>
                    <Active>
                    <xsl:choose>
                        <xsl:when test="ws:Status/ws:Active = 'false'">
                            <xsl:text>N</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>Y</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    </Active>
                    <orgUnit1-6/>
                    <Custom1-20/>
                    <employeecustom21/>
                    <sendemailwhencashadvancestatuschanges/>
                    <sendemailwhencashadvancewaitingapproval/>
                    
                    <LocaleCode xtt:attribute="Snd Email when Csh Adv Stat Ch"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Csh Adv Stat App"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Email Whn Rpt Stat Chgs"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Rpt Awt Apprv"></LocaleCode>
                    <LocaleCode xtt:attribute="Prmpt Appr Whn Sbmt Rpt"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Trvl Rq St Ch"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Trv Rq St Appr"></LocaleCode>
                    <LocaleCode xtt:attribute="Prmpt Appr When Sbmt Trv Pymnt"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Pymt Sts Chgs"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Pymt Awt Appr"></LocaleCode>
                    <LocaleCode xtt:attribute="Prmpt Appr When Sbmt Pymnt"></LocaleCode>
                    <LocaleCode xtt:attribute="Prompt to Add CmpCrdTrans"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml Whn Nw Cmp Crd Trs Arr"></LocaleCode>
                    <LocaleCode xtt:attribute="Snd Eml When Fxd Rcpts Arrve"></LocaleCode>
                    <LocaleCode xtt:attribute="Dsp Instr Hip On App Pages"></LocaleCode>
                    <LocaleCode xtt:attribute="Dsply Imaging Intro Page"></LocaleCode>
                    
                    <emppIDexpreseapprover/>
                    <empIdcashapprover/>
                    <empIDrequestapprover/>
                    <EmpIDinvoiceapprover/>
                    
                    <LocaleCode xtt:attribute="Traveler"></LocaleCode>
                    <LocaleCode xtt:attribute="Approver"></LocaleCode>
                    <LocaleCode xtt:attribute="Company Card Administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="Integration Administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="Receipt Processor"></LocaleCode>
                    <LocaleCode xtt:attribute="Authorization Request Approver"></LocaleCode>
                    <LocaleCode xtt:attribute="Integration Administrator (Restricted)"></LocaleCode>
                    <LocaleCode xtt:attribute="Company Info Administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="Offline User"></LocaleCode>
                    <LocaleCode xtt:attribute="Reporting Configuration administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="Invoice User 300"></LocaleCode>
                    <LocaleCode xtt:attribute="Invoice Approver 300"></LocaleCode>
                    <LocaleCode xtt:attribute="Invoice Vendor Manager"></LocaleCode>
                    
                    <expenseauditreq/>
                    <BImanagerempID/>
                    
                    <LocaleCode xtt:attribute="Request User"></LocaleCode>
                    <LocaleCode xtt:attribute="Request Manager"></LocaleCode>
                    
                    <expensereportapproverempID/>
                    
                    <LocaleCode xtt:attribute="A Payment Request has been Assigned"></LocaleCode>
                    <LocaleCode xtt:attribute="Concur Invoice User"></LocaleCode>
                    <LocaleCode xtt:attribute="Travel and Expense User"></LocaleCode>
                    <LocaleCode xtt:attribute="Tax Administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="FBT Administrator"></LocaleCode>
                    <LocaleCode xtt:attribute="Cliqbook User"></LocaleCode>
         
                </Record300>
             
             
             
             
                <!-- Record 310 -->
                <Record310 xtt:separator="," xtt:quotes="csv" xtt:align="left">  
                    <TransactionType  xtt:attribute="Record 310 Transaction Type"></TransactionType>
                    
                    <EmployeeID><xsl:value-of select="ws:Summary/ws:Employee_ID"/></EmployeeID>
                    <LoginID>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Email_Data/ws:Email_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Email_Data[1]/ws:Email_Address[1]"/>
                            </xsl:when>
                        </xsl:choose>
                    </LoginID>
                    <FirstName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:First_Name"/></FirstName>
                    <MiddleName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Middle_Name"/></MiddleName>
                    <LastName><xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Last_Name"/></LastName>
                    
                    <EmailAddress>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Email_Data/ws:Email_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Email_Data[1]/ws:Email_Address[1]"/>
                            </xsl:when>
                        </xsl:choose>
                    </EmailAddress>
                    <Password/>
                    <LocaleCode/>
                    <ExpenseUser xtt:attribute="Expense User"></ExpenseUser>
                    <ExpenseApprover xtt:attribute="Expense Approver"></ExpenseApprover>
                    <InvoiceUser xtt:attribute="Invoice Approver 310"></InvoiceUser>
                    <InvoiceApprover xtt:attribute="Invoice User 310"></InvoiceApprover>
                        <TravelUser xtt:attribute="Travel User"></TravelUser>
                    <Active>
                        <xsl:choose>
                            <xsl:when test="ws:Status/ws:Active = 'false'">
                                <xsl:text>N</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Y</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </Active>
                    <NoMiddleName xtt:attribute="No Middle Name"></NoMiddleName>
                    <LocateandAlert/>
                    <ExpenseItUser xtt:attribute="ExpenseIt User"></ExpenseItUser>
                    <FutureUse5-10/>
                   
                </Record310>
            
            
                <!-- Record 350 -->
                <Record350 xtt:separator="," xtt:quotes="csv" xtt:align="left">  
                    <TransactionType xtt:attribute="Record 350 Transaction Type"></TransactionType>
                    <EmployeeID><xsl:value-of select="ws:Summary/ws:Employee_ID"/></EmployeeID>
                    <Prefix/>
                    <Suffix><xsl:value-of select="ws:Personal/ws:Name_Data/ws:Social_Suffix"/></Suffix>
                    <NickName>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Name_Data/ws:Name_Type = 'Preferred'">
                                <xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Formatted_Name"/>
                            </xsl:when>
                        </xsl:choose>
                    </NickName>
                    <RedressNumber/>
                    <Gender><xsl:value-of select="ws:Personal/ws:Gender"/></Gender>
                    <DateofBirth><xsl:value-of select="ws:Additional_Information/ws:Date_of_Birth"/></DateofBirth>
                    <ManagerCompanyEmpID><xsl:value-of select="ws:Position/ws:Supervisor_ID"/></ManagerCompanyEmpID>
                    <JobTitle><xsl:value-of select="ws:Position/ws:Position_Title"/></JobTitle>
                    <WorkPhone>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Phone_Data/ws:Phone_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Phone_Data/ws:Phone_Number"/>
                            </xsl:when>
                        </xsl:choose>
                
                    </WorkPhone>
                    <WorkPhoneExtension>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Phone_Data/ws:Phone_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Phone_Data/ws:Phone_Extension"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkPhoneExtension>
                    <WorkFax></WorkFax>
                    <HomePhone><xsl:choose>
                        <xsl:when test="ws:Personal/ws:Phone_Data/ws:Phone_Type = 'HOME'">
                            <xsl:value-of select="ws:Personal/ws:Phone_Data/ws:Phone_Number"/>
                        </xsl:when>
                    </xsl:choose>
                    </HomePhone>
                    <CellPhone>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Phone_Data/ws:Phone_Device_Type = 'MOBILE'">
                                <xsl:value-of select="ws:Personal/ws:Phone_Data/ws:Phone_Number"/>
                            </xsl:when>
                        </xsl:choose>
                    </CellPhone>
                    <PagerPhone/>
                    <TravelNameRemark/>
                    <TravelClassName/>
                    <GDSProfileName/>
                    <OrgUnitDivision/>
                    <HomeStreetAddress>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Address_Line_Data"/>
                            </xsl:when>
                        </xsl:choose>
                    </HomeStreetAddress>
                    <HomeCity>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Municipality"/>
                            </xsl:when>
                        </xsl:choose>
                    </HomeCity>
                    <HomeState>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'HOME'">
                                <xsl:value-of select="ws:Additional_Information/ws:Home_State"/>
                            </xsl:when>
                        </xsl:choose>
                    </HomeState>
                    <HomePostalCode>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Postal_Code"/>
                            </xsl:when>
                        </xsl:choose>
                    </HomePostalCode>
                    <HomeCountry>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Country"/>
                            </xsl:when>
                        </xsl:choose>
                    </HomeCountry>
                    <WorkStreetAddress>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Address_Line_Data"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkStreetAddress>
                    <WorkCity>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Municipality"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkCity>
                    <WorkState>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Additional_Information/ws:Work_State"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkState>
                    <WorkPostalCode>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Postal_Code"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkPostalCode>
                    <WorkCountry>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Address_Data/ws:Address_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Address_Data/ws:Country"/>
                            </xsl:when>
                        </xsl:choose>
                    </WorkCountry>
                    <Email2>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Email_Data/ws:Email_Type = 'WORK'">
                                <xsl:value-of select="ws:Personal/ws:Email_Data/ws:Email_Address"/>
                            </xsl:when>
                        </xsl:choose>
                    </Email2>
                    <Email3>
                        <xsl:choose>
                            <xsl:when test="ws:Personal/ws:Email_Data/ws:Email_Type = 'HOME'">
                                <xsl:value-of select="ws:Personal/ws:Email_Data/ws:Email_Address"/>
                            </xsl:when>
                        </xsl:choose>
                    </Email3>
                    <Custom1/>
                    <XMLProfile/>
                    <ProfileUserPermission xtt:attribute="Profile User Permission"></ProfileUserPermission>
                    <AmadeusUserPermission xtt:attribute="Amadeus User Permission"></AmadeusUserPermission>
                    <OpenBookingUserPermission xtt:attribute="Open Booking User Permission"></OpenBookingUserPermission>
                    <FutureUse/>
                   
                    
                </Record350>
  
  
                <!-- Record 800 -->
                <Record800 xtt:separator="," xtt:quotes="csv" xtt:align="left">  
                    <TransactionType  xtt:attribute="Record 800 Transaction Type"></TransactionType>
                    <EmployeeID><xsl:value-of select="ws:Summary/ws:Employee_ID"/></EmployeeID>
                    <futureuse/>
                    <EFTBankAccountNumber><xsl:value-of select="ws:Additional_Information/ws:Bank_Account"/></EFTBankAccountNumber>
                    <EFTBankAccountRoutingNumber><xsl:value-of select="ws:Additional_Information/ws:Routing_Number"/></EFTBankAccountRoutingNumber>
                    <EFTBankAccountType><xsl:value-of select="ws:Additional_Information/ws:Account_Type"/></EFTBankAccountType>
                    <EFTBankAccountCurrencyCode><xsl:value-of select="ws:Additional_Information/ws:Currency"/></EFTBankAccountCurrencyCode>
                    <Active>
                        <xsl:choose>
                            <xsl:when test="ws:Status/ws:Active = 'false'">
                                <xsl:text>N</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Y</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </Active>
                </Record800>
            
        </xsl:for-each>
            
      
        </File>
        
    </xsl:template>
    
</xsl:stylesheet>