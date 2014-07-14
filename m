From: Jordi Llonch <jordi.llonch@rochsystems.com>
Date: Tue, 15 Jul 2014 08:58:42 +1000
Subject: [Buildroot] [PATCH 1/1] PHP-FPM support
In-Reply-To: <53C4598E.90000@zacarias.com.ar>
References: <1405365326-2414-1-git-send-email-jordi.llonch@rochsystems.com>
 <53C4598E.90000@zacarias.com.ar>
Message-ID: <FEA3AD43-7908-460F-B390-077CBD689B37@rochsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Gustavo, 
This is my first contribution to the project and I appreciate your guidance.

Will those changes suit better?


Signed-off-by: Jordi Llonch <jordi.llonch@rochsystems.com>
---
 package/php/Config.in | 18 ++++++++++++++++++
 package/php/php.mk    |  1 +
 2 files changed, 19 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 46444a5..4ee14c3 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_PHP_CLI
 config BR2_PACKAGE_PHP_CGI
 	bool

+config BR2_PACKAGE_PHP_FPM
+        bool
+
 choice
 	prompt "Interface"
 	default BR2_PACKAGE_PHP_SAPI_CGI
@@ -37,6 +40,13 @@ config BR2_PACKAGE_PHP_SAPI_CLI
 	help
 	  Command Line Interface

+config BR2_PACKAGE_PHP_SAPI_FPM
+	bool "FPM"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_PHP_FPM
+	help
+	  PHP-FPM (FastCGI Process Manager)
+
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "CGI and CLI"
 	# CGI uses fork()
@@ -46,6 +56,14 @@ config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	help
 	  Command line and Common gateway interfaces

+config BR2_PACKAGE_PHP_SAPI_CLI_FPM
+	bool "FPM and CLI"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_PHP_CLI
+	select BR2_PACKAGE_PHP_FPM
+	help
+	  Command line and PHP-FPM (FastCGI Process Manager)
+
 endchoice

 endif
diff --git a/package/php/php.mk b/package/php/php.mk
index 4d3aa7d..5a91f9c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -47,6 +47,7 @@ endif

 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
+PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable--fpm)

 ### Extensions
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
--
1.9.1


El 15/07/2014, a las 08:28, Gustavo Zacarias <gustavo@zacarias.com.ar> escribi?:

> On 07/14/2014 04:15 PM, Jordi Llonch wrote:
> 
> Hi, let's look at this.
> 
>> +config BR2_PACKAGE_PHP_SAPI_FPM
>> +	bool "FPM"
>> +	select BR2_PACKAGE_PHP_FPM
>> +	help
>> +	  PHP-FPM (FastCGI Process Manager)
>> +
> 
> Pretty sure it depends on MMU just like CGI does.
> 
>> +config BR2_PACKAGE_PHP_SAPI_CLI_FPM
>> +	bool "FPM and CLI"
>> +	select BR2_PACKAGE_PHP_CLI
>> +	select BR2_PACKAGE_PHP_FPM
>> +	help
>> +	  Command line and PHP-FPM (FastCGI Process Manager)
>> +
> 
> Another option for FPM alone would be good too, not everyone needs CLI
> and php binaries are somewhat big.
> 
>> +PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm --disable-cgi,--disable--fpm)
> 
> This should focus on just enable/disabling it's own option, cgi disables
> itself via:
> 
> PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
> 
> So no need to re-state that.
> Regards.
> 
