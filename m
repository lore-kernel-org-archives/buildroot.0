From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 15:19:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090210151958.406E476275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 15:19:57 +0000 (Tue, 10 Feb 2009)
New Revision: 25293

Log:
u-boot: don't touch config.h unless explicitly requested by user

Fixes the problem of important variables like serverip being overwritten
with empty strings if the network/default env stuff isn't used.

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-02-10 15:19:31 UTC (rev 25292)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-02-10 15:19:57 UTC (rev 25293)
@@ -105,15 +105,18 @@
 
 $(U_BOOT_DIR)/.header_modified: $(U_BOOT_DIR)/.configured
 	# Modify configuration header in $(U_BOOT_INC_CONF_FILE)
+ifdef BR2_TARGET_UBOOT_DEFAULT_ENV
 	@echo >> $(U_BOOT_INC_CONF_FILE)
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
-	$(call insert_define, DATE, $(DATE))	
+	$(call insert_define, DATE, $(DATE))
 	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
 ifneq ($(strip $(BR2_PROJECT)),"")
 	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
 endif
+endif # BR2_TARGET_UBOOT_DEFAULT_ENV
+ifdef BR2_TARGET_UBOOT_NETWORK
 ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
 	$(call insert_define, CONFIG_IPADDR, $(BR2_TARGET_UBOOT_IPADDR))
 ifneq ($(strip $(BR2_TARGET_UBOOT_GATEWAY)),"")
@@ -134,9 +137,11 @@
 	$(call insert_define, CONFIG_ETH1ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
 endif
+endif # BR2_TARGET_UBOOT_NETWORK
 ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
 	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
+ifdef BR2_TARGET_UBOOT_DEFAULT_ENV
 ifneq ($(strip $(BR2_TARGET_UBOOT_KERNEL_START)),"")
 	$(call insert_define, KERNEL_START, $(BR2_TARGET_UBOOT_KERNEL_START))
 endif
@@ -159,6 +164,7 @@
 	$(call insert_define, MEMORY_SIZE, $(BR2_TARGET_UBOOT_MEMORY_SIZE))
 endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
+endif # BR2_TARGET_UBOOT_DEFAULT_ENV
 	touch $@
 
 $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
