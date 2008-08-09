From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 9 Aug 2008 14:04:38 +0200
Subject: [Buildroot] [PATCH] u-boot: cleanup
Message-ID: <200808091404.38249.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

u-boot: cleanup

* remove unused BR2 variables
* add BR2 variables from Config.in to target "u-boot-status"
* fix typos
---
 target/u-boot/Makefile.in |   22 +++++++---------------
 1 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 9148e05..9d400e5 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -14,11 +14,7 @@ U_BOOT_TOOLS_BIN:=mkimage
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 
-ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
-U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
-else
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
-endif
 
 U_BOOT_TARGET_TOOLS:=
 ifeq ($(strip $(BR2_TARGET_UBOOT_TOOL_MKIMAGE)),y)
@@ -56,13 +52,7 @@ ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 endif
 	touch $@
 
-$(U_BOOT_DIR)/.header_copied: $(U_BOOT_DIR)/.patched
-ifneq ($(strip $(BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE)),)
-	cp -dpf $(BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE) $(U_BOOT_INC_CONF_FILE)
-endif
-	touch $@
-
-$(U_BOOT_DIR)/.configured: $(U_BOOT_DIR)/.header_copied
+$(U_BOOT_DIR)/.configured: $(U_BOOT_DIR)/.patched
 	$(TARGET_CONFIGURE_OPTS)		\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
@@ -92,7 +82,7 @@ endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_NETMASK)),"")
 	$(call insert_define, "CONFIG_NETMASK", $(BR2_TARGET_UBOOT_NETMASK))
 endif
-endif # end BR2_TARGET_U_BOOT_IPADDR
+endif # end BR2_TARGET_UBOOT_IPADDR
 
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
 	$(call insert_define, "CONFIG_ETHADDR", $(BR2_TARGET_UBOOT_ETHADDR))
@@ -161,16 +151,18 @@ u-boot-status:
 	@echo
 	@echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
 	@echo
-	@echo BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE = $(BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE)
-	@echo BR2_TARGET_U_BOOT_CONFIG_BOARD = $(BR2_TARGET_U_BOOT_CONFIG_BOARD)
+	@echo BR2_TARGET_UBOOT_BOARDNAME = $(BR2_TARGET_UBOOT_BOARDNAME)
+	@echo BR2_TARGET_UBOOT_CUSTOM_PATCH = $(BR2_TARGET_UBOOT_CUSTOM_PATCH)
 	@echo BR2_TARGET_UBOOT_SERVERIP = $(BR2_TARGET_UBOOT_SERVERIP)
 	@echo BR2_TARGET_UBOOT_IPADDR = $(BR2_TARGET_UBOOT_IPADDR)
 	@echo BR2_TARGET_UBOOT_GATEWAY = $(BR2_TARGET_UBOOT_GATEWAY)
 	@echo BR2_TARGET_UBOOT_NETMASK = $(BR2_TARGET_UBOOT_NETMASK)
-	@echo BR2_TARGET_UBOOT_ETH0ADDR = $(BR2_TARGET_UBOOT_ETHADDR)
+	@echo BR2_TARGET_UBOOT_ETHADDR = $(BR2_TARGET_UBOOT_ETHADDR)
 	@echo BR2_TARGET_UBOOT_ETH1ADDR = $(BR2_TARGET_UBOOT_ETH1ADDR)
 	@echo BR2_TARGET_UBOOT_BOOTARGS = $(BR2_TARGET_UBOOT_BOOTARGS)
 	@echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
 	@echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
+	@echo BR2_TARGET_UBOOT_TOOL_MKIMAGE = $(BR2_TARGET_UBOOT_TOOL_MKIMAGE)
+	@echo BR2_TARGET_UBOOT_TOOL_ENV = $(BR2_TARGET_UBOOT_TOOL_ENV)
 	@echo
 	@exit 0
