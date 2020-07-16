From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 15:03:17 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix sdma
 support for imx8m family
Message-ID: <20200716130317.135841-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In latest patch the SDMA installation was limited to platforms whose
name was mentioned in the binary. That would unfortunately be too simple
to manage, instead the i.MX 8M family uses the same binary as the i.MX 7
processors [1].

Fixes: fad2df39b9 ("package/freescale-imx/firmware-imx: clarify
installation of firmware files")

[1]
https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mq.dtsi?h=imx_5.4.24_2.1.0#n519

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/Config.in       | 3 +++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index aae552177f..3859cc1d14 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -20,6 +20,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW
 	bool
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index cd299aad5e..90d9a79860 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -107,9 +107,13 @@ endif
 #
 
 ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)
+FIRMWARE_IMX_SDMA_NAME = $(FIRMWARE_IMX_PLATFORM_LOWER)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+FIRMWARE_IMX_SDMA_NAME = imx7d
+endif
 define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma
-	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_PLATFORM_LOWER)*.bin \
+	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_SDMA_NAME)*.bin \
 	       $(TARGET_DIR)/lib/firmware/imx/sdma/
 endef
 endif
-- 
2.27.0
