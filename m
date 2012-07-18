From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 18 Jul 2012 18:02:43 +0200
Subject: [Buildroot] [PATCH 2/2] Add MXS bootlets package
In-Reply-To: <1342627363-3941-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1342627363-3941-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1342627363-3941-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MXS platforms (imx23 and imx28) are relying on bootlets as their first
stage bootloaders, that can then either start a regular second stage
bootloader or directly a Linux kernel. However, the Makefile allows
only to build u-boot and linux images at the same time, which is
not very convenient as we will more likely use only one of them,
so we need to duplicate a bit what is already done so that we are able
to choose what we want to generate.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/Config.in                    |    1 +
 boot/common.mk                    |    2 +-
 boot/mxs-bootlets/Config.in       |   91 ++++++++++++++++++++++++++++++++++
 boot/mxs-bootlets/barebox_ivt.bd  |   34 +++++++++++++
 boot/mxs-bootlets/mxs-bootlets.mk |   97 +++++++++++++++++++++++++++++++++++++
 5 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 boot/mxs-bootlets/Config.in
 create mode 100644 boot/mxs-bootlets/barebox_ivt.bd
 create mode 100644 boot/mxs-bootlets/mxs-bootlets.mk

diff --git a/boot/Config.in b/boot/Config.in
index f8ab1cf..5252a49 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -5,6 +5,7 @@ source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
 source "boot/lpc32xxcdl/Config.in"
+source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
 source "boot/xloader/Config.in"
