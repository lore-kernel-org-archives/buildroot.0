From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 31 Jan 2020 10:09:55 +0100
Subject: [Buildroot] [PATCH] package/php: bump version to 7.4.2
Message-ID: <20200131090955.7948-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch 0005 has been sourced from upstream,
and can be dropped when 7.4.3 is released.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 .../0001-acinclude.m4-don-t-unset-variables.patch  | 18 ++---
 package/php/0002-iconv-tweak-iconv-detection.patch | 20 ++---
 .../php/0003-configure-disable-the-phar-tool.patch |  4 +-
 .../php/0004-Call-apxs-with-correct-prefix.patch   |  6 +-
 ...ompilation-failure-due-to-size_t-typecast.patch | 46 +++++++++++
 ...nfig0.m4-add-ac_cv_have_pcre2_jit-variabl.patch | 91 ----------------------
 package/php/Config.ext                             |  1 +
 package/php/php.hash                               |  5 +-
 package/php/php.mk                                 | 10 ++-
 9 files changed, 81 insertions(+), 120 deletions(-)
 create mode 100644 package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
 delete mode 100644 package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch

diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index b25f661..982857a 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -10,14 +10,14 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett at gmail.com: Update for 7.3.0]
 ---
- acinclude.m4 | 4 ----
+ build/php.m4 | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 28506b6..af4aa06 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -1921,8 +1921,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
+diff --git a/build/php.m4 b/build/php.m4
+index e91ef988..9586c490 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1587,8 +1587,6 @@ dnl PHP_CHECK_FUNC_LIB
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -26,14 +26,14 @@ index 28506b6..af4aa06 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1954,8 +1952,6 @@ dnl in the default libraries and as a fall back in the specified library.
- dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
+@@ -1620,8 +1618,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+ dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
 -  unset ac_cv_func_$1
 -  unset ac_cv_func___$1
    unset found
-   
+ 
    AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
 -- 
 2.7.4
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index e4f2abb..1aa8400 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -3,7 +3,7 @@ From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 9 Aug 2016 11:50:49 +0200
 Subject: [PATCH] iconv: tweak iconv detection
 
-Tweak PHP_SETUP_ICONV from aclocal/acinclude.m4 to not
+Tweak PHP_SETUP_ICONV from aclocal/build/php.m4 to not
 PHP_ADD_INCLUDE $ICONV_DIR/include since the tests use
 test instead of AC_TRY_LINK to find headers which is bad,
 specially when adding /usr and /usr/local to the mix.
@@ -16,16 +16,16 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett at gmail.com: Update for 7.3.0]
 ---
- acinclude.m4        |  2 +-
+ build/php.m4        |  2 +-
  ext/iconv/config.m4 | 22 ----------------------
  2 files changed, 1 insertion(+), 23 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index af4aa06..1bd2652 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2444,7 +2444,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   dnl
+diff --git a/build/php.m4 b/build/php.m4
+index 9586c490..8b3d47ed 100644
+--- a/build/php.m4
++++ b/build/php.m4
+@@ -1971,7 +1971,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+   dnl Check external libs for iconv funcs.
    if test "$found_iconv" = "no"; then
  
 -    for i in $PHP_ICONV /usr/local /usr; do
@@ -34,10 +34,10 @@ index af4aa06..1bd2652 100644
          AC_DEFINE(HAVE_GICONV_H, 1, [ ])
          ICONV_DIR=$i
 diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index 72334f79..29c358ad 100644
+index fe9b47aa..70599694 100644
 --- a/ext/iconv/config.m4
 +++ b/ext/iconv/config.m4
-@@ -12,28 +12,6 @@ if test "$PHP_ICONV" != "no"; then
+@@ -13,28 +13,6 @@ if test "$PHP_ICONV" != "no"; then
    ])
  
    if test "$iconv_avail" != "no"; then
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 829cdf9..7cc3637 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -17,10 +17,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d20af76..7f02f1a 100644
+index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1472,13 +1472,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+@@ -1430,13 +1430,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/0004-Call-apxs-with-correct-prefix.patch b/package/php/0004-Call-apxs-with-correct-prefix.patch
index 60589b5..a0a0715 100644
--- a/package/php/0004-Call-apxs-with-correct-prefix.patch
+++ b/package/php/0004-Call-apxs-with-correct-prefix.patch
@@ -22,10 +22,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/sapi/apache2handler/config.m4 b/sapi/apache2handler/config.m4
-index 2e64b21..f5bf002 100644
+index 55c16179..68ce66c0 100644
 --- a/sapi/apache2handler/config.m4
 +++ b/sapi/apache2handler/config.m4
