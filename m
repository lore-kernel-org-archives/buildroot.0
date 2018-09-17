From: Pierret David <david.pierret@smile.fr>
Date: Mon, 17 Sep 2018 13:30:49 +0200
Subject: [Buildroot] [PATCH 2/2] monkey: add option for SSL/TLS plugin
 compilation
In-Reply-To: <cec8070d-680a-c016-00a4-48b273f7b417@smile.fr>
References: <2120fe96-83cd-3d1e-0bfb-e085dafaad36@smile.fr>
 <20180917120155.617afb89@windsurf>
 <cec8070d-680a-c016-00a4-48b273f7b417@smile.fr>
Message-ID: <5395d263-a2c9-e04a-7acc-02ba8d21eb68@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This commit add an option to enable SSL/TLS plugin compilation who is 
not build
by default.

Signed-off-by: David Pierret <david.pierret@gmail.com>
---
  package/monkey/Config.in | 6 ++++++
  package/monkey/monkey.mk | 4 ++++
  2 files changed, 10 insertions(+)

diff --git a/package/monkey/Config.in b/package/monkey/Config.in
index 9054aa0..fdfa148 100644
--- a/package/monkey/Config.in
+++ b/package/monkey/Config.in
@@ -17,6 +17,12 @@ config BR2_PACKAGE_MONKEY_SHARED
  	  Build Monkey as a shared library in addition to stand-alone
  	  server

+config BR2_PACKAGE_MONKEY_SSL
+	bool "enable SSL/TLS"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Enable build of the SSL/TLS plugin.
+
  endif

  comment "monkey needs an toolchain w/ threads, dynamic library"
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 58bc26e..427f359 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -48,6 +48,10 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
  MONKEY_CONF_OPTS += --debug
  endif

+ifeq ($(BR2_PACKAGE_MONKEY_SSL),y)
+MONKEY_CONF_OPTS += --enable-plugins=tls --mbedtls-shared
+endif
+
  define MONKEY_CONFIGURE_CMDS
  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(MONKEY_CONF_OPTS))
  endef
-- 
2.7.4


Le 17/09/2018 ? 13:29, Pierret David a ?crit?:
> Hello Thomas,
> 
> Thank's for review
> 
>>> We always want to use external libraries instead of bundled libraries.
> 
> Ok, I define the mbedtls as a select.
> I'm not yet comfortable with mailing list :/
> 
> Regards,
> David
> 
> Le 17/09/2018 ? 12:01, Thomas Petazzoni a ?crit?:
>> Hello David,
>>
>> Thanks for your contribution!
>>
>> On Mon, 17 Sep 2018 12:09:01 +0200, Pierret David wrote:
>>> This commit add an option to enable SSL/TLS plugin compilation who is
>>> not build
>>> by default.
>>> If mbedtls library is selected, she will be used instead of build-in 
>>> one.
>>
>> We always want to use external libraries instead of bundled libraries.
>>
>>> +config BR2_PACKAGE_MONKEY_SSL
>>> +??????? bool "enable SSL/TLS"
>>> +??????? help
>>> +????????? Enable build of the SSL/TLS plugin.
>>
>> Please use one tab to indent bool and help, and one tab + two spaces to
>> indent the help text.
>>
>> Make sure to run "make check-package" after your changes to verify that
>> you do not introduce coding style issues such as those ones.
>>
>>> +ifeq ($(BR2_PACKAGE_MONKEY_SSL), y)
>>
>> No space before "y".
>>
>>> +MONKEY_CONF_OPTS += --enable-plugins=tls
>>> +# If we already have TLS/SSL library, use it.
>>> +ifeq ($(BR2_PACKAGE_MBEDTLS), y)
>>> +MONKEY_CONF_OPTS += --mbedtls-shared
>>> +endif
>>> +endif
>>
>> Thanks!
>>
>> Thomas
>>
> 

-- 
<div>
     <link href="https://fonts.googleapis.com/css?family=Raleway" 
rel="stylesheet" type="text/css">
     <font face="Raleway, regular">
     <table style="padding:20px;margin-bottom:-10px" border=0>
         <tbody>
         <tr>
             <td style="font-size:13px; color:#ff8054; text-align: 
center; padding-right:30px">
                 <a href="http://www.smile.eu/">
                     <img style="max-width:100%; height:auto" 
src="http://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" 
alt="SMILE"/>
                 </a><br/><br/>
                     <p style="line-heigth:8px">2 Esplanade Compans 
Caffarelli, 31100 Toulouse</p>
             </td>
             <td style="border-left: 1px solid #3b7ffe; 
padding-left:20px; font-size:13px; color:#ff8054;">
                 <div style="color:#ff8054; font-size:14px;">
                     <b>David PIERRET</b>
                 </div>
                 <div style="color:#3b7ffe; font-size:13px;">
                     Ing?nieur Etude et D?veloppement<br>

                 </div><br>
                 <div style="color:#3b7ffe; font-size:13px;">
                     <span style="white-space: nowrap"><img 
style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/mail.png" 
alt="email" width="12" height="10" />
                         <a href="mailto:david.pierret@smile.fr" 
style="color:#3b7ffe; font-size:13px; 
text-decoration:none;">david.pierret at smile.fr</a>
                     </span>
                      <br>
                                     <span style="white-space: 
nowrap"><img style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/phone.png" 
alt="phone" width="10" height="10" /></span>
 
+33662312341
                                     <br>
                                                     <span 
style="white-space: nowrap"><img style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/web.png" 
alt="url" width="12" height="12" />
<a href="http://www.smile.eu/" style="color:#3b7ffe; font-size:13px; 
text-decoration:none;">http://www.smile.eu/</a>
                   </span>
                                 </div>

                 <br>
                 <div>
                     <span><a style="margin-right:5px" 
href="https://twitter.com/openwide_inge"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-twitter.png" 
alt="Twitter" style="max-width:100%; height:auto"/></a></span>
                     <span><a style="margin-right:5px" 
href="https://www.facebook.com/smileopensource"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-facebook.png" 
alt="Facebook" style="max-width:100%; height:auto"></a></span>
                     <span><a style="margin-right:5px" 
href="https://fr.linkedin.com/in/david-pierret-11912290"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-linkedin.png" 
alt="LinkedIn" style="max-width:100%; height:auto"/></a></span>
                     <span><a style="margin-right:5px" 
href="https://github.com/Smile-SA"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-github.png" 
alt="Github" style="max-width:100%; height:auto"/></a></span>
                 </div>
             </td>
         </tr>
         </tbody>
     </table>
     <br>
     <div> <a 
href="https://www.smile.eu/fr/publications/livres-blancs/freertos-aws?utm_source=signature&amp;utm_medium=email&amp;utm_campaign=signature"><img 
src="https://signature.smile.eu/assets/img/bandeaux_signature_mail_FreeRTOS.gif.gif" 
alt="D?couvrez l?univers Smile, rendez-vous sur smile.eu" border="0" 
/></a></div>
     <br>
     <div style="color:#a3acb5; font-size:10px;">
         <img 
src="http://ftp.smile.fr/client/Communication/signature/img/eco.png" 
alt="eco" width="13" height="11" />
             Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
     </div>
     </font>
</div>
