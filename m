From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:01 +0200
Subject: [Buildroot] [PATCH 15/46] u-boot: further simplify the configuration
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a2fbca6b2a4babe40974e7dc0960b66ea3884afa.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all the bootsource selection mechanism and the horribly
complicated BR2_TARGET_UBOOT_DEFAULT_ENV thing, which wanted to be
generic, but was in fact very AT91-specific.

Just keep things simple: we build U-Boot with the board configuration
file specified in BR2_TARGET_UBOOT_BOARDNAME.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |  247 -------------------------------------------------
 boot/u-boot/u-boot.mk |  113 ++---------------------
 2 files changed, 8 insertions(+), 352 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 78a195d..a4f5fd9 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -42,53 +42,6 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
-choice
-	prompt "Bootsource"
-	depends on BR2_BOOTSOURCE
-	default BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD
-	bool "Boot from dataflashcard"
-	depends on BR2_BOOTSOURCE_DATAFLASHCARD
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	bool "Boot from dataflash"
-	depends on BR2_BOOTSOURCE_DATAFLASH
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH
-	bool "Boot from a NAND flash"
-	depends on BR2_BOOTSOURCE_NANDFLASH
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_FLASH
-	bool "Boot from a parallell flash"
-	depends on BR2_BOOTSOURCE_FLASH
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD
-	bool "Boot from an SD-Card"
-	depends on BR2_BOOTSOURCE_SDCARD
-
-	config BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM
-	bool "Boot from a serial EEPROM (Not yet supported)"
-	depends on BR2_BOOTSOURCE_EEPROM
-
-endchoice
-
-config BR2_TARGET_UBOOT_BOOTSOURCE
-	string
-	depends on BR2_BOOTSOURCE
-	default "dataflash"	if BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD
-	default "dataflash"	if BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default "nandflash"	if BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH
-	default "flash"		if BR2_TARGET_UBOOT_BOOTSOURCE_FLASH
-	default "sdcard"	if BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD
-	default "eeprom"	if BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM
-
-config BR2_TARGET_UBOOT_SILENT
-	bool "silent console"
-	help
-	  If the option has been enabled, the output can be
-	  silenced by setting the environment variable "silent".
-
 config BR2_TARGET_UBOOT_TOOL_MKIMAGE
 	bool "mkimage tool in target"
 	help
@@ -99,165 +52,6 @@ config BR2_TARGET_UBOOT_TOOL_ENV
 	help
 	  Install fw_printenv / fw_setenv tools in target.
 
