From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Jan 2018 22:30:31 +0100
Subject: [Buildroot] [PATCH 2/5] arm-trusted-firmware: generate atf-uboot.ub
 for ZynqMP booting
In-Reply-To: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1517002234-17608-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot SPL for the Xilinx ZynqMP SoCs needs ATF in this format to load
it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/arm-trusted-firmware/Config.in               |  9 +++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7aef87cb746c..dca9958423b9 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -71,6 +71,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	  typically used on platforms where another bootloader (e.g
 	  U-Boot) encapsulates ATF BL31.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
+	bool "Generate a U-Boot image (for Xilinx ZynqMP U-Boot)"
+	depends on BR2_cortex_a53
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
+	help
+	  Uses mkimage from uboot-tools to encapsulate bl31.bin into
+	  a U-Boot image named atf-uboot.ub. This is needed by the
+	  Xilinx version of U-Boot SPL to load ATF on the ZynqMP SoC.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 212bb5049f2b..b2c2a67fb661 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -86,6 +86,26 @@ define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
 endef
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE),y)
+define ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
+# Get the entry point address from the elf.
+	BASE_ADDR=$$($(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | \
+	             grep -E -m 1 -i "entry point.*?0x" | \
+	             sed -r 's/.*?(0x.*?)/\1/g') && \
+	$(HOST_DIR)/bin/mkimage -A arm64 -O linux -T kernel -C none \
+		-a $${BASE_ADDR} -e $${BASE_ADDR} \
+		-d $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31.bin \
+		$(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub
+endef
+define ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_INSTALL
+	install $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub $(BINARIES_DIR)
+endef
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
+ARM_TRUSTED_FIRMWARE_POST_BUILD_HOOKS += ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_MKIMAGE
+ARM_TRUSTED_FIRMWARE_POST_INSTALL_IMAGES_HOOKS += ARM_TRUSTED_FIRMWARE_ZYNQMP_UB_INSTALL
+endif
+
 # Configuration check
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
 
-- 
2.7.4
