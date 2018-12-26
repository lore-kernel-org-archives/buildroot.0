From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed, 26 Dec 2018 23:31:08 +0100
Subject: [Buildroot] [PATCH 5/9] package/freescale-imx: Add imx-sc-firmware
 package
In-Reply-To: <20181226223112.24456-1-nerv@dawncrow.de>
References: <20181226223112.24456-1-nerv@dawncrow.de>
Message-ID: <20181226223112.24456-5-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                                    |  1 +
 package/freescale-imx/Config.in               |  1 +
 .../freescale-imx/imx-sc-firmware/Config.in   |  8 +++++
 .../imx-sc-firmware/imx-sc-firmware.mk        | 29 +++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/freescale-imx/imx-sc-firmware/Config.in
 create mode 100644 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d58ea9014..11d3524b88 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -124,6 +124,7 @@ F:	package/ktap/
 
 N:	Andr? Hentschel <nerv@dawncrow.de>
 F:	package/azure-iot-sdk-c/
+F:	package/freescale-imx/imx-sc-firmware/
 F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 9001764437..fcceacdc9e 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -90,6 +90,7 @@ source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/imx-sc-firmware/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
new file mode 100644
index 0000000000..b0e11c9dff
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IMX_SC_FIRMWARE
+	bool "imx-sc-firmware"
+	depends on BR2_aarch64 # Only relevant for i.MX8
+	help
+	  System Control Unit Firmware blobs for the Freescale i.MX8 SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
new file mode 100644
index 0000000000..aa10322753
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# imx-sc-firmware
+#
+################################################################################
+
+IMX_SC_FIRMWARE_VERSION = 1.0
+IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
+IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
+
+IMX_SC_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
+IMX_SC_FIRMWARE_LICENSE_FILES = EULA COPYING
+IMX_SC_FIRMWARE_REDISTRIBUTE = NO
+
+define IMX_SC_FIRMWARE_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
+endef
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+	# SCFW firmware is needed when generating imx8-boot-sd.bin which
+	# is done in post-image script.
+	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
+	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.17.1
