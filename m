From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  3 Mar 2014 11:06:50 +0200
Subject: [Buildroot] [PATCH] wget: fix build against uclibc snapshot
Message-ID: <745b175536fa66c2f312ec98feadb25a8c543708.1393837610.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Same fix as a728e2fe3 (coreutils: fix build against uclibc snapshot).

uClibc development version adds support for POSIX spawn routines. However,
unlike glibc these routines are in librt. This breaks gnulib autoconf
detection. Teach gnulib autoconf to look for POSIX spawn in librt.

Fixes:
http://autobuild.buildroot.net/results/bc20297dad0f0e9b7fa79fe835b9754fbce6dfdf/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../wget-0001-spawn-fix-link-error-on-uclibc.patch | 40 ++++++++++++++++++++++
 package/wget/wget.mk                               |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch

diff --git a/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch b/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
new file mode 100644
index 000000000000..54d6dfbf38e7
--- /dev/null
+++ b/package/wget/wget-0001-spawn-fix-link-error-on-uclibc.patch
@@ -0,0 +1,40 @@
+From d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5 Mon Sep 17 00:00:00 2001
+Message-Id: <d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5.1393836674.git.baruch@tkos.co.il>
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 14 Jan 2014 16:59:07 +0000
+Subject: [PATCH] spawn: fix link error on uclibc
+
+* m4/spawn_h.m4 (gl_HAVE_POSIX_SPAWN): use AC_SEARCH_LIBS,
+to incorporate -lrt if needed (on uclibc for example).
+* modules/posix_spawn: Reference the substituted LIB.
+
+Patch status: upstream (gnulib commit d6eab2e70fc5ccc82a73e5c988b76a229e4cd3d5)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff --git a/m4/spawn_h.m4 b/m4/spawn_h.m4
+index 87fe12298471..3eb835c3c2a8 100644
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
+1.9.0
+
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index ffdf047a5266..80f8314f9de7 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -10,6 +10,9 @@ WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
 
+# patching gnulib .m4 file
+WGET_AUTORECONF = YES
+
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	WGET_DEPENDENCIES += busybox
-- 
1.9.0
