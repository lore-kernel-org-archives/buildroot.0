From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:47 +0200
Subject: [Buildroot] [PATCH 5/7] target: use qstrip
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <79c213fbe5aa188e60563b88708e267cfe5bf4ec.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Makefile.in                                 |   22 +++-----
 target/cpio/cpioroot.mk                            |    3 +-
 target/cramfs/cramfs.mk                            |    3 +-
 target/device/ARMLTD/Makefile.in                   |    6 +--
 target/device/Atmel/DataFlashBoot/DataflashBoot.mk |    3 +-
 target/device/Atmel/Makefile.in                    |   22 +++-----
 target/device/Atmel/arch-arm/u-boot/Makefile.in    |    3 +-
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |   18 ++-----
 target/device/KwikByte/Makefile.in                 |   10 ++--
 target/device/x86/i686/Makefile.in                 |    6 +--
 target/ext2/ext2root.mk                            |    6 +--
 target/generic/Makefile.in                         |    6 +--
 target/iso9660/iso9660.mk                          |    6 +--
 target/jffs2/jffs2root.mk                          |    6 +--
 target/linux/Makefile.in                           |   19 ++-----
 target/linux/Makefile.in.advanced                  |   53 +++++++-------------
 target/squashfs/squashfsroot.mk                    |    3 +-
 target/tar/tarroot.mk                              |    3 +-
 target/u-boot/Makefile.in                          |   30 ++++-------
 target/ubifs/ubifsroot.mk                          |    6 +--
 target/xtensa/patch.in                             |    2 +-
 21 files changed, 81 insertions(+), 155 deletions(-)

diff --git a/target/Makefile.in b/target/Makefile.in
index a835353..df980b4 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -1,12 +1,9 @@
-BR2_PACKAGE_LINUX_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
-BR2_PACKAGE_LINUX_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
+BR2_PACKAGE_LINUX_FORMAT:=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
+BR2_PACKAGE_LINUX_KCONFIG:=$(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG))
 
 
 # COPY_FILE absolute_path_to_file, target_directory, filename
-ifneq ($(strip $(subst ",,$(BUILDROOT_COPYTO))),)	# Use shell definition
-#"))
+ifneq ($(call qstrip,$(BUILDROOT_COPYTO)),)	# Use shell definition
 define COPY_FILE
 	@echo "BUILDROOT_COPYTO: Copy to $(BUILDROOT_COPYTO)/$(strip $(3))" ; \
 	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
@@ -18,25 +15,23 @@ define COPY_FILE
 		cp $(1) $(BUILDROOT_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi
 endef
-COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))
+COPYTO=$(call qstrip,$(BUILDROOT_COPYTO))
 else
-ifneq ($(strip $(subst ",,$(BR2_COPYTO))),)	# Global override
-#"))
+ifneq ($(call qstrip,$(BR2_COPYTO)),)	# Global override
 define COPY_FILE
 	@echo "BR2_COPYTO: Copy to $(BR2_COPYTO)/$(strip $(3))" ; \
 	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
 	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
 		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi ; \
-	if [ "$(strip $(subst ",,$(BR2_COPYTO)))X" != "X" ] ; then \
+	if [ "$(call qstrip,$(BR2_COPYTO))X" != "X" ] ; then \
 		mkdir -p $(BR2_COPYTO)  || echo "Could not create $(BR2_COPYTO)" ; \
 		if [ -d $(BR2_COPYTO) -o -w $(BR2_COPYTO) ] ; then \
 			cp $(1) $(BR2_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 		fi ; \
 	fi
 endef
-#"))
-COPYTO=$(strip $(subst ",,$(BR2_COPYTO)))
+COPYTO=$(call qstrip,$(BR2_COPYTO))
 else	# Package specific copyto, or empty
 define COPY_FILE
 	@echo "Copy to $(2)/$(strip $(3))" ; \
@@ -44,14 +39,13 @@ define COPY_FILE
 	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
 		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 	fi ; \
-	if [ "$(strip $(subst ",,$(2)))X" != "X" ] ; then \
+	if [ "$(call qstrip,$(2))X" != "X" ] ; then \
 		mkdir -p $(2) || echo "Could not create $(2)" ; \
 		if [ -d $(2) -o  -w $(2) ] ; then \
 			cp $(1) $(2)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
 		fi ; \
 	fi
 endef
-#"))
 endif
 endif
 
diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 08983ff..0dbdb2e 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -31,8 +31,7 @@ else
 CPIO_TARGET := $(CPIO_BASE)
 endif
 
-ROOTFS_CPIO_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_CPIO_COPYTO)))
-# "))
+ROOTFS_CPIO_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_COPYTO))
 #
 
 cpioroot-init:
