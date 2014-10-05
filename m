From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 15:45:18 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_8/8=5D_package/php=3A_Add_Apache_s?=
	=?utf-8?q?upport?=
In-Reply-To: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412516718-12597-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.in                            |   17 +++
 package/php/php-04-cross-compile.only-for-apache |  131 ++++++++++++++++++++++
 package/php/php.mk                               |   16 +++
 3 files changed, 164 insertions(+)
 create mode 100644 package/php/php-04-cross-compile.only-for-apache

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
diff --git a/package/php/php-04-cross-compile.only-for-apache b/package/php/php-04-cross-compile.only-for-apache
new file mode 100644
index 0000000..a72befc
--- /dev/null
+++ b/package/php/php-04-cross-compile.only-for-apache
@@ -0,0 +1,131 @@
+Fix cross-compilation when used as Apache module.
+
+Apache is configured to use the worker MPM which depends on threads.
+As PHP?s phtread detection is broken in a cross-compile environment, it is not
+possible to apply this patch unconditionally, since php itself works without
+thread support,
+
+Also avoid calling the Apache httpd target binary to check for its presence.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr php-5.5.17.org/configure php-5.5.17/configure
+--- php-5.5.17.org/configure	2014-09-16 14:53:57.000000000 +0200
++++ php-5.5.17/configure	2014-10-05 15:06:12.162625672 +0200
+@@ -4062,7 +4062,7 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether we are cross compiling" >&5
+ $as_echo_n "checking whether we are cross compiling... " >&6; }
+ if test "$cross_compiling" != yes; then
+-  { { ac_try="$ac_link"
++  { { ac_try="false"
+ case "(($ac_try" in
+   *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+   *) ac_try_echo=$ac_try;;
+@@ -5772,7 +5772,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -5828,7 +5828,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -5894,7 +5894,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
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
+@@ -104127,7 +104127,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -104183,7 +104183,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
+@@ -104249,7 +104249,7 @@
+ 
+ if test "$cross_compiling" = yes; then :
+ 
+-    pthreads_working=no
++    pthreads_working=yes
+   case $host_alias in
+   *netware*)
+     pthreads_working=yes
diff --git a/package/php/php.mk b/package/php/php.mk
index 2e97c9a..0b32bca 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -50,6 +50,22 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_APACHE),y)
+# this patchset is only needed when cross-compiling mod_php for Apache
+define PHP_PATCH_FOR_APACHE
+	patch -d $(@D) -p1 -E -i $(TOPDIR)/$(PKGDIR)php-04-cross-compile.only-for-apache
+endef
+PHP_POST_PATCH_HOOKS += PHP_PATCH_FOR_APACHE
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
