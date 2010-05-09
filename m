From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:35 +0200
Subject: [Buildroot] [PATCH 1/9] php: make sure either CLI or CGI is selected
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fcdc9f891d28af2c81fc3f74d4054895b8f228ae.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When neither CLI nor CGI is selected, PHP's configure script fails
with:

checking whether to build CGI binary... configure: error: No SAPIs selected.

Of couse, the help text of the options says that at least one of them
should be selected, but when doing testing with randpackageconfig,
noone is reading these help texts.

Therefore, based on the suggestion of Yann E. Morin, modify the
Config.in organization so that at least one of the option is selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.in |   38 ++++++++++++++++++++++++++++----------
 1 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index aef6e58..23d86e4 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -7,21 +7,40 @@ config BR2_PACKAGE_PHP
 
 	  http://www.php.net
 
+if BR2_PACKAGE_PHP
+
 config BR2_PACKAGE_PHP_CLI
+       bool
+
+config BR2_PACKAGE_PHP_CGI
+       bool
+
+choice
+        prompt "PHP interface"
+        default BR2_PACKAGE_PHP_SAPI_CGI
+        help
+          Select the PHP interface(s).
+
+config BR2_PACKAGE_PHP_SAPI_CLI
         bool "cli interface"
-        depends on BR2_PACKAGE_PHP
-        default y
+	select BR2_PACKAGE_PHP_CLI
         help
-          command line interface for php.
-          you must have at least cli or cgi selected.
+          Command line interface for PHP.
 
-config BR2_PACKAGE_PHP_CGI
+config BR2_PACKAGE_PHP_SAPI_CGI
         bool "cgi interface"
-        depends on BR2_PACKAGE_PHP
-        default y
+        select BR2_PACKAGE_PHP_CGI
         help
-          cgi interface for php
-          you must have at least cli or cgi selected.
+          CGI interface for PHP.
+
+config BR2_PACKAGE_PHP_SAPI_CLI_CGI
+        bool "cli and cgi interfaces"
+	select BR2_PACKAGE_PHP_CLI
+	select BR2_PACKAGE_PHP_CGI
+	help
+	  Command line and CGI interfaces for PHP.
+
+endchoice
 
 config BR2_PACKAGE_PHP_FASTCGI
         bool "fastcgi"
@@ -30,6 +49,5 @@ config BR2_PACKAGE_PHP_FASTCGI
         help
           fast cgi interface for php
 
-if BR2_PACKAGE_PHP
 source "package/php/Config.ext"
 endif
-- 
1.6.3.3
