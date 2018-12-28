From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 14:04:00 +0100
Subject: [Buildroot] [git commit] package/php: bump version to 7.3.0
Message-ID: <20181228125949.367E0821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd6c2f41ef0e58d0b797039512d5c0f07c7239ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:

 - Update patches so they cleanly apply.

 - Remove patch 5, as it no longer applies.

 - Remove conf env option ac_cv_func_strcasestr=yes because of the
   above.

 - libzip is no longer bundled with php, because of this, libzip must
   now be selected and depended on if the zip extension is selected.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-acinclude.m4-don-t-unset-variables.patch  |  6 ++--
 package/php/0002-iconv-tweak-iconv-detection.patch | 10 +++---
 .../php/0003-configure-disable-the-phar-tool.patch |  4 +--
 ...ck-mechanism-is-obviously-linux-so-force-.patch | 18 ++++++-----
 ...ch => 0005-Call-apxs-with-correct-prefix.patch} |  6 ++--
 ...o-config.m4-allow-cache-answer-for-strcas.patch | 37 ----------------------
 package/php/Config.ext                             |  5 +++
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  7 ++--
 9 files changed, 34 insertions(+), 61 deletions(-)

diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index b23911322f..b25f661753 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -8,7 +8,7 @@ Terminate them with extreme prejudice.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.2.2]
+[aduskett at gmail.com: Update for 7.3.0]
 ---
  acinclude.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -17,7 +17,7 @@ diff --git a/acinclude.m4 b/acinclude.m4
 index 28506b6..af4aa06 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -1890,8 +1890,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
+@@ -1921,8 +1921,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -26,7 +26,7 @@ index 28506b6..af4aa06 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1923,8 +1921,6 @@ dnl in the default libraries and as a fall back in the specified library.
+@@ -1954,8 +1952,6 @@ dnl in the default libraries and as a fall back in the specified library.
  dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index e921030d29..e4f2abbc0c 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -14,7 +14,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
 [Gustavo: update for 5.6.10]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.2.2]
+[aduskett at gmail.com: Update for 7.3.0]
 ---
  acinclude.m4        |  2 +-
  ext/iconv/config.m4 | 22 ----------------------
@@ -24,7 +24,7 @@ diff --git a/acinclude.m4 b/acinclude.m4
 index af4aa06..1bd2652 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -2463,7 +2463,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -2444,7 +2444,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl
    if test "$found_iconv" = "no"; then
  
@@ -34,10 +34,10 @@ index af4aa06..1bd2652 100644
          AC_DEFINE(HAVE_GICONV_H, 1, [ ])
          ICONV_DIR=$i
 diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
-index 6a05697..694fcb8 100644
+index 72334f79..29c358ad 100644
 --- a/ext/iconv/config.m4
 +++ b/ext/iconv/config.m4
-@@ -14,28 +14,6 @@ if test "$PHP_ICONV" != "no"; then
+@@ -12,28 +12,6 @@ if test "$PHP_ICONV" != "no"; then
    ])
  
    if test "$iconv_avail" != "no"; then
@@ -65,7 +65,7 @@ index 6a05697..694fcb8 100644
 -	fi
  
      AC_MSG_CHECKING([if iconv is glibc's])
-     AC_TRY_LINK([#include <gnu/libc-version.h>],[gnu_get_libc_version();],
+     AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <gnu/libc-version.h>]], [[gnu_get_libc_version();]])],[
 -- 
 2.7.4
 
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index e41584e8e5..396a806496 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -11,7 +11,7 @@ on the target.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
 Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
-[Aduskett: update for 7.2.2]
+[Aduskett: update for 7.3.0]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index d20af76..7f02f1a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1420,13 +1420,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+@@ -1472,13 +1472,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
index 2c08437e4d..280d5ee47b 100644
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Bernd: update for 7.2.12]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[aduskett at gmail.com: Update for 7.3.0]
 ---
  ext/opcache/config.m4 | 34 ++--------------------------------
  1 file changed, 2 insertions(+), 32 deletions(-)
@@ -14,13 +16,13 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index fbb9b21..ffddc8e 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -343,38 +343,8 @@ int main() {
-     msg=yes,msg=no,msg=no)
+@@ -341,38 +341,8 @@ int main() {
+     msg=yes],[msg=no],[msg=no])
    AC_MSG_RESULT([$msg])
  
 -flock_type=unknown
 -AC_MSG_CHECKING("whether flock struct is linux ordered")
--AC_TRY_RUN([
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
 -  int main() {
@@ -29,14 +31,14 @@ index fbb9b21..ffddc8e 100644
 -    }
 -    return 1;
 -  }
--], [
+-]])], [
 -	flock_type=linux
 -    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
 -    AC_MSG_RESULT("yes")
--], AC_MSG_RESULT("no") )
+-], [AC_MSG_RESULT("no")], [AC_MSG_RESULT([no])])
 -
 -AC_MSG_CHECKING("whether flock struct is BSD ordered")
