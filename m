From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:39 +0200
Subject: [Buildroot] [PATCH 22/28] boot: rename BR2_TARGET_* to BR2_BOOT_*
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3fe0c274aee46718fa67c5b92b7912d43abc7779.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in                |   18 +++---
 boot/at91bootstrap/at91bootstrap.mk         |    8 +-
 boot/at91dataflashboot/Config.in            |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk |    2 +-
 boot/barebox/Config.in                      |    8 +-
 boot/barebox/barebox.mk                     |   12 ++--
 boot/grub/Config.in                         |   94 +++++++++++++-------------
 boot/grub/grub.mk                           |   50 +++++++-------
 boot/syslinux/Config.in                     |   10 ++--
 boot/syslinux/syslinux.mk                   |    6 +-
 boot/u-boot/Config.in                       |   70 ++++++++++----------
 boot/u-boot/u-boot.mk                       |   34 +++++-----
 12 files changed, 157 insertions(+), 157 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index f022dd5..26af93a 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_TARGET_AT91BOOTSTRAP
+menuconfig BR2_BOOT_AT91BOOTSTRAP
 	depends on BR2_arm
 	bool "AT91 Bootstrap"
 	help
@@ -8,9 +8,9 @@ menuconfig BR2_TARGET_AT91BOOTSTRAP
 	  - Peripheral drivers such as PIO, PMC or SDRAMC...
 	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
 
-if	BR2_TARGET_AT91BOOTSTRAP
+if	BR2_BOOT_AT91BOOTSTRAP
 
-config BR2_TARGET_AT91BOOTSTRAP_BOARD
+config BR2_BOOT_AT91BOOTSTRAP_BOARD
 	string "Bootstrap board"
 	default ""
 	help
@@ -18,22 +18,22 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 
 choice
 	prompt "Boot Memory"
-	default BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
+	default BR2_BOOT_AT91BOOTSTRAP_DATAFLASH
 	help
 	  Select Chip for which AT91 bootstrap should be built
 
-config BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
+config BR2_BOOT_AT91BOOTSTRAP_DATAFLASH
 	bool "Data Flash"
 
-config BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
+config BR2_BOOT_AT91BOOTSTRAP_NANDFLASH
 	bool "NAND Flash"
 
 endchoice
 
-config BR2_TARGET_AT91BOOTSTRAP_MEMORY
+config BR2_BOOT_AT91BOOTSTRAP_MEMORY
 	string
-	default	"dataflash"	if	BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
-	default	"nandflash"	if	BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
+	default	"dataflash"	if	BR2_BOOT_AT91BOOTSTRAP_DATAFLASH
+	default	"nandflash"	if	BR2_BOOT_AT91BOOTSTRAP_NANDFLASH
 
 endif
 
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 48fa4e0..58d547d 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -7,8 +7,8 @@ AT91BOOTSTRAP_VERSION = 1.16
 AT91BOOTSTRAP_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 AT91BOOTSTRAP_SOURCE  = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
-AT91BOOTSTRAP_BOARD       = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-AT91BOOTSTRAP_MEMORY      = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
+AT91BOOTSTRAP_BOARD       = $(call qstrip,$(BR2_BOOT_AT91BOOTSTRAP_BOARD))
+AT91BOOTSTRAP_MEMORY      = $(call qstrip,$(BR2_BOOT_AT91BOOTSTRAP_MEMORY))
 AT91BOOTSTRAP_MAKE_SUBDIR = board/$(AT91BOOTSTRAP_BOARD)/$(AT91BOOTSTRAP_MEMORY)
 AT91BOOTSTRAP_BINARY      = $(AT91BOOTSTRAP_MAKE_SUBDIR)/$(AT91BOOTSTRAP_MEMORY)_$(AT91BOOTSTRAP_BOARD).bin
 