-menuconfig BR2_TARGET_UBOOT_DEFAULT_ENV
-	bool "Generate a default environment"
-	help
-	  Will generate variables for factory default command
-	  and autoscript.
-
-if BR2_TARGET_UBOOT_DEFAULT_ENV
-choice
-	prompt "SDRAM Memory size"
-	default BR2_TARGET_UBOOT_SDRAM_SIZE_64M
-	help
-	  Size of the onboard SDRAM
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_256MB
-	bool "256 MB"
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_128MB
-	bool "128 MB"
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_64MB
-	bool "64 MB"
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_32MB
-	bool "32 MB"
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_16MB
-	bool "16 MB"
-
-config BR2_TARGET_UBOOT_SDRAM_SIZE_8MB
-	bool "8 MB"
-
-endchoice
-
-config BR2_TARGET_UBOOT_MEMORY_SIZE
-	string
-	default "256M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_256MB
-	default "128M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_128MB
-	default "64M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_64MB
-	default "32M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_32MB
-	default "16M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_16MB
-	default "8M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_8MB
-
-choice
-	prompt "Kernel Size"
-	default BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
-	bool "Kernel size is less than 1.25 MB"
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
-	bool "Kernel size is less than 1.50 MB"
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
-	bool "Kernel size is less than 1.75 MB"
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
-	bool "Kernel size is less than 2.00 MB"
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
-	bool "Kernel size is less than 2.25 MB"
-
-config BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
-	bool "Kernel size is less than 2.50 MB"
-
-endchoice
-
-choice
-	prompt "Dataflash Size"
-	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default BR2_TARGET_UBOOT_DATAFLASH_SIZE_2_00MB
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
-	bool "Dataflash size is 8 MB"
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB
-	bool "Dataflash size is 4 MB"
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB
-	bool "Dataflash size is 2 MB"
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_1MB
-	bool "Dataflash size is 1 MB"
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB
-	bool "Dataflash size is 0.5 MB"
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB
-	bool "Dataflash size is 0.25 MB"
-
-endchoice
-
-config BR2_TARGET_UBOOT_DATAFLASH_SIZE
-	string
-	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default "8M"	if BR2_TARGET_DATAFLASH_SIZE_8MB
-	default "4M"	if BR2_TARGET_DATAFLASH_SIZE_4MB
-	default "2M"	if BR2_TARGET_DATAFLASH_SIZE_2MB
-	default "1M"	if BR2_TARGET_DATAFLASH_SIZE_1MB
-	default "0.5M"	if BR2_TARGET_DATAFLASH_SIZE_0_50MB
-	default "0.25M"	if BR2_TARGET_DATAFLASH_SIZE_0_25MB
-
-config BR2_TARGET_UBOOT_END_OF_FLASH
-	string
-	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default "C083FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
-	default "C041FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB
-	default "C020FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB
-	default "C0107FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_1MB
-	default "C0083FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB
-	default "C0041FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB
-	help
-
-config BR2_TARGET_UBOOT_KERNEL_START
-	string "Kernel SDRAM address"
-	default "21000000"
-	help
-	  Kernel is loaded to this address in SDRAM
-
-config BR2_TARGET_UBOOT_KERNEL_LOCATION
-	string "Kernel flash address"
-	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
-			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default "C0042000" if BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default ""
-	help
-	  Kernel location in dataflash
-
-config BR2_TARGET_UBOOT_FILESYSTEM_START
-	string
-	default "2114A000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
-	default "2118C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
-  	default "211CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
-  	default "21210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
-  	default "21252000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
-  	default "21294000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
-	help
-	  Kernel is loaded to this SDRAM address
-	  Assumes SDRAM starts at 20000000
-	  Will need to be updated if the SDRAM is located elsewhere
-
-config BR2_TARGET_UBOOT_FILESYSTEM_LOCATION
-	string
-	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
-			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
-	default "C018C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
-  	default "C01CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
-  	default "C0210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
-  	default "C0252000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
-  	default "C0294000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
-  	default "C02D6000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
-	help
-	  Determine location for File System in Dataflash
-	  This needs to be updated for other memory technologies
-
-config BR2_TARGET_UBOOT_FILESYSTEM_SIZE
-	string "File System Size"
-	default "6000000"
-	help
-
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Network Settings"
 	default y
@@ -304,45 +98,4 @@ config BR2_TARGET_UBOOT_ETH1ADDR
 
 endif # BR2_TARGET_UBOOT_NETWORK
 
-endif # BR2_TARGET_UBOOT_DEFAULT_ENV
-
 endif # BR2_TARGET_UBOOT
