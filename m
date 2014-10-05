From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:39:04 +0200
Subject: [Buildroot] [PATCH v2 16/16] package/php: Add Apache support
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.in           |   17 +++++++++++
 package/php/php-04-apache.patch |   63 +++++++++++++++++++++++++++++++++++++++
 package/php/php.mk              |   19 ++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 package/php/php-04-apache.patch

diff --git a/package/php/Config.in b/package/php/Config.in
index 32faa32..db4e647 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -11,6 +11,9 @@ if BR2_PACKAGE_PHP
 
 source "package/php/Config.ext"
 
+config BR2_PACKAGE_PHP_APACHE
+	bool
+
 config BR2_PACKAGE_PHP_CLI
 	bool
 
@@ -26,6 +29,20 @@ choice
 	help
 	  Select the PHP interface(s).
 
+config BR2_PACKAGE_PHP_SAPI_APACHE
+	bool "Apache"
+	select BR2_PACKAGE_APACHE
+	select BR2_PACKAGE_PHP_APACHE
+	depends on !BR2_PREFER_STATIC_LIB # apache
+	depends on BR2_TOOLCHAIN_HAS_THREADS # apache
+	depends on BR2_USE_MMU # apr
+	help
+	  Apache module
+
+comment "apache module needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI"
 	# CGI uses fork()
diff --git a/package/php/php-04-apache.patch b/package/php/php-04-apache.patch
new file mode 100644
index 0000000..aa0dc16
--- /dev/null
+++ b/package/php/php-04-apache.patch
@@ -0,0 +1,63 @@
+Fix cross-compilation when used as Apache module.
+
+Avoid calling the Apache httpd target binary to check for its presence.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr php-5.5.17.org/configure php-5.5.17/configure
+--- php-5.5.17.org/configure	2014-09-16 14:53:57.000000000 +0200
++++ php-5.5.17/configure	2014-10-05 15:06:12.162625672 +0200
+@@ -6342,7 +6342,7 @@
+ 
+   # Test that we're trying to configure with apache 1.x
+ 
+-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
++  ac_output='Server version: Apache/2.4.10 (Unix)'
+   ac_IFS=$IFS
+ IFS="- /.
+ "
+@@ -7626,7 +7626,7 @@
+ 
+   # Test that we're trying to configure with apache 2.x
+ 
+-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
++  ac_output='Server version: Apache/2.4.10 (Unix)'
+   ac_IFS=$IFS
+ IFS="- /.
+ "
+@@ -8332,7 +8332,7 @@
+ 
+     fi
+   else
+-    APACHE_THREADED_MPM=`$APXS_HTTPD -V | grep 'threaded:.*yes'`
++    APACHE_THREADED_MPM="threaded:     yes (fixed thread count)"
+     if test -n "$APACHE_THREADED_MPM"; then
+ 
+   enable_maintainer_zts=yes
+@@ -8450,7 +8450,7 @@
+ 
+   # Test that we're trying to configure with apache 2.x
+ 
+-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
++  ac_output='Server version: Apache/2.4.10 (Unix)'
+   ac_IFS=$IFS
+ IFS="- /.
+ "
+@@ -9156,7 +9156,7 @@
+ 
+     fi
+   else
+-    APACHE_THREADED_MPM=`$APXS_HTTPD -V | grep 'threaded:.*yes'`
++    APACHE_THREADED_MPM="threaded:     yes (fixed thread count)"
+     if test -n "$APACHE_THREADED_MPM"; then
+ 
+   enable_maintainer_zts=yes
+@@ -9255,7 +9255,7 @@
+ 
+   # Test that we're trying to configure with apache 1.x
+ 
+-  ac_output=`$APXS_HTTPD -v 2>&1 | grep version | $SED -e 's/Oracle-HTTP-//'`
++  ac_output='Server version: Apache/2.4.10 (Unix)'
+   ac_IFS=$IFS
+ IFS="- /.
+ "
diff --git a/package/php/php.mk b/package/php/php.mk
index e6c2db7..444c690 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -50,6 +50,25 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+define PHP_FIX_THREADS_DETECTION
+	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
+endef
+# PHP assumes pthreads are not working when cross-compiling,
+# needed for Apache-MPM worker
+PHP_POST_PATCH_HOOKS += PHP_FIX_THREADS_DETECTION
+endif
+PHP_CONF_OPTS += \
+	--with-apxs2=$(STAGING_DIR)/usr/bin/apxs \
+	--with-config-file-path=/etc/apache2 \
+	--with-config-file-scan-dir=/etc/apache2/php \
+	--oldincludedir=$(STAGING_DIR)/usr/include \
+	--enable-pthreads \
+	--localstatedir=/var
+PHP_DEPENDENCIES += apache
+endif
+
 ### Extensions
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
-- 
1.7.10.4
