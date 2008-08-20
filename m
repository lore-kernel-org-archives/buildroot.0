From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 13:04:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080820200415.30A773C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 13:04:14 -0700 (Wed, 20 Aug 2008)
New Revision: 23122

Log:
u-boot: fix broken insert_define in Makefile

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 20:04:11 UTC (rev 23121)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 20:04:14 UTC (rev 23122)
@@ -34,7 +34,7 @@
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
- at echo "#define $(strip $(1)) $(2)" >> $(U_BOOT_INC_CONF_FILE)
+ at echo '#define $(strip $(1)) $(2)' >> $(U_BOOT_INC_CONF_FILE)
 endef
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
@@ -78,36 +78,36 @@
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 ifneq ($(strip $(BR2_PROJECT)),"")
-	$(call insert_define, "CONFIG_HOSTNAME", $(BR2_PROJECT))
+	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_SERVERIP)),"")
-	$(call insert_define, "CONFIG_SERVERIP", $(BR2_TARGET_UBOOT_SERVERIP))
+	$(call insert_define, CONFIG_SERVERIP, $(BR2_TARGET_UBOOT_SERVERIP))
 endif
 
 ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
-	$(call insert_define, "CONFIG_IPADDR", $(BR2_TARGET_UBOOT_IPADDR))
+	$(call insert_define, CONFIG_IPADDR, $(BR2_TARGET_UBOOT_IPADDR))
 ifneq ($(strip $(BR2_TARGET_UBOOT_GATEWAY)),"")
-	$(call insert_define, "CONFIG_GATEWAYIP", $(BR2_TARGET_UBOOT_GATEWAY))
+	$(call insert_define, CONFIG_GATEWAYIP, $(BR2_TARGET_UBOOT_GATEWAY))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_NETMASK)),"")
-	$(call insert_define, "CONFIG_NETMASK", $(BR2_TARGET_UBOOT_NETMASK))
+	$(call insert_define, CONFIG_NETMASK, $(BR2_TARGET_UBOOT_NETMASK))
 endif
 endif # end BR2_TARGET_U_BOOT_IPADDR
 
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
-	$(call insert_define, "CONFIG_ETHADDR", $(BR2_TARGET_UBOOT_ETHADDR))
+	$(call insert_define, CONFIG_ETHADDR, $(BR2_TARGET_UBOOT_ETHADDR))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),"")
-	$(call insert_define, "CONFIG_ETH2ADDR", $(BR2_TARGET_UBOOT_ETH1ADDR))
+	$(call insert_define, CONFIG_ETH2ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
-	$(call insert_define, "CONFIG_BOOTARGS", $(BR2_TARGET_UBOOT_BOOTARGS))
+	$(call insert_define, CONFIG_BOOTARGS, $(BR2_TARGET_UBOOT_BOOTARGS))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
-	$(call insert_define, "CONFIG_BOOTCOMMAND", $(BR2_TARGET_UBOOT_BOOTCMD))
+	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
 endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_SILENT)),"")
-	$(call insert_define, "CONFIG_SILENT_CONSOLE", "")
+ifeq ($(strip $(BR2_TARGET_UBOOT_SILENT)),y)
+	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
 	touch $@
