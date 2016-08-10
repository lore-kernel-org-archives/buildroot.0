From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:26:52 +0200
Subject: [Buildroot] [git commit] php: rework patches as Git formatted
	patches
Message-ID: <20160810125340.4346C817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6604b2e9c446ae85ae358bf1a9973c8c6f205edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ... 0001-acinclude.m4-don-t-unset-variables.patch} | 22 ++++++++++----
 ...atch => 0002-iconv-tweak-iconv-detection.patch} | 30 ++++++++++++++-----
 ... => 0003-configure-disable-the-phar-tool.patch} | 22 ++++++++++----
 ...k-mechanism-is-obviously-linux-so-force-.patch} | 22 ++++++++++----
 package/php/0005-ac-cache-strcasestr.patch         | 24 ---------------
 ...o-config.m4-allow-cache-answer-for-strcas.patch | 35 ++++++++++++++++++++++
 ....in.patch => 0006-Fix-php-fpm.service.in.patch} |  4 +--
 7 files changed, 109 insertions(+), 50 deletions(-)

diff --git a/package/php/0001-ditch-unset.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
similarity index 52%
rename from package/php/0001-ditch-unset.patch
rename to package/php/0001-acinclude.m4-don-t-unset-variables.patch
index eda83c9..d507775 100644
--- a/package/php/0001-ditch-unset.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -1,12 +1,21 @@
+From 7a4168062fbab2e33ef9a42bca9f87a5921afac2 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Aug 2016 11:49:56 +0200
+Subject: [PATCH] acinclude.m4: don't unset variables
+
 Unsetting ac_cv_{func,lib}_* is bad, you can't feed the configure cache.
 Terminate them with extreme prejudice.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ acinclude.m4 | 4 ----
+ 1 file changed, 4 deletions(-)
 
-diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
---- php-5.6.8.orig/acinclude.m4	2015-04-15 20:05:57.000000000 +0200
-+++ php-5.6.8/acinclude.m4	2015-05-18 20:03:50.833099001 +0200
-@@ -1897,8 +1897,6 @@
+diff --git a/acinclude.m4 b/acinclude.m4
+index 28506b6..af4aa06 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1898,8 +1898,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -15,7 +24,7 @@ diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1930,8 +1928,6 @@
+@@ -1931,8 +1929,6 @@ dnl in the default libraries and as a fall back in the specified library.
  dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
@@ -24,3 +33,6 @@ diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
    unset found
    
    AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
+-- 
+2.7.4
+
diff --git a/package/php/0002-no-iconv-search.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
similarity index 69%
rename from package/php/0002-no-iconv-search.patch
rename to package/php/0002-iconv-tweak-iconv-detection.patch
index 32aa7f5..a346649 100644
--- a/package/php/0002-no-iconv-search.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -1,3 +1,8 @@
+From 1357df0196806d5697b1f84497ef72aab5faa8a3 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Aug 2016 11:50:49 +0200
+Subject: [PATCH] iconv: tweak iconv detection
+
 Tweak PHP_SETUP_ICONV from aclocal/acinclude.m4 to not
 PHP_ADD_INCLUDE $ICONV_DIR/include since the tests use
 test instead of AC_TRY_LINK to find headers which is bad,
@@ -8,11 +13,16 @@ PHP_ICONV_H_PATH which, again, uses test and absolute paths.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
 [Gustavo: update for 5.6.10]
+---
+ acinclude.m4        |  2 +-
+ ext/iconv/config.m4 | 22 ----------------------
+ 2 files changed, 1 insertion(+), 23 deletions(-)
 
-diff -Nura php-5.6.10.orig/acinclude.m4 php-5.6.10/acinclude.m4
---- php-5.6.10.orig/acinclude.m4	2015-06-12 16:09:06.274355813 -0300
-+++ php-5.6.10/acinclude.m4	2015-06-12 16:10:10.884544865 -0300
-@@ -2474,7 +2474,7 @@
+diff --git a/acinclude.m4 b/acinclude.m4
+index af4aa06..1bd2652 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2471,7 +2471,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl
    if test "$found_iconv" = "no"; then
  
@@ -21,10 +31,11 @@ diff -Nura php-5.6.10.orig/acinclude.m4 php-5.6.10/acinclude.m4
        if test -r $i/include/giconv.h; then
          AC_DEFINE(HAVE_GICONV_H, 1, [ ])
          ICONV_DIR=$i
