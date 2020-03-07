From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Mar 2020 10:56:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: fix host build without
 makeinfo
Message-ID: <20200307095644.1428004-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...kefile.am-fix-build-without-makeinfo.patch | 51 +++++++++++++++++++
 package/guile/guile.mk                        |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch

diff --git a/package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch
new file mode 100644
index 0000000000..0d16f92387
--- /dev/null
+++ b/package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch
@@ -0,0 +1,51 @@
+From 9304ad88a5f4b083d348563c5de00da53b34cf46 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Mar 2020 23:20:39 +0100
+Subject: [PATCH] Makefile.am: fix build without makeinfo
+
+Don't build doc subdir if makeinfo is not available otherwise build
+fails on:
+
+make[4]: Entering directory '/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/doc/ref'
+  MAKEINFO guile.info
+/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/build-aux/missing: line 81: makeinfo: command not found
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <http://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <http://www.gnu.org/software/make/>
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to bug-guile at gnu.org]
+---
+ Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ebbf6d476..2270afb9f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -38,8 +38,12 @@ SUBDIRS =					\
+ 	test-suite				\
+ 	benchmark-suite				\
+ 	gc-benchmarks				\
+-	am					\
++	am
++
++if HAVE_MAKEINFO
++SUBDIRS +=					\
+ 	doc
++endif
+ 
+ DIST_SUBDIRS = $(SUBDIRS) prebuilt
+ 
+-- 
+2.25.0
+
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index f53ebdd5cb..669000d080 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -8,7 +8,8 @@ GUILE_VERSION = 2.0.14
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-# For 0002-calculate-csqrt_manually.patch
+# For 0002-calculate-csqrt_manually.patch and 
+# 0004-Makefile.am-fix-build-without-makeinfo.patch
 GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
-- 
2.25.0
