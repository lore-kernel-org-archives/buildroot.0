From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-gpu-viv: bump version to 5.0.11-p8.4
Message-ID: <20160615204848.749C582033@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=018e1a06b7dcf17b39d08a2a44d68a8744d23af8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
Software floating point is no longer supported.

For a detailed list of changes in this update, see the Graphics section of
the i.MX Linux Release Notes contained in the i.MX Linux BSP documentation
here:

https://www.nxp.com/webapp/Download?colCode=L4.1.15_1.1.0_LINUX_DOCS&location=null&fpsp=1&WT_TYPE=Supporting%20Information&WT_VENDOR=FREESCALE&WT_FILE_FORMAT=gz&WT_ASSET=Documentation&fileExt=.gz&Parent_nodeId=1337637154535695831062&Parent_pageType=product

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/b667ed4
https://github.com/Freescale/meta-fsl-arm/commit/af5b3a6

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # apitrace trace --api egl ./tutorial7
 # gmem_info
 ... display memory use per PID ...
 #??apitrace replay tutorial7.trace
 #??eglretrace tutorial7.trace

Signed-off-by: Andrew Webster <awebster@arcx.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas:
 - use only one comment for the glibc and ARM EABIhf dependency, like we
   do for the mali-t76x package.
 - reword the comment for the EABIhf dependency, as suggested by Gary
 - remove the IMX_GPU_VIV_BASE_VERSION variable, and use directly
   IMX_GPU_VIV_VERSION, as suggested by Gary.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in        |  7 ++++---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 +---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 11 +++--------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 20759b1..531c480 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -1,13 +1,14 @@
-comment "imx-gpu-viv needs an (e)glibc toolchain"
+comment "imx-gpu-viv needs an (e)glibc toolchain with armhf enabled"
 	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
 
 config BR2_PACKAGE_IMX_GPU_VIV
 	bool "imx-gpu-viv"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENVG
-	depends on BR2_arm # Only relevant for i.MX6
+	# Pre-built binaries only available for ARM EABIhf
+	depends on BR2_ARM_EABIHF
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 4119388..f94d3148 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,3 +1 @@
-# locally computed
-sha256	3ea201f91ce9b56455e4983ab1055e8175415fbbf2800dc097d47e78ceefba34  imx-gpu-viv-5.0.11.p7.4-sfp.bin
-sha256	b80838104f2f2e3b0baf2f1aacdca263c1c92589ce919b3be40aaad23f686b7f  imx-gpu-viv-5.0.11.p7.4-hfp.bin
+sha256	8f79ce562d8ac1efb0a2af403b405541f98c55ae1631a18a3d7fad3224dfb44b  imx-gpu-viv-5.0.11.p8.4-hfp.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index b51a7af..c7b1d9c 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.4
-ifeq ($(BR2_ARM_EABIHF),y)
-IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
-else
-IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-sfp
-endif
+IMX_GPU_VIV_VERSION = 5.0.11.p8.4-hfp
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
 
 IMX_GPU_VIV_INSTALL_STAGING = YES
 
-IMX_GPU_VIV_LICENSE = Freescale Semiconductor Software License Agreement
-IMX_GPU_VIV_LICENSE_FILES = EULA
+IMX_GPU_VIV_LICENSE = NXP Semiconductor Software License Agreement
+IMX_GPU_VIV_LICENSE_FILES = EULA COPYING
 IMX_GPU_VIV_REDISTRIBUTE = NO
 
 IMX_GPU_VIV_PROVIDES = libegl libgles libopenvg
