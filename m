From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Fri, 20 Mar 2020 17:31:54 +0100
Subject: [Buildroot] [PATCH 1/5] package/freescale-imx/imx-seco: new package
In-Reply-To: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200320163158.18341-2-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed with Freescale i.MX8/i.MX8X defconfigs
version equal to 4.19.35_1.0.0
It is also subject to multi-version support.

The package version aligned with NXP BSP 4.19.35_1.1.0 is 2.3.1

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 DEVELOPERS                                   |  1 +
 package/freescale-imx/Config.in              |  1 +
 package/freescale-imx/imx-seco/Config.in     |  9 +++++
 package/freescale-imx/imx-seco/imx-seco.hash |  4 +++
 package/freescale-imx/imx-seco/imx-seco.mk   | 35 ++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/freescale-imx/imx-seco/Config.in
 create mode 100644 package/freescale-imx/imx-seco/imx-seco.hash
 create mode 100644 package/freescale-imx/imx-seco/imx-seco.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c736efcca..c3d5e330dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1529,6 +1529,7 @@ F:	package/wilc1000-firmware/
 N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
 F:	board/freescale/imx8qmmek/
 F:	configs/freescale_imx8qmmek_defconfig
+F:	package/freescale-imx/imx-seco/
 
 N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
 F:	package/ffmpeg/
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 711e8f72c2..f42bb11a3c 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -101,6 +101,7 @@ source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
+source "package/freescale-imx/imx-seco/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
new file mode 100644
index 0000000000..1877664a0c
--- /dev/null
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IMX_SECO
+	bool "imx-seco"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	help
+	  Firmware file for the i.MX8 and i.MX8X Security Controller.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
new file mode 100644
index 0000000000..56f56369d4
--- /dev/null
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  b429ac58b2ea1771b3fdf7ae87bf1d37ccaf596bde01a5ecccae27b2145f6824  imx-seco-2.3.1.bin
+sha256  69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
+sha256  6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
new file mode 100644
index 0000000000..d06bf4c5cc
--- /dev/null
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# imx-seco
+#
+################################################################################
+
+IMX_SECO_VERSION = 2.3.1
+IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
+IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
+
+IMX_SECO_LICENSE = NXP Semiconductor Software License Agreement
+IMX_SECO_LICENSE_FILES = EULA COPYING
+IMX_SECO_REDISTRIBUTE = NO
+
+define IMX_SECO_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SECO_DL_DIR)/$(IMX_SECO_SOURCE))
+endef
+
+IMX_SECO_INSTALL_IMAGES = YES
+
+# SECO firmware is needed when generating imx8-boot-sd.bin which
+# is done in post-image script.
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+define IMX_SECO_INSTALL_IMAGES_CMDS
+	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
+		$(BINARIES_DIR)/ahab-container.img
+endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+define IMX_SECO_INSTALL_IMAGES_CMDS
+	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
+		$(BINARIES_DIR)/ahab-container.img
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.17.1
