From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:30:15 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: refine
 vpu and sdma copies
Message-ID: <20200716203405.84A9987840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e236a0576c756fe131e538f3e472caf1a3e2ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In latest patch the SDMA installation was limited to platforms whose
name was mentioned in the binary but this approach wasn't flexible to
manage cases like imx8m using imx7 sdma binary, so this patch does:
- change VPU/SDMA FW options to string to allow specifying the name
  (suggested by Thomas)
- remove imx27 sdma case as non-existent
- add imx8m family support (using imx7d binary)
- get rid of FIRMWARE_IMX_PLATFORM_LOWER macro

Fixes: fad2df39b9 ("package/freescale-imx/firmware-imx: clarify installation of firmware files")
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/Config.in       | 34 ++++++++++++----------
 package/freescale-imx/firmware-imx/firmware-imx.mk | 19 ++++--------
 2 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index aae552177f..5becf8b6a9 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -12,23 +12,25 @@ config BR2_PACKAGE_FIRMWARE_IMX
 
 if BR2_PACKAGE_FIRMWARE_IMX
 
-config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW
-	bool
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
+	string
+	default "imx25" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 
-config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW
-	bool
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
+	string
+	default "imx27" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default "imx6"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	bool
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index cd299aad5e..5cfff2da05 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -14,8 +14,6 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
-FIRMWARE_IMX_PLATFORM_LOWER = $(shell echo $(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) | tr A-Z a-z | head -c 5)
-
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
@@ -106,10 +104,11 @@ endif
 # SDMA firmware
 #
 
-ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)
+FIRMWARE_IMX_SDMA_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME))
+ifneq ($(FIRMWARE_IMX_SDMA_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma
-	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_PLATFORM_LOWER)*.bin \
+	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_SDMA_FW_NAME)*.bin \
 	       $(TARGET_DIR)/lib/firmware/imx/sdma/
 endef
 endif
@@ -118,17 +117,11 @@ endif
 # VPU firmware
 #
 
-ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW),y)
-# special case for i.MX8X, which uses the same firmware as i.MX8
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
-FIRMWARE_IMX_VPU_PLATFORM = imx8
-else
-FIRMWARE_IMX_VPU_PLATFORM = $(FIRMWARE_IMX_PLATFORM_LOWER)
-endif
-
+FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
+ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
-	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_PLATFORM)*.bin \
+	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
 		$(TARGET_DIR)/lib/firmware/imx/vpu/
 endef
 endif
