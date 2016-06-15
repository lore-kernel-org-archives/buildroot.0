From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] imx-parser: rename from libfslparser and
	bump version to 4.0.9
Message-ID: <20160615204850.B41CA80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6499890700d9cebb273e649d3587ff13f27ccee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
--Add aac latm parser in parser_libs, support aac latm in mpeg2 parser

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/e2c6f10

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
 package/freescale-imx/imx-parser/Config.in         |  8 ++++++++
 package/freescale-imx/imx-parser/imx-parser.hash   |  2 ++
 package/freescale-imx/imx-parser/imx-parser.mk     | 23 ++++++++++++++++++++++
 package/gstreamer/gst-fsl-plugins/Config.in        |  2 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  2 +-
 package/libfslparser/Config.in                     |  8 --------
 package/libfslparser/libfslparser.hash             |  2 --
 package/libfslparser/libfslparser.mk               | 23 ----------------------
 11 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e5a568d..12426c9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_LIBFSLPARSER
+	bool "libfslparser has been renamed to imx-parser"
+	select BR2_LEGACY
+	select BR2_PACKAGE_IMX_PARSER
+	help
+	  The libfslparser has been renamed to match the renamed package.
+
 config BR2_PACKAGE_LIBFSLCODEC
 	bool "libfslcodec has been renamed to imx-codec"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1f62c19..822367e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1102,7 +1102,6 @@ menu "Multimedia"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
-	source "package/libfslparser/Config.in"
 	source "package/libfslvpuwrap/Config.in"
 	source "package/libhdhomerun/Config.in"
 	source "package/libimxvpuapi/Config.in"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 052de5a..868e51c 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
diff --git a/package/freescale-imx/imx-parser/Config.in b/package/freescale-imx/imx-parser/Config.in
new file mode 100644
index 0000000..526f066
--- /dev/null
+++ b/package/freescale-imx/imx-parser/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IMX_PARSER
+	bool "imx-parser"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Binary parser libraries for the NXP i.MX SoCs.
+
+	  This library is provided by NXP as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-parser/imx-parser.hash b/package/freescale-imx/imx-parser/imx-parser.hash
new file mode 100644
index 0000000..2193c66
--- /dev/null
+++ b/package/freescale-imx/imx-parser/imx-parser.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256	1bec0101843db2e95d61e3dbe9e35172d874e54be19cc5d8bf72a735d5e3236f  imx-parser-4.0.9.bin
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
new file mode 100644
index 0000000..a207d6e
--- /dev/null
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# imx-parser
+#
+################################################################################
+
+IMX_PARSER_VERSION = 4.0.9
+IMX_PARSER_SITE = $(FREESCALE_IMX_SITE)
+IMX_PARSER_SOURCE = imx-parser-$(IMX_PARSER_VERSION).bin
+IMX_PARSER_INSTALL_STAGING = YES
+
+IMX_PARSER_LICENSE = NXP Semiconductor Software License Agreement
+IMX_PARSER_LICENSE_FILES = EULA COPYING
+IMX_PARSER_REDISTRIBUTE = NO
+
+define IMX_PARSER_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_PARSER_SOURCE))
+endef
+
+# The Makefile installs several versions of the libraries, but we only
+# need one of them, depending on the platform.
+
+$(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 8c82a4a..38c8a47 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_IMX_LIB
-	select BR2_PACKAGE_LIBFSLPARSER
+	select BR2_PACKAGE_IMX_PARSER
 	select BR2_PACKAGE_IMX_CODEC
 	select BR2_PACKAGE_FREESCALE_IMX
 	help
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 50732bf..8db8d1b 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -16,7 +16,7 @@ GST_FSL_PLUGINS_INSTALL_STAGING = YES
 GST_FSL_PLUGINS_AUTORECONF = YES
 
 GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
-	imx-lib libfslparser imx-codec
+	imx-lib imx-parser imx-codec
 
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
 GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
diff --git a/package/libfslparser/Config.in b/package/libfslparser/Config.in
deleted file mode 100644
index e3ab980..0000000
--- a/package/libfslparser/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LIBFSLPARSER
-	bool "libfslparser"
-	depends on BR2_arm # Only relevant for i.MX
-	help
-	  Binary parser libraries for the Freescale i.MX SoCs.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
diff --git a/package/libfslparser/libfslparser.hash b/package/libfslparser/libfslparser.hash
deleted file mode 100644
index c49345f..0000000
--- a/package/libfslparser/libfslparser.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256	a04621783c84a9776216caff9563c7f840fddd584b0b2d27738d6ca6d2c77f32  libfslparser-4.0.8.bin
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
deleted file mode 100644
index 44e6039..0000000
--- a/package/libfslparser/libfslparser.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# libfslparser
-#
-################################################################################
-
-LIBFSLPARSER_VERSION = 4.0.8
-LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
-LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
-LIBFSLPARSER_INSTALL_STAGING = YES
-
-LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
-LIBFSLPARSER_LICENSE_FILES = EULA COPYING
-LIBFSLPARSER_REDISTRIBUTE = NO
-
-define LIBFSLPARSER_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLPARSER_SOURCE))
-endef
-
-# The Makefile installs several versions of the libraries, but we only
-# need one of them, depending on the platform.
-
-$(eval $(autotools-package))
