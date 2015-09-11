From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 11 Sep 2015 11:39:42 +0200
Subject: [Buildroot] [PATCH v2 03/14] kobs-ng: remove obsolete package
In-Reply-To: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441964394-3817-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In favor of imx-kobs maintained by Freescale.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 Config.in.legacy                           |  8 ++++
 package/Config.in                          |  1 -
 package/kobs-ng/0001-fix-mtd-defines.patch | 73 ------------------------------
 package/kobs-ng/Config.in                  |  9 ----
 package/kobs-ng/kobs-ng.hash               |  2 -
 package/kobs-ng/kobs-ng.mk                 | 13 ------
 6 files changed, 8 insertions(+), 98 deletions(-)
 delete mode 100644 package/kobs-ng/0001-fix-mtd-defines.patch
 delete mode 100644 package/kobs-ng/Config.in
 delete mode 100644 package/kobs-ng/kobs-ng.hash
 delete mode 100644 package/kobs-ng/kobs-ng.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 52031fe..dfbf6db 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -316,6 +316,14 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
 	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
 	  examples.
 
+config BR2_PACKAGE_KOBS_NG
+	bool "kobs-ng was replaced by imx-kobs"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_KOBS
+	help
+	  The outdated kobs-ng has been replaced by the Freescale-
+	  maintained imx-kobs package.
+
 config BR2_PACKAGE_SAWMAN
 	bool "sawman package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 030477a..bbd6f37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -163,7 +163,6 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
-	source "package/kobs-ng/Config.in"
 	source "package/makedevs/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
diff --git a/package/kobs-ng/0001-fix-mtd-defines.patch b/package/kobs-ng/0001-fix-mtd-defines.patch
deleted file mode 100644
index 3ffba71..0000000
--- a/package/kobs-ng/0001-fix-mtd-defines.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Newer kernel headers renamed mtd mode defines and no longer support
-MEMSETOOBSEL. Allow code to work with both older and newer kernel
-versions.
-
-Signed-off-by: Paul B. Henson <henson@acm.org>
-Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
-
-diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
---- kobs-ng-3.0.35-4.0.0-orig/src/mtd.c	2012-12-17 22:37:40.000000000 -0800
-+++ kobs-ng-3.0.35-4.0.0/src/mtd.c	2013-07-28 19:39:59.000000000 -0700
-@@ -852,8 +852,11 @@
- 		mp = &md->part[i];
- 
- 		if (mp->fd != -1) {
-+/* Newer kernels dropped MEMSETOOBSEL */
-+#ifdef MEMSETOOBSEL
- 			(void)ioctl(mp->fd, MEMSETOOBSEL,
- 					&mp->old_oobinfo);
-+#endif
- 			close(mp->fd);
- 		}
- 
-@@ -896,6 +899,8 @@
- 				continue;
- 			}
- 
-+/* Newer kernels dropped MEMSETOOBSEL */
-+#ifdef MEMSETOOBSEL
- 			if (r == -ENOTTY) {
- 				r = ioctl(mp->fd, MEMSETOOBSEL, &mp->old_oobinfo);
- 				if (r != 0) {
-@@ -904,6 +909,7 @@
- 				}
- 				mp->oobinfochanged = 0;
- 			}
-+#endif
- 		} else {
- 			r = ioctl(mp->fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
- 			if (r != 0 && r != -ENOTTY) {
-@@ -911,6 +917,8 @@
- 				continue;
- 			}
- 
-+/* Newer kernels dropped MEMSETOOBSEL */
-+#ifdef MEMSETOOBSEL
- 			if (r == -ENOTTY) {
- 				r = ioctl(mp->fd, MEMSETOOBSEL, &none_oobinfo);
- 				if (r != 0) {
-@@ -920,6 +928,7 @@
- 				mp->oobinfochanged = 1;
- 			} else
- 				mp->oobinfochanged = 2;
-+#endif
- 		}
- 
- 		mp->ecc = ecc;
-diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.h kobs-ng-3.0.35-4.0.0/src/mtd.h
---- kobs-ng-3.0.35-4.0.0-orig/src/mtd.h	2012-12-17 22:37:40.000000000 -0800
-+++ kobs-ng-3.0.35-4.0.0/src/mtd.h	2013-07-28 19:33:57.000000000 -0700
-@@ -31,6 +31,13 @@
- #include "BootControlBlocks.h"
- #include "rom_nand_hamming_code_ecc.h"
- 
-+// Newer kernel headers renamed define
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 2, 0)
-+# define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
-+# define MTD_MODE_RAW MTD_FILE_MODE_RAW
-+#endif
-+
- //------------------------------------------------------------------------------
- // Re-definitions of true and false, because the standard ones aren't good
- // enough?
diff --git a/package/kobs-ng/Config.in b/package/kobs-ng/Config.in
deleted file mode 100644
index 1f6b2d1..0000000
--- a/package/kobs-ng/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_KOBS_NG
-	bool "kobs-ng"
-	depends on BR2_arm
-	help
-	  The kobs-ng tool is used for writing images to NAND on i.MX
-	  platforms.
-
-	  This utility is provided by Freescale as-is and doesn't have an
-	  upstream.
diff --git a/package/kobs-ng/kobs-ng.hash b/package/kobs-ng/kobs-ng.hash
deleted file mode 100644
index 3e527da..0000000
--- a/package/kobs-ng/kobs-ng.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-3.0.35-4.0.0/kobs-ng-3.0.35-4.0.0.tar.gz.md5sum
-md5	26104c577f59a6b81782a5bd16aadd82	kobs-ng-3.0.35-4.0.0.tar.gz
diff --git a/package/kobs-ng/kobs-ng.mk b/package/kobs-ng/kobs-ng.mk
deleted file mode 100644
index 13d1faf..0000000
--- a/package/kobs-ng/kobs-ng.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# kobs-ng
-#
-################################################################################
-
-# kobs-ng versions have never made much sense :(
-KOBS_NG_VERSION = 3.0.35-4.0.0
-KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)
-KOBS_NG_LICENSE = GPLv2+
-KOBS_NG_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.5.1
