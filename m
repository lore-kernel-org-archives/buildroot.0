From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 13 Dec 2014 18:43:08 +0100
Subject: [Buildroot] [PATCH 3/3] package/guile: fix build failure
In-Reply-To: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1418492588-22122-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches fix a number of dependency mis-detection (libltdl, libgmp
libunistring and locale support).

These patches are necessary to fix the build failures below, but also to
fix build failure with musl-based toolchains.

Fixes:
  http://autobuild.buildroot.org/results/f99/f99f2d5f29f282906c3c37b61dd56d6d71971bf7/
  http://autobuild.buildroot.org/results/bf7/bf716169aef4a6449991a62ada8de8e8fb107aba/
  http://autobuild.buildroot.org/results/565/565e5b613e125d4557bfcefd41d28644f3d6ab35/
  http://autobuild.buildroot.org/results/605/6053382dc78e6ddd588ba87be43b768c878293d5/
  http://autobuild.buildroot.org/results/e3c/e3c92c38c6b812d36ca12ffc8e7a0a4ccea34bc7/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...e.ac-use-AC_LINK_IFELSE-for-libltdl-check.patch | 32 +++++++++
 ...re.ac-use-AC_LINK_IFELSE-for-libgmp-check.patch | 35 ++++++++++
 ...c-use-AC_LINK_IFELSE-for-libunistring-che.patch | 81 ++++++++++++++++++++++
 ...figure.ac-add-check-for-strtol_l-function.patch | 47 +++++++++++++
 package/guile/guile.mk                             |  3 +
 5 files changed, 198 insertions(+)
 create mode 100644 package/guile/0004-configure.ac-use-AC_LINK_IFELSE-for-libltdl-check.patch
 create mode 100644 package/guile/0005-configure.ac-use-AC_LINK_IFELSE-for-libgmp-check.patch
 create mode 100644 package/guile/0006-configure.ac-use-AC_LINK_IFELSE-for-libunistring-che.patch
 create mode 100644 package/guile/0007-configure.ac-add-check-for-strtol_l-function.patch