diff --git a/boot/common.mk b/boot/common.mk
index dc0bfb4..b315fe8 100644
--- a/boot/common.mk
+++ b/boot/common.mk
@@ -1 +1 @@
-include boot/*/*.mk
\ No newline at end of file
+include boot/*/*.mk
diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
new file mode 100644
index 0000000..87ca512
--- /dev/null
+++ b/boot/mxs-bootlets/Config.in
@@ -0,0 +1,91 @@
+config BR2_TARGET_MXS_BOOTLETS
+	bool "mxs-bootlets"
+	depends on BR2_arm
+	select BR2_PACKAGE_ELFTOSB
+	help
+	  Stage1 bootloaders for Freescale iMX23/iMX28 SoCs
+
+if BR2_TARGET_MXS_BOOTLETS
+
+choice
+	prompt "Source"
+	default BR2_TARGET_MXS_BOOTLETS_FREESCALE
+	help
+	  Select the location of the bootlets you want to use
+
+config BR2_TARGET_MXS_BOOTLETS_FREESCALE
+	bool "Freescale 10.12.01 version"
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL
+	depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL
+	string "URL of custom bootlets tarball"
+
+if BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL
+	string "URL of custom Git repository"
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION
+	string "Custom Git version"
+
+endif
+
+choice
+	prompt "Bootstream"
+	help
+	  Select which bootstream to generate
+
+config BR2_TARGET_MXS_BOOTLETS_BAREBOX
+       depends on BR2_TARGET_BAREBOX
+       bool "Barebox Bootloader"
+
+config BR2_TARGET_MXS_BOOTLETS_LINUX
+       depends on BR2_LINUX_KERNEL
+       bool "Linux Kernel"
+
+config BR2_TARGET_MXS_BOOTLETS_UBOOT
+       depends on BR2_TARGET_UBOOT
+       bool "U-boot bootloader"
+
+endchoice
+
+config BR2_TARGET_MXS_BOOTLETS_HAS_IVT
+	bool "HAB Support"
+	help
+	  Enable this option if you are building bootlets
+	  for the iMX28 platform that needs to include instructions
+	  for the secure boot mechanism present on these SoCs
+
+choice
+	prompt "Board"
+	help
+	  Select the board to build the bootlets for
+
+config BR2_TARGET_MXS_BOOTLETS_STMP37xx
+	bool "Sigmatel ST-MP3-7xx Boards"
+
+config BR2_TARGET_MXS_BOOTLETS_STMP378x
+	bool "Sigmatel ST-MP3-78x Boards"
+
+config BR2_TARGET_MXS_BOOTLETS_IMX28
+	bool "Freescale iMX28 Boards"
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD
+	bool "Custom board"
+endchoice
+
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME
+       string "Custom board name"
+       depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD
+       help
+         Name of the board to build the bootlets for
+
+endif
diff --git a/boot/mxs-bootlets/barebox_ivt.bd b/boot/mxs-bootlets/barebox_ivt.bd
new file mode 100644
index 0000000..e02ddd6
--- /dev/null
+++ b/boot/mxs-bootlets/barebox_ivt.bd
@@ -0,0 +1,34 @@
+// STMP378x ROM command script to load and run U-Boot
+
+sources {
+	power_prep="./power_prep/power_prep";
+	sdram_prep="./boot_prep/boot_prep";
+	barebox="./barebox";
+}
+
+section (0) {
+
+	//----------------------------------------------------------
+	// Power Supply initialization
+	//----------------------------------------------------------
+
+	load power_prep;
+	load ivt (entry = power_prep:_start) > 0x8000;
+	hab call 0x8000;
+
+	//----------------------------------------------------------
+	// SDRAM initialization
+	//----------------------------------------------------------
+
+	load sdram_prep;
+        load ivt (entry = sdram_prep:_start) > 0x8000;
+        hab call 0x8000;
+	//----------------------------------------------------------
+	//  Load and call u_boot - ELF ARM image
+	//----------------------------------------------------------
+
+        load barebox;
+        load ivt (entry = barebox:exception_vectors) > 0x8000;
+	hab call 0x8000;
+
+}
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
new file mode 100644
index 0000000..4e5986c
--- /dev/null
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -0,0 +1,97 @@
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
+	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
+	MXS_BOOTLETS_SITE = $(dir $(MXS_BOOTLETS_TARBALL))
+	MXS_BOOTLETS_SOURCE  = $(notdir $(MXS_BOOTLETS_TARBALL))
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
+	MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
+	MXS_BOOTLETS_SITE_METHOD = git
+	MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
+else
+	MXS_BOOTLETS_VERSION = 10.12.01
+	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source/
+	MXS_BOOTLETS_SOURCE = imx-bootlets-src-$(MXS_BOOTLETS_VERSION).tar.gz
+endif
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_STMP37xx),y)
+	MXS_BOOTLETS_BOARD = stmp37xx_dev
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_STMP378x),y)
+	MXS_BOOTLETS_BOARD = stmp378x_dev
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_IMX28),y)
+	MXS_BOOTLETS_BOARD = iMX28_EVK
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD),y)
+	MXS_BOOTLETS_BOARD = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME))
+endif
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_HAS_IVT),y)
+	MXS_BOOTLETS_IVT_SUFFIX = _ivt
+	MXS_BOOTLETS_ELFTOSB_OPTIONS += -f imx28
+endif
+
+MXS_BOOTLETS_DEPENDENCIES = host-elftosb
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
+MXS_BOOTLETS_DEPENDENCIES += barebox
+MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
+MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
+
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
+MXS_BOOTLETS_DEPENDENCIES += linux
+MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
+MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
+
+else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
+MXS_BOOTLETS_DEPENDENCIES += uboot
+MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
+MXS_BOOTLETS_BOOTSTREAM = $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
+endif
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
+define MXS_BOOTLETS_SED_BAREBOX
+	sed -i 's,[^ *]barebox.*;,\tbarebox="$(BAREBOX_DIR)/barebox";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+endif
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
+define MXS_BOOTLETS_BUILD_LINUX_PREP
+	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(MAKE1) -C $(@D) linux_prep
+endef
+define MXS_BOOTLETS_SED_LINUX
+	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+endif
+
+ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
+define MXS_BOOTLETS_SED_UBOOT
+	sed -i 's,[^ *]u_boot.*;,\tu_boot="$(UBOOT_DIR)/u-boot";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+endef
+endif
+
+define MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
+	cp boot/mxs-bootlets/barebox_ivt.bd $(@D)/
+endef
+
+MXS_BOOTLETS_POST_EXTRACT_HOOKS += MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
+
+define MXS_BOOTLETS_BUILD_CMDS
+	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(MAKE1) -C $(@D) power_prep
+	BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(MAKE1) -C $(@D) boot_prep
+	$(MXS_BOOTLETS_BUILD_LINUX_PREP)
+	sed -i 's,[^ *]power_prep.*;,\tpower_prep="$(@D)/power_prep/power_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]sdram_prep.*;,\tsdram_prep="$(@D)/boot_prep/boot_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	$(MXS_BOOTLETS_SED_BAREBOX)
+	$(MXS_BOOTLETS_SED_LINUX)
+	$(MXS_BOOTLETS_SED_UBOOT)
+	$(HOST_DIR)/usr/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
+		-z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
+		-o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
+endef
+
+define MXS_BOOTLETS_INSTALL_TARGET_CMDS
+	cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
