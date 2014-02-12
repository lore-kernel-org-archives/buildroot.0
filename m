From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 15:56:31 +0100
Subject: [Buildroot] [git commit branch/next] php: fix for external
	extensions
Message-ID: <20140212192700.670E99C9AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f8b51338432686307f34a1ea44e6ff9a37e6399
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Adjust phpize and php-config to make them work for cross-compiled
external extensions.
While at it also fix dl* issues that prevent said extensions from
loading.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php-02-dlopen.patch |   25 +++++++++++++++++++++++++
 package/php/php.mk              |   25 ++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/package/php/php-02-dlopen.patch b/package/php/php-02-dlopen.patch
new file mode 100644
index 0000000..1dd009f
--- /dev/null
+++ b/package/php/php-02-dlopen.patch
@@ -0,0 +1,25 @@
+PHP can't be AUTORECONF with any modern autotools and the dl tests are
+pretty bad for cross-compilation, so just kill the needed ac_cv value unsets
+so they can flow through from the package makefile.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.5.8.orig/configure php-5.5.8/configure
+--- php-5.5.8.orig/configure	2014-01-28 17:41:33.943851727 -0300
++++ php-5.5.8/configure	2014-01-28 17:42:53.785493795 -0300
+@@ -16985,7 +16985,6 @@
+ 
+ 
+ 
+-  unset ac_cv_func_dlopen
+   unset ac_cv_func___dlopen
+   unset found
+ 
+@@ -17013,7 +17012,6 @@
+ 
+     *)
+ 
+-  unset ac_cv_lib_dl_dlopen
+   unset ac_cv_lib_dl___dlopen
+   unset found
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for dlopen in -ldl" >&5
diff --git a/package/php/php.mk b/package/php/php.mk
index de02f4b..2f6280f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -19,15 +19,25 @@ PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--with-config-file-path=/etc \
 		--localstatedir=/var \
 		--disable-rpath
+PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
+
 ifeq ($(BR2_ENDIAN),"BIG")
-PHP_CONF_ENV = ac_cv_c_bigendian_php=yes
+PHP_CONF_ENV += ac_cv_c_bigendian_php=yes
 else
-PHP_CONF_ENV = ac_cv_c_bigendian_php=no
+PHP_CONF_ENV += ac_cv_c_bigendian_php=no
 endif
 PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
+# We need to force dl "detection"
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+PHP_CONF_ENV += ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes
+PHP_EXTRA_LIBS += -ldl
+else
+PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
+endif
+
 # Workaround for non-IPv6 uClibc toolchain
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ifneq ($(BR2_INET_IPV6),y)
@@ -116,7 +126,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
 	# The intl module is implemented in C++, but PHP fails to use
 	# g++ as the compiler for the final link. As a workaround,
 	# tell it to link libstdc++.
-	PHP_CONF_ENV += EXTRA_LIBS="-lstdc++"
+	PHP_EXTRA_LIBS + = -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
@@ -200,6 +210,15 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
 	PHP_DEPENDENCIES += netsnmp
 endif
 
+define PHP_EXTENSIONS_FIXUP
+	$(SED) "/prefix/ s:/usr:$(STAGING_DIR)/usr:" \
+		$(STAGING_DIR)/usr/bin/phpize
+	$(SED) "/extension_dir/ s:/usr:$(TARGET_DIR)/usr:" \
+		$(STAGING_DIR)/usr/bin/php-config
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
+
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
