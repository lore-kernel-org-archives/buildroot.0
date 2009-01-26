From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 14:49:00 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090126144901.35735768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 14:49:00 +0000 (Mon, 26 Jan 2009)
New Revision: 25051

Log:
u-boot: clean up after Ulf

As discussed on the list.

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 14:04:10 UTC (rev 25050)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 14:49:00 UTC (rev 25051)
@@ -47,11 +47,7 @@
 #"))
 endif
 
-ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
-U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
-else
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
-endif
 
 U_BOOT_TARGET_TOOLS:=
 ifeq ($(BR2_TARGET_UBOOT_TOOL_MKIMAGE),y)
@@ -99,13 +95,7 @@
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
@@ -297,8 +287,6 @@
 	@echo
 	@echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
 	@echo BR2_UBOOT_VERSION = $(BR2_UBOOT_VERSION)
-	@echo BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE = $(BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE)
-	@echo BR2_TARGET_U_BOOT_CONFIG_BOARD = $(BR2_TARGET_U_BOOT_CONFIG_BOARD)
 	@echo BR2_TARGET_UBOOT_SERVERIP = $(BR2_TARGET_UBOOT_SERVERIP)
 	@echo BR2_TARGET_UBOOT_IPADDR = $(BR2_TARGET_UBOOT_IPADDR)
 	@echo BR2_TARGET_UBOOT_GATEWAY = $(BR2_TARGET_UBOOT_GATEWAY)
@@ -309,6 +297,5 @@
 	@echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
 	@echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
 	@echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
-	@echo TEST=$(TEST)
 	@exit 0
 
