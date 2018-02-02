From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Feb 2018 21:36:38 +0100
Subject: [Buildroot] [git commit] php: bump version to 7.2.2
Message-ID: <20180202203804.794F788243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a7eca9baaf9930ef0c975621a8b941bfa11efe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additional changes:
  - Fix ordering of patches.
  - Update patches to apply cleanly against 7.2.2
  - Updates License sha256sum

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/0001-acinclude.m4-don-t-unset-variables.patch           | 6 ++++--
 package/php/0002-iconv-tweak-iconv-detection.patch                  | 4 +++-
 package/php/0003-configure-disable-the-phar-tool.patch              | 4 ++--
 .../0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch | 6 ++++--
 ...d-bfin-gcc-segfault.patch => 0006-avoid-bfin-gcc-segfault.patch} | 5 +++--
 ...orrect-prefix.patch => 0007-Call-apxs-with-correct-prefix.patch} | 2 ++
 package/php/php.hash                                                | 4 ++--
 package/php/php.mk                                                  | 2 +-
 8 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/php/0001-acinclude.m4-don-t-unset-variables.patch b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
index d507775b8a..b23911322f 100644
--- a/package/php/0001-acinclude.m4-don-t-unset-variables.patch
+++ b/package/php/0001-acinclude.m4-don-t-unset-variables.patch
@@ -7,6 +7,8 @@ Unsetting ac_cv_{func,lib}_* is bad, you can't feed the configure cache.
 Terminate them with extreme prejudice.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[aduskett at gmail.com: Update for 7.2.2]
 ---
  acinclude.m4 | 4 ----
  1 file changed, 4 deletions(-)
@@ -15,7 +17,7 @@ diff --git a/acinclude.m4 b/acinclude.m4
 index 28506b6..af4aa06 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -1898,8 +1898,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
+@@ -1890,8 +1890,6 @@ define([phpshift],[ifelse(index([$@],[,]),-1,,[substr([$@],incr(index([$@],[,]))
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
    ifelse($2,,:,[
@@ -24,7 +26,7 @@ index 28506b6..af4aa06 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1931,8 +1929,6 @@ dnl in the default libraries and as a fall back in the specified library.
+@@ -1923,8 +1921,6 @@ dnl in the default libraries and as a fall back in the specified library.
  dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/package/php/0002-iconv-tweak-iconv-detection.patch b/package/php/0002-iconv-tweak-iconv-detection.patch
index a34664930b..e921030d29 100644
--- a/package/php/0002-iconv-tweak-iconv-detection.patch
+++ b/package/php/0002-iconv-tweak-iconv-detection.patch
@@ -13,6 +13,8 @@ PHP_ICONV_H_PATH which, again, uses test and absolute paths.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
 [Gustavo: update for 5.6.10]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[aduskett at gmail.com: Update for 7.2.2]
 ---
  acinclude.m4        |  2 +-
  ext/iconv/config.m4 | 22 ----------------------
@@ -22,7 +24,7 @@ diff --git a/acinclude.m4 b/acinclude.m4
 index af4aa06..1bd2652 100644
 --- a/acinclude.m4
 +++ b/acinclude.m4
-@@ -2471,7 +2471,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -2463,7 +2463,7 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl
    if test "$found_iconv" = "no"; then
  
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 17a92abe63..e41584e8e5 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -11,7 +11,7 @@ on the target.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
 Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
-[Aduskett: update for php7.2.1]
+[Aduskett: update for 7.2.2]
 ---
  configure.ac | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
@@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index d20af76..7f02f1a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1419,13 +1419,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
+@@ -1420,13 +1420,8 @@ CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch b/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
index a36c2a3ae0..257ac70f4f 100644
--- a/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
+++ b/package/php/0005-ext-fileinfo-config.m4-allow-cache-answer-for-strcas.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] ext/fileinfo/config.m4: allow cache answer for strcasestr
  discovery
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[aduskett at gmail.com: Update for 7.2.2]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  ext/fileinfo/config.m4 | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -13,14 +15,14 @@ diff --git a/ext/fileinfo/config.m4 b/ext/fileinfo/config.m4
 index 7e98d62..8561962 100644
 --- a/ext/fileinfo/config.m4
 +++ b/ext/fileinfo/config.m4
-@@ -14,6 +14,7 @@ if test "$PHP_FILEINFO" != "no"; then
-     libmagic/readcdf.c libmagic/softmagic.c"
+@@ -15,6 +15,7 @@ libmagic/readcdf.c libmagic/softmagic.c libmagic/der.c"
  
    AC_MSG_CHECKING([for strcasestr])
 +  AC_CACHE_VAL(ac_cv_func_strcasestr,
    AC_TRY_RUN([
  #include <string.h>
  #include <strings.h>
+ #include <stdlib.h>
 @@ -46,7 +47,7 @@ int main(void)
      AC_MSG_RESULT(no)
      AC_MSG_NOTICE(using libmagic strcasestr implementation)
diff --git a/package/php/0007-avoid-bfin-gcc-segfault.patch b/package/php/0006-avoid-bfin-gcc-segfault.patch
similarity index 88%
rename from package/php/0007-avoid-bfin-gcc-segfault.patch
rename to package/php/0006-avoid-bfin-gcc-segfault.patch
index 4dccb25f1f..7f8cb24e7a 100644
--- a/package/php/0007-avoid-bfin-gcc-segfault.patch
+++ b/package/php/0006-avoid-bfin-gcc-segfault.patch
@@ -1,11 +1,12 @@
 Avoid gcc segmentation fault
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[aduskett at gmail.com: Update for 7.2.2]
 diff -Nur php-7.0.12.orig/Zend/zend_portability.h php-7.0.12/Zend/zend_portability.h
 --- php-7.0.12.orig/Zend/zend_portability.h	2016-10-13 16:04:17.000000000 +0200
 +++ php-7.0.12/Zend/zend_portability.h	2016-11-08 02:49:39.118388999 +0100
-@@ -97,7 +97,7 @@
+@@ -95,7 +95,7 @@
  
  #if defined(ZEND_WIN32) && !defined(__clang__)
  # define ZEND_ASSUME(c)	__assume(c)
diff --git a/package/php/0008-Call-apxs-with-correct-prefix.patch b/package/php/0007-Call-apxs-with-correct-prefix.patch
similarity index 95%
rename from package/php/0008-Call-apxs-with-correct-prefix.patch
rename to package/php/0007-Call-apxs-with-correct-prefix.patch
index b850ab7755..c81711d2a0 100644
--- a/package/php/0008-Call-apxs-with-correct-prefix.patch
+++ b/package/php/0007-Call-apxs-with-correct-prefix.patch
@@ -15,6 +15,8 @@ httpd.conf will only be correct in the staging directory.
 To fix this, add -S PREFIX='$(INSTALL_ROOT)/usr' to apxs call in configure
 
 Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[aduskett at gmail.com: Update for 7.2.2]
 ---
  sapi/apache2handler/config.m4 | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/package/php/php.hash b/package/php/php.hash
index 60783cac7a..fdb4446d2b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 6c6cf82fda6660ed963821eb0525214bb3547e8e29f447b9c15b2d8e6efd8822  php-7.2.1.tar.xz
+sha256 47d7607d38a1d565fc43ea942c92229a7cd165f156737f210937e375b243cb11  php-7.2.2.tar.xz
 
 # License file
-sha256 a44951f93b10c87c3f7cd9f311d95999c57c95ed950eec32b14c1c7ea6baf25e  LICENSE
+sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 152ec7d780..a4481c45c7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.1
+PHP_VERSION = 7.2.2
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
