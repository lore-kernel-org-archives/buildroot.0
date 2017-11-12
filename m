From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 12 Nov 2017 23:16:44 +0300
Subject: [Buildroot] [PATCH/next 3/5] atf: add support for Marvell Armada
 SoCs
In-Reply-To: <20171112201646.15558-1-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
Message-ID: <20171112201646.15558-4-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Marvell Armada SoCs to arm-trusted-firmware package.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 7b1cc6ebb6..d6bde29894 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -39,6 +39,19 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
 endif
 
+ifeq ($(BR2_TARGET_ARMADA_FIRMWARE),y)
+ARMADA_FIRMWARE_IMAGE = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_IMAGE))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	SCP_BL2=$(BINARIES_DIR)/$(ARMADA_FIRMWARE_IMAGE)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-firmware
+endif
+
+ifeq ($(BR2_TARGET_ARMADA_DDR),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
+	MV_DDR_PATH=$(DL_DIR)/mv-ddr-marvell
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-ddr
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-- 
2.11.0
