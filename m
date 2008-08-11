From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 11 Aug 2008 22:09:36 +0200
Subject: [Buildroot] [PATCH] u-boot: fix wrong syntax in Makefile
In-Reply-To: <200808091403.44855.markus.heidelberg@web.de>
References: <200808091403.44855.markus.heidelberg@web.de>
Message-ID: <200808112209.36552.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

today I've noticed, that the previous patch has some issues. There are no ""
around the value of CONFIG_BOOTARGS and the make run may stop with an error
when echoing CONFIG_BOOTCOMMAND into U-Boots config.h. This time I have tested
it with different configurations, on Friday the time was short.


u-boot: fix broken insert_define in Makefile

---
 target/u-boot/Makefile.in |   25 +++++++++++++------------
 1 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index d7af24c..d63bea5 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -31,10 +31,11 @@ endif
 
 # Define a helper function
 define insert_define
+ at echo "" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#undef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
 @echo "#endif" >> $(U_BOOT_INC_CONF_FILE)
- at echo "#define $(strip $(1)) $(2)" >> $(U_BOOT_INC_CONF_FILE)
+ at echo '#define $(strip $(1)) $(2)' >> $(U_BOOT_INC_CONF_FILE)
 endef
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
@@ -78,36 +79,36 @@ $(U_BOOT_DIR)/.header_modified: $(U_BOOT_DIR)/.configured
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
-	$(call insert_define "CONFIG_ETH2ADDR", $(BR2_TARGET_UBOOT_ETH1ADDR))
+	$(call insert_define, CONFIG_ETH2ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
-	$(call insert_define "CONFIG_BOOTARGS", $(BR2_TARGET_UBOOT_BOOTARGS))
+	$(call insert_define, CONFIG_BOOTARGS, $(BR2_TARGET_UBOOT_BOOTARGS))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
-	$(call insert_define "CONFIG_BOOTCOMMAND", $(BR2_TARGET_UBOOT_BOOTCMD))
+	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
 endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_SILENT)),"")
-	$(call insert_define "CONFIG_SILENT_CONSOLE", "")
+ifeq ($(strip $(BR2_TARGET_UBOOT_SILENT)),y)
+	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
 	touch $@
-- 
1.5.6.4
