From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 29 Jun 2021 09:50:54 -0700
Subject: [Buildroot] [PATCH 11/11] package/php: bump version to 8.0.7
In-Reply-To: <20210629165054.3831930-1-aduskett@gmail.com>
References: <20210629165054.3831930-1-aduskett@gmail.com>
Message-ID: <20210629165054.3831930-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Move BR2_PACKAGE_PHP_EXT_JSON to Config.in.legacy as the json extension is
    now an integral part of PHP and is no longer optional.

  - Move BR2_PACKAGE_PHP_EXT_XMLRPC to Config.in.legacy as the extension has
    been removed. See https://wiki.php.net/rfc/unbundle_xmlprc for an
    explination.

  - Add a new patch that allows for opcache to cross-compile with PHP8.

  - Explicitly disable opcache-jit when opcache is enabled, as the JIT fails
    to cross-compile.
  
  - --enable-maintainer-zts is now --enable-zts

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy                              | 15 ++++++
 ...1-acinclude.m4-don-t-unset-variables.patch |  4 +-
 .../0002-iconv-tweak-iconv-detection.patch    | 48 +++----------------
 ...0003-configure-disable-the-phar-tool.patch |  6 +--
 .../0004-Call-apxs-with-correct-prefix.patch  |  8 ++--
 .../0005-allow-opcache-cross-compiling.patch  | 37 ++++++++++++++
 package/php/Config.ext                        | 12 -----
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            | 16 ++-----
 9 files changed, 73 insertions(+), 75 deletions(-)
 create mode 100644 package/php/0005-allow-opcache-cross-compiling.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index a0c1a6898f..2865e4c58b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,21 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_PHP_EXT_XMLRPC
+	bool "PHP XMLRPC extension removed"
+	select BR2_LEGACY
+	help
+	  The XMLRPC php extension was removed.
+	  See: https://wiki.php.net/rfc/unbundle_xmlprc
+
+config BR2_PACKAGE_PHP_EXT_JSON
+	bool "Optional PHP JSON extension removed"
+	select BR2_LEGACY
+	help
+	  The JSON extension is now an integral part of PHP and cannot
+	  be disabled as per RFC:
+	  https://wiki.php.net/rfc/always_enable_json
+
 config BR2_PACKAGE_UDISKS_LVM2
 	bool "udisks lvm2 support removed"
 	select BR2_LEGACY
diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index 982857a357..2d15552783 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -17,7 +17,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index e91ef988..9586c490 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
+@@ -1568,8 +1568,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -26,7 +26,7 @@ index e91ef988..9586c490 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1601,8 +1599,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index 65ed6055bc..19d7ab5cf9 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -14,60 +14,26 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
 [Gustavo: update for 5.6.10]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.3.0]
+[aduskett at gmail.com: Update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Bernd: rebased for 7.4.10 & 7.4.13]
 ---
- build/php.m4        |  2 +-
- ext/iconv/config.m4 | 22 ----------------------
- 2 files changed, 1 insertion(+), 23 deletions(-)
+ build/php.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
 index 9586c490..8b3d47ed 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1973,7 +1973,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1937,7 +1937,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
 -    for i in $PHP_ICONV /usr/local /usr; do
 +    for i in $PHP_ICONV; do
-       if test -r $i/include/giconv.h; then
-         AC_DEFINE(HAVE_GICONV_H, 1, [ ])
+       if test -r $i/include/gnu-libiconv/iconv.h; then
          ICONV_DIR=$i
-diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index fe9b47aa..70599694 100644
---- a/ext/iconv/config.m4
-+++ b/ext/iconv/config.m4
-@@ -13,28 +13,6 @@ if test "$PHP_ICONV" != "no"; then
-   ])
- 
-   if test "$iconv_avail" != "no"; then
--    if test -z "$ICONV_DIR"; then
--      for i in /usr/local /usr; do
--        if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
--          PHP_ICONV_PREFIX="$i"
--          break
--        fi
--      done
--      if test -z "$PHP_ICONV_PREFIX"; then
--        PHP_ICONV_PREFIX="/usr"
--      fi
--    else
--      PHP_ICONV_PREFIX="$ICONV_DIR"
--    fi
--
--    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
--    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
--
--    if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
--      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
--    else
--      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/iconv.h"
--	fi
- 
-     AC_MSG_CHECKING([if iconv is glibc's])
-     AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <gnu/libc-version.h>]], [[gnu_get_libc_version();]])],[
+         ICONV_INCLUDE_DIR=$i/include/gnu-libiconv
 -- 
-2.7.4
+2.31.1
 
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 4a25ec05c1..cc4f55a8c8 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -11,7 +11,7 @@ on the target.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Aduskett: update for 7.3.0]
+[Aduskett: update for 8.0.7]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Bernd: rebased for 7.4.10 & 7.4.13]
 ---
@@ -22,8 +22,8 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1454,13 +1454,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
- INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
+@@ -1423,13 +1423,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
 -if test "$PHP_PHAR" != "no" && test "$PHP_CLI" != "no"; then
diff --git a/package/php/0004-Call-apxs-with-correct-prefix.patch b/package/php/0004-Call-apxs-with-correct-prefix.patch
index a0a0715789..3a1a580084 100644
--- a/package/php/0004-Call-apxs-with-correct-prefix.patch
+++ b/package/php/0004-Call-apxs-with-correct-prefix.patch
@@ -7,7 +7,7 @@ php uses apache's apxs script from staging directory to install libphp
 dynamic library and update /etc/apache2/httpd.conf in the staging and target
 directories. Here is the full command line:
 "apxs -S LIBEXECDIR='$(INSTALL_ROOT)/usr/modules'
