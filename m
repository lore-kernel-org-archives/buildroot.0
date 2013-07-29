From: Paul B. Henson <henson@acm.org>
Date: Sun, 28 Jul 2013 20:14:14 -0700
Subject: [Buildroot] [PATCH] kobs-ng: new package
Message-ID: <20130804025016.D35CB5C0DE@zaphod.pbhware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul B. Henson <henson@acm.org>
---
 package/Config.in                             |    1 +
 package/kobs-ng/Config.in                     |    7 +++
 package/kobs-ng/kobs-ng-fix-mtd-defines.patch |   73 +++++++++++++++++++++++++
 package/kobs-ng/kobs-ng.mk                    |   13 +++++
 4 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 package/kobs-ng/Config.in
 create mode 100644 package/kobs-ng/kobs-ng-fix-mtd-defines.patch
 create mode 100644 package/kobs-ng/kobs-ng.mk

diff --git a/package/Config.in b/package/Config.in
index ed373de..c16b306 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -207,6 +207,7 @@ source "package/f2fs-tools/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
+source "package/kobs-ng/Config.in"
 source "package/makedevs/Config.in"
 source "package/mtd/Config.in"
 source "package/nfs-utils/Config.in"
diff --git a/package/kobs-ng/Config.in b/package/kobs-ng/Config.in
new file mode 100644
index 0000000..d58ac92
--- /dev/null
+++ b/package/kobs-ng/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KOBS_NG
+	bool "kobs-ng"
+	help
+	  Build freescale kobs-ng utility for burning bootstreams to NAND.
+
+	  This utility is provided by Freescale as-is and doesn't have an
+	  upstream.
diff --git a/package/kobs-ng/kobs-ng-fix-mtd-defines.patch b/package/kobs-ng/kobs-ng-fix-mtd-defines.patch
new file mode 100644
index 0000000..39d7474
--- /dev/null
+++ b/package/kobs-ng/kobs-ng-fix-mtd-defines.patch
@@ -0,0 +1,73 @@
+Newer kernel headers renamed mtd mode defines and no longer support
+MEMSETOOBSEL. Allow code to work with both older and newer kernel
+versions.
+
+Signed-off-by: Paul B. Henson <henson@acm.org>
+
+diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
+--- kobs-ng-3.0.35-4.0.0-orig/src/mtd.c	2012-12-17 22:37:40.000000000 -0800
++++ kobs-ng-3.0.35-4.0.0/src/mtd.c	2013-07-28 19:39:59.000000000 -0700
+@@ -852,8 +852,11 @@
+ 		mp = &md->part[i];
+ 
+ 		if (mp->fd != -1) {
++/* Newer kernels dropped MEMSETOOBSEL */
++#ifdef MEMSETOOBSEL
+ 			(void)ioctl(mp->fd, MEMSETOOBSEL,
+ 					&mp->old_oobinfo);
++#endif
+ 			close(mp->fd);
+ 		}
+ 
+@@ -896,6 +899,8 @@
+ 				continue;
+ 			}
+ 
++/* Newer kernels dropped MEMSETOOBSEL */
++#ifdef MEMSETOOBSEL
+ 			if (r == -ENOTTY) {
+ 				r = ioctl(mp->fd, MEMSETOOBSEL, &mp->old_oobinfo);
+ 				if (r != 0) {
+@@ -904,6 +909,7 @@
+ 				}
+ 				mp->oobinfochanged = 0;
+ 			}
++#endif
+ 		} else {
+ 			r = ioctl(mp->fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
+ 			if (r != 0 && r != -ENOTTY) {
+@@ -911,6 +917,8 @@
+ 				continue;
+ 			}
+ 
++/* Newer kernels dropped MEMSETOOBSEL */
++#ifdef MEMSETOOBSEL
+ 			if (r == -ENOTTY) {
+ 				r = ioctl(mp->fd, MEMSETOOBSEL, &none_oobinfo);
+ 				if (r != 0) {
+@@ -920,6 +928,7 @@
+ 				mp->oobinfochanged = 1;
+ 			} else
+ 				mp->oobinfochanged = 2;
++#endif
+ 		}
+ 
+ 		mp->ecc = ecc;
+diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.h kobs-ng-3.0.35-4.0.0/src/mtd.h
+--- kobs-ng-3.0.35-4.0.0-orig/src/mtd.h	2012-12-17 22:37:40.000000000 -0800
++++ kobs-ng-3.0.35-4.0.0/src/mtd.h	2013-07-28 19:33:57.000000000 -0700
+@@ -31,6 +31,14 @@
+ #include "BootControlBlocks.h"
+ #include "rom_nand_hamming_code_ecc.h"
+ 
++// Newer kernel headers renamed define
++#ifndef MTD_MODE_NORMAL
++#define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
++#endif
++#ifndef MTD_MODE_RAW
++#define MTD_MODE_RAW MTD_FILE_MODE_RAW
++#endif
++
+ //------------------------------------------------------------------------------
+ // Re-definitions of true and false, because the standard ones aren't good
+ // enough?
diff --git a/package/kobs-ng/kobs-ng.mk b/package/kobs-ng/kobs-ng.mk
new file mode 100644
index 0000000..c7030cf
--- /dev/null
+++ b/package/kobs-ng/kobs-ng.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kobs-ng
+#
+################################################################################
+
+# kobs-ng versions have never made much sense :(
+KOBS_NG_VERSION = 3.0.35-4.0.0
+KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)/
+KOBS_NG_LICENSE = GPLv2
+KOBS_NG_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.8.6
