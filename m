From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 23:15:06 +0100
Subject: [Buildroot] [git commit branch/next] package/pixman: bump version
	to 0.33.4
Message-ID: <20151114222605.CE7ED81A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b282351c13e7f5bca4865cbe0b9597dbc75cebb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/0001-check-fe-divbyzero.patch       |   41 --------------------
 ...x-C-pre-processor-issues-in-LEAF_MIPS32R2.patch |   33 ----------------
 package/pixman/pixman.hash                         |    4 +-
 package/pixman/pixman.mk                           |    3 +-
 4 files changed, 4 insertions(+), 77 deletions(-)

diff --git a/package/pixman/0001-check-fe-divbyzero.patch b/package/pixman/0001-check-fe-divbyzero.patch
deleted file mode 100644
index 01c6c96..0000000
--- a/package/pixman/0001-check-fe-divbyzero.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Add a check for FE_DIVBYZERO
-
-Some architectures (namely Microblaze) do have fenv.h and
-feenableexcept, but they don't have the FE_DIVBYZERO definition. This
-patch adds a configure check for FE_DIVBYZERO, and only uses it if
-it's available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -838,6 +838,11 @@
-    AC_DEFINE(HAVE_FEENABLEEXCEPT, 1, [Whether we have feenableexcept()])
- fi
- 
-+AC_CHECK_DECL([FE_DIVBYZERO], [], [], [[#include <fenv.h>]])
-+if test x$ac_cv_have_decl_FE_DIVBYZERO = xyes; then
-+   AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])
-+fi
-+
- AC_CHECK_FUNC(gettimeofday, have_gettimeofday=yes, have_gettimeofday=no)
- AC_CHECK_HEADER(sys/time.h, have_sys_time_h=yes, have_sys_time_h=no)
- if test x$have_gettimeofday = xyes && test x$have_sys_time_h = xyes; then
-Index: b/test/utils.c
-===================================================================
---- a/test/utils.c
-+++ b/test/utils.c
-@@ -776,9 +776,11 @@
- {
- #ifdef HAVE_FENV_H
- #ifdef HAVE_FEENABLEEXCEPT
-+#ifdef HAVE_FE_DIVBYZERO
-     feenableexcept (FE_DIVBYZERO);
- #endif
- #endif
-+#endif
- }
- 
- void *
diff --git a/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch b/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch
deleted file mode 100644
index b898fa5..0000000
--- a/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-pixman: Fix C pre-processor issues in LEAF_MIPS32R2
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 3a60aa8d574f4dfc4fa3ddb13aaa13c7d955105b Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 11 Sep 2014 10:24:10 +0100
-Subject: [PATCH] Fix C pre-processor issues in LEAF_MIPS32R2
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- pixman/pixman-mips-dspr2-asm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pixman/pixman-mips-dspr2-asm.h b/pixman/pixman-mips-dspr2-asm.h
-index 11849bd..b2696d0 100644
---- a/pixman/pixman-mips-dspr2-asm.h
-+++ b/pixman/pixman-mips-dspr2-asm.h
-@@ -72,10 +72,10 @@
- #define LEAF_MIPS32R2(symbol)                           \
-                 .globl  symbol;                         \
-                 .align  2;                              \
--#ifdef __ELF__
-+            .if __ELF__;                                \
-                 .hidden symbol;                         \
-                 .type   symbol, @function;              \
--#endif
-+            .endif;                                     \
-                 .ent    symbol, 0;                      \
- symbol:         .frame  sp, 0, ra;                      \
-                 .set    push;                           \
--- 
-1.7.1
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 04e2620..66decf6 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,2 @@
-# From http://cairographics.org/releases/pixman-0.32.8.tar.gz.sha1
-sha1	c1119bbdb587c56009b653e6f81c083f98a20135	pixman-0.32.8.tar.gz
+# From http://lists.x.org/archives/xorg-announce/2015-October/002644.html
+sha1	dff77cd08412b33ab0294057ade93e401c8a9302	pixman-0.33.4.tar.bz2
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 0e4b0b9..cbf57fe 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.32.8
+PIXMAN_VERSION = 0.33.4
+PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.bz2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