@@ -36,13 +36,13 @@ $(eval $(call GENTARGETS,boot,at91bootstrap))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
+ifeq ($(BR2_BOOT_AT91BOOTSTRAP),y)
 TARGETS+=at91bootstrap
 
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(AT91BOOTSTRAP_BOARD),)
-$(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
+$(error No AT91Bootstrap board name set. Check your BR2_BOOT_AT91BOOTSTRAP_BOARD setting)
 endif
 endif
 
diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 88cd058..3ac2928 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
-menuconfig BR2_TARGET_AT91DATAFLASHBOOT
+menuconfig BR2_BOOT_AT91DATAFLASHBOOT
        depends on BR2_arm
        bool "AT91 DataFlashBoot"
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index d27e9f3..119c452 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -25,6 +25,6 @@ $(eval $(call GENTARGETS,boot,at91dataflashboot))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_AT91DATAFLASHBOOT),y)
+ifeq ($(BR2_BOOT_AT91DATAFLASHBOOT),y)
 TARGETS+=at91dataflashboot
 endif
diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a821c45..7f377a4 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -1,18 +1,18 @@
-menuconfig BR2_TARGET_BAREBOX
+menuconfig BR2_BOOT_BAREBOX
 	bool "Barebox"
 	help
 	  The Barebox bootloader, formerly known as U-Boot v2.
 
 	  http://www.barebox.org
 
-if BR2_TARGET_BAREBOX
-config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
+if BR2_BOOT_BAREBOX
+config BR2_BOOT_BAREBOX_BOARD_DEFCONFIG
 	string "board defconfig"
 	help
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
 
-config BR2_TARGET_BAREBOX_BAREBOXENV
+config BR2_BOOT_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
 	  Install bareboxenv tool in target.
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 4ed0389..859b301 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -9,11 +9,11 @@ BAREBOX_SOURCE  = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE    = http://www.barebox.org/download/
 
 BAREBOX_INSTALL_IMAGES = YES
-ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifneq ($(BR2_BOOT_BAREBOX_BAREBOXENV),y)
 BAREBOX_INSTALL_TARGET = NO
 endif
 
-BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
+BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_BOOT_BAREBOX_BOARD_DEFCONFIG))
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH=x86
@@ -29,7 +29,7 @@ define BAREBOX_CONFIGURE_CMDS
 	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
 endef
 
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifeq ($(BR2_BOOT_BAREBOX_BAREBOXENV),y)
 define BAREBOX_BUILD_BAREBOXENV_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
 		$(@D)/scripts/bareboxenv.c
@@ -45,7 +45,7 @@ define BAREBOX_INSTALL_IMAGES_CMDS
 	cp $(@D)/barebox.bin $(BINARIES_DIR)
 endef
 
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifeq ($(BR2_BOOT_BAREBOX_BAREBOXENV),y)
 define BAREBOX_INSTALL_TARGET_CMDS
 	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
 endef
@@ -53,13 +53,13 @@ endif
 
 $(eval $(call GENTARGETS,boot,barebox))
 
-ifeq ($(BR2_TARGET_BAREBOX),y)
+ifeq ($(BR2_BOOT_BAREBOX),y)
 TARGETS+=barebox
 
 # we NEED a board defconfig file unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