-
-config BR2_BOOTSOURCE_DATAFLASHCARD
-	bool
-	help
-	  Allow use of a dataflashcard as a boot source
-
-config BR2_BOOTSOURCE_DATAFLASH
-	bool
-	help
-	  Allow use of a dataflash as a boot source
-
-config BR2_BOOTSOURCE_NANDFLASH
-	bool
-	help
-	  Allow use of a NAND flash as a boot source
-
-config BR2_BOOTSOURCE_FLASH
-	bool
-	help
-	  Allow use of a flash RAM as a boot source
-
-config BR2_BOOTSOURCE_SDCARD
-	bool
-	help
-	  Allow use of an SD-card as a boot source
-
-config BR2_BOOTSOURCE_EEPROM
-	bool
-	help
-	  Allow use of a serial eeprom as a boot source
-
-config	BR2_BOOTSOURCE
-	bool
-	default y if BR2_BOOTSOURCE_DATAFLASHCARD
-	default y if BR2_BOOTSOURCE_DATAFLASH
-	default y if BR2_BOOTSOURCE_NANDFLASH
-	default y if BR2_BOOTSOURCE_FLASH
-	default y if BR2_BOOTSOURCE_SDCARD
-	default y if BR2_BOOTSOURCE_EEPROM
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 1f5b216..d21e50a 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -21,21 +21,9 @@ U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 
-U_BOOT_TOOLS:=$(HOST_DIR)/usr/bin/mkimage
-MKIMAGE:=$(U_BOOT_TOOLS)
-U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
+MKIMAGE:=$(HOST_DIR)/usr/bin/mkimage
 
-U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
-
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV)),y)
-U_BOOT_TARGETS += u-boot-autoscript
-endif
-
-TARGET_UBOOT_IPADDR:=$(call qstrip,$(BR2_TARGET_UBOOT_IPADDR))
-TARGET_UBOOT_SERVERIP:=$(call qstrip,$(BR2_TARGET_UBOOT_SERVERIP))
-TARGET_UBOOT_GATEWAY:=$(call qstrip,$(BR2_TARGET_UBOOT_GATEWAY))
-TARGET_UBOOT_NETMASK:=$(call qstrip,$(BR2_TARGET_UBOOT_NETMASK))
-TARGET_UBOOT_ETHADDR:=$(call qstrip,$(BR2_TARGET_UBOOT_ETHADDR))
+U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(MKIMAGE)
 
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
@@ -87,68 +75,38 @@ endif
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
 		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) -C $(U_BOOT_DIR)	\
-		$(UBOOT_BOARD_NAME)_config
+		$(U_BOOT_BOARD_NAME)_config
 	touch $@
 
 $(U_BOOT_DIR)/.header_modified: $(U_BOOT_DIR)/.configured
 	# Modify configuration header in $(U_BOOT_INC_CONF_FILE)
-ifdef BR2_TARGET_UBOOT_DEFAULT_ENV
+ifdef BR2_TARGET_UBOOT_NETWORK
 	@echo >> $(U_BOOT_INC_CONF_FILE)
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	$(call insert_define, DATE, $(DATE))
 	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
-endif # BR2_TARGET_UBOOT_DEFAULT_ENV
-ifdef BR2_TARGET_UBOOT_NETWORK
 ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
 	$(call insert_define, CONFIG_IPADDR, $(BR2_TARGET_UBOOT_IPADDR))
+endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_GATEWAY)),"")
 	$(call insert_define, CONFIG_GATEWAYIP, $(BR2_TARGET_UBOOT_GATEWAY))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_NETMASK)),"")
 	$(call insert_define, CONFIG_NETMASK, $(BR2_TARGET_UBOOT_NETMASK))
 endif