diff --git a/target/cramfs/cramfs.mk b/target/cramfs/cramfs.mk
index e2ca415..99f9f79 100644
--- a/target/cramfs/cramfs.mk
+++ b/target/cramfs/cramfs.mk
@@ -5,8 +5,7 @@
 #############################################################
 CRAMFS_DIR=$(BUILD_DIR)/cramfs-1.1
 CRAMFS_SOURCE=cramfs-1.1.tar.gz
-ifeq ($(strip $(subst ",,$(BR2_SOURCEFORGE_MIRROR))),unc)
-# "))
+ifeq ($(call qstrip,$(BR2_SOURCEFORGE_MIRROR)),unc)
 # UNC does not seem to have cramfs
 CRAMFS_SITE=http://internap.dl.sourceforge.net/sourceforge/cramfs
 else
diff --git a/target/device/ARMLTD/Makefile.in b/target/device/ARMLTD/Makefile.in
index a846ba6..18e7b7d 100644
--- a/target/device/ARMLTD/Makefile.in
+++ b/target/device/ARMLTD/Makefile.in
@@ -1,8 +1,6 @@
 ifeq ($(BR2_TARGET_ARMLTD),y)
-BOARD_NAME=$(strip $(subst ",,$(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME=$(call qstrip,$(BR2_BOARD_NAME))
+BOARD_PATH=$(call qstrip,$(BR2_BOARD_PATH))
 
 
 # pin some settings
diff --git a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
index b3735bc..c3dc857 100644
--- a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
+++ b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
@@ -5,8 +5,7 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
-ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
-# "))
+ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index 70d3805..bb03529 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -3,10 +3,8 @@
 ifeq ($(BR2_TARGET_ATMEL),y)
 ATMEL_PATH:=target/device/Atmel
 
-BOARD_NAME:=$(strip $(subst ",, $(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH:=$(strip $(subst ",, $(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
+BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 
 ATMEL_TARGET:=$(ATMEL_PATH)/root
 TARGET_SKELETON:=$(ATMEL_TARGET)/target_skeleton
@@ -18,26 +16,23 @@ KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
 endif
 
 ifneq ($(COPYTO),)
-TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_COPYTO)))
+TARGET_ATMEL_COPYTO:=$(call qstrip,$(BR2_COPYTO))
 else
-TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_TARGET_ATMEL_COPYTO)))
+TARGET_ATMEL_COPYTO:=$(call qstrip,$(BR2_TARGET_ATMEL_COPYTO))
 endif
 
 # These are set by Config.in
-DOWNLOAD_LINUX26_VERSION:= $(strip $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:= $(call qstrip,$(BR2_DOWNLOAD_LINUX26_VERSION))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_VERSION:=$(strip $(subst ",, $(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call qstrip,$(BR2_LINUX26_VERSION))
 ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_RC_PATCH:=$(strip $(subst ",, $(BR2_LINUX26_RC_PATCH)))
-#"))
+LINUX26_RC_PATCH:=$(call qstrip,$(BR2_LINUX26_RC_PATCH))
 
 # These are set by "new" Config.in
 LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config
@@ -62,8 +57,7 @@ DFB_BOARD_NAME:=$(BOARD_NAME)
 
 #BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
-U_BOOT_VERSION:=$(strip $(subst ",,$(BR2_UBOOT_VERSION)))
-#"))
+U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
 
 # Update things in board specific makefiles
 include target/device/Atmel/*/Makefile.in
diff --git a/target/device/Atmel/arch-arm/u-boot/Makefile.in b/target/device/Atmel/arch-arm/u-boot/Makefile.in
index 841895c..b5981e1 100644
--- a/target/device/Atmel/arch-arm/u-boot/Makefile.in
+++ b/target/device/Atmel/arch-arm/u-boot/Makefile.in
@@ -1,5 +1,4 @@
 ifneq ($(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR),)
-U_BOOT_ARCH_PATCH_DIR:=$(strip $(subst ",, $(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR)))
-#"))
+U_BOOT_ARCH_PATCH_DIR:=$(call qstrip,$(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR))
 endif
 
diff --git a/target/device/Atmel/at91bootstrap/at91bootstrap.mk b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
index b68be5e..92da683 100644
--- a/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
@@ -7,29 +7,23 @@ AT91BOOTSTRAP_VERSION:=2.10
 AT91BOOTSTRAP_PATCH_LEVEL:=
 AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
-#"))
+ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
-AT91BOOTSTRAP:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP)))
-#"))
+AT91BOOTSTRAP:=$(call qstrip,$(BR2_AT91BOOTSTRAP))
 AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
-AT91BOOTSTRAP_BOARD:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_BOARD)))
-#"))
+AT91BOOTSTRAP_BOARD:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 
-AT91BOOTSTRAP_MEMORY:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
-#"))
+AT91BOOTSTRAP_MEMORY:=$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
 
 AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_PATCHED_VERSION).bin
 
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
-AT91BOOTSTRAP_JUMP_ADDR:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_JUMP_ADDR)))
-#"))
-AT91BOOTSTRAP_IMG_SIZE:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
-#"))
+AT91BOOTSTRAP_JUMP_ADDR:=$(call qstrip,$(BR2_AT91BOOTSTRAP_JUMP_ADDR))
+AT91BOOTSTRAP_IMG_SIZE:=$(call qstrip,$(BR2_AT91BOOTSTRAP_IMG_SIZE))
 
 AT91_CUSTOM_FLAGS:=
 ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
diff --git a/target/device/KwikByte/Makefile.in b/target/device/KwikByte/Makefile.in
index 347d6ab..d889bc2 100644
--- a/target/device/KwikByte/Makefile.in
+++ b/target/device/KwikByte/Makefile.in
@@ -1,17 +1,15 @@
 ifeq ($(BR2_TARGET_KWIKBYTE),y)
 
-BOARD_NAME:=$(strip  $(subst ",, $(BR2_BOARD_NAME)))
-BOARD_PATH:=$(strip  $(subst ",, $(BR2_BOARD_PATH)))
+BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
+BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 
 # These are set by Config.in
-DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:=$(call qstrip,$(BR2_DOWNLOAD_LINUX26_VERSION))
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
-LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call qstrip,$(BR2_LINUX26_VERSION))
 ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
diff --git a/target/device/x86/i686/Makefile.in b/target/device/x86/i686/Makefile.in
index 99ef63b..41d2bbc 100644
--- a/target/device/x86/i686/Makefile.in
+++ b/target/device/x86/i686/Makefile.in
@@ -1,7 +1,5 @@
-BOARD_NAME=$(strip $(subst ",,$(BR2_BOARD_NAME)))
-#"))
-BOARD_PATH=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_NAME=$(call qstrip,$(BR2_BOARD_NAME))
+BOARD_PATH=$(call qstrip,$(BR2_BOARD_PATH))
 
 
 
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 4fadefa..11624cf 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -58,8 +58,7 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
-EXT2_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
-#")
+EXT2_BASE := $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
 
 EXT2_ROOTFS_COMPRESSOR:=
 EXT2_ROOTFS_COMPRESSOR_EXT:=
@@ -121,8 +120,7 @@ $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(E
 	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_BASE) > $(EXT2_TARGET)
 endif
 
-EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
-# "))
+EXT2_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_COPYTO))
 
 ext2root: $(EXT2_TARGET)
 	@ls -l $(EXT2_TARGET)
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 3541264..084acf4 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -7,10 +7,8 @@ TARGET_SKELETON=target/generic/target_busybox_skeleton
 TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 
-TARGET_GENERIC_GETTY:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_PORT)))
-#"))
-TARGET_GENERIC_GETTY_BAUDRATE:=$(strip $(subst ",, $(BR2_TARGET_GENERIC_GETTY_BAUDRATE)))
-#"))
+TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
+TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 
 target-generic-getty:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 2525286..4dfa1ad 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -44,10 +44,8 @@ mkisofs-dirclean:
 #############################################################
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
-ISO9660_TARGET:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
-#")
-ISO9660_BOOT_MENU:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
-#")
+ISO9660_TARGET:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
+ISO9660_BOOT_MENU:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 ISO9660_OPTS:=
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index a89dc80..9d67347 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -32,8 +32,7 @@ JFFS2_OPTS += -n
 SUMTOOL_OPTS += -n
 endif
 
-JFFS2_TARGET := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT)))
-#"))
+JFFS2_TARGET := $(call qstrip,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
 ifneq ($(TARGET_DEVICE_TABLE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
@@ -75,8 +74,7 @@ ifeq ($(BR2_JFFS2_TARGET_SREC),y)
 	@ls -l $(JFFS2_TARGET).srec
 endif
 
-JFFS2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO)))
-#"))
+JFFS2_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO))
 
 jffs2root: $(JFFS2_TARGET)
 ifneq ($(JFFS2_COPYTO),)
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index 3e8bc7b..742fe19 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -26,28 +26,23 @@ LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 
 ifeq ($(BOARD_PATH),)
-BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 endif
 
 # Linux kernel configuration file
 # Has to be set by the target/device
 # If it is not set by the target/device, then pick the one from .config
 ifndef LINUX26_KCONFIG
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
-LINUX26_KCONFIG=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
-#"))
+ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG)),)
+LINUX26_KCONFIG=$(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG))
 else
 # LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
 endif
 
 ifndef LINUX26_FORMAT
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
-LINUX26_FORMAT=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
-#"))
+ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT)),)
+LINUX26_FORMAT=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
 else
 LINUX26_FORMAT=zImage
 endif
@@ -67,8 +62,7 @@ endif
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
-#"))
+ROOTFS_STRIPPED_SUFFIX=$(call qstrip,$(ROOTFS_SUFFIX))
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL
 LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
@@ -86,7 +80,6 @@ LINUX_KERNEL=$(LINUX26_KERNEL_NAME)
 ifeq ($(strip $(LINUX26_PATCH_DIR)),)
 ifneq ($(BOARD_PATH),)
 LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
-#"))
 endif
 endif
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 47a1f4e..9de4735 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -20,8 +20,7 @@ endif
 # 4. Use default (2.6.22.1)
 ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 ifneq ($(BR2_DOWNLOAD_LINUX26_VERSION),)
-DOWNLOAD_LINUX26_VERSION:=$(strip $(subst ",,$(BR2_DOWNLOAD_LINUX26_VERSION)))
-#"))
+DOWNLOAD_LINUX26_VERSION:=$(call qstrip,$(BR2_DOWNLOAD_LINUX26_VERSION))
 else
 DOWNLOAD_LINUX26_VERSION:=$(LINUX_HEADERS_VERSION)
 endif
@@ -35,8 +34,7 @@ endif
 # 4. Use default (2.6.22.1)
 ifeq ($(LINUX26_VERSION),)
 ifneq ($(BR2_LINUX26_VERSION),)
-LINUX26_VERSION:=$(strip $(subst ",,$(BR2_LINUX26_VERSION)))
-#"))
+LINUX26_VERSION:=$(call qstrip,$(BR2_LINUX26_VERSION))
 else
 LINUX26_VERSION:=$(LINUX_HEADERS_VERSION)
 endif
@@ -46,8 +44,7 @@ endif
 LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`
 
 ifeq ($(BOARD_PATH),)
-BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
-#"))
+BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 endif
 
 # Version of Linux AFTER patches
@@ -60,16 +57,12 @@ LINUX_DIR:=$(LINUX26_DIR)
 # -----------------------------------------------------------------------------
 # Define source name and sites
 LINUX26_SOURCE:=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
-LINUX26_SITE:=$(strip $(subst ",,$(BR2_KERNEL_SITE)))
-#"))
+LINUX26_SITE:=$(call qstrip,$(BR2_KERNEL_SITE))
 
-LINUX26_PATCH_SOURCE:=$(strip $(subst ",,$(BR2_KERNEL_PATCH)))
-#"))
-LINUX26_PATCH_SITE:=$(strip $(subst ",,$(BR2_KERNEL_PATCH_SITE)))
-#"))
+LINUX26_PATCH_SOURCE:=$(call qstrip,$(BR2_KERNEL_PATCH))
+LINUX26_PATCH_SITE:=$(call qstrip,$(BR2_KERNEL_PATCH_SITE))
 
-LINUX26_BSP_PATCH:=$(strip $(subst ",,$(BR2_LINUX_BSP_PATCH)))
-#"))
+LINUX26_BSP_PATCH:=$(call qstrip,$(BR2_LINUX_BSP_PATCH))
 
 ifneq ($(LINUX26_BSP_PATCH),)
 LINUX_HEADERS_DEPENDS:=  $(DL_DIR)/$(LINUX26_BSP_PATCH)
@@ -86,8 +79,7 @@ LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
 endif
 
 # kernel architecture patches provided by buildroot
-KERNEL_ARCH_PATCH_DIR:=$(strip $(subst ",,$(BR2_KERNEL_ARCH_PATCH_DIR)))
-#"))
+KERNEL_ARCH_PATCH_DIR:=$(call qstrip,$(BR2_KERNEL_ARCH_PATCH_DIR))
 
 
 
@@ -98,10 +90,8 @@ KERNEL_ARCH_PATCH_DIR:=$(strip $(subst ",,$(BR2_KERNEL_ARCH_PATCH_DIR)))
 # Has to be set by the target/device
 # If it is not set by the target/device, then pick the one from .config
 ifndef LINUX26_KCONFIG
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
-LINUX26_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
-#"))
-#"))
+ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG)),)
+LINUX26_KCONFIG:=$(call qstrip,$(BR2_PACKAGE_LINUX_KCONFIG))
 else
 ifeq ($(BR2_i386),y)
 LINUX26_KCONFIG:=$(BOARD_PATH)/linux26.config
@@ -111,18 +101,15 @@ endif
 endif
 endif
 
-KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
-#"))
+KERNEL_CONFIG_METHOD:=$(call qstrip,$(BR2_KERNEL_CONFIG_METHOD))
 ifeq ($(KERNEL_CONFIG_METHOD),)
 KERNEL_CONFIG_METHOD:=menuconfig
 endif
 
 # -----------------------------------------------------------------------------
 ifndef LINUX26_FORMAT
-ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
-#"))
-LINUX26_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
-#"))
+ifneq ($(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT)),)
+LINUX26_FORMAT:=$(call qstrip,$(BR2_PACKAGE_LINUX_FORMAT))
 else
 LINUX26_FORMAT:=zImage
 endif
@@ -168,8 +155,7 @@ LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
 endif
 endif
 
-ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
-#"))
+ROOTFS_STRIPPED_SUFFIX=$(call qstrip,$(ROOTFS_SUFFIX))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
 LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
@@ -234,10 +220,8 @@ ifeq ($(BR2_LINUX_COPYTO_TFTPBOOT),y)
 LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
 endif
 
-ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
-LINUX_COPYTO:=$(strip $(subst ",,$(BR2_LINUX_COPYTO)))
-#"))
-#"))
+ifneq ($(call qstrip,$(BR2_LINUX_COPYTO)),)
+LINUX_COPYTO:=$(call qstrip,$(BR2_LINUX_COPYTO))
 LINUX26_TARGETS+=$(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 endif
 
@@ -294,8 +278,7 @@ endif
 # =============================================================================
 linux_patch: $(LINUX26_DIR)/.patched.board
 
-KERNEL_EXTRA_VERSION:=$(strip $(subst ",,$(BR2_EXTRA_VERSION)))
-#"))
+KERNEL_EXTRA_VERSION:=$(call qstrip,$(BR2_EXTRA_VERSION))
 
 lxcf:	$(LINUX26_DIR)/.config
 
@@ -337,7 +320,7 @@ ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
 	fi
 endif
-ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
+ifneq ($(call qstrip,$(BR2_EXTRA_VERSION)),)
 	$(SED) 's,^EXTRAVERSION.*,EXTRAVERSION = $(KERNEL_EXTRA_VERSION),g' $(LINUX26_DIR)/Makefile
 endif
 # $(strip $(subst ",, - ))
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index 019ed8b..d7d559b 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -3,8 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION)))
-#"))
+SQUASHFS_VERSION:=$(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION))
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index 5b33c62..a62f5bf 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -21,8 +21,7 @@ ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
-ROOTFS_TAR_COPYTO:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_TAR_COPYTO)))
-# "))
+ROOTFS_TAR_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
 
 tarroot: host-fakeroot makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index b74e43a..3dc78b1 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -3,13 +3,11 @@
 # U-Boot
 #
 #############################################################
-U_BOOT_VERSION:=$(strip $(subst ",,$(BR2_UBOOT_VERSION)))
-#"))
+U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
 
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
-U_BOOT_SITE:=$(strip $(subst ",,$(BR2_U_BOOT_SITE)))
-#"))
+U_BOOT_SITE:=$(call qstrip,$(BR2_U_BOOT_SITE))
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
@@ -23,27 +21,20 @@ U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
 U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
 
-ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
-#"))
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV)),y)
 U_BOOT_TARGETS += u-boot-autoscript
 endif
 
-TARGET_UBOOT_IPADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
-#"))
-TARGET_UBOOT_SERVERIP:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_SERVERIP)))
-#"))
-TARGET_UBOOT_GATEWAY:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_GATEWAY)))
-#"))
-TARGET_UBOOT_NETMASK:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_NETMASK)))
-#"))
-TARGET_UBOOT_ETHADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_ETHADDR)))
-#"))
+TARGET_UBOOT_IPADDR:=$(call qstrip,$(BR2_TARGET_UBOOT_IPADDR))
+TARGET_UBOOT_SERVERIP:=$(call qstrip,$(BR2_TARGET_UBOOT_SERVERIP))
+TARGET_UBOOT_GATEWAY:=$(call qstrip,$(BR2_TARGET_UBOOT_GATEWAY))
+TARGET_UBOOT_NETMASK:=$(call qstrip,$(BR2_TARGET_UBOOT_NETMASK))
+TARGET_UBOOT_ETHADDR:=$(call qstrip,$(BR2_TARGET_UBOOT_ETHADDR))
 
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 ifeq ($(UBOOT_BOARD_NAME),)
-UBOOT_BOARD_NAME:=$(strip $(subst ",,$(BR2_TARGET_UBOOT_BOARDNAME)))
-#"))
+UBOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 endif
 
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
@@ -67,9 +58,8 @@ define insert_define
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
- at echo '#define $(strip $(1)) $(strip $(subst ",,$(2)))' >> $(U_BOOT_INC_CONF_FILE)
+ at echo '#define $(strip $(1)) $(call qstrip,$(2))' >> $(U_BOOT_INC_CONF_FILE)
 endef
-#"))
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(call DOWNLOAD,$(U_BOOT_SITE),$(U_BOOT_SOURCE))
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index 1707e46..c09c981 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -38,8 +38,7 @@ mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
 
 UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
-UBIFS_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
-#")
+UBIFS_BASE := $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
 
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
@@ -99,8 +98,7 @@ $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT): $(UBIFS_ROOTFS_COMPRESSOR_PREREQ)
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
-UBIFS_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO)))
-# "))
+UBIFS_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO))
 
 ubifsroot: $(UBIFS_TARGET)
 	@ls -l $(UBIFS_TARGET)
diff --git a/target/xtensa/patch.in b/target/xtensa/patch.in
index 5b723a8..3fe5cc8 100644
--- a/target/xtensa/patch.in
+++ b/target/xtensa/patch.in
@@ -19,7 +19,7 @@ ifneq ($(filter xtensa%,$(ARCH)),)
 #  overlay is selected).  So the function emits a Makefile error
 #  if a selected patch file is not found.
 
-XTENSA_CORENAME:=$(strip $(subst ",,$(BR2_xtensa_core_name)))
+XTENSA_CORENAME:=$(call qstrip,$(BR2_xtensa_core_name))
 ifeq ($(XTENSA_CORENAME),fsf)
 XTENSA_PATCH =
 else
-- 
1.6.0.4