-$(error No Barebox defconfig file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
+$(error No Barebox defconfig file. Check your BR2_BOOT_BAREBOX_BOARD_DEFCONFIG setting)
 endif
 endif
 
diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index bc7a73e..462ef70 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -1,146 +1,146 @@
-config BR2_TARGET_GRUB
+config BR2_BOOT_GRUB
 	bool "grub"
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  The GRand Unified Bootloader for x86 systems.
 
-config BR2_TARGET_GRUB_SPLASH
+config BR2_BOOT_GRUB_SPLASH
 	bool "Splashimage support"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  Add support for splashimage.
 	
 	  A splashimage is a 14-color indexed .xpm picture which
 	  is displayed as background for the grub menu.
 
-config BR2_TARGET_GRUB_DISKLESS
+config BR2_BOOT_GRUB_DISKLESS
 	bool "diskless support"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable diskless support
 
-config BR2_TARGET_GRUB_3c595
+config BR2_BOOT_GRUB_3c595
 	bool "3Com595 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable 3Com595 driver
 
-config BR2_TARGET_GRUB_3c90x
+config BR2_BOOT_GRUB_3c90x
 	bool "3Com90x driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable 3Com90x driver
 
-config BR2_TARGET_GRUB_davicom
+config BR2_BOOT_GRUB_davicom
 	bool "Davicom driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Davicom driver
 
-config BR2_TARGET_GRUB_e1000
+config BR2_BOOT_GRUB_e1000
 	bool "Etherexpress Pro/1000 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Etherexpress Pro/1000 driver
 
-config BR2_TARGET_GRUB_eepro100
+config BR2_BOOT_GRUB_eepro100
 	bool "Etherexpress Pro/100 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Etherexpress Pro/100 driver
 
-config BR2_TARGET_GRUB_epic100
+config BR2_BOOT_GRUB_epic100
 	bool "SMC 83c170 EPIC/100 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable SMC 83c170 EPIC/100 driver
 
-config BR2_TARGET_GRUB_forcedeth
+config BR2_BOOT_GRUB_forcedeth
 	bool "Nvidia Geforce driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Nvidia Geforce driver
 
-config BR2_TARGET_GRUB_natsemi
+config BR2_BOOT_GRUB_natsemi
 	bool "NatSemi DP8381x driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable NatSemi DP8381x driver
 
-config BR2_TARGET_GRUB_ns83820
+config BR2_BOOT_GRUB_ns83820
 	bool "NS83820 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable NS83820 driver
 
-config BR2_TARGET_GRUB_ns8390
+config BR2_BOOT_GRUB_ns8390
 	bool "NE2000 PCI driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable NE2000 PCI driver
 
-config BR2_TARGET_GRUB_pcnet32
+config BR2_BOOT_GRUB_pcnet32
 	bool "AMD Lance/PCI PCNet/32 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable AMD Lance/PCI PCNet/32 driver
 
-config BR2_TARGET_GRUB_pnic
+config BR2_BOOT_GRUB_pnic
 	bool "Bochs Pseudo Nic driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Bochs Pseudo Nic driver
 
-config BR2_TARGET_GRUB_rtl8139
+config BR2_BOOT_GRUB_rtl8139
 	bool "Realtek 8139 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Realtek 8139 driver
 
-config BR2_TARGET_GRUB_r8169
+config BR2_BOOT_GRUB_r8169
 	bool "Realtek 8169 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Realtek 8169 driver
 
-config BR2_TARGET_GRUB_sis900
+config BR2_BOOT_GRUB_sis900
 	bool "SIS 900 and SIS 7016 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable SIS 900 and SIS 7016 driver
 
-config BR2_TARGET_GRUB_tg3
+config BR2_BOOT_GRUB_tg3
 	bool "Broadcom Tigon3 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Broadcom Tigon3 driver
 
-config BR2_TARGET_GRUB_tulip
+config BR2_BOOT_GRUB_tulip
 	bool "Tulip driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Tulip driver
 
-config BR2_TARGET_GRUB_tlan
+config BR2_BOOT_GRUB_tlan
 	bool "TI ThunderLAN driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable TI ThunderLAN driver
 
-config BR2_TARGET_GRUB_undi
+config BR2_BOOT_GRUB_undi
 	bool "PXE UNDI driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable PXE UNDI driver
 
-config BR2_TARGET_GRUB_via_rhine
+config BR2_BOOT_GRUB_via_rhine
 	bool "Rhine-I/II driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Rhine-I/II driver
 
-config BR2_TARGET_GRUB_w89c840
+config BR2_BOOT_GRUB_w89c840
 	bool "Winbond W89c840 driver"
-	depends on BR2_TARGET_GRUB
+	depends on BR2_BOOT_GRUB
 	help
 	  enable Winbond W89c840 driver
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 4938416..93238cb 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -14,29 +14,29 @@ ifeq ($(BR2_LARGEFILE),)
 GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
-GRUB_CONFIG-$(BR2_TARGET_GRUB_SPLASH) += --enable-graphics
-GRUB_CONFIG-$(BR2_TARGET_GRUB_DISKLESS) += --enable-diskless
-GRUB_CONFIG-$(BR2_TARGET_GRUB_3c595) += --enable-3c595
-GRUB_CONFIG-$(BR2_TARGET_GRUB_3c90x) += --enable-3c90x
-GRUB_CONFIG-$(BR2_TARGET_GRUB_davicom) += --enable-davicom
-GRUB_CONFIG-$(BR2_TARGET_GRUB_e1000) += --enable-e1000
-GRUB_CONFIG-$(BR2_TARGET_GRUB_eepro100) += --enable-eepro100
-GRUB_CONFIG-$(BR2_TARGET_GRUB_epic100) += --enable-epic100
-GRUB_CONFIG-$(BR2_TARGET_GRUB_forcedeth) += --enable-forcedeth
-GRUB_CONFIG-$(BR2_TARGET_GRUB_natsemi) += --enable-natsemi
-GRUB_CONFIG-$(BR2_TARGET_GRUB_ns83820) += --enable-ns83820
-GRUB_CONFIG-$(BR2_TARGET_GRUB_ns8390) += --enable-ns8390
-GRUB_CONFIG-$(BR2_TARGET_GRUB_pcnet32) += --enable-pcnet32
-GRUB_CONFIG-$(BR2_TARGET_GRUB_pnic) += --enable-pnic
-GRUB_CONFIG-$(BR2_TARGET_GRUB_rtl8139) += --enable-rtl8139
-GRUB_CONFIG-$(BR2_TARGET_GRUB_r8169) += --enable-r8169
-GRUB_CONFIG-$(BR2_TARGET_GRUB_sis900) += --enable-sis900
-GRUB_CONFIG-$(BR2_TARGET_GRUB_tg3) += --enable-tg3
-GRUB_CONFIG-$(BR2_TARGET_GRUB_tulip) += --enable-tulip
-GRUB_CONFIG-$(BR2_TARGET_GRUB_tlan) += --enable-tlan
-GRUB_CONFIG-$(BR2_TARGET_GRUB_undi) += --enable-undi
-GRUB_CONFIG-$(BR2_TARGET_GRUB_via_rhine) += --enable-via-rhine
-GRUB_CONFIG-$(BR2_TARGET_GRUB_w89c840) += --enable-w89c840
+GRUB_CONFIG-$(BR2_BOOT_GRUB_SPLASH) += --enable-graphics
+GRUB_CONFIG-$(BR2_BOOT_GRUB_DISKLESS) += --enable-diskless
+GRUB_CONFIG-$(BR2_BOOT_GRUB_3c595) += --enable-3c595
+GRUB_CONFIG-$(BR2_BOOT_GRUB_3c90x) += --enable-3c90x
+GRUB_CONFIG-$(BR2_BOOT_GRUB_davicom) += --enable-davicom
+GRUB_CONFIG-$(BR2_BOOT_GRUB_e1000) += --enable-e1000
+GRUB_CONFIG-$(BR2_BOOT_GRUB_eepro100) += --enable-eepro100
+GRUB_CONFIG-$(BR2_BOOT_GRUB_epic100) += --enable-epic100
+GRUB_CONFIG-$(BR2_BOOT_GRUB_forcedeth) += --enable-forcedeth
+GRUB_CONFIG-$(BR2_BOOT_GRUB_natsemi) += --enable-natsemi
+GRUB_CONFIG-$(BR2_BOOT_GRUB_ns83820) += --enable-ns83820
+GRUB_CONFIG-$(BR2_BOOT_GRUB_ns8390) += --enable-ns8390
+GRUB_CONFIG-$(BR2_BOOT_GRUB_pcnet32) += --enable-pcnet32
+GRUB_CONFIG-$(BR2_BOOT_GRUB_pnic) += --enable-pnic
+GRUB_CONFIG-$(BR2_BOOT_GRUB_rtl8139) += --enable-rtl8139
+GRUB_CONFIG-$(BR2_BOOT_GRUB_r8169) += --enable-r8169
+GRUB_CONFIG-$(BR2_BOOT_GRUB_sis900) += --enable-sis900
+GRUB_CONFIG-$(BR2_BOOT_GRUB_tg3) += --enable-tg3
+GRUB_CONFIG-$(BR2_BOOT_GRUB_tulip) += --enable-tulip
+GRUB_CONFIG-$(BR2_BOOT_GRUB_tlan) += --enable-tlan
+GRUB_CONFIG-$(BR2_BOOT_GRUB_undi) += --enable-undi
+GRUB_CONFIG-$(BR2_BOOT_GRUB_via_rhine) += --enable-via-rhine
+GRUB_CONFIG-$(BR2_BOOT_GRUB_w89c840) += --enable-w89c840
 
 define GRUB_DEBIAN_PATCHES
 	# Apply the patches from the Debian patch
@@ -58,7 +58,7 @@ define GRUB_INSTALL_STAGING_CMDS
 	install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
 endef
 
-ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
+ifeq ($(BR2_BOOT_GRUB_SPLASH),y)
 define GRUB_INSTALL_SPLASH
 	cp boot/grub/splash.xpm.gz $(TARGET_DIR)/boot/grub/
 endef
@@ -89,6 +89,6 @@ $(eval $(call AUTOTARGETS,boot,grub))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_GRUB),y)
+ifeq ($(BR2_BOOT_GRUB),y)
 TARGETS+=grub
 endif
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 60f3b8f..eaa3d70 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,16 +1,16 @@
-config BR2_TARGET_SYSLINUX
+config BR2_BOOT_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
 