--AC_TRY_RUN([
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
 -  int main() {
@@ -45,11 +47,11 @@ index fbb9b21..ffddc8e 100644
 -    }
 -    return 1;
 -  }
--], [
+-]])], [
 -	flock_type=bsd
 -    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
 -    AC_MSG_RESULT("yes")
--], AC_MSG_RESULT("no") )
+-], [AC_MSG_RESULT("no")], [AC_MSG_RESULT([no])])
 +flock_type=linux
 +AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
  
diff --git a/package/php/0006-Call-apxs-with-correct-prefix.patch b/package/php/0005-Call-apxs-with-correct-prefix.patch
similarity index 93%
rename from package/php/0006-Call-apxs-with-correct-prefix.patch
rename to package/php/0005-Call-apxs-with-correct-prefix.patch
index c81711d2a0..60589b54fe 100644
--- a/package/php/0006-Call-apxs-with-correct-prefix.patch
+++ b/package/php/0005-Call-apxs-with-correct-prefix.patch
@@ -16,7 +16,7 @@ To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
 
 Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.2.2]
+[aduskett at gmail.com: Update for 7.3.0]
 ---
  sapi/apache2handler/config.m4 | 3 +++
  1 file changed, 3 insertions(+)
@@ -25,7 +25,7 @@ diff --git a/sapi/apache2handler/config.m4 b/sapi/apache2handler/config.m4
 index 2e64b21..f5bf002 100644
 --- a/sapi/apache2handler/config.m4
 +++ b/sapi/apache2handler/config.m4
-@@ -66,10 +66,12 @@ if test "$PHP_APXS2" != "no"; then
+@@ -64,10 +64,12 @@ if test "$PHP_APXS2" != "no"; then
      AC_MSG_ERROR([Please note that Apache version >= 2.0.44 is required])
    fi
  
@@ -38,7 +38,7 @@ index 2e64b21..f5bf002 100644
                         -i -n php7"
    else
      APXS_SYSCONFDIR='$(INSTALL_ROOT)'`$APXS -q SYSCONFDIR`
-@@ -77,6 +79,7 @@ if test "$PHP_APXS2" != "no"; then
+@@ -75,6 +77,7 @@ if test "$PHP_APXS2" != "no"; then
                  \$(mkinstalldirs) '$APXS_SYSCONFDIR' && \
                   $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
                         -S SYSCONFDIR='$APXS_SYSCONFDIR' \
diff --git a/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch b/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
deleted file mode 100644
index 257ac70f4f..0000000000
--- a/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a874ba472151c6811018de322a5787d0ca6148c9 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 9 Aug 2016 11:52:51 +0200
-Subject: [PATCH] ext/fileinfo/config.m4: allow cache answer for strcasestr
- discovery
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[aduskett at gmail.com: Update for 7.2.2]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- ext/fileinfo/config.m4 | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
-index 7e98d62..8561962 100644
---- a/ext/fileinfo/config.m4
-+++ b/ext/fileinfo/config.m4
-@@ -15,6 +15,7 @@ libmagic/readcdf.c libmagic/softmagic.c libmagic/der.c"
- 
-   AC_MSG_CHECKING([for strcasestr])
-+  AC_CACHE_VAL(ac_cv_func_strcasestr,
-   AC_TRY_RUN([
- #include <string.h>
- #include <strings.h>
- #include <stdlib.h>
-@@ -46,7 +47,7 @@ int main(void)
-     AC_MSG_RESULT(no)
-     AC_MSG_NOTICE(using libmagic strcasestr implementation)
-     libmagic_sources="$libmagic_sources libmagic/strcasestr.c"
--  ])
-+  ]))
- 
-   PHP_NEW_EXTENSION(fileinfo, fileinfo.c $libmagic_sources, $ext_shared,,-I at ext_srcdir@/libmagic)
-   PHP_ADD_BUILD_DIR($ext_builddir/libmagic)
--- 
-2.7.4
-
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 7e6b3e0e25..9a90e0a8a4 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -45,9 +45,14 @@ config BR2_PACKAGE_PHP_EXT_PHAR
 	help
 	  PHP Archive support
 
+comment "zip needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
+	depends on !BR2_STATIC_LIBS # libzip
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBZIP
 	help
 	  Zip read/write support
 
diff --git a/package/php/php.hash b/package/php/php.hash
index 094977c548..c1c6e8c3e9 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 14b0429abdb46b65c843e5882c9a8c46b31dfbf279c747293b8ab950c2644a4b  php-7.2.13.tar.xz
+sha256 7d195cad55af8b288c3919c67023a14ff870a73e3acc2165a6d17a4850a560b5  php-7.3.0.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 338361f58a..fd428e192a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.13
+PHP_VERSION = 7.3.0
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
@@ -22,7 +22,6 @@ PHP_CONF_OPTS = \
 	--disable-phpdbg \
 	--disable-rpath
 PHP_CONF_ENV = \
-	ac_cv_func_strcasestr=yes \
 	EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -153,6 +152,10 @@ PHP_CONF_OPTS += \
 PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
+PHP_DEPENDENCIES += libzip
+endif
+
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
 PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += zlib
