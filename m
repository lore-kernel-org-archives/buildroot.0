From: Andrew Webster <awebster@arcx.com>
Date: Fri, 3 Jun 2016 09:10:34 -0400
Subject: [Buildroot] [PATCH 04/10] imx-codec: rename from libfslcodec and
	bump version to 4.0.9
In-Reply-To: <cover.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
Message-ID: <1c80fb18ed68a53b0eae32552132b91f5fc12469.1464958470.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
--[aac_dec] refine the code for pure c build
  aac decoder c build need float point support, which use some
  float point function.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/4b91194

Signed-off-by: Andrew Webster <awebster@arcx.com>
---
 Config.in.legacy                                   |  7 +++++++
 package/Config.in                                  |  1 -
 package/freescale-imx/Config.in                    |  1 +
 .../imx-codec}/Config.in                           |  6 +++---
 package/freescale-imx/imx-codec/imx-codec.hash     |  2 ++
 package/freescale-imx/imx-codec/imx-codec.mk       | 23 ++++++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in        |  4 ++--
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  2 +-
 package/gstreamer1/gst1-imx/Config.in              |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  4 ++--
 package/libfslcodec/libfslcodec.hash               |  2 --
 package/libfslcodec/libfslcodec.mk                 | 23 ----------------------
 12 files changed, 42 insertions(+), 35 deletions(-)
 rename package/{libfslcodec => freescale-imx/imx-codec}/Config.in (75%)
 create mode 100644 package/freescale-imx/imx-codec/imx-codec.hash
 create mode 100644 package/freescale-imx/imx-codec/imx-codec.mk
 delete mode 100644 package/libfslcodec/libfslcodec.hash
 delete mode 100644 package/libfslcodec/libfslcodec.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b73603b..54d43f1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -142,6 +142,13 @@ comment "build, or run, in unpredictable ways.               "
 comment "----------------------------------------------------"
 endif
 
+config BR2_PACKAGE_LIBFSLCODEC
+	bool "libfslcodec has been renamed to imx-codec"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_CODEC
+	help
+	  The libfslcodec has been renamed to match the renamed package.
+
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
diff --git a/package/Config.in b/package/Config.in
index ae74f17..c41e4f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1089,7 +1089,6 @@ menu "Multimedia"
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
diff --git a/package/libfslcodec/Config.in b/package/freescale-imx/imx-codec/Config.in
similarity index 75%
rename from package/libfslcodec/Config.in
rename to package/freescale-imx/imx-codec/Config.in
index d2007fe..e161699 100644
--- a/package/libfslcodec/Config.in
+++ b/package/freescale-imx/imx-codec/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LIBFSLCODEC
-	bool "libfslcodec"
+config BR2_PACKAGE_IMX_CODEC
+	bool "imx-codec"
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
 	help
@@ -8,6 +8,6 @@ config BR2_PACKAGE_LIBFSLCODEC
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-comment "libfslcodec needs an (e)glibc toolchain"
+comment "imx-codec needs an (e)glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
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
index 0084483..3512666 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -18,6 +18,6 @@ config BR2_PACKAGE_GST1_IMX
 	  The VPU plugin is built when BR2_PACKAGE_LIBIMXVPUAPI is enabled.
 	  The EGL plugin is built when BR2_PACKAGE_IMX_GPU_VIV is enabled.
 	  The G2D plugin is built when BR2_PACKAGE_IMX_GPU_VIV_G2D is enabled.
-	  The MP3 plugin is built when BR2_PACKAGE_LIBFSLCODEC is enabled.
+	  The MP3 plugin is built when BR2_PACKAGE_IMX_CODEC is enabled.
 
 	  https://github.com/Freescale/gstreamer-imx
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 8838110..f81d8c9 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -27,8 +27,8 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_IMX_DEPENDENCIES += gst1-plugins-bad
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFSLCODEC),y)
-GST1_IMX_DEPENDENCIES += libfslcodec
+ifeq ($(BR2_PACKAGE_IMX_CODEC),y)
+GST1_IMX_DEPENDENCIES += imx-codec
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIMXVPUAPI),y)
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
-- 
1.9.1