-config BR2_TARGET_SYSLINUX_ISOLINUX
+config BR2_BOOT_SYSLINUX_ISOLINUX
 	bool "Install isolinux"
-	depends on BR2_TARGET_SYSLINUX
+	depends on BR2_BOOT_SYSLINUX
 	default y
 
-config BR2_TARGET_SYSLINUX_PXELINUX
+config BR2_BOOT_SYSLINUX_PXELINUX
 	bool "Install pxelinux"
-	depends on BR2_TARGET_SYSLINUX
+	depends on BR2_BOOT_SYSLINUX
 	default y
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index d1b2907..1f50ed5 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -17,8 +17,8 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" AR="$(HOSTAR)" -C $(@D)
 endef
 
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
-SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_BOOT_SYSLINUX_ISOLINUX) += isolinux.bin
+SYSLINUX_IMAGES-$(BR2_BOOT_SYSLINUX_PXELINUX) += pxelinux.bin
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
@@ -33,6 +33,6 @@ $(eval $(call GENTARGETS,boot,syslinux))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_SYSLINUX),y)
+ifeq ($(BR2_BOOT_SYSLINUX),y)
 TARGETS+=syslinux
 endif
diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index aada346..d9a6385 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -1,10 +1,10 @@
-menuconfig BR2_TARGET_UBOOT
+menuconfig BR2_BOOT_UBOOT
 	bool "U-Boot"
 	help
 	  Build "Das U-Boot" Boot Monitor
 
