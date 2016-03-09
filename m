From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Mar 2016 16:05:09 +0100
Subject: [Buildroot] [PATCH] freescale-imx: add
	BR2_PACKAGE_FREESCALE_IMX_HAS_VPU config
Message-ID: <1457535909-12591-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the imx-vpu package build is skipped if the platform doesn't
have a VPU, libraries dependent on the package such as libimxvpuapi
can fail although the imx-vpu package build went "fine".

This patch therefore adds a BR2_PACKAGE_FREESCALE_IMX_HAS_VPU config
which is used in every package selecting imx-vpu directly or indrectly.

It fixes the following build errors:
http://autobuild.buildroot.net/results/892/8924b17f3aa5eba1a8016d84d4478ecb0a96b236/
http://autobuild.buildroot.net/results/86f/86fef2a30065d5bc0d7755706e9ca3332426834d/
http://autobuild.buildroot.net/results/b47/b47eb03e93e2f1af85caebb707f7b4667f7e3d74/
http://autobuild.buildroot.net/results/4c9/4c9b22b33533132fd9f88917cc341ae2c2e171a8/
http://autobuild.buildroot.net/results/a8b/a8b33bfd099d9b9cd383cc568ea70846eb13c34d/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is the follow-up of the autobuilder failures discussion:
http://lists.busybox.net/pipermail/buildroot/2016-March/154989.html

Implementing this BR2_PACKAGE_FREESCALE_IMX_HAS_VPU was actually easier
and not as intrusive as expected. Let me know your thoughts.

However during the testing of this patch, I realized that old
platforms will be a nightmare to maintain, here are a few examples:
- if using IMX25_3STACK or IMX51, imx-lib will fail with the following errors:
iso7816-3.c:34:37: fatal error: linux/mxc_sim_interface.h: No such file or directory
 #include <linux/mxc_sim_interface.h>
- if using IMX37_3STACK or IMX50 or IMX53 or IMX27ADS, imx-lib will fail too:
fsl_shw_rand.c:46:24: fatal error: shw_driver.h: No such file or directory
 #include "shw_driver.h"

Both issues above require to use the old 2.6.x kernels from Freescale, are
they even still building? All the defconfigs I see of old platforms are
using mainline kernel which doesn't work with those proprietary Freescale
packages anyway as the Yocto community explained:
https://github.com/Freescale/meta-fsl-arm/commit/3b698004
https://github.com/Freescale/meta-fsl-arm/commit/83b240e7

So I now think this BR2_PACKAGE_FREESCALE_IMX_HAS_VPU is necessary for the
future platforms definition (IMX6UL and IMX7D) but we should still get rid
of the old ones.

Anyway, I guess this patch can be merged as-is to fix the build issue and we
can later discuss the fate of older platforms once autobuilder will try a
config with imx-lib ;)

Regards,
Gary
---
 package/freescale-imx/Config.in                      | 7 +++++++
 package/freescale-imx/imx-vpu/Config.in              | 5 +++++
 package/gstreamer/gst-fsl-plugins/Config.in          | 3 +--
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 6 +++++-
 package/libfslvpuwrap/Config.in                      | 6 +++++-
 package/libimxvpuapi/Config.in                       | 6 +++++-
 6 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index dfb6cc4..4a086ae 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -42,6 +42,13 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
index 220385c..779717f 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -1,6 +1,11 @@
+comment "imx-vpu needs an i.MX platform with VPU support"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+
 config BR2_PACKAGE_IMX_VPU
 	bool "imx-vpu"
 	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Library of userspace helpers specific for the Freescale i.MX
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index a4a2606..0407dc5 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -11,9 +11,8 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_LIBFSLVPUWRAP
+	select BR2_PACKAGE_LIBFSLVPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_LIB
-	select BR2_PACKAGE_IMX_VPU
 	select BR2_PACKAGE_LIBFSLPARSER
 	select BR2_PACKAGE_LIBFSLCODEC
 	select BR2_PACKAGE_FREESCALE_IMX
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 2ac558a..fa0e093 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -16,7 +16,11 @@ GST_FSL_PLUGINS_INSTALL_STAGING = YES
 GST_FSL_PLUGINS_AUTORECONF = YES
 
 GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
-	libfslvpuwrap imx-lib imx-vpu libfslparser libfslcodec
+	imx-lib libfslparser libfslcodec
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
+GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
+endif
 
 GST_FSL_PLUGINS_CONF_ENV = \
 	PLATFORM=$(BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM) \
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
index 9cc15d5..72f7126 100644
--- a/package/libfslvpuwrap/Config.in
+++ b/package/libfslvpuwrap/Config.in
@@ -2,11 +2,15 @@ comment "libfslvpuwrap needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
 
+comment "libfslvpuwrap needs an i.MX platform with VPU support"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL && !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+
 config BR2_PACKAGE_LIBFSLVPUWRAP
 	bool "libfslvpuwrap"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	select BR2_PACKAGE_FREESCALE_IMX
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_VPU
 	help
 	  Wrapper library for the vpu library, giving it a different API.
diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
index 85467f2..8b8b839 100644
--- a/package/libimxvpuapi/Config.in
+++ b/package/libimxvpuapi/Config.in
@@ -1,7 +1,11 @@
+comment "libimxvpuapi needs an i.MX platform with VPU support"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+
 config BR2_PACKAGE_LIBIMXVPUAPI
 	bool "libimxvpuapi"
 	depends on BR2_arm # Only relevant for i.MX
-	select BR2_PACKAGE_FREESCALE_IMX
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_VPU
 	help
 	  This library provides an API for using the iMX6 VPU video
-- 
2.7.0
