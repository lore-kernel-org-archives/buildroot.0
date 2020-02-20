From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 03:18:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-imx: install
 mx8qm-ahab-container.img
In-Reply-To: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
References: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200220021858.700249-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit ensures the mx8qm-ahab-container.img file gets installed
for the i.MX8 platform (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8). This
is needed for board/freescale/common/imx/imx8-bootloader-prepare.sh to
find this file when creating the bootloader image.

Note that it means that the default FIRMWARE_IMX_INSTALL_TARGET_CMDS
that applies to all platforms except i.MX8M, i.MX8MM and i.MX8X also
no longer applies to i.MX8. But this is anyway probably relevant, as
most likely i.MX8 also needs a special variant of
FIRMWARE_IMX_INSTALL_TARGET_CMDS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTE: some review on this patch from i.MX people would be greatly
appreciated. Thanks!
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index b251fcda2a..b79973a104 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -59,6 +59,14 @@ define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/firmware/vpu/vpu_fw_imx8_enc.bin \
 		$(TARGET_DIR)/lib/firmware/vpu/vpu_fw_imx8_enc.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+FIRMWARE_IMX_INSTALL_IMAGES = YES
+define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
+	# SECO firmware is needed when generating imx8-boot-sd.bin which
+	# is done in post-image script.
+	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
+		$(BINARIES_DIR)/ahab-container.img
+endef
 else
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware/imx
-- 
2.24.1