-if BR2_TARGET_UBOOT
-config BR2_TARGET_UBOOT_BOARDNAME
+if BR2_BOOT_UBOOT
+config BR2_BOOT_UBOOT_BOARDNAME
 	string "U-Boot board name"
 	help
 	  One of U-Boot supported boards to be built.
@@ -12,47 +12,47 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_03
+	default BR2_BOOT_UBOOT_2011_03
 	help
 	  Select the specific U-Boot version you want to use
 
-config BR2_TARGET_UBOOT_2011_03
+config BR2_BOOT_UBOOT_2011_03
 	bool "2011.03"
 
-config BR2_TARGET_UBOOT_2010_12
+config BR2_BOOT_UBOOT_2010_12
 	bool "2010.12"
 
-config BR2_TARGET_UBOOT_2010_09
+config BR2_BOOT_UBOOT_2010_09
 	bool "2010.09"
 
-config BR2_TARGET_UBOOT_2010_06
+config BR2_BOOT_UBOOT_2010_06
 	bool "2010.06"
 
-config BR2_TARGET_UBOOT_2010_03
+config BR2_BOOT_UBOOT_2010_03
 	bool "2010.03"
 
-config BR2_TARGET_UBOOT_CUSTOM_TARBALL
+config BR2_BOOT_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
 endchoice
 
-if BR2_TARGET_UBOOT_CUSTOM_TARBALL
+if BR2_BOOT_UBOOT_CUSTOM_TARBALL
 
