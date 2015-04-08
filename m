From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 12:39:28 -0300
Subject: [Buildroot] [PATCH 2/3] php: cleanup patches
In-Reply-To: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428507569-28044-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert patches from pure configure ones to *.m4/configure.in cleanness.
This allows us to AUTORECONF (well, not quite, but close).
Even though upstream will probably not accept them it's the right way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/0001-ditch-unset.patch     | 26 ++++++++++++++
 package/php/0001-no-iconv-search.patch | 65 ----------------------------------
 package/php/0002-dlopen.patch          | 25 -------------
 package/php/0002-no-iconv-search.patch | 55 ++++++++++++++++++++++++++++
 package/php/0003-disable-pharcmd.patch |  9 ++---
 package/php/php.mk                     |  7 ++++
 6 files changed, 93 insertions(+), 94 deletions(-)
 create mode 100644 package/php/0001-ditch-unset.patch
 delete mode 100644 package/php/0001-no-iconv-search.patch
 delete mode 100644 package/php/0002-dlopen.patch
 create mode 100644 package/php/0002-no-iconv-search.patch

diff --git a/package/php/0001-ditch-unset.patch b/package/php/0001-ditch-unset.patch
new file mode 100644
index 0000000..b43b40f
--- /dev/null
+++ b/package/php/0001-ditch-unset.patch
@@ -0,0 +1,26 @@
+Unsetting ac_cv_{func,lib}_* is bad, you can't feed the configure cache.
+Terminate them with extreme prejudice.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.6.7.orig/aclocal.m4 php-5.6.7/aclocal.m4
+--- php-5.6.7.orig/aclocal.m4	2015-04-08 11:08:11.208848359 -0300
++++ php-5.6.7/aclocal.m4	2015-04-08 11:08:49.828160195 -0300
+@@ -1897,8 +1897,6 @@
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC_LIB],[
+   ifelse($2,,:,[
+-  unset ac_cv_lib_$2[]_$1
+-  unset ac_cv_lib_$2[]___$1
+   unset found
+   AC_CHECK_LIB($2, $1, [found=yes], [
+     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
+@@ -1930,8 +1928,6 @@
+ dnl Defines HAVE_func and HAVE_library if found and adds the library to LIBS.
+ dnl
+ AC_DEFUN([PHP_CHECK_FUNC],[
+-  unset ac_cv_func_$1
+-  unset ac_cv_func___$1
+   unset found
+   
+   AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
diff --git a/package/php/0001-no-iconv-search.patch b/package/php/0001-no-iconv-search.patch
deleted file mode 100644
index 1979b7d..0000000
--- a/package/php/0001-no-iconv-search.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Tweak PHP_SETUP_ICONV from aclocal/acinclude.m4 to not
-PHP_ADD_INCLUDE $ICONV_DIR/include since the tests use
-test instead of AC_TRY_LINK to find headers which is bad,
-specially when adding /usr and /usr/local to the mix.
-Do basically the same with ext/iconv/config.m4 by tweaking
-PHP_ICONV_H_PATH which, again, uses test and absolute paths.
-And all this directly in configure since autoreconf isn't
-happy with php.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura php-5.5.11.orig/configure php-5.5.11/configure
---- php-5.5.11.orig/configure	2014-04-16 14:55:52.300838499 -0300
-+++ php-5.5.11/configure	2014-04-22 21:54:01.499097295 -0300
-@@ -45751,12 +45751,6 @@
-   if test -n "$unique" && test "`eval $cmd`" = "" ; then
-     eval "INCLUDEPATH$unique=set"
- 
--      if test ""; then
--        INCLUDES="-I$ai_p $INCLUDES"
--      else
--        INCLUDES="$INCLUDES -I$ai_p"
--      fi
--
-   fi
- 
-   fi
-@@ -45786,14 +45780,7 @@
-       PHP_ICONV_PREFIX="$ICONV_DIR"
-     fi
- 
--    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
--    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
--
--    if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
--      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
--    else
--      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/iconv.h"
--    fi
-+      PHP_ICONV_H_PATH="iconv.h"
- 
-     { $as_echo "$as_me:${as_lineno-$LINENO}: checking if iconv is glibc's" >&5
- $as_echo_n "checking if iconv is glibc's... " >&6; }
-@@ -46191,8 +46178,6 @@
-   ext_builddir=ext/iconv
-   ext_srcdir=$abs_srcdir/ext/iconv
- 
--  ac_extra=`echo "-I\"$PHP_ICONV_PREFIX/include\""|$SED s#@ext_srcdir@#$ext_srcdir#g|$SED s#@ext_builddir@#$ext_builddir#g`
--
-   if test "$ext_shared" != "shared" && test "$ext_shared" != "yes" && test "" != "cli"; then
-     PHP_ICONV_SHARED=no
- 
-@@ -97419,12 +97404,6 @@
-   if test -n "$unique" && test "`eval $cmd`" = "" ; then
-     eval "INCLUDEPATH$unique=set"
- 
--      if test ""; then
--        INCLUDES="-I$ai_p $INCLUDES"
--      else
--        INCLUDES="$INCLUDES -I$ai_p"
--      fi
--
-   fi
- 
-   fi
diff --git a/package/php/0002-dlopen.patch b/package/php/0002-dlopen.patch
deleted file mode 100644
index 1dd009f..0000000
--- a/package/php/0002-dlopen.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-PHP can't be AUTORECONF with any modern autotools and the dl tests are
-pretty bad for cross-compilation, so just kill the needed ac_cv value unsets
-so they can flow through from the package makefile.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura php-5.5.8.orig/configure php-5.5.8/configure
---- php-5.5.8.orig/configure	2014-01-28 17:41:33.943851727 -0300
-+++ php-5.5.8/configure	2014-01-28 17:42:53.785493795 -0300
-@@ -16985,7 +16985,6 @@
- 
- 
- 
--  unset ac_cv_func_dlopen
-   unset ac_cv_func___dlopen
-   unset found
- 
-@@ -17013,7 +17012,6 @@
- 
-     *)
- 
--  unset ac_cv_lib_dl_dlopen
-   unset ac_cv_lib_dl___dlopen
-   unset found
-   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for dlopen in -ldl" >&5
diff --git a/package/php/0002-no-iconv-search.patch b/package/php/0002-no-iconv-search.patch
new file mode 100644
index 0000000..3496222
--- /dev/null
+++ b/package/php/0002-no-iconv-search.patch
@@ -0,0 +1,55 @@
+Tweak PHP_SETUP_ICONV from aclocal/acinclude.m4 to not
+PHP_ADD_INCLUDE $ICONV_DIR/include since the tests use
+test instead of AC_TRY_LINK to find headers which is bad,
+specially when adding /usr and /usr/local to the mix.
+Do basically the same with ext/iconv/config.m4 by tweaking
+PHP_ICONV_H_PATH which, again, uses test and absolute paths.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Gustavo: convert to nice m4 instead of patching configure]
+
+diff -Nura php-5.6.7.orig/aclocal.m4 php-5.6.7/aclocal.m4
+--- php-5.6.7.orig/aclocal.m4	2015-04-08 11:08:11.208848359 -0300
++++ php-5.6.7/aclocal.m4	2015-04-08 11:42:17.321044950 -0300
+@@ -2474,7 +2474,7 @@
+   dnl
+   if test "$found_iconv" = "no"; then
+ 
+-    for i in $PHP_ICONV /usr/local /usr; do
++    for i in $PHP_ICONV; do
+       if test -r $i/include/giconv.h; then
+         AC_DEFINE(HAVE_GICONV_H, 1, [ ])
+         ICONV_DIR=$i
+diff -Nura php-5.6.7.orig/ext/iconv/config.m4 php-5.6.7/ext/iconv/config.m4
+--- php-5.6.7.orig/ext/iconv/config.m4	2015-04-08 11:08:11.184847544 -0300
++++ php-5.6.7/ext/iconv/config.m4	2015-04-08 11:39:07.823608030 -0300
+@@ -14,28 +14,8 @@
+   ])
+ 
+   if test "$iconv_avail" != "no"; then
+-    if test -z "$ICONV_DIR"; then
+-      for i in /usr/local /usr; do
+-        if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
+-          PHP_ICONV_PREFIX="$i"
+-          break
+-        fi
+-      done
+-      if test -z "$PHP_ICONV_PREFIX"; then
+-        PHP_ICONV_PREFIX="/usr"
+-      fi
+-    else
+-      PHP_ICONV_PREFIX="$ICONV_DIR"
+-    fi
+ 
+-    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
+-    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
+-
+-    if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
+-      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
+-    else
+-      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/iconv.h"
+-    fi 
++    PHP_ICONV_H_PATH="iconv.h"
+ 
+     AC_MSG_CHECKING([if iconv is glibc's])
+     AC_TRY_LINK([#include <gnu/libc-version.h>],[gnu_get_libc_version();],
diff --git a/package/php/0003-disable-pharcmd.patch b/package/php/0003-disable-pharcmd.patch
index d4a8464..bfcc956 100644
--- a/package/php/0003-disable-pharcmd.patch
+++ b/package/php/0003-disable-pharcmd.patch
@@ -4,11 +4,12 @@ a host-php instance and really probably nobody needs the phar tool
 on the target.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Gustavo: update for autoreconf/configure.in]
 
-diff -Nura php-5.5.14.orig/configure php-5.5.14/configure
---- php-5.5.14.orig/configure	2014-07-08 09:52:52.657753194 -0300
-+++ php-5.5.14/configure	2014-07-08 09:53:07.610243933 -0300
-@@ -112930,13 +112930,8 @@
+diff -Nura php-5.6.7.orig/configure.in php-5.6.7/configure.in
+--- php-5.6.7.orig/configure.in	2015-04-08 11:08:10.815835010 -0300
++++ php-5.6.7/configure.in	2015-04-08 11:16:20.460467444 -0300
+@@ -1437,13 +1437,8 @@
  INLINE_CFLAGS="$INLINE_CFLAGS $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag"
  
diff --git a/package/php/php.mk b/package/php/php.mk
index ed842b0..12f8eaa 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -22,6 +22,13 @@ PHP_CONF_OPTS = \
 	--disable-rpath
 PHP_CONF_ENV = EXTRA_LIBS="$(PHP_EXTRA_LIBS)"
 
+# PHP can't be AUTORECONFed the standard way unfortunately
+PHP_DEPENDENCIES += host-autoconf host-automake host-libtool
+define PHP_BUILDCONF
+	cd $(@D) ; ./buildconf --force
+endef
+PHP_PRE_CONFIGURE_HOOKS += PHP_BUILDCONF
+
 ifeq ($(BR2_ENDIAN),"BIG")
 PHP_CONF_ENV += ac_cv_c_bigendian_php=yes
 else
-- 
2.0.5
