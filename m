From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 11 Nov 2018 22:39:42 +0100
Subject: [Buildroot] [PATCH v3] uboot: add support for bundling ATF BL31 in
 ELF format into U-Boot
Message-ID: <20181111213942.3833-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rockchip's rk3328 encapsulates the BL31 part of ATP but it needs
image in ELF format. This is extension to
2c4809e6088660dc71de9de8cee0bba312aafbe4

This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF variable
to achieve this.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v2 -> v3:
  - change 'config' to 'choice' in uboot/Config.in

Changes v1 -> v2:
  - fix wrong prefix BR_ to BR2_
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  7 +++++++
 boot/uboot/Config.in                              | 13 +++++++++++++
 boot/uboot/uboot.mk                               |  4 ++++
 3 files changed, 24 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 23f493653d..8f0f745ac0 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -94,6 +94,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
+define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
+	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf $(BINARIES_DIR)/
+endef
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
@@ -104,6 +110,7 @@ endef
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
+	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
 
 # Configuration check
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ac6f8bc8c1..cbbbd5f1a4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -179,6 +179,19 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	  variable pointing to ATF's BL31 binary, is passed during the
 	  Buildroot build.
 
+choice
+	prompt "U-Boot ATF BL31 format"
+	depends on BR2_TARGET_UBOOT_NEEDS_ATF_BL31
+	default BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
+
+config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
+	bool "bl31.bin"
+
+config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
+	bool "bl31.elf"
+
+endchoice
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbdfee6ac3..06efd7b052 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -137,8 +137,12 @@ UBOOT_MAKE_OPTS += \
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
+else
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
-- 
2.18.1