-config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
+config BR2_BOOT_UBOOT_CUSTOM_TARBALL_LOCATION
 	string "URL of custom U-Boot tarball"
 
 endif
 
-config BR2_TARGET_UBOOT_VERSION
+config BR2_BOOT_UBOOT_VERSION
 	string
-	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
-	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
-	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
-	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
-	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
-	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-
-config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	default "2011.03"	if BR2_BOOT_UBOOT_2011_03
+	default "2010.12"	if BR2_BOOT_UBOOT_2010_12
+	default "2010.09"	if BR2_BOOT_UBOOT_2010_09
+	default "2010.06"	if BR2_BOOT_UBOOT_2010_06
+	default "2010.03"	if BR2_BOOT_UBOOT_2010_03
+	default "custom"	if BR2_BOOT_UBOOT_CUSTOM_TARBALL
+
+config BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
 	  If your board requires custom patches, add the path to the
@@ -64,68 +64,68 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 choice
 	prompt "U-Boot binary format"
 
-config BR2_TARGET_UBOOT_FORMAT_BIN
+config BR2_BOOT_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
-config BR2_TARGET_UBOOT_FORMAT_KWB
+config BR2_BOOT_UBOOT_FORMAT_KWB
 	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
 
-config BR2_TARGET_UBOOT_FORMAT_LDR
+config BR2_BOOT_UBOOT_FORMAT_LDR
 	depends on BR2_bfin
 	bool "u-boot.ldr"
 
 endchoice
 
-config BR2_TARGET_UBOOT_TOOL_ENV
+config BR2_BOOT_UBOOT_TOOL_ENV
 	bool "fw_printenv tool in target"
 	help
 	  Install fw_printenv / fw_setenv tools in target.
 
-menuconfig BR2_TARGET_UBOOT_NETWORK
+menuconfig BR2_BOOT_UBOOT_NETWORK
 	bool "Network Settings"
 	default y
 	help
 	  Network settings for U-boot
 
-if BR2_TARGET_UBOOT_NETWORK
+if BR2_BOOT_UBOOT_NETWORK
 
-config BR2_TARGET_UBOOT_SERVERIP
+config BR2_BOOT_UBOOT_SERVERIP
 	string "server ip"
 	default "10.175.196.221"
 	help
 	  TFTP server ip address
 
-config BR2_TARGET_UBOOT_IPADDR
+config BR2_BOOT_UBOOT_IPADDR
 	string "ip address"
 	default "10.175.196.18"
 	help
 	  Target ip address
 
-config BR2_TARGET_UBOOT_GATEWAY
+config BR2_BOOT_UBOOT_GATEWAY
 	string "gateway ip"
 	default "10.175.196.1"
 	help
 	  Gateway ip address
 
-config BR2_TARGET_UBOOT_NETMASK
+config BR2_BOOT_UBOOT_NETMASK
 	string "netmask"
 	default "255.255.255.0"
 	help
 	  Network Mask
 
-config BR2_TARGET_UBOOT_ETHADDR
+config BR2_BOOT_UBOOT_ETHADDR
 	string "ethernet address"
 	default "04:25:fe:ed:00:18"
 	help
 	  Target MAC address for the ethernet interface.
 	  This should be changed for production units
 
-config BR2_TARGET_UBOOT_ETH1ADDR
+config BR2_BOOT_UBOOT_ETH1ADDR
 	string "ethernet 2 address"
 	help
 	  Target MAC address for the second ethernet interface.
 
-endif # BR2_TARGET_UBOOT_NETWORK
+endif # BR2_BOOT_UBOOT_NETWORK
 
