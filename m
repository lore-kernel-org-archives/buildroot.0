From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 10:09:03 +0200
Subject: [Buildroot] [PATCH 2/3] package/gettext-gnu: bump version to 0.20.1
In-Reply-To: <20190630080904.4105-1-bernd.kuhls@t-online.de>
References: <20190630080904.4105-1-bernd.kuhls@t-online.de>
Message-ID: <20190630080904.4105-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Removed patch applied upstream
- Removed md5 hash which is not provided by upstream anymore
- Added locally computed sha256 hash for the tarball
- Updated license hash after upstream commit
  http://git.savannah.gnu.org/cgit/gettext.git/commit/COPYING?id=a57ffdb2f17d040a737e84114544fcd748fa87fa
- Added license hash for gettext-runtime/intl/COPYING.LIB
- Added note about changing gettext-tiny as well
- Ported changes from this version bump to gettext-tiny,
  lock.m4 can now be found in gnulib-m4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-Update-after-gnulib-changed.patch    | 86 -------------------
 package/gettext-gnu/gettext-gnu.hash          | 11 +--
 package/gettext-gnu/gettext-gnu.mk            |  4 +-
 package/gettext-tiny/gettext-tiny.hash        |  7 +-
 package/gettext-tiny/gettext-tiny.mk          |  4 +-
 5 files changed, 15 insertions(+), 97 deletions(-)
 delete mode 100644 package/gettext-gnu/0002-Update-after-gnulib-changed.patch

diff --git a/package/gettext-gnu/0002-Update-after-gnulib-changed.patch b/package/gettext-gnu/0002-Update-after-gnulib-changed.patch
deleted file mode 100644
index 5f5e5f6c25..0000000000
--- a/package/gettext-gnu/0002-Update-after-gnulib-changed.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From a6f9caf8cc7614665d1be694485dd7bc30399e0f Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 16 May 2017 00:27:57 +0200
-Subject: [PATCH] Update after gnulib changed.
-
-For buildroot we only need to update wint_t.m4 to fix autoreconf with
-certain packages which already contain the updated version of this file.
-Otherwise autoreconf will break:
-
-http://git.net/ml/bug-gnulib-gnu/2017-01/msg00067.html
-https://git.busybox.net/buildroot/commit/package/wget?id=c36f0d65ad63589f1b21833ef53d429c018b6f8a
-
-Patch backported from upstream commit:
-http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=a6f9caf8cc7614665d1be694485dd7bc30399e0f
-
-Needed for coreutils bump to 8.27
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/gettext-runtime/m4/wint_t.m4 b/gettext-runtime/m4/wint_t.m4
-index 8ff2a5b5a..d30b8bcf8 100644
---- a/gettext-runtime/m4/wint_t.m4
-+++ b/gettext-runtime/m4/wint_t.m4
-@@ -1,11 +1,12 @@
--# wint_t.m4 serial 5 (gettext-0.18.2)
--dnl Copyright (C) 2003, 2007-2016 Free Software Foundation, Inc.
-+# wint_t.m4 serial 7
-+dnl Copyright (C) 2003, 2007-2017 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
- 
- dnl From Bruno Haible.
--dnl Test whether <wchar.h> has the 'wint_t' type.
-+dnl Test whether <wchar.h> has the 'wint_t' type and whether gnulib's
-+dnl <wchar.h> or <wctype.h> would, if present, override 'wint_t'.
- dnl Prerequisite: AC_PROG_CC
- 
- AC_DEFUN([gt_TYPE_WINT_T],
-@@ -28,5 +29,46 @@ AC_DEFUN([gt_TYPE_WINT_T],
-        [gt_cv_c_wint_t=no])])
-   if test $gt_cv_c_wint_t = yes; then
-     AC_DEFINE([HAVE_WINT_T], [1], [Define if you have the 'wint_t' type.])
-+
-+    dnl Determine whether gnulib's <wchar.h> or <wctype.h> would, if present,
-+    dnl override 'wint_t'.
-+    AC_CACHE_CHECK([whether wint_t is too small],
-+      [gl_cv_type_wint_t_too_small],
-+      [AC_COMPILE_IFELSE(
-+           [AC_LANG_PROGRAM([[
-+/* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
-+   <wchar.h>.
-+   BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
-+   included before <wchar.h>.  */
-+#if !(defined __GLIBC__ && !defined __UCLIBC__)
-+# include <stddef.h>
-+# include <stdio.h>
-+# include <time.h>
-+#endif
-+#include <wchar.h>
-+              int verify[sizeof (wint_t) < sizeof (int) ? -1 : 1];
-+              ]])],
-+           [gl_cv_type_wint_t_too_small=no],
-+           [gl_cv_type_wint_t_too_small=yes])])
-+    if test $gl_cv_type_wint_t_too_small = yes; then
-+      GNULIB_OVERRIDES_WINT_T=1
-+    else
-+      GNULIB_OVERRIDES_WINT_T=0
-+    fi
-+  else
-+    GNULIB_OVERRIDES_WINT_T=0
-+  fi
-+  AC_SUBST([GNULIB_OVERRIDES_WINT_T])
-+])
-+
-+dnl Prerequisites of the 'wint_t' override.
-+AC_DEFUN([gl_TYPE_WINT_T_PREREQ],
-+[
-+  AC_CHECK_HEADERS_ONCE([crtdefs.h])
-+  if test $ac_cv_header_crtdefs_h = yes; then
-+    HAVE_CRTDEFS_H=1
-+  else
-+    HAVE_CRTDEFS_H=0
-   fi
-+  AC_SUBST([HAVE_CRTDEFS_H])
- ])
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index a2ab298760..1427a7788d 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,6 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
-md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
-sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
-# License files, locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
+sha1	62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90	gettext-0.20.1.tar.xz
+# Locally computed
+sha256	53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800	gettext-0.20.1.tar.xz
+sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	COPYING
+sha256	3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288	gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 28662e0dec..1d8266cf5f 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-GETTEXT_GNU_VERSION = 0.19.8.1
+# When updating the version, please also update gettext-tiny.hash and
+# GETTEXT_TINY_ARCHIVE_VERSION
+GETTEXT_GNU_VERSION = 0.20.1
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 7d13054144..21ecfd5d8b 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -2,6 +2,7 @@
 sha256 00b03b08d909021aa5580fb45b6cf0ec45e9084ef94c26f034f03a64a69942bc  gettext-tiny-c6dcdcdef801127549d3906d153c061880d25a73.tar.gz
 sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
-# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
-md5  df3f5690eaa30fd228537b00cb7b7590         gettext-0.19.8.1.tar.xz
-sha1 e0fe90ede22f7f16bbde7bdea791a835f2773fc9 gettext-0.19.8.1.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
+sha1 62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+# Locally computed
+sha256 53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 7db478d845..f4a6cad016 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -14,12 +14,12 @@ HOST_GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
 GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
-GETTEXT_TINY_ARCHIVE_VERSION = 0.19.8
+GETTEXT_TINY_ARCHIVE_VERSION = 0.20.1
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
 	gettext-tools/po/Makevars.template \
-	gettext-runtime/m4/lock.m4 \
+	gettext-runtime/gnulib-m4/lock.m4 \
 	gettext-runtime/po/boldquot.sed \
 	gettext-runtime/po/en at boldquot.header \
 	gettext-runtime/po/en@quot.header \
-- 
2.20.1
