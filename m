From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 12:25:29 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-sc-firmware:
 bump to version 1.1 to support i.MX8
Message-ID: <20200205111426.3713F8BFC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9c4bb3517e38998e4be9bffc85b678aec2c14bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-sc-firmware/Config.in          |  3 ++-
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk | 11 +++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
index 4a22f72b1f..4932e62dd2 100644
--- a/package/freescale-imx/imx-sc-firmware/Config.in
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IMX_SC_FIRMWARE
 	bool "imx-sc-firmware"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	help
 	  System Control Unit Firmware blobs for the Freescale i.MX8
 	  SoCs.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index cb4e046b8a..6a768ea109 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -17,11 +17,18 @@ define IMX_SC_FIRMWARE_EXTRACT_CMDS
 endef
 
 IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
+
+# SCFW firmware is needed when generating imx8-boot-sd.bin which is
+# done in post-image script.
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
 define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
-	# SCFW firmware is needed when generating imx8-boot-sd.bin which
-	# is done in post-image script.
 	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
 	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp $(@D)/mx8qm-*-scfw-tcm.bin $(BINARIES_DIR)/
+endef
+endif
 
 $(eval $(generic-package))