-endif # BR2_TARGET_UBOOT
+endif # BR2_BOOT_UBOOT
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 215b1c7..ecbf675 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -3,14 +3,14 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
-U_BOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+U_BOOT_VERSION    = $(call qstrip,$(BR2_BOOT_UBOOT_VERSION))
+U_BOOT_BOARD_NAME = $(call qstrip,$(BR2_BOOT_UBOOT_BOARDNAME))
 
 U_BOOT_INSTALL_IMAGES = YES
 
 ifeq ($(U_BOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
-U_BOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
+U_BOOT_TARBALL = $(call qstrip,$(BR2_BOOT_UBOOT_CUSTOM_TARBALL_LOCATION))
 U_BOOT_SITE    = $(dir $(U_BOOT_TARBALL))
 U_BOOT_SOURCE  = $(notdir $(U_BOOT_TARBALL))
 else
@@ -19,10 +19,10 @@ U_BOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
 U_BOOT_SOURCE  = u-boot-$(U_BOOT_VERSION).tar.bz2
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+ifeq ($(BR2_BOOT_UBOOT_FORMAT_KWB),y)
 U_BOOT_BIN          = u-boot.kwb
 U_BOOT_MAKE_TARGET  = $(U_BOOT_BIN)
-else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
+else ifeq ($(BR2_BOOT_UBOOT_FORMAT_LDR),y)
 U_BOOT_BIN          = u-boot.ldr
 else
 U_BOOT_BIN          = u-boot.bin
@@ -52,9 +52,9 @@ $(if $(call qstrip,$(2)),
 	@echo '#define $(strip $(1)) $(call qstrip,$(2))' >> $(@D)/include/config.h)
 endef
 
-ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
+ifneq ($(call qstrip,$(BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR)),)
 define U_BOOT_APPLY_CUSTOM_PATCHES
-	toolchain/patch-kernel.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
+	toolchain/patch-kernel.sh $(@D) $(BR2_BOOT_UBOOT_CUSTOM_PATCH_DIR) \
 		u-boot-$(U_BOOT_VERSION)-\*.patch
 endef
 
@@ -71,16 +71,16 @@ define U_BOOT_CONFIGURE_CMDS
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
 	$(call insert_define,DATE,$(DATE))
 	$(call insert_define,CONFIG_LOAD_SCRIPTS,1)
-	$(call insert_define,CONFIG_IPADDR,$(BR2_TARGET_UBOOT_IPADDR))
-	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_TARGET_UBOOT_GATEWAY))
-	$(call insert_define,CONFIG_NETMASK,$(BR2_TARGET_UBOOT_NETMASK))
-	$(call insert_define,CONFIG_SERVERIP,$(BR2_TARGET_UBOOT_SERVERIP))
-	$(call insert_define,CONFIG_ETHADDR,$(BR2_TARGET_UBOOT_ETHADDR))
-	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_TARGET_UBOOT_ETH1ADDR))
+	$(call insert_define,CONFIG_IPADDR,$(BR2_BOOT_UBOOT_IPADDR))
+	$(call insert_define,CONFIG_GATEWAYIP,$(BR2_BOOT_UBOOT_GATEWAY))
+	$(call insert_define,CONFIG_NETMASK,$(BR2_BOOT_UBOOT_NETMASK))
+	$(call insert_define,CONFIG_SERVERIP,$(BR2_BOOT_UBOOT_SERVERIP))
+	$(call insert_define,CONFIG_ETHADDR,$(BR2_BOOT_UBOOT_ETHADDR))
+	$(call insert_define,CONFIG_ETH1ADDR,$(BR2_BOOT_UBOOT_ETH1ADDR))
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(@D)/include/config.h
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
+ifeq ($(BR2_BOOT_UBOOT_TOOL_ENV),y)
 define U_BOOT_BUILD_TARGET_ENV_UTILS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) HOSTCC="$(TARGET_CC)" -C $(@D) env
 endef
@@ -97,7 +97,7 @@ define U_BOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
+ifeq ($(BR2_BOOT_UBOOT_TOOL_ENV),y)
 define U_BOOT_INSTALL_TARGET_ENV_UTILS
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv \
 		$(TARGET_DIR)/usr/sbin/fw_printenv
@@ -116,13 +116,13 @@ $(eval $(call GENTARGETS,boot,u-boot))
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_TARGET_UBOOT),y)
+ifeq ($(BR2_BOOT_UBOOT),y)
 TARGETS+=u-boot
 
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(U_BOOT_BOARD_NAME),)
-$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
+$(error NO U-Boot board name set. Check your BR2_BOOT_UBOOT_BOARDNAME setting)
 endif
 endif
 
-- 
1.7.4.1