-endif # end BR2_TARGET_U_BOOT_IPADDR
 ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
 	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
 	$(call insert_define, CONFIG_ETHADDR, $(BR2_TARGET_UBOOT_ETHADDR))
 endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),)
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),"")
 	$(call insert_define, CONFIG_ETH1ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
-endif
-endif # BR2_TARGET_UBOOT_NETWORK
-ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
-	$(call insert_define, CONFIG_SILENT_CONSOLE,)
-endif
-ifdef BR2_TARGET_UBOOT_DEFAULT_ENV
-ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_START)),"")
-	$(call insert_define, KERNEL_START, $(BR2_TARGET_UBOOT_KERNEL_START))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_LOCATION)),"")
-	$(call insert_define, KERNEL_LOCATION, $(BR2_TARGET_UBOOT_KERNEL_LOCATION))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_START)),"")
-	$(call insert_define, FILESYSTEM_START, $(BR2_TARGET_UBOOT_FILESYSTEM_START))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION)),"")
-	$(call insert_define, FILESYSTEM_LOCATION, $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE)),"")
-	$(call insert_define, FILESYSTEM_SIZE, $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_END_OF_FLASH)),"")
-	$(call insert_define, END_OF_FLASH, $(BR2_TARGET_UBOOT_END_OF_FLASH))
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_MEMORY_SIZE)),"")
-	$(call insert_define, MEMORY_SIZE, $(BR2_TARGET_UBOOT_MEMORY_SIZE))
-endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
-endif # BR2_TARGET_UBOOT_DEFAULT_ENV
+endif # BR2_TARGET_UBOOT_NETWORK
 	touch $@
 
 $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
@@ -196,11 +154,9 @@ $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 
 u-boot: $(U_BOOT_TARGETS)
 
-u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).img
-
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
-	rm -f $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
+	rm -f $(MKIMAGE) $(U_BOOT_TARGET_TOOLS)
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)
@@ -213,59 +169,6 @@ u-boot-configured: $(U_BOOT_DIR)/.header_modified
 
 #############################################################
 #
-# Generate an autoscript with the configration items
-#
-#############################################################
-
-$(U_BOOT_AUTOSCRIPT): .config
-	rm -f $(U_BOOT_AUTOSCRIPT)
-ifneq ($(TARGET_UBOOT_IPADDR),)
-	echo setenv ipaddr $(TARGET_UBOOT_IPADDR) > $(U_BOOT_AUTOSCRIPT)
-else
-	echo TARGET_UBOOT_IPADDR="$(TARGET_UBOOT_IPADDR)"
-endif
-ifneq ($(TARGET_UBOOT_SERVERIP),)
-	echo setenv serverip $(TARGET_UBOOT_SERVERIP) >> $(U_BOOT_AUTOSCRIPT)
-endif
-ifneq ($(TARGET_UBOOT_GATEWAY),)
-	echo setenv gatewayip $(TARGET_UBOOT_GATEWAY) >> $(U_BOOT_AUTOSCRIPT)
-endif
-ifneq ($(TARGET_UBOOT_NETMASK),)
-	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(U_BOOT_AUTOSCRIPT)
-endif
-	echo setenv linux $(LINUX26_KERNEL_NAME) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv fs-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv rd-1 rootfs.$(ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv rd-2 rootfs.$(ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv ver 1 >> $(U_BOOT_AUTOSCRIPT)
-ifneq ($(TARGET_UBOOT_ETHADDR),)
-	echo setenv ethaddr $(TARGET_UBOOT_ETHADDR) >> $(U_BOOT_AUTOSCRIPT)
-endif
-	echo setenv fstype ram >> $(U_BOOT_AUTOSCRIPT)
-	echo fs >> $(U_BOOT_AUTOSCRIPT)
-	echo os >> $(U_BOOT_AUTOSCRIPT)
-	echo setargs >> $(U_BOOT_AUTOSCRIPT)
-	echo saveenv >> $(U_BOOT_AUTOSCRIPT)
-
-$(U_BOOT_AUTOSCRIPT).img: $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
-	$(MKIMAGE) -A $(ARCH) \
-				-O linux \
-				-T script \
-				-C none \
-				-a 0 \
-				-e 0 \
-				-n "autoscr config" \
-				-d $(U_BOOT_AUTOSCRIPT) \
-				$(U_BOOT_AUTOSCRIPT).img
-
-
-
-#############################################################
-#
 # Toplevel Makefile options
 #
 #############################################################
@@ -273,7 +176,7 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 TARGETS+=u-boot
 
 # we NEED a board name
-ifeq ($(UBOOT_BOARD_NAME),)
+ifeq ($(U_BOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 
-- 
1.7.0.4
