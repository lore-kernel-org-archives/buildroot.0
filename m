From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-vpuwrap: rename from libfslvpuwrap and
	bump version to 1.0.65
Message-ID: <20160615204850.CD79F7FD1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f92b19dd68483279b8f0effce316fb6aec9ff9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
--Update 'nLastFrameEndPosPhy' in seqinit stage to avoid feed
  the same SPS to vpu repeatedly.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/d6b9490

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Andrew Webster <awebster@arcx.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                    |  7 +++++++
 package/Config.in                                   |  1 -
 package/freescale-imx/Config.in                     |  1 +
 .../imx-vpuwrap}/Config.in                          | 10 +++++-----
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash  |  2 ++
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk    | 21 +++++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in         |  2 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk    |  2 +-
 package/kodi/kodi.mk                                |  4 ++--
 package/libfslvpuwrap/libfslvpuwrap.hash            |  2 --
 package/libfslvpuwrap/libfslvpuwrap.mk              | 21 ---------------------
 11 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 12426c9..bb12d7b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_LIBFSLVPUWRAP
+	bool "libfslvpuwrap has been renamed to imx-vpuwrap"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_VPUWRAP
+	help
+	  The libfslvpuwrap has been renamed to match the renamed package.
+
 config BR2_PACKAGE_LIBFSLPARSER
 	bool "libfslparser has been renamed to imx-parser"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 822367e..3d93951 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,7 +1102,6 @@ menu "Multimedia"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
-	source "package/libfslvpuwrap/Config.in"
 	source "package/libhdhomerun/Config.in"
 	source "package/libimxvpuapi/Config.in"
 	source "package/libmatroska/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 868e51c..056728f 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -55,6 +55,7 @@ source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
+source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
diff --git a/package/libfslvpuwrap/Config.in b/package/freescale-imx/imx-vpuwrap/Config.in
similarity index 59%
rename from package/libfslvpuwrap/Config.in
rename to package/freescale-imx/imx-vpuwrap/Config.in
index 72f7126..3509595 100644
--- a/package/libfslvpuwrap/Config.in
+++ b/package/freescale-imx/imx-vpuwrap/Config.in
@@ -1,13 +1,13 @@
-comment "libfslvpuwrap needs an imx-specific Linux kernel to be built"
+comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
 
-comment "libfslvpuwrap needs an i.MX platform with VPU support"
+comment "imx-vpuwrap needs an i.MX platform with VPU support"
 	depends on BR2_arm
 	depends on BR2_LINUX_KERNEL && !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 
-config BR2_PACKAGE_LIBFSLVPUWRAP
-	bool "libfslvpuwrap"
+config BR2_PACKAGE_IMX_VPUWRAP
+	bool "imx-vpuwrap"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBFSLVPUWRAP
 	help
 	  Wrapper library for the vpu library, giving it a different API.
 
-	  This library is provided by Freescale as-is and doesn't have
+	  This library is provided by NXP as-is and doesn't have
 	  an upstream.
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
new file mode 100644
index 0000000..42b97a1
--- /dev/null
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	ddeacb7d9cb26c8864374df6d3f090aad47cd2ae409c2b9c817b773447252d61  imx-vpuwrap-1.0.65.bin
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
new file mode 100644
index 0000000..da0e32c
--- /dev/null
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# imx-vpuwrap
+#
+################################################################################
+
+IMX_VPUWRAP_VERSION = 1.0.65
+IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
+IMX_VPUWRAP_DEPENDENCIES = imx-vpu
+IMX_VPUWRAP_INSTALL_STAGING = YES
+
+IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
+IMX_VPUWRAP_REDISTRIBUTE = NO
+
+define IMX_VPUWRAP_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPUWRAP_SOURCE))
+endef
+
+$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 38c8a47..f34a067 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-codec
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_LIBFSLVPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	select BR2_PACKAGE_IMX_VPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_LIB
 	select BR2_PACKAGE_IMX_PARSER
 	select BR2_PACKAGE_IMX_CODEC
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 8db8d1b..65993a2 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -19,7 +19,7 @@ GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
 	imx-lib imx-parser imx-codec
 
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
-GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
+GST_FSL_PLUGINS_DEPENDENCIES += imx-vpuwrap
 endif
 
 GST_FSL_PLUGINS_CONF_ENV = \
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e163c24..90c50c3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -53,8 +53,8 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)
-KODI_DEPENDENCIES += libfslvpuwrap
+ifeq ($(BR2_PACKAGE_IMX_VPUWRAP),y)
+KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
 endif
 
diff --git a/package/libfslvpuwrap/libfslvpuwrap.hash b/package/libfslvpuwrap/libfslvpuwrap.hash
deleted file mode 100644
index e987077..0000000
--- a/package/libfslvpuwrap/libfslvpuwrap.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256	0717faccb5413dc95ce9ad919400095ecf722320478c924366793a6cc450ae16  libfslvpuwrap-1.0.62.bin
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
deleted file mode 100644
index 12a4e86..0000000
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# libfslvpuwrap
-#
-################################################################################
-
-LIBFSLVPUWRAP_VERSION = 1.0.62
-LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
-LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
-LIBFSLVPUWRAP_INSTALL_STAGING = YES
-
-LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLVPUWRAP_LICENSE_FILES = EULA COPYING
-LIBFSLVPUWRAP_REDISTRIBUTE = NO
-
-define LIBFSLVPUWRAP_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE))
-endef
-
-$(eval $(autotools-package))