-diff -Nura php-5.6.10.orig/ext/iconv/config.m4 php-5.6.10/ext/iconv/config.m4
---- php-5.6.10.orig/ext/iconv/config.m4	2015-06-12 16:09:07.792407246 -0300
-+++ php-5.6.10/ext/iconv/config.m4	2015-06-12 16:11:07.752471600 -0300
-@@ -14,28 +14,6 @@
+diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
+index 6a05697..694fcb8 100644
+--- a/ext/iconv/config.m4
++++ b/ext/iconv/config.m4
+@@ -14,28 +14,6 @@ if test "$PHP_ICONV" != "no"; then
    ])
  
    if test "$iconv_avail" != "no"; then
@@ -53,3 +64,6 @@ diff -Nura php-5.6.10.orig/ext/iconv/config.m4 php-5.6.10/ext/iconv/config.m4
  
      AC_MSG_CHECKING([if iconv is glibc's])
      AC_TRY_LINK([#include <gnu/libc-version.h>],[gnu_get_libc_version();],
+-- 
+2.7.4
+
diff --git a/package/php/0003-disable-pharcmd.patch b/package/php/0003-configure-disable-the-phar-tool.patch
similarity index 60%
rename from package/php/0003-disable-pharcmd.patch
rename to package/php/0003-configure-disable-the-phar-tool.patch
index bfcc956..3b64b7b 100644
--- a/package/php/0003-disable-pharcmd.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -1,3 +1,8 @@
+From 5ba6355e489f647c88ca48afbc75965468193181 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Aug 2016 11:51:53 +0200
+Subject: [PATCH] configure: disable the 'phar' tool
+
 Disable the 'phar' command-line tool build/installation since it requires
 php to run and pack up phar itself in phar format. This would require
 a host-php instance and really probably nobody needs the phar tool
@@ -5,13 +10,17 @@ on the target.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
+---
+ configure.in | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
 
-diff -Nura php-5.6.7.orig/configure.in php-5.6.7/configure.in
---- php-5.6.7.orig/configure.in	2015-04-08 11:08:10.815835010 -0300
-+++ php-5.6.7/configure.in	2015-04-08 11:16:20.460467444 -0300
-@@ -1437,13 +1437,8 @@
+diff --git a/configure.in b/configure.in
+index 25c8abf..4dc8a09 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1445,13 +1445,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
- CXXFLAGS="$CXXFLAGS $standard_libtool_flag"
+ CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
 -if test "$PHP_PHAR" != "no" && test "$PHP_CLI" != "no"; then
 -  pharcmd=pharcmd
@@ -25,3 +34,6 @@ diff -Nura php-5.6.7.orig/configure.in php-5.6.7/configure.in
  
  all_targets="$lcov_target \$(OVERALL_TARGET) \$(PHP_MODULES) \$(PHP_ZEND_EX) \$(PHP_BINARIES) $pharcmd"
  install_targets="$install_sapi $install_modules $install_binaries install-build install-headers install-programs $install_pear $pharcmd_install"
+-- 
+2.7.4
+
diff --git a/package/php/0004-flock-type-linux.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
similarity index 66%
rename from package/php/0004-flock-type-linux.patch
rename to package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
index a03c262..9b53036 100644
--- a/package/php/0004-flock-type-linux.patch
+++ b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
@@ -1,11 +1,18 @@
-OPcache: flock mechanism is obviously linux so force it.
+From bedbd41ef0a5ce80b83a6f6eaebd7c90f0bc5615 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Aug 2016 11:52:19 +0200
+Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ ext/opcache/config.m4 | 34 ++--------------------------------
+ 1 file changed, 2 insertions(+), 32 deletions(-)
 
-diff -Nura php-5.6.7.orig/ext/opcache/config.m4 php-5.6.7/ext/opcache/config.m4
---- php-5.6.7.orig/ext/opcache/config.m4	2015-04-08 11:08:11.125845540 -0300
-+++ php-5.6.7/ext/opcache/config.m4	2015-04-08 11:57:23.648831436 -0300
-@@ -326,38 +326,8 @@
+diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
+index fbb9b21..ffddc8e 100644
+--- a/ext/opcache/config.m4
++++ b/ext/opcache/config.m4
+@@ -343,38 +343,8 @@ int main() {
      msg=yes,msg=no,msg=no)
    AC_MSG_RESULT([$msg])
  
@@ -44,5 +51,8 @@ diff -Nura php-5.6.7.orig/ext/opcache/config.m4 php-5.6.7/ext/opcache/config.m4
 +flock_type=linux
 +AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
  
- if test "$flock_type" == "unknown"; then
+ if test "$flock_type" = "unknown"; then
  	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
+-- 
+2.7.4
+
diff --git a/package/php/0005-ac-cache-strcasestr.patch b/package/php/0005-ac-cache-strcasestr.patch
deleted file mode 100644
index 8a8c5d8..0000000
--- a/package/php/0005-ac-cache-strcasestr.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Allow cache answer for strcasestr discovery.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura php-5.6.7.orig/ext/fileinfo/config.m4 php-5.6.7/ext/fileinfo/config.m4
---- php-5.6.7.orig/ext/fileinfo/config.m4	2015-04-08 22:19:45.798770792 -0300
-+++ php-5.6.7/ext/fileinfo/config.m4	2015-04-08 22:26:33.110654338 -0300
-@@ -14,6 +14,7 @@
-     libmagic/readcdf.c libmagic/softmagic.c"
- 
-   AC_MSG_CHECKING([for strcasestr])
-+  AC_CACHE_VAL(ac_cv_func_strcasestr,
-   AC_TRY_RUN([
- #include <string.h>
- #include <strings.h>
-@@ -46,7 +47,7 @@
-     AC_MSG_RESULT(no)
-     AC_MSG_NOTICE(using libmagic strcasestr implementation)
-     libmagic_sources="$libmagic_sources libmagic/strcasestr.c"
--  ])
-+  ]))
- 
-   PHP_NEW_EXTENSION(fileinfo, fileinfo.c $libmagic_sources, $ext_shared,,-I at ext_srcdir@/libmagic)
-   PHP_ADD_BUILD_DIR($ext_builddir/libmagic)
diff --git a/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch b/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
new file mode 100644
index 0000000..a36c2a3
--- /dev/null
+++ b/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
@@ -0,0 +1,35 @@
+From a874ba472151c6811018de322a5787d0ca6148c9 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 9 Aug 2016 11:52:51 +0200
+Subject: [PATCH] ext/fileinfo/config.m4: allow cache answer for strcasestr
+ discovery
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ ext/fileinfo/config.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
+index 7e98d62..8561962 100644
+--- a/ext/fileinfo/config.m4
++++ b/ext/fileinfo/config.m4
+@@ -14,6 +14,7 @@ if test "$PHP_FILEINFO" != "no"; then
+     libmagic/readcdf.c libmagic/softmagic.c"
+ 
+   AC_MSG_CHECKING([for strcasestr])
++  AC_CACHE_VAL(ac_cv_func_strcasestr,
+   AC_TRY_RUN([
+ #include <string.h>
+ #include <strings.h>
+@@ -46,7 +47,7 @@ int main(void)
+     AC_MSG_RESULT(no)
+     AC_MSG_NOTICE(using libmagic strcasestr implementation)
+     libmagic_sources="$libmagic_sources libmagic/strcasestr.c"
+-  ])
++  ]))
+ 
+   PHP_NEW_EXTENSION(fileinfo, fileinfo.c $libmagic_sources, $ext_shared,,-I at ext_srcdir@/libmagic)
+   PHP_ADD_BUILD_DIR($ext_builddir/libmagic)
+-- 
+2.7.4
+
diff --git a/package/php/0006-fix-php-fpm.service.in.patch b/package/php/0006-Fix-php-fpm.service.in.patch
similarity index 93%
rename from package/php/0006-fix-php-fpm.service.in.patch
rename to package/php/0006-Fix-php-fpm.service.in.patch
index a182a25..68cb50a 100644
--- a/package/php/0006-fix-php-fpm.service.in.patch
+++ b/package/php/0006-Fix-php-fpm.service.in.patch
@@ -1,4 +1,4 @@
-From bb19125781c0794da9a63fee62e263ff4efff661 Mon Sep 17 00:00:00 2001
+From 1a8714d0b56e06301b3c261eaef93d897ec5d834 Mon Sep 17 00:00:00 2001
 From: Floris Bos <bos@je-eigen-domein.nl>
 Date: Fri, 1 May 2015 15:28:55 +0200
 Subject: [PATCH] Fix php-fpm.service.in
@@ -31,5 +31,5 @@ index a2df30e..c135f04 100644
  
  [Install]
 -- 
-2.1.4
+2.7.4
 
