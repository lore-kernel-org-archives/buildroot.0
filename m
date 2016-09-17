From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 19:24:12 +0200
Subject: [Buildroot] [git commit] boot/uboot: allow to build multiple U-Boot
	images
Message-ID: <20160917172805.2FDDE818BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fad58cefa4a392b52eafe46a773f8cbfb8aadb43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes it is desired to build multiple U-boot images. E.g. one to
save into flash memory and one for serial load. So far this was not
possible.

This change allows to select any combination of the target formats. They
are all copied to the image folder.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
[Thomas:
 - Handle the BR2_TARGET_UBOOT_FORMAT_BIN, which wasn't handled, and
   therefore u-boot.bin was not copied when
   BR2_TARGET_UBOOT_FORMAT_BIN=y.
 - Rename UBOOT_BIN to UBOOT_BINS, since it can now contain multiple
   values.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |  19 +++++-----
 boot/uboot/uboot.mk  | 102 +++++++++++++++++++++++++++++++++------------------
 2 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 45d0586..f6d30d9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,9 +137,7 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
-choice
-	prompt "U-Boot binary format"
-	default BR2_TARGET_UBOOT_FORMAT_BIN
+menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
 	bool "u-boot.ais"
@@ -150,6 +148,7 @@ config BR2_TARGET_UBOOT_FORMAT_AIS
 
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
+	default y
 
 config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	bool "u-boot-dtb.img"
@@ -252,19 +251,21 @@ config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	help
 	  On some platforms, the standard U-Boot binary is not called
 	  u-boot.bin, but u-boot<something>.bin. If this is your case,
-	  you should select this option and specify the correct name
+	  you should select this option and specify the correct name(s)
 	  in BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME.
 
-endchoice
-
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
-	string "U-Boot binary format: custom name"
+	string "U-Boot binary format: custom names"
 	depends on BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	help
-	  Specify the correct name of the output binary created by
-	  U-Boot, if it is not one of the default names. For example:
+	  In case the U-Boot binary for the target platform is not among
+	  the default names, one or more custom names can be listed here.
+	  Use space to separate multiple names.
+	  Example:
 	  u-boot_magic.bin
 
+endmenu
+
 config BR2_TARGET_UBOOT_OMAP_IFT
 	depends on BR2_TARGET_UBOOT_FORMAT_BIN
 	depends on BR2_arm || BR2_armeb
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7c3512a..7379a4d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -36,48 +36,78 @@ BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
+UBOOT_BINS += u-boot.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BIN = u-boot
+UBOOT_BINS += u-boot
 # To make elf usable for debuging on ARC use special target
 ifeq ($(BR2_arc),y)
-UBOOT_MAKE_TARGET = mdbtrick
+UBOOT_MAKE_TARGET += mdbtrick
+endif
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+UBOOT_BINS += u-boot.kwb
+UBOOT_MAKE_TARGET += u-boot.kwb
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
+UBOOT_BINS += u-boot.ais
+UBOOT_MAKE_TARGET += u-boot.ais
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
+UBOOT_BINS += u-boot.ldr
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
+UBOOT_BINS += u-boot-nand.bin
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
+UBOOT_BINS += u-boot-dtb.img
+UBOOT_MAKE_TARGET += all u-boot-dtb.img
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
+UBOOT_BINS += u-boot.img
+UBOOT_MAKE_TARGET += u-boot.img
 endif
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
-UBOOT_BIN = u-boot.kwb
-UBOOT_MAKE_TARGET = $(UBOOT_BIN)
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
-UBOOT_BIN = u-boot.ais
-UBOOT_MAKE_TARGET = $(UBOOT_BIN)
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-UBOOT_BIN = u-boot.ldr
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
-UBOOT_BIN = u-boot-nand.bin
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
-UBOOT_BIN = u-boot-dtb.img
-UBOOT_MAKE_TARGET = all $(UBOOT_BIN)
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
-UBOOT_BIN = u-boot.img
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
-UBOOT_BIN = u-boot.imx
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
-UBOOT_BIN = u-boot.sb
-UBOOT_MAKE_TARGET = $(UBOOT_BIN)
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
+UBOOT_BINS += u-boot.imx
+UBOOT_MAKE_TARGET += u-boot.imx
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
+UBOOT_BINS += u-boot.sb
+UBOOT_MAKE_TARGET += u-boot.sb
 # mxsimage needs OpenSSL
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
 # BootStream (.sb) is generated by U-Boot, we convert it to SD format
-UBOOT_BIN = u-boot.sd
-UBOOT_MAKE_TARGET = u-boot.sb
+UBOOT_BINS += u-boot.sd
+UBOOT_MAKE_TARGET += u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
-UBOOT_BIN = u-boot.nand
-UBOOT_MAKE_TARGET = u-boot.sb
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
+UBOOT_BINS += u-boot.nand
+UBOOT_MAKE_TARGET += u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
-UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
-else
-UBOOT_BIN = u-boot.bin
-UBOOT_BIN_IFT = $(UBOOT_BIN).ift
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
+UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+endif
+
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+UBOOT_BINS += u-boot.bin
+UBOOT_BIN_IFT = u-boot.bin.ift
 endif
 
 # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
@@ -166,9 +196,11 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
-	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(foreach f,$(UBOOT_BINS), \
+			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
+	)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
-		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
+		cp -dpf $(@D)/u-boot.sb $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
