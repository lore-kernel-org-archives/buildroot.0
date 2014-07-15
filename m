From: Jordi Llonch <jordi.llonch@rochsystems.com>
Date: Tue, 15 Jul 2014 18:07:42 +0000
Subject: [Buildroot] [PATCH 1/1] PHP-FPM support
Message-ID: <1405447663-2109-1-git-send-email-jordi.llonch@rochsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
+PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
 ### Extensions
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
-- 
1.9.1