diff --git a/package/guile/0004-configure.ac-use-AC_LINK_IFELSE-for-libltdl-check.patch b/package/guile/0004-configure.ac-use-AC_LINK_IFELSE-for-libltdl-check.patch
new file mode 100644
index 0000000..53ac893
--- /dev/null
+++ b/package/guile/0004-configure.ac-use-AC_LINK_IFELSE-for-libltdl-check.patch
@@ -0,0 +1,32 @@
+From 86cf3d5cb164020918b0383e1a1105850f93fe70 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 7 Dec 2014 15:00:31 +0100
+Subject: [PATCH 4/7] configure.ac: use AC_LINK_IFELSE for libltdl check
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7e8b396..275fb75 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -94,8 +94,12 @@ AC_PROG_LIBTOOL
+ AM_CONDITIONAL([HAVE_SHARED_LIBRARIES], [test "x$enable_shared" = "xyes"])
+ 
+ dnl Check for libltdl.
+-AC_LIB_HAVE_LINKFLAGS([ltdl], [], [#include <ltdl.h>],
+-  [lt_dlopenext ("foo");])
++LIBLTDL="-lltdl"
++LIBS="$LIBLTDL $LIBS"
++AC_MSG_CHECKING([for the libltdl])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <ltdl.h>]],[[lt_dlopenext ("foo");]])],
++  [[LIBLTDL="-lltdl" ; HAVE_LIBLTDL=yes]], [[LIBLTDL= ; HAVE_LIBLTDL=no]])
++AC_MSG_RESULT($HAVE_LIBLTDL)
+ if test "x$HAVE_LIBLTDL" != "xyes"; then
+   AC_MSG_ERROR([GNU libltdl (Libtool) not found, see README.])
+ fi
+-- 
+2.1.3
+
diff --git a/package/guile/0005-configure.ac-use-AC_LINK_IFELSE-for-libgmp-check.patch b/package/guile/0005-configure.ac-use-AC_LINK_IFELSE-for-libgmp-check.patch
new file mode 100644
index 0000000..503411b
--- /dev/null
+++ b/package/guile/0005-configure.ac-use-AC_LINK_IFELSE-for-libgmp-check.patch
@@ -0,0 +1,35 @@
+From 0f26f1e18f7591aaaeee5562d856ba350bb1be61 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 7 Dec 2014 16:45:58 +0100
+Subject: [PATCH 5/7] configure.ac: use AC_LINK_IFELSE for libgmp check
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 275fb75..4c4f4fd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -877,11 +877,12 @@ fi
+ AC_CACHE_SAVE
+ 
+ dnl GMP tests
+-AC_LIB_HAVE_LINKFLAGS([gmp],
+-  [],
+-  [#include <gmp.h>],
+-  [mpz_import (0, 0, 0, 0, 0, 0, 0);])
+-
++LIBGMP="-lgmp"
++LIBS="$LIBGMP $LIBS"
++AC_MSG_CHECKING([for the libgmp])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <gmp.h>]],[[mpz_import (0, 0, 0, 0, 0, 0, 0);]])],
++  [[LIBGMP="-lgmp" ; HAVE_LIBGMP=yes]], [[LIBGMP= ; HAVE_LIBGMP=no]])
++AC_MSG_RESULT($HAVE_LIBGMP)
+ if test "x$HAVE_LIBGMP" != "xyes"; then
+   AC_MSG_ERROR([GNU MP 4.1 or greater not found, see README])
+ fi
+-- 
+2.1.3
+
diff --git a/package/guile/0006-configure.ac-use-AC_LINK_IFELSE-for-libunistring-che.patch b/package/guile/0006-configure.ac-use-AC_LINK_IFELSE-for-libunistring-che.patch
new file mode 100644
index 0000000..a899462
--- /dev/null
+++ b/package/guile/0006-configure.ac-use-AC_LINK_IFELSE-for-libunistring-che.patch
@@ -0,0 +1,81 @@
+From 73222acb19916044611add0abbe470a11180a9eb Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 7 Dec 2014 17:14:47 +0100
+Subject: [PATCH 6/7] configure.ac: use AC_LINK_IFELSE for libunistring checks
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac       |  7 +++++++
+ m4/libunistring.m4 | 24 +++++++++++++++---------
+ 2 files changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4c4f4fd..7af9c7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -896,6 +896,13 @@ AC_CHECK_DECLS([mpz_inits], [], [], [[#include <gmp.h>]])
+ CPPFLAGS="$save_CPPFLAGS"
+ 
+ dnl GNU libunistring is checked for by Gnulib's `libunistring' module.
++LIBUNISTRING="-lunistring"
++LIBS="$LIBUNISTRING $LIBS"
++AC_MSG_CHECKING([for the libunistring])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <uniconv.h>]],[[u8_strconv_from_locale((char*)0);]])],
++  [[LIBUNISTRING="-lunistring" ; LTLIBUNISTRING="-lunistring" ; HAVE_LIBUNISTRING=yes]],
++  [[LIBUNISTRING= ; HAVE_LIBUNISTRING=no]])
++AC_MSG_RESULT($HAVE_LIBUNISTRING)
+ if test "x$LTLIBUNISTRING" = "x"; then
+   AC_MSG_ERROR([GNU libunistring is required, please install it.])
+ fi
+diff --git a/m4/libunistring.m4 b/m4/libunistring.m4
+index 35980dd..864a32f 100644
+--- a/m4/libunistring.m4
++++ b/m4/libunistring.m4
+@@ -72,9 +72,14 @@ AC_DEFUN([gl_LIBUNISTRING_CORE],
+     dnl First, try to link without -liconv. libunistring often depends on
+     dnl libiconv, but we don't know (and often don't need to know) where
+     dnl libiconv is installed.
+-    AC_LIB_HAVE_LINKFLAGS([unistring], [],
+-      [#include <uniconv.h>], [u8_strconv_from_locale((char*)0);],
+-      [no, trying again together with libiconv])
++
++    LIBUNISTRING="-lunistring"
++    LIBS="$LIBUNISTRING $LIBS"
++    AC_MSG_CHECKING([for the libunistring])
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <uniconv.h>]],[[u8_strconv_from_locale((char*)0);]])],
++      [[LIBUNISTRING="-lunistring" ; LTLIBUNISTRING="-lunistring" ; HAVE_LIBUNISTRING=yes ; ac_cv_libunistring=yes]],
++      [[LIBUNISTRING= ; HAVE_LIBUNISTRING=no ; ac_cv_libunistring=no]])
++
+     if test "$ac_cv_libunistring" != yes; then
+       dnl Second try, with -liconv.
+       dnl We have to erase the cached result of the first AC_LIB_HAVE_LINKFLAGS
+@@ -82,9 +87,10 @@ AC_DEFUN([gl_LIBUNISTRING_CORE],
+       unset ac_cv_libunistring
+       glus_save_LIBS="$LIBS"
+       LIBS="$LIBS $LIBICONV"
+-      AC_LIB_HAVE_LINKFLAGS([unistring], [],
+-        [#include <uniconv.h>], [u8_strconv_from_locale((char*)0);],
+-        [no, consider installing GNU libunistring])
++      AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <uniconv.h>]],[[u8_strconv_from_locale((char*)0);]])],
++        [[LIBUNISTRING="-lunistring" ; LTLIBUNISTRING="-lunistring" ; HAVE_LIBUNISTRING=yes]],
++        [[LIBUNISTRING= ; HAVE_LIBUNISTRING=no]])
++
+       if test -n "$LIBUNISTRING"; then
+         LIBUNISTRING="$LIBUNISTRING $LIBICONV"
+         LTLIBUNISTRING="$LTLIBUNISTRING $LTLIBICONV"
+@@ -92,9 +98,9 @@ AC_DEFUN([gl_LIBUNISTRING_CORE],
+       LIBS="$glus_save_LIBS"
+     fi
+   else
+-    AC_LIB_HAVE_LINKFLAGS([unistring], [],
+-      [#include <uniconv.h>], [u8_strconv_from_locale((char*)0);],
+-      [no, consider installing GNU libunistring])
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <uniconv.h>]],[[u8_strconv_from_locale((char*)0);]])],
++      [[LIBUNISTRING="-lunistring" ; LTLIBUNISTRING="-lunistring" ; HAVE_LIBUNISTRING=yes]],
++      [[LIBUNISTRING= ; HAVE_LIBUNISTRING=no]])
+   fi
+   if test $HAVE_LIBUNISTRING = yes; then
+     dnl Determine the installed version.
+-- 
+2.1.3
+
diff --git a/package/guile/0007-configure.ac-add-check-for-strtol_l-function.patch b/package/guile/0007-configure.ac-add-check-for-strtol_l-function.patch
new file mode 100644
index 0000000..fb6a116
--- /dev/null
+++ b/package/guile/0007-configure.ac-add-check-for-strtol_l-function.patch
@@ -0,0 +1,47 @@
+From 93e1a2b8eef99181ddf620414ae675e895f3a048 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 10 Dec 2014 08:28:17 +0100
+Subject: [PATCH 7/7] configure.ac: add check for strtol_l function
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac    | 9 +++++++++
+ libguile/i18n.c | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7af9c7b..92abc84 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -895,6 +895,15 @@ fi
+ AC_CHECK_DECLS([mpz_inits], [], [], [[#include <gmp.h>]])
+ CPPFLAGS="$save_CPPFLAGS"
+ 
++dnl strtol_l (locale) tests
++AC_MSG_CHECKING([for strtol_l])
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>]],[[strtol_l (0, 0, 0, 0);]])],
++  [[HAVE_STRTOL_L=yes]], [[HAVE_STRTOL_L=no]])
++AC_MSG_RESULT($HAVE_STRTOL_L)
++if test "x$HAVE_STRTOL_L" = "xyes"; then
++  AC_DEFINE([HAVE_STRTOL_L], 1, [Define to 1 if strtol_l is defined])
++fi
++
+ dnl GNU libunistring is checked for by Gnulib's `libunistring' module.
+ LIBUNISTRING="-lunistring"
+ LIBS="$LIBUNISTRING $LIBS"
+diff --git a/libguile/i18n.c b/libguile/i18n.c
+index 395e528..2bb4812 100644
+--- a/libguile/i18n.c
++++ b/libguile/i18n.c
+@@ -40,7 +40,7 @@
+ #include <unicase.h>
+ #include <unistr.h>
+ 
+-#if (defined HAVE_NEWLOCALE) && (defined HAVE_STRCOLL_L)
++#if (defined HAVE_NEWLOCALE) && (defined HAVE_STRCOLL_L) && defined(HAVE_STRTOL_L)
+ /* The GNU thread-aware locale API is documented in ``Thread-Aware Locale
+    Model, a Proposal'', by Ulrich Drepper:
+ 
+-- 
+2.1.3
+
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 30af11d..238e39a 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -11,6 +11,9 @@ GUILE_INSTALL_STAGING = YES
 GUILE_LICENSE = LGPLv3+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 
+# autoreconf if needed because we are patching configure.ac and some *.m4 files
+GUILE_AUTORECONF = YES
+
 # libtool dependency is needed because guile uses libltdl
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
-- 
2.1.3
