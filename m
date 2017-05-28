From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:04:15 +0200
Subject: [Buildroot] [git commit] package/gettext: update wint_t.m4 from
	gnulib
Message-ID: <20170601202858.875C582A3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9563ebecf26edac103e39880bd7acc938cfeea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for coreutils bump to 8.27

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gettext/0002-Update-after-gnulib-changed.patch | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/package/gettext/0002-Update-after-gnulib-changed.patch b/package/gettext/0002-Update-after-gnulib-changed.patch
new file mode 100644
index 0000000..5f5e5f6
--- /dev/null
+++ b/package/gettext/0002-Update-after-gnulib-changed.patch
@@ -0,0 +1,86 @@
+From a6f9caf8cc7614665d1be694485dd7bc30399e0f Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Tue, 16 May 2017 00:27:57 +0200
+Subject: [PATCH] Update after gnulib changed.
+
+For buildroot we only need to update wint_t.m4 to fix autoreconf with
+certain packages which already contain the updated version of this file.
+Otherwise autoreconf will break:
+
+http://git.net/ml/bug-gnulib-gnu/2017-01/msg00067.html
+https://git.busybox.net/buildroot/commit/package/wget?id=c36f0d65ad63589f1b21833ef53d429c018b6f8a
+
+Patch backported from upstream commit:
+http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=a6f9caf8cc7614665d1be694485dd7bc30399e0f
+
+Needed for coreutils bump to 8.27
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/gettext-runtime/m4/wint_t.m4 b/gettext-runtime/m4/wint_t.m4
+index 8ff2a5b5a..d30b8bcf8 100644
+--- a/gettext-runtime/m4/wint_t.m4
++++ b/gettext-runtime/m4/wint_t.m4
+@@ -1,11 +1,12 @@
+-# wint_t.m4 serial 5 (gettext-0.18.2)
+-dnl Copyright (C) 2003, 2007-2016 Free Software Foundation, Inc.
++# wint_t.m4 serial 7
++dnl Copyright (C) 2003, 2007-2017 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+ dnl From Bruno Haible.
+-dnl Test whether <wchar.h> has the 'wint_t' type.
++dnl Test whether <wchar.h> has the 'wint_t' type and whether gnulib's
++dnl <wchar.h> or <wctype.h> would, if present, override 'wint_t'.
+ dnl Prerequisite: AC_PROG_CC
+ 
+ AC_DEFUN([gt_TYPE_WINT_T],
+@@ -28,5 +29,46 @@ AC_DEFUN([gt_TYPE_WINT_T],
+        [gt_cv_c_wint_t=no])])
+   if test $gt_cv_c_wint_t = yes; then
+     AC_DEFINE([HAVE_WINT_T], [1], [Define if you have the 'wint_t' type.])
++
++    dnl Determine whether gnulib's <wchar.h> or <wctype.h> would, if present,
++    dnl override 'wint_t'.
++    AC_CACHE_CHECK([whether wint_t is too small],
++      [gl_cv_type_wint_t_too_small],
++      [AC_COMPILE_IFELSE(
++           [AC_LANG_PROGRAM([[
++/* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
++   <wchar.h>.
++   BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
++   included before <wchar.h>.  */
++#if !(defined __GLIBC__ && !defined __UCLIBC__)
++# include <stddef.h>
++# include <stdio.h>
++# include <time.h>
++#endif
++#include <wchar.h>
++              int verify[sizeof (wint_t) < sizeof (int) ? -1 : 1];
++              ]])],
++           [gl_cv_type_wint_t_too_small=no],
++           [gl_cv_type_wint_t_too_small=yes])])
++    if test $gl_cv_type_wint_t_too_small = yes; then
++      GNULIB_OVERRIDES_WINT_T=1
++    else
++      GNULIB_OVERRIDES_WINT_T=0
++    fi
++  else
++    GNULIB_OVERRIDES_WINT_T=0
++  fi
++  AC_SUBST([GNULIB_OVERRIDES_WINT_T])
++])
++
++dnl Prerequisites of the 'wint_t' override.
++AC_DEFUN([gl_TYPE_WINT_T_PREREQ],
++[
++  AC_CHECK_HEADERS_ONCE([crtdefs.h])
++  if test $ac_cv_header_crtdefs_h = yes; then
++    HAVE_CRTDEFS_H=1
++  else
++    HAVE_CRTDEFS_H=0
+   fi
++  AC_SUBST([HAVE_CRTDEFS_H])
+ ])
