From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Dec 2016 23:29:16 +0100
Subject: [Buildroot] [PATCH v7,1/1] php: add apache support
Message-ID: <1481495356-24462-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Continue work started by Bernd Kuhls in
https://patchwork.ozlabs.org/patch/437544/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v6 -> v7:
 - Put apxs fix in php configure inside a dedicated patch to make it more
   readable

Changes v5 -> v6 (after review of Thomas Petazzoni):
 - Remove BR2_PACKAGE_PHP_HAS_SAPI as this option no longer exists
 - Remove hooks on apxs configuration file as this solution was ugly
 - Clearly state in comment that apxs is an apache script
 - Update configure script to pass down -S PREFIX='$(INSTALL_ROOT)/usr'
   to apxs

Changes v4 -> v5 (after review of Arnout Vandecappelle):
 - Patch on pthread detection has been merged upstream and is available
   in php 7.0.14 so https://patchwork.ozlabs.org/patch/670567/
   has been set as "Not Applicable"
 - Remove hook added in v4 and let php updates the apache configuration
   file
 - Patch apxs configuration file to update httpd.conf in the target
   directory with the correct relative path. Without these hooks, apxs
   will only update correctly the httpd.conf in the staging directory

Changes v3 -> v4 (after review of Yann Morin):
 - Do not select apache but depends on it
 - Move pthread detection fix in a separate patch
 - Remove unneeded configuration options such as --with-config-file-path
 - Do not allow php to update apache configuration file by removing -a
   argument from apxs call

Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Remove unneeded php-04-apache.patch
 - Fix pthread detection if Apache MPM is event or worker
 - Update pthread detection mechanism (--enable-pthreads does not exist
   anymore)
 - Remove unneeded --oldincludedir
 - Fix php module path

 .../php/0008-Call-apxs-with-correct-prefix.patch   | 49 ++++++++++++++++++++++
 package/php/Config.in                              |  7 ++++
 package/php/php.mk                                 | 10 +++++
 3 files changed, 66 insertions(+)
 create mode 100644 package/php/0008-Call-apxs-with-correct-prefix.patch

diff --git a/package/php/0008-Call-apxs-with-correct-prefix.patch b/package/php/0008-Call-apxs-with-correct-prefix.patch
new file mode 100644
index 0000000..b850ab7
--- /dev/null
+++ b/package/php/0008-Call-apxs-with-correct-prefix.patch
@@ -0,0 +1,49 @@
+From 4342bdea7a1a21430ce0d051fa4387441166c473 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Sun, 11 Dec 2016 23:12:46 +0100
+Subject: [PATCH] Call apxs with correct prefix
+
+php uses apache's apxs script from staging directory to install libphp
+dynamic library and update /etc/apache2/httpd.conf in the staging and target
+directories. Here is the full command line:
+"apxs -S LIBEXECDIR='$(INSTALL_ROOT)/usr/modules'
+ -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2' -i -a -n php7"
+This does not work for target directory as apxs sets the full path of the
+library and not the relative one. Indeed, apxs is smart enough to substitute
+away the prefix specified in $(STAGING_DIR)/usr/build/config_vars.mk so
+httpd.conf will only be correct in the staging directory.
+To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ sapi/apache2handler/config.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/sapi/apache2handler/config.m4 b/sapi/apache2handler/config.m4
+index 2e64b21..f5bf002 100644
+--- a/sapi/apache2handler/config.m4
++++ b/sapi/apache2handler/config.m4
+@@ -66,10 +66,12 @@ if test "$PHP_APXS2" != "no"; then
+     AC_MSG_ERROR([Please note that Apache version >= 2.0.44 is required])
+   fi
+ 
++  APXS_PREFIX='$(INSTALL_ROOT)'/usr
+   APXS_LIBEXECDIR='$(INSTALL_ROOT)'`$APXS -q LIBEXECDIR`
+   if test -z `$APXS -q SYSCONFDIR`; then
+     INSTALL_IT="\$(mkinstalldirs) '$APXS_LIBEXECDIR' && \
+                  $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
++                       -S PREFIX='$APXS_PREFIX' \
+                        -i -n php7"
+   else
+     APXS_SYSCONFDIR='$(INSTALL_ROOT)'`$APXS -q SYSCONFDIR`
+@@ -77,6 +79,7 @@ if test "$PHP_APXS2" != "no"; then
+                 \$(mkinstalldirs) '$APXS_SYSCONFDIR' && \
+                  $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
+                        -S SYSCONFDIR='$APXS_SYSCONFDIR' \
++                       -S PREFIX='$APXS_PREFIX' \
+                        -i -a -n php7"
+   fi
+ 
+-- 
+2.5.0
+
diff --git a/package/php/Config.in b/package/php/Config.in
index 57dabc4..0fb8006 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PHP
 	bool "php"
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
+	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
 	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
 	       BR2_USE_MMU
@@ -14,6 +15,12 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
+config BR2_PACKAGE_PHP_SAPI_APACHE
+	bool "Apache interface"
+	depends on BR2_PACKAGE_APACHE
+	help
+	  Apache module
+
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI interface"
 	# CGI uses fork()
diff --git a/package/php/php.mk b/package/php/php.mk
index 8c1ccef..e8c8f4b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -81,6 +81,16 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
+PHP_DEPENDENCIES += apache
+PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
+
+# Enable thread safety option if Apache MPM is event or worker
+ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT)$(BR2_PACKAGE_APACHE_MPM_WORKER),y)
+PHP_CONF_OPTS += --enable-maintainer-zts
+endif
+endif
+
 ### Extensions
 PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
-- 
2.5.0
