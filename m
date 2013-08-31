From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:03 -0000
Subject: [Buildroot] [git commit] kobs-ng: new package
Message-ID: <20130831213337.112379B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6fb2f5018fe0ae9bba275991efc502236422924
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: change license to GPLv2+, slightly reword Config.in
description, add a BR2_arm dependency.]

Signed-off-by: Paul B. Henson <henson@acm.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                             |    1 +
 package/kobs-ng/Config.in                     |    9 +++
 package/kobs-ng/kobs-ng-fix-mtd-defines.patch |   73 +++++++++++++++++++++++++
 package/kobs-ng/kobs-ng.mk                    |   13 +++++
 4 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f5b14f6..7199a36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/f2fs-tools/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
+source "package/kobs-ng/Config.in"
 source "package/makedevs/Config.in"
 source "package/mtd/Config.in"
 source "package/nfs-utils/Config.in"
diff --git a/package/kobs-ng/Config.in b/package/kobs-ng/Config.in
new file mode 100644
index 0000000..1f6b2d1
--- /dev/null
+++ b/package/kobs-ng/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KOBS_NG
+	bool "kobs-ng"
+	depends on BR2_arm
+	help
+	  The kobs-ng tool is used for writing images to NAND on i.MX
+	  platforms.
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
index 0000000..f7e65e7
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
+KOBS_NG_LICENSE = GPLv2+
+KOBS_NG_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
