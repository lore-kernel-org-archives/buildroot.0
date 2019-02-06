From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 16:51:23 +0100
Subject: [Buildroot] [git commit] boot/uboot: add support for bundling ATF
 BL31 in ELF format into U-Boot
Message-ID: <20190206155331.9B59B88127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cab8bd3b46badb11e734e64747aee848c2b4282d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rockchip's rk3328 encapsulates the BL31 part of ATP but it needs
image in ELF format. This is extension to
2c4809e6088660dc71de9de8cee0bba312aafbe4

This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF variable
to achieve this.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  8 ++++++++
 boot/uboot/Config.in                              | 13 +++++++++++++
 boot/uboot/uboot.mk                               |  4 ++++
 3 files changed, 25 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 8c5e55eb4b..8ca3864dd0 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -97,6 +97,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
+define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
+	$(INSTALL) -D -m 0644 $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf \
+		$(BINARIES_DIR)/bl31.elf
+endef
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
@@ -107,6 +114,7 @@ endef
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
index 6977bcc064..3c070b41b3 100644
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
