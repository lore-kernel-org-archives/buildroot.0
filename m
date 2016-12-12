From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:46:19 +0100
Subject: [Buildroot] [git commit] php: add apache support
Message-ID: <20161212214832.7B53B81732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f65e462da2b1100fb407b1409278bf42d6cc5ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Continue work started by Bernd Kuhls in
https://patchwork.ozlabs.org/patch/437544/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../php/0009-Call-apxs-with-correct-prefix.patch   | 49 ++++++++++++++++++++++
 package/php/Config.in                              |  7 ++++
 package/php/php.mk                                 | 10 +++++
 3 files changed, 66 insertions(+)

diff --git a/package/php/0009-Call-apxs-with-correct-prefix.patch b/package/php/0009-Call-apxs-with-correct-prefix.patch
new file mode 100644
index 0000000..b850ab7
--- /dev/null
+++ b/package/php/0009-Call-apxs-with-correct-prefix.patch
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
