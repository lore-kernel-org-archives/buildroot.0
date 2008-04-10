From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Apr 2008 14:03:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20080410210327.E728B3C5B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-10 14:03:27 -0700 (Thu, 10 Apr 2008)
New Revision: 21695

Log:
Avoid hardwiring tftpboot

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-04-10 21:02:12 UTC (rev 21694)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-04-10 21:03:27 UTC (rev 21695)
@@ -95,18 +95,18 @@
 		CONFIG_NOSOFTFLOAT=1 \
 		TOPDIR=$(UBOOT_DIR) \
 		SRCTREE=$(UBOOT_DIR) \
-		TFTPBOOT=/tftpboot \
+		TFTPBOOT=$(TARGET_ATMEL_COPYTO) \
 		-C $(UBOOT_DIR)
 
 $(BINARIES_DIR)/$(UBOOT_BIN): $(UBOOT_BUILD_DIR)/u-boot.bin
 	mkdir -p $(BINARIES_DIR)
 	cp $(UBOOT_BUILD_DIR)/u-boot.bin $(BINARIES_DIR)/$(UBOOT_BIN)
 
-/tftpboot/$(UBOOT_BIN): $(UBOOT_BUILD_DIR)/u-boot.bin
-	mkdir -p /tftpboot
-	cp $(UBOOT_BUILD_DIR)/u-boot.bin /tftpboot/$(UBOOT_BIN)
+$(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN): $(UBOOT_BUILD_DIR)/u-boot.bin
+	mkdir -p $(TARGET_ATMEL_COPYTO)
+	cp $(UBOOT_BUILD_DIR)/u-boot.bin $(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN)
 
-uboot-bin: $(BINARIES_DIR)/$(UBOOT_BIN) /tftpboot/$(UBOOT_BIN)
+uboot-bin: $(BINARIES_DIR)/$(UBOOT_BIN) $(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN)
 
 $(UBOOT_CUSTOM).test: .config $(UBOOT_BUILD_DIR)/.configured
 	echo "/* Automatically generated file, do not edit */" \
@@ -175,7 +175,7 @@
 				-n "autoscr config" \
 				-d $(UBOOT_SCR) \
 				$(UBOOT_SCR).$(PROJECT)
-	cp $(UBOOT_SCR).$(PROJECT) /tftpboot
+	cp $(UBOOT_SCR).$(PROJECT) $(TARGET_ATMEL_COPYTO)
 
 $(MKIMAGE): $(MKIMAGE_BINLOC)
 	cp -f $(MKIMAGE_BINLOC) $(MKIMAGE)
@@ -200,7 +200,7 @@
 	rm -fr $(UBOOT_BUILD_DIR)/u-boot
 	rm -fr $(UBOOT_BUILD_DIR)/u-boot.gz
 	rm -fr $(UBOOT_BUILD_DIR)/u-boot.bin
-	rm -fr /tftpboot/$(UBOOT_BIN)
+	rm -fr $(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN)
 	rm -fr $(BINARIES_DIR)/$(UBOOT_BIN)
 
 .PHONY: uboot-bin
@@ -270,8 +270,8 @@
 	- at ls $(UBOOT_BUILD_DIR)/u-boot.bin
 	- at echo binaries-u-boot.bin=$(BINARIES_DIR)/$(UBOOT_BIN)
 	- at ls $(BINARIES_DIR)/$(UBOOT_BIN)
-	- at echo tftpboot=/tftpboot/$(UBOOT_BIN)
-	- at ls /tftpboot/$(UBOOT_BIN)
+	- at echo tftpboot=$(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN)
+	- at ls $(TARGET_ATMEL_COPYTO)/$(UBOOT_BIN)
 	- at echo "mkimage = $(MKIMAGE)"
 	- at ls $(MKIMAGE)
 	- at echo "u-boot script=$(UBOOT_SCR).$(PROJECT)"
