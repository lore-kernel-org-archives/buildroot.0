From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-codec: rename from libfslcodec and
	bump version to 4.0.9
Message-ID: <20160615204850.75C4A80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47e6203f63544345dffa4bdbad303b6045c4b11f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
--[aac_dec] refine the code for pure c build
  aac decoder c build need float point support, which use some
  float point function.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/4b91194

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 +++++++
 package/Config.in                                  |  1 -
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-codec/Config.in          | 13 ++++++++++++
 package/freescale-imx/imx-codec/imx-codec.hash     |  2 ++
 package/freescale-imx/imx-codec/imx-codec.mk       | 23 ++++++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in        |  4 ++--
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  2 +-
 package/gstreamer1/gst1-imx/Config.in              |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  4 ++--
 package/libfslcodec/Config.in                      | 13 ------------
 package/libfslcodec/libfslcodec.hash               |  2 --
 package/libfslcodec/libfslcodec.mk                 | 23 ----------------------
 13 files changed, 52 insertions(+), 45 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 434aa5f..e5a568d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_LIBFSLCODEC
+	bool "libfslcodec has been renamed to imx-codec"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_CODEC
+	help
+	  The libfslcodec has been renamed to match the renamed package.
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
 	bool "FIT support in uboot-tools has been refactored"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 753f5aa..1f62c19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,7 +1102,6 @@ menu "Multimedia"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
-	source "package/libfslcodec/Config.in"
 	source "package/libfslparser/Config.in"
 	source "package/libfslvpuwrap/Config.in"
 	source "package/libhdhomerun/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 8c03190..052de5a 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
+source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
diff --git a/package/freescale-imx/imx-codec/Config.in b/package/freescale-imx/imx-codec/Config.in
new file mode 100644
index 0000000..70d340a
--- /dev/null
+++ b/package/freescale-imx/imx-codec/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_IMX_CODEC
+	bool "imx-codec"
+	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
+	help
+	  Binary codec libraries for the NXP i.MX SoCs.
+
+	  This library is provided by NXP as-is and doesn't have
+	  an upstream.
+
+comment "imx-codec needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
new file mode 100644
index 0000000..39bddc1
--- /dev/null
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	62bda182143cde9743cba0eb2a1c315a53cb434294605742f9fc364219958888  imx-codec-4.0.9.bin
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
new file mode 100644
index 0000000..67d3390
--- /dev/null
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# imx-codec
+#
+################################################################################
+
+IMX_CODEC_VERSION = 4.0.9
+IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
+IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
+IMX_CODEC_INSTALL_STAGING = YES
+
+IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
+IMX_CODEC_LICENSE_FILES = EULA COPYING
+IMX_CODEC_REDISTRIBUTE = NO
+
+define IMX_CODEC_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_CODEC_SOURCE))
+endef
+
+# FIXME The Makefile installs both the arm9 and arm11 versions of the
+# libraries, but we only need one of them.
+
+$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 0407dc5..8c82a4a 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -9,12 +9,12 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	bool "gst-fsl-plugins"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
+	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-codec
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_LIB
 	select BR2_PACKAGE_LIBFSLPARSER
-	select BR2_PACKAGE_LIBFSLCODEC
+	select BR2_PACKAGE_IMX_CODEC
 	select BR2_PACKAGE_FREESCALE_IMX
 	help
 	  GStreamer plugins for hardware-accelerated audio and video
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index fa0e093..50732bf 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -16,7 +16,7 @@ GST_FSL_PLUGINS_INSTALL_STAGING = YES
 GST_FSL_PLUGINS_AUTORECONF = YES
 
 GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
-	imx-lib libfslparser libfslcodec
+	imx-lib libfslparser imx-codec
 
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
 GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index df0fcf3..2b0360f 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -14,6 +14,6 @@ config BR2_PACKAGE_GST1_IMX
 	  The VPU plugin is built when BR2_PACKAGE_LIBIMXVPUAPI is enabled.
 	  The EGL plugin is built when BR2_PACKAGE_IMX_GPU_VIV is enabled.
 	  The G2D plugin is built when BR2_PACKAGE_IMX_GPU_VIV_G2D is enabled.
-	  The MP3 plugin is built when BR2_PACKAGE_LIBFSLCODEC is enabled.
+	  The MP3 plugin is built when BR2_PACKAGE_IMX_CODEC is enabled.
 
 	  https://github.com/Freescale/gstreamer-imx
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 8afd204..e67f11f 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -30,8 +30,8 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFSLCODEC),y)
-GST1_IMX_DEPENDENCIES += libfslcodec
+ifeq ($(BR2_PACKAGE_IMX_CODEC),y)
+GST1_IMX_DEPENDENCIES += imx-codec
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIMXVPUAPI),y)
diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
deleted file mode 100644
index d2007fe..0000000
--- a/package/libfslcodec/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBFSLCODEC
-	bool "libfslcodec"
-	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
-	help
-	  Binary codec libraries for the Freescale i.MX SoCs.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
-
-comment "libfslcodec needs an (e)glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libfslcodec/libfslcodec.hash b/package/libfslcodec/libfslcodec.hash
deleted file mode 100644
index fd934f7..0000000
--- a/package/libfslcodec/libfslcodec.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256	544ffc5989bce18ca50c7a826cc03370b1cf8455335e4291ef0c0779b4c33de0  libfslcodec-4.0.8.bin
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
deleted file mode 100644
index 502390f..0000000
--- a/package/libfslcodec/libfslcodec.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# libfslcodec
-#
-################################################################################
-
-LIBFSLCODEC_VERSION = 4.0.8
-LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
-LIBFSLCODEC_INSTALL_STAGING = YES
-
-LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
-LIBFSLCODEC_LICENSE_FILES = EULA COPYING
-LIBFSLCODEC_REDISTRIBUTE = NO
-
-define LIBFSLCODEC_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLCODEC_SOURCE))
-endef
-
-# FIXME The Makefile installs both the arm9 and arm11 versions of the
-# libraries, but we only need one of them.
-
-$(eval $(autotools-package))