- -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2' -i -a -n php7"
+ -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2' -i -a -n php"
 This does not work for target directory as apxs sets the full path of the
 library and not the relative one. Indeed, apxs is smart enough to substitute
 away the prefix specified in $(STAGING_DIR)/usr/build/config_vars.mk so
@@ -16,7 +16,7 @@ To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
 
 Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.3.0]
+[aduskett at gmail.com: Update for 8.0.7]
 ---
  sapi/apache2handler/config.m4 | 3 +++
  1 file changed, 3 insertions(+)
@@ -35,7 +35,7 @@ index 55c16179..68ce66c0 100644
      INSTALL_IT="\$(mkinstalldirs) '$APXS_LIBEXECDIR' && \
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
 +                       -S PREFIX='$APXS_PREFIX' \
-                        -i -n php7"
+                        -i -n php"
    else
      APXS_SYSCONFDIR='$(INSTALL_ROOT)'`$APXS -q SYSCONFDIR`
 @@ -74,6 +76,7 @@ if test "$PHP_APXS2" != "no"; then
@@ -43,7 +43,7 @@ index 55c16179..68ce66c0 100644
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
                         -S SYSCONFDIR='$APXS_SYSCONFDIR' \
 +                       -S PREFIX='$APXS_PREFIX' \
-                        -i -a -n php7"
+                        -i -a -n php"
    fi
  
 -- 
diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
new file mode 100644
index 0000000000..d168f71892
--- /dev/null
+++ b/package/php/0005-allow-opcache-cross-compiling.patch
@@ -0,0 +1,37 @@
+From 9bb316c41a69935ee2072626467241889594bed4 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 28 Jun 2021 11:12:36 -0700
+Subject: [PATCH] allow opcache cross-compiling
+
+Remove the check at the end of ext/opcache/config.m4 that prevents opcache from
+being enabled in a cross-compiled environment. We pass the following as a
+CFLAGS when opcache is enabled:
+  -DHAVE_SHM_IPC
+  -DHAVE_SHM_MMAP_ANON
+  -DHAVE_SHM_MMAP_ZERO
+  -DHAVE_SHM_MMAP_POSIX
+  -DHAVE_SHM_MMAP_FILE
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ ext/opcache/config.m4 | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index 5492fd92..10c150ff 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -339,10 +339,6 @@ int main() {
+   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
+   PHP_ADD_EXTENSION_DEP(opcache, pcre)
+ 
+-  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
+-    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
+-  fi
+-
+   if test "$PHP_OPCACHE_JIT" = "yes"; then
+     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
+     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
+-- 
+2.31.1
+
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 1e8ca495a7..3a65f70b86 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -273,11 +273,6 @@ config BR2_PACKAGE_PHP_EXT_GMP
 
 comment "Other basic extensions"
 
-config BR2_PACKAGE_PHP_EXT_JSON
-	bool "JSON"
-	help
-	  JavaScript Object Serialization support
-
 config BR2_PACKAGE_PHP_EXT_TOKENIZER
 	bool "Tokenizer"
 	help
@@ -363,13 +358,6 @@ config BR2_PACKAGE_PHP_EXT_SOAP
 	help
 	  SOAP support
 
-config BR2_PACKAGE_PHP_EXT_XMLRPC
-	bool "XML-RPC"
-	select BR2_PACKAGE_PHP_EXT_LIBXML2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  XML-RPC support
-
 comment "XML manipulation"
 
 config BR2_PACKAGE_PHP_EXT_DOM
diff --git a/package/php/php.hash b/package/php/php.hash
index d91d6aec66..b1cb8f045e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  1fa46ca6790d780bf2cb48961df65f0ca3640c4533f0bca743cd61b71cb66335  php-7.4.20.tar.xz
+sha256  d5fc2e4fc780a32404d88c360e3e0009bc725d936459668e9c2ac992f2d83654  php-8.0.7.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 3e422c5ac1..af0b073d84 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.20
-PHP_SITE = http://www.php.net/distributions
+PHP_VERSION = 8.0.7
+PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
@@ -62,7 +62,7 @@ PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 # The OPcache extension isn't cross-compile friendly
 # Throw some defines here to avoid patching heavily
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPCACHE),y)
-PHP_CONF_OPTS += --enable-opcache
+PHP_CONF_OPTS += --enable-opcache --disable-opcache-jit
 PHP_CONF_ENV += ac_cv_func_mprotect=yes
 PHP_CFLAGS += \
 	-DHAVE_SHM_IPC \
@@ -90,7 +90,7 @@ PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
 
 # Enable thread safety option if Apache MPM is event or worker
 ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT)$(BR2_PACKAGE_APACHE_MPM_WORKER),y)
-PHP_CONF_OPTS += --enable-maintainer-zts
+PHP_CONF_OPTS += --enable-zts
 endif
 endif
 
@@ -107,7 +107,6 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_XMLWRITER),--enable-xmlwriter) \
 	$(if $(BR2_PACKAGE_PHP_EXT_EXIF),--enable-exif) \
 	$(if $(BR2_PACKAGE_PHP_EXT_FTP),--enable-ftp) \
-	$(if $(BR2_PACKAGE_PHP_EXT_JSON),--enable-json) \
 	$(if $(BR2_PACKAGE_PHP_EXT_TOKENIZER),--enable-tokenizer) \
 	$(if $(BR2_PACKAGE_PHP_EXT_PCNTL),--enable-pcntl) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SHMOP),--enable-shmop) \
@@ -161,13 +160,6 @@ PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += expat
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_XMLRPC),y)
-PHP_CONF_OPTS += \
-	--with-xmlrpc \
-	$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
-PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
 PHP_DEPENDENCIES += libzip
 endif
-- 
2.31.1
