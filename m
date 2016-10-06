From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 6 Oct 2016 10:43:13 -0300
Subject: [Buildroot] [PATCH v2] Revert "boot/uboot: allow to build multiple
	U-Boot images"
Message-ID: <1475761393-29715-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit fad58cefa4a392b52eafe46a773f8cbfb8aadb43.

Since commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot
images") the installation of SPL binary fails.

For example, when building the mx6cubox_defconfig target we see:

  LD      u-boot
  OBJCOPY u-boot-nodtb.bin
  COPY    u-boot.bin
  MKIMAGE u-boot.img
>>> uboot 2016.09.01 Installing to target
>>> uboot 2016.09.01 Installing to images directory
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.bin /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.img /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/SPL /home/fabio/buildroot/output/images/
cp: cannot stat '/home/fabio/buildroot/output/build/uboot-2016.09.01/SPL': No such file or directory

According to Arnout Vandecappelle: 

"It has been mentioned in a number of threads: a better solution is to
always 'make all' in UBOOT_BUILD_CMDS. This will also allow to remove
many of the UBOOT_MAKE_TARGET assignments.

It hasn't been done yet because such a change should be tested against
all the different U-Boot artefacts, and with different U-Boot versions."

While the 'make all' approach is not implemented, let's revert the
offending commit to avoid the SPL breakage. 

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Revert the offending commit instead of trying to fix it.

 boot/uboot/Config.in |  19 +++++-----
 boot/uboot/uboot.mk  | 102 ++++++++++++++++++---------------------------------
 2 files changed, 44 insertions(+), 77 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d46a757..a345601 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -137,7 +137,9 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
-menu "U-Boot binary format"
+choice
+	prompt "U-Boot binary format"
+	default BR2_TARGET_UBOOT_FORMAT_BIN
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
 	bool "u-boot.ais"
@@ -148,7 +150,6 @@ config BR2_TARGET_UBOOT_FORMAT_AIS
 
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
-	default y
 
 config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	bool "u-boot-dtb.img"
@@ -251,21 +252,19 @@ config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	help
 	  On some platforms, the standard U-Boot binary is not called
 	  u-boot.bin, but u-boot<something>.bin. If this is your case,
-	  you should select this option and specify the correct name(s)
+	  you should select this option and specify the correct name
 	  in BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME.
 
+endchoice
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
-	string "U-Boot binary format: custom names"
+	string "U-Boot binary format: custom name"
 	depends on BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	help
-	  In case the U-Boot binary for the target platform is not among
-	  the default names, one or more custom names can be listed here.
-	  Use space to separate multiple names.
-	  Example:
+	  Specify the correct name of the output binary created by
+	  U-Boot, if it is not one of the default names. For example:
 	  u-boot_magic.bin
 
-endmenu
-
 config BR2_TARGET_UBOOT_OMAP_IFT
 	depends on BR2_TARGET_UBOOT_FORMAT_BIN
 	depends on BR2_arm || BR2_armeb
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..7c3512a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -36,78 +36,48 @@ BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
-UBOOT_BINS += u-boot.bin
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BINS += u-boot
+UBOOT_BIN = u-boot
 # To make elf usable for debuging on ARC use special target
 ifeq ($(BR2_arc),y)
-UBOOT_MAKE_TARGET += mdbtrick
-endif
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
-UBOOT_BINS += u-boot.kwb
-UBOOT_MAKE_TARGET += u-boot.kwb
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
-UBOOT_BINS += u-boot.ais
-UBOOT_MAKE_TARGET += u-boot.ais
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-UBOOT_BINS += u-boot.ldr
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
-UBOOT_BINS += u-boot-nand.bin
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
-UBOOT_BINS += u-boot-dtb.img
-UBOOT_MAKE_TARGET += all u-boot-dtb.img
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
-UBOOT_BINS += u-boot.img
-UBOOT_MAKE_TARGET += u-boot.img
+UBOOT_MAKE_TARGET = mdbtrick
 endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
-UBOOT_BINS += u-boot.imx
-UBOOT_MAKE_TARGET += u-boot.imx
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
-UBOOT_BINS += u-boot.sb
-UBOOT_MAKE_TARGET += u-boot.sb
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+UBOOT_BIN = u-boot.kwb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
+UBOOT_BIN = u-boot.ais
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
+UBOOT_BIN = u-boot.ldr
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
+UBOOT_BIN = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
+UBOOT_BIN = u-boot-dtb.img
+UBOOT_MAKE_TARGET = all $(UBOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
+UBOOT_BIN = u-boot.img
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
+UBOOT_BIN = u-boot.imx
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
+UBOOT_BIN = u-boot.sb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 # mxsimage needs OpenSSL
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
 # BootStream (.sb) is generated by U-Boot, we convert it to SD format
-UBOOT_BINS += u-boot.sd
-UBOOT_MAKE_TARGET += u-boot.sb
+UBOOT_BIN = u-boot.sd
+UBOOT_MAKE_TARGET = u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
-UBOOT_BINS += u-boot.nand
-UBOOT_MAKE_TARGET += u-boot.sb
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
+UBOOT_BIN = u-boot.nand
+UBOOT_MAKE_TARGET = u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
-UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
-endif
-
-ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
-UBOOT_BINS += u-boot.bin
-UBOOT_BIN_IFT = u-boot.bin.ift
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
+UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+else
+UBOOT_BIN = u-boot.bin
+UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
 # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
@@ -196,11 +166,9 @@ define UBOOT_BUILD_OMAP_IFT
 endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
-	$(foreach f,$(UBOOT_BINS), \
-			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
-	)
+	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
-		cp -dpf $(@D)/u-boot.sb $(BINARIES_DIR))
+		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
-- 
2.7.4