-@@ -64,10 +64,12 @@ if test "$PHP_APXS2" != "no"; then
+@@ -63,10 +63,12 @@ if test "$PHP_APXS2" != "no"; then
      AC_MSG_ERROR([Please note that Apache version >= 2.0.44 is required])
    fi
  
@@ -38,7 +38,7 @@ index 2e64b21..f5bf002 100644
                         -i -n php7"
    else
      APXS_SYSCONFDIR='$(INSTALL_ROOT)'`$APXS -q SYSCONFDIR`
-@@ -75,6 +77,7 @@ if test "$PHP_APXS2" != "no"; then
+@@ -74,6 +76,7 @@ if test "$PHP_APXS2" != "no"; then
                  \$(mkinstalldirs) '$APXS_SYSCONFDIR' && \
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
                         -S SYSCONFDIR='$APXS_SYSCONFDIR' \
diff --git a/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch b/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
new file mode 100644
index 0000000..342a210
--- /dev/null
+++ b/package/php/0005-fix-cross-compilation-failure-due-to-size_t-typecast.patch
@@ -0,0 +1,46 @@
+From f0f5c415a6e0abc40514f97113deb52a343174ee Mon Sep 17 00:00:00 2001
+From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
+Date: Thu, 30 Jan 2020 13:48:44 +0100
+Subject: [PATCH] fix cross compilation failure due to size_t typecast in
+ define
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The following commit introduces a cross-compilation failure:
+
+   93c728b77cfb47f5cfdd1863f8982ea59d344205
+  "Try to control ZEND_MM_ALIGNED_SIZE type"
+
+br-arm-full/build/php-7.4.2/Zend/zend_alloc.h:30:38:
+error: missing binary operator before token "8"
+                                              ^
+br-arm-full/build/php-7.4.2/ext/opcache/ZendAccelerator.c:1380:7:
+note: in expansion of macro ?ZEND_MM_ALIGNMENT?
+
+Closes GH-5128.
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+ Zend/zend_alloc.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Zend/zend_alloc.h b/Zend/zend_alloc.h
+index c5838f2ac684..8bb854328dbd 100644
+--- a/Zend/zend_alloc.h
++++ b/Zend/zend_alloc.h
+@@ -27,12 +27,12 @@
+ #include "zend.h"
+ 
+ #ifndef ZEND_MM_ALIGNMENT
+-# define ZEND_MM_ALIGNMENT ((size_t) 8)
++# define ZEND_MM_ALIGNMENT Z_UL(8)
+ # define ZEND_MM_ALIGNMENT_LOG2 Z_L(3)
+ #elif ZEND_MM_ALIGNMENT < 4
+ # undef ZEND_MM_ALIGNMENT
+ # undef ZEND_MM_ALIGNMENT_LOG2
+-# define ZEND_MM_ALIGNMENT ((size_t) 4)
++# define ZEND_MM_ALIGNMENT Z_UL(4)
+ # define ZEND_MM_ALIGNMENT_LOG2 Z_L(2)
+ #endif
+ 
diff --git a/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
deleted file mode 100644
index 4fa24fd..0000000
--- a/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From a9151b1a6abde8306c7b46ca52036b2dc9c1b76d Mon Sep 17 00:00:00 2001
-From: Artem Panfilov <panfilov.artyom@gmail.com>
-Date: Tue, 16 Apr 2019 12:02:05 +0300
-Subject: [PATCH] ext/pcre/config0.m4: add ac_cv_have_pcre2_jit variable
-
-The HAVE_PCRE_JIT_SUPPORT check uses AC_RUN_IFELSE, which is not
-available when cross-compiling. As a fallback, JIT support is enabled
-based on CPU architecture. However, this may be wrong,
-e.g. when the JIT the feature was not enabled in the pcre2 build.
-
-Add a cache variable for the PCRE JIT feature to make it possible to
-override the check.
-
-Backported from: 12ee246ae45889004fc2c099c04cfff1ce6e8848
-Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
----
- ext/pcre/config0.m4 | 56 +++++++++++++++++++++++----------------------
- 1 file changed, 29 insertions(+), 27 deletions(-)
-
-diff --git a/ext/pcre/config0.m4 b/ext/pcre/config0.m4
-index b9542f0113..f964429431 100644
---- a/ext/pcre/config0.m4
-+++ b/ext/pcre/config0.m4
-@@ -53,35 +53,37 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
-     AC_DEFINE(HAVE_PCRE, 1, [ ])
- 
-     if test "$PHP_PCRE_JIT" != "no"; then
--      AC_MSG_CHECKING([for JIT support in PCRE2])
-+      AC_CACHE_CHECK([for JIT support in PCRE2], ac_cv_have_pcre2_jit, [
-       AC_RUN_IFELSE([
--        AC_LANG_SOURCE([[
--            #include <pcre2.h>
--            #include <stdlib.h>
--            int main(void) {
--              uint32_t have_jit;
--              pcre2_config_8(PCRE2_CONFIG_JIT, &have_jit);
--              return !have_jit;
--            }
--        ]])], [
--        AC_MSG_RESULT([yes])
--        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
--      ],
--      [
--        AC_MSG_RESULT([no])
--      ],
--      [
--        AC_CANONICAL_HOST
--        case $host_cpu in
--        arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
--          AC_MSG_RESULT([yes])
--          AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
--          ;;
--        *)
--          AC_MSG_RESULT([no])
--          ;;
--        esac
-+          AC_LANG_SOURCE([[
-+              #include <pcre2.h>
-+              #include <stdlib.h>
-+              int main(void) {
-+                uint32_t have_jit;
-+                pcre2_config_8(PCRE2_CONFIG_JIT, &have_jit);
-+                return !have_jit;
-+              }
-+          ]])], [
-+          ac_cv_have_pcre2_jit=yes
-+        ],
-+        [
-+          ac_cv_have_pcre2_jit=no
-+        ],
-+        [
-+          AC_CANONICAL_HOST
-+          case $host_cpu in
-+          arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
-+            ac_cv_have_pcre2_jit=yes
-+            ;;
-+          *)
-+            ac_cv_have_pcre2_jit=no
-+            ;;
-+          esac
-+        ])
-       ])
-+      if test $ac_cv_have_pcre2_jit = yes; then
-+        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
-+      fi
-     fi
- 
-     PHP_NEW_EXTENSION(pcre, php_pcre.c, no,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
--- 
-2.17.1
-
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 6a96343..193bc1b 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -240,6 +240,7 @@ comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library,
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
+	select BR2_PACKAGE_ONIGURUMA
 	help
 	  multibyte string support
 
diff --git a/package/php/php.hash b/package/php/php.hash
index 31f08ca..f4142ce 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,6 @@
 # From https://www.php.net/downloads.php
-sha256 cc05dd373ca5d36652800762f65c10e828a17de35aaf246262e3efa99d00cdb0  php-7.3.14.tar.xz
+sha256 98284deac017da0d426117ecae7599a1f1bf62ae3911e8bc16c4403a8f4bdf13  php-7.4.2.tar.xz
 
 # License file
-sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
+sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
+
diff --git a/package/php/php.mk b/package/php/php.mk
index 41c86da..a0eb9d1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.14
+PHP_VERSION = 7.4.2
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
@@ -119,7 +119,6 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
 	$(if $(BR2_PACKAGE_PHP_EXT_FILEINFO),--enable-fileinfo) \
 	$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
-	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBARGON2),y)
@@ -132,6 +131,11 @@ PHP_CONF_OPTS += --with-sodium=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libsodium
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_MBSTRING),y)
+PHP_CONF_OPTS += --enable-mbstring
+PHP_DEPENDENCIES += oniguruma
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
 PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libmcrypt
@@ -147,7 +151,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 PHP_CONF_ENV += php_cv_libxml_build_works=yes
-PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-libxml --with-libxml-dir=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libxml2
 endif
 
-- 
2.7.4
