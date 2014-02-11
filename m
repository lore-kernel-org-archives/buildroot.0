From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Feb 2014 16:25:21 +0200
Subject: [Buildroot] [PATCH 2/3] coreutils: fix build against uclibc snapshot
In-Reply-To: <cover.1392128329.git.baruch@tkos.co.il>
References: <cover.1392128329.git.baruch@tkos.co.il>
Message-ID: <5d62445fcadab4f283d0e1868bd2481d9c40856a.1392128329.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc development version adds support for POSIX spawn routines. However,
unlike glibc these routines are in librt. This breaks gnulib autoconf
detection. Teach gnulib autoconf to look for POSIX spawn in librt.

Fixes:
http://autobuild.buildroot.net/results/246/246b3778a1a646afd1c8b9c17b4579fb5a27120e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/coreutils/coreutils-01-spawn-uclibc.patch | 43 +++++++++++++++++++++++
 package/coreutils/coreutils.mk                    |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/coreutils/coreutils-01-spawn-uclibc.patch

diff --git a/package/coreutils/coreutils-01-spawn-uclibc.patch b/package/coreutils/coreutils-01-spawn-uclibc.patch
new file mode 100644
index 000000000000..47609b75bc08
--- /dev/null
+++ b/package/coreutils/coreutils-01-spawn-uclibc.patch
@@ -0,0 +1,43 @@
+From 71cf16e435bf5db64abcf81a9dc6dc36ce37d58d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 14 Jan 2014 16:59:07 +0000
+Subject: [PATCH] spawn: fix link error on uclibc
+
+* m4/spawn_h.m4 (gl_HAVE_POSIX_SPAWN): use AC_SEARCH_LIBS,
+to incorporate -lrt if needed (on uclibc for example).
+* modules/posix_spawn: Reference the substituted LIB.
+
+Patch status: suggested by gnulib maintainer
+(http://article.gmane.org/gmane.comp.lib.gnulib.bugs/33610), not in upstream
+gnulib yet
+
+This issue should be fixed in coreutils version 2.23.
+
+Sign-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff --git a/m4/spawn_h.m4 b/m4/spawn_h.m4
+index 87fe122..3eb835c 100644
+--- a/m4/spawn_h.m4
++++ b/m4/spawn_h.m4
+@@ -64,7 +64,15 @@ AC_DEFUN([gl_HAVE_POSIX_SPAWN],
+   dnl once only, before all statements that occur in other macros.
+   AC_REQUIRE([gl_SPAWN_H_DEFAULTS])
+ 
+-  AC_CHECK_FUNCS_ONCE([posix_spawn])
++  LIB_POSIX_SPAWN=
++  AC_SUBST([LIB_POSIX_SPAWN])
++  gl_saved_libs=$LIBS
++    AC_SEARCH_LIBS([posix_spawn], [rt],
++                   [test "$ac_cv_search_posix_spawn" = "none required" ||
++                    LIB_POSIX_SPAWN=$ac_cv_search_posix_spawn])
++    AC_CHECK_FUNCS([posix_spawn])
++  LIBS=$gl_saved_libs
++
+   if test $ac_cv_func_posix_spawn != yes; then
+     HAVE_POSIX_SPAWN=0
+   fi
+ 
+-- 
+1.7.7.6
+
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e0e9d80b3989..72087523f413 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,6 +10,9 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPLv3+
 COREUTILS_LICENSE_FILES = COPYING
 
+# patching gnulib .m4 file
+COREUTILS_AUTORECONF = YES
+
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.8.5.3
