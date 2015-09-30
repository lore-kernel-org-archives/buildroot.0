From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 22:06:47 +0200
Subject: [Buildroot] [git commit] imx-kobs: add new package
Message-ID: <20150930200653.A3D2B80425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff3e2d69a94392a444eeaf988f8a054d43b354cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on the Yocto 3.14.28-1.0.0_ga update:
https://github.com/Freescale/meta-fsl-arm/commit/6c44744

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/Config.in                    |    1 +
 .../imx-kobs/0001-Fix-musl-build.patch             |   39 ++++++++++++++++++++
 package/freescale-imx/imx-kobs/Config.in           |   10 +++++
 package/freescale-imx/imx-kobs/imx-kobs.hash       |    2 +
 package/freescale-imx/imx-kobs/imx-kobs.mk         |   12 ++++++
 5 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index dffe76f..a958dbd 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
+source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
diff --git a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
new file mode 100644
index 0000000..ce123de
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
@@ -0,0 +1,39 @@
+[PATCH] Fix musl build
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ src/mtd.c | 1 +
+ src/mtd.h | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/mtd.c b/src/mtd.c
+index 1edc441..6d2264c 100644
+--- a/src/mtd.c
++++ b/src/mtd.c
+@@ -31,6 +31,7 @@
+ #include <fcntl.h>
+ #include <ctype.h>
+ #include <errno.h>
++#include <stddef.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ 
+diff --git a/src/mtd.h b/src/mtd.h
+index bd21add..debfc84 100644
+--- a/src/mtd.h
++++ b/src/mtd.h
+@@ -31,6 +31,11 @@
+ #include "BootControlBlocks.h"
+ #include "rom_nand_hamming_code_ecc.h"
+ 
++// musl library doesn't define loff_t
++#if !defined(__GLIBC__) && !defined(__UCLIBC__)
++#define loff_t off_t
++#endif
++
+ //------------------------------------------------------------------------------
+ // Re-definitions of true and false, because the standard ones aren't good
+ // enough?
+-- 
+2.5.1
+
diff --git a/package/freescale-imx/imx-kobs/Config.in b/package/freescale-imx/imx-kobs/Config.in
new file mode 100644
index 0000000..fc2344e
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_IMX_KOBS
+	bool "imx-kobs"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  The imx-kobs tool is used for writing images to NAND on i.MX
+	  platforms.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
new file mode 100644
index 0000000..13373ea
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 cfac042f5c96731205c397a4a6b3ed966f804569ae4d0e2685d22fdf6bdc9eb7  imx-kobs-3.14.28-1.0.0.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
new file mode 100644
index 0000000..02c5cad
--- /dev/null
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# imx-kobs
+#
+################################################################################
+
+IMX_KOBS_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
+IMX_KOBS_LICENSE = GPLv2+
+IMX_KOBS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
