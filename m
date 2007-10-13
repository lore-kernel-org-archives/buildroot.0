From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:07:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20071013230705.2716EA4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:07:04 -0700 (Sat, 13 Oct 2007)
New Revision: 20244

Log:
Use correct kernel name for advanced linux build

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-13 18:37:24 UTC (rev 20243)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-13 23:07:04 UTC (rev 20244)
@@ -147,7 +147,7 @@
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
 
 ifndef LINUX26_KERNEL
 LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
@@ -212,9 +212,10 @@
 LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
 endif
 
-ifneq ($(BR2_LINUX_COPYTO),)
+ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
 LINUX_COPYTO:=$(strip $(subst ",,$(BR2_LINUX_COPYTO)))
 #"))
+#"))
 LINUX26_TARGETS+=$(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 endif
 
@@ -359,7 +360,7 @@
 	mkdir -p $(TARGET_DIR)/boot
 	cp -dpf $(LINUX26_DIR)/.config $(TARGET_DIR)/boot/linux-$(LINUX26_VERSION).config
 
-$(TARGET_DIR)/boot/uclibc.config: .$(UCLIBC_DIR)/.config
+$(TARGET_DIR)/boot/uclibc.config: $(UCLIBC_DIR)/.config
 	mkdir -p $(TARGET_DIR)/boot
 	cp -dpf $(UCLIBC_DIR)/.config $(TARGET_DIR)/boot/uclibc.config
 
@@ -367,13 +368,13 @@
 	mkdir -p $(TARGET_DIR)/boot
 	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
 
-/tftpboot/$(LINUX_KERNEL_NAME): $(LINUX26_KERNEL)
+/tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p /tftpboot
-	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX_KERNEL_NAME)
+	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
 
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)
-	cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX_KERNEL_NAME)
+	cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 
 linux26: $(LINUX26_TARGETS)
 
@@ -408,6 +409,7 @@
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
 	@echo LINUX26_DIR=$(LINUX26_DIR)
 	@echo TARGETS=$(TARGETS)
+	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_HEADERS_PATCH_DIR=$(LINUX26_HEADERS_PATCH_DIR)
 	@echo LINUX26_BINLOC=$(LINUX26_BINLOC)
 	@echo LINUX26_FORMAT=$(LINUX26_FORMAT)
@@ -426,6 +428,7 @@
 	@echo BR2_LINUX_COPYTO_ROOTFS=$(BR2_LINUX_COPYTO_ROOTFS)
 	@echo BR2_LINUX_COPYTO_TFTPBOOT=$(BR2_LINUX_COPYTO_TFTPBOOT=)
 	@echo BR2_LINUX_COPYTO=$(BR2_LINUX_COPYTO)
+	@echo LINUX_COPYTO=$(LINUX_COPYTO)
 	@echo BR2_KERNEL_MINORLEVEL=$(BR2_KERNEL_MINORLEVEL)
 	@echo LINUX26_LATEST_RC_PATCH=$(LINUX26_LATEST_RC_PATCH)
 	@echo BR2_KERNEL_RC_LEVEL=$(BR2_KERNEL_RC_LEVEL)
