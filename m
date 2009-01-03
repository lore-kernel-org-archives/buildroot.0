From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 00:00:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090103000048.221A2769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 00:00:46 +0000 (Sat, 03 Jan 2009)
New Revision: 24652

Log:
Add Memory configuration to U-Boot build, remove some debugging info

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-02 20:31:44 UTC (rev 24651)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-03 00:00:46 UTC (rev 24652)
@@ -42,8 +42,9 @@
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
- at echo '#define $(strip $(1)) $(2)' >> $(U_BOOT_INC_CONF_FILE)
+ at echo '#define $(strip $(1)) $(strip $(subst ",,$(2)))' >> $(U_BOOT_INC_CONF_FILE)
 endef
+#"))
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(U_BOOT_SITE)/$(U_BOOT_SOURCE)
@@ -80,18 +81,15 @@
 
 $(U_BOOT_DIR)/.header_modified: $(U_BOOT_DIR)/.configured
 	# Modify configuration header in $(U_BOOT_INC_CONF_FILE)
-	
 	@echo >> $(U_BOOT_INC_CONF_FILE)
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
+	$(call insert_define, DATE, $(DATE))	
+	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
 ifneq ($(strip $(BR2_PROJECT)),"")
 	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
 endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
-	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
-endif
-
 ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
 	$(call insert_define, CONFIG_IPADDR, $(BR2_TARGET_UBOOT_IPADDR))
 ifneq ($(strip $(BR2_TARGET_UBOOT_GATEWAY)),"")
@@ -101,22 +99,51 @@
 	$(call insert_define, CONFIG_NETMASK, $(BR2_TARGET_UBOOT_NETMASK))
 endif
 endif # end BR2_TARGET_U_BOOT_IPADDR
-
+ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
+	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
+endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
 	$(call insert_define, CONFIG_ETHADDR, $(BR2_TARGET_UBOOT_ETHADDR))
 endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),)
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),"")
-	$(call insert_define, CONFIG_ETH2ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
+	$(call insert_define, CONFIG_ETH1ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),)
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
 	$(call insert_define, CONFIG_BOOTARGS, $(BR2_TARGET_UBOOT_BOOTARGS))
 endif
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),)
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
 	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
 endif
+endif
 ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
 	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_START)),"")
+	$(call insert_define, KERNEL_START, $(BR2_TARGET_UBOOT_KERNEL_START))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_LOCATION)),"")
+	$(call insert_define, KERNEL_LOCATION, $(BR2_TARGET_UBOOT_KERNEL_LOCATION))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_START)),"")
+	$(call insert_define, FILESYSTEM_START, $(BR2_TARGET_UBOOT_FILESYSTEM_START))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION)),"")
+	$(call insert_define, FILESYSTEM_LOCATION, $(BR2_TARGET_UBOOT_FILESYSTEM_LOCATION))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE)),"")
+	$(call insert_define, FILESYSTEM_SIZE, $(BR2_TARGET_UBOOT_FILESYSTEM_SIZE))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_END_OF_FLASH)),"")
+	$(call insert_define, END_OF_FLASH, $(BR2_TARGET_UBOOT_END_OF_FLASH))
+endif
+ifneq ($(strip $(BR2_TARGET_UBOOT_MEMORY_SIZE)),"")
+	$(call insert_define, MEMORY_SIZE, $(BR2_TARGET_UBOOT_MEMORY_SIZE))
+endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
 	touch $@
 
@@ -162,6 +189,10 @@
 
 u-boot-source: $(DL_DIR)/$(U_BOOT_SOURCE)
 
+u-boot-unpacked: $(U_BOOT_DIR)/.patched
+
+u-boot-configured: $(U_BOOT_DIR)/.header_modified
+
 #############################################################
 #
 # Toplevel Makefile options
@@ -186,13 +217,6 @@
 	@echo BR2_TARGET_UBOOT_BOOTARGS = $(BR2_TARGET_UBOOT_BOOTARGS)
 	@echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
 	@echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
-	@echo BR2_BOOTSOURCE=$(BR2_BOOTSOURCE)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD=$(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH=$(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH=$(BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_FLASH=$(BR2_TARGET_UBOOT_BOOTSOURCE_FLASH)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD=$(BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD)
-	@echo BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM=$(BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM)
 	@echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
 	@echo TEST=$(TEST)
 	@exit 0
