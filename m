From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Apr 2008 14:05:33 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20080410210533.496AC3C5B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-10 14:05:30 -0700 (Thu, 10 Apr 2008)
New Revision: 21696

Log:
Add configuration items to at91bootstrap

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-04-10 21:03:27 UTC (rev 21695)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-04-10 21:05:30 UTC (rev 21696)
@@ -1,5 +1,5 @@
 config BR2_TARGET_AT91BOOTSTRAP
-	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || \
+	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9260PF || \
 	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK
 	bool "Build AT91 Bootstrap for selected chip"
 
@@ -26,8 +26,8 @@
 	bool "NAND Flash"
 
 config BR2_TARGET_AT91BOOT_FLASH
-        depends on BR2_TARGET_AT91SAM9XEEK
-	bool "Internal Flash"
+        depends on BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9260PF
+	bool "Internal Flash or external parallel flash"
 
 endchoice
 
@@ -37,3 +37,47 @@
 	default	"dataflashcard"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
 	default	"flash"		if	BR2_TARGET_AT91BOOT_FLASH
+
+config	BR2_AT91BOOTSTRAP_IMG_SIZE
+	string	"Image Size to copy to SDRAM"
+	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH || BR2_TARGET_AT91BOOT_DATAFLASHCARD
+	default	"0x30000"	if	BR2_TARGET_AT91BOOT_NANDFLASH
+	default	"0x100000"	if	BR2_TARGET_AT91BOOT_FLASH
+	depends BR2_TARGET_AT91BOOTSTRAP
+	help
+	  Select the size of your application
+	  AT91 Bootstrap will copy this amount from flash to SDRAM
+
+choice	
+	prompt "Start address of application"
+	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	depends on BR2_TARGET_AT91BOOTSTRAP
+	help
+	  Select Chip for which AT91 bootstrap should be built
+	  Currently supports AT91SAM9260EK, AT91SAM9261EK, AT91SAM9XEEK, AT91SAM9263EK
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	bool "Copy to the default U-Boot start location in the SDRAM"
+	help
+	  This is where you copy the U-Boot boot loader
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
+	bool "Copy to the last Megabyte of the SDRAM"
+	help
+	  This is where you copy a boot loader
+
+config	BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
+	bool "Copy to the start of the SDRAM"
+	help
+	  This is where you copy a standalone application
+endchoice
+
+config	BR2_AT91BOOTSTRAP_JUMP_ADDR
+	string
+	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
+	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM	
+	default "0x20000000" if BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
+	depends on BR2_TARGET_AT91BOOTSTRAP
+
+comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
+

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-04-10 21:03:27 UTC (rev 21695)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-04-10 21:05:30 UTC (rev 21696)
@@ -4,59 +4,83 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION:=2.3
+AT91BOOTSTRAP_PATCH_LEVEL:=4
+AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION).$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
-AT91BOOTSTRAP:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP)))
-AT91BOOTSTRAP_ZCAT:=bzcat
+AT91BOOTSTRAP:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP)))
+#"))
+AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
-AT91BOOTSTRAP_MEMORY:=$(strip  $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
+AT91BOOTSTRAP_MEMORY:=$(strip $(subst ",, $(BR2_TARGET_AT91BOOTSTRAP_MEMORY)))
+#"))
 
+AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_PATCHED_VERSION).bin
 
-AT91BOOTSTRAP_BINARY:=$(BOARD_NAME)-$(AT91BOOTSTRAP_MEMORY)boot-$(AT91BOOTSTRAP_VERSION).bin
-
 AT91BOOTSTRAP_TARGET:=$(AT91BOOTSTRAP_DIR)/binaries/$(AT91BOOTSTRAP_BINARY)
 
+AT91BOOTSTRAP_JUMP_ADDR:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_JUMP_ADDR)))
+#"))
+AT91BOOTSTRAP_IMG_SIZE:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP_IMG_SIZE)))
+#"))
+
+AT91_CUSTOM_FLAGS:=
+ifneq ($(AT91BOOTSTRAP_JUMP_ADDR),)
+AT91_CUSTOM_FLAGS+=-DJUMP_ADDR=$(AT91BOOTSTRAP_JUMP_ADDR)
+endif
+ifneq ($(AT91BOOTSTRAP_IMG_SIZE),)
+AT91_CUSTOM_FLAGS+=-DIMG_SIZE=$(AT91BOOTSTRAP_IMG_SIZE)
+endif
+
 $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT91BOOTSTRAP_SITE)/$(AT91BOOTSTRAP_SOURCE)
 
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(PROJECT_BUILD_DIR)
 	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config
-	$(MAKE)					\
-		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
-		CROSS_COMPILE=$(TARGET_CROSS)	\
-		-C $(AT91BOOTSTRAP_DIR)		\
+	$(MAKE) \
+		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		-C $(AT91BOOTSTRAP_DIR) \
 		$(BOARD_NAME)_defconfig
-	touch	$(AT91BOOTSTRAP_DIR)/.configured
+	touch $(AT91BOOTSTRAP_DIR)/.configured
 
 $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
-	$(MAKE)					\
-		MEMORY=$(AT91BOOTSTRAP_MEMORY)	\
-		CROSS_COMPILE=$(TARGET_CROSS)	\
+	$(MAKE) \
+		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
 		-C $(AT91BOOTSTRAP_DIR)
 
+$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY): $(AT91BOOTSTRAP_TARGET)
+	mkdir -p $(BINARIES_DIR)
+	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+	cp $(AT91BOOTSTRAP_TARGET) /tftpboot/$(AT91BOOTSTRAP_BINARY)
+
+.PHONY: at91bootstrap at91bootstrap-source
+
+at91bootstrap: $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
+
 at91bootstrap-source: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 
+at91bootstrap-unpacked: $(AT91BOOTSTRAP_DIR)/.unpacked
+
+.PHONY: at91bootstrap-clean at91bootstrap-dirclean
+
 at91bootstrap-clean:
 	make -C $(AT91BOOTSTRAP_DIR) clean
 
 at91bootstrap-dirclean:
 	rm -rf $(AT91BOOTSTRAP_DIR)
 
-at91bootstrap:	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-
-$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY):	$(AT91BOOTSTRAP_TARGET)
-	mkdir -p $(BINARIES_DIR)
-	cp $(AT91BOOTSTRAP_TARGET)	$(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	cp $(AT91BOOTSTRAP_TARGET)	/tftpboot/$(AT91BOOTSTRAP_BINARY)
-
-.PHONY:	at91bootstrap
 #############################################################
 #
 # Toplevel Makefile options
