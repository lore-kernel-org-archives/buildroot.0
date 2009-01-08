From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  8 Jan 2009 22:58:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090108225832.382AD77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-08 22:58:30 +0000 (Thu, 08 Jan 2009)
New Revision: 24727

Log:
Linux26 requires "mkimage" from u-boot to be in the PATH
if an uImage is to be built for arm, avr32, blackfin and sh.

PATH has therefore been set to have $(STAGING_DIR)/usr/bin
as the first item allowing linux to find mkimage.

This patch will, if an uImage is built, create a "u-boot-to?\195?\179ls"
directory in the PROJECT_BUILD_DIR directory.
$(STAGING_DIR)/usr/bin/mkimage is copied to this directory
and the PATH variable will now include "u-boot-tools"

If an uImage is built, then the linux build will now depend on "u-boot".



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-08 22:11:33 UTC (rev 24726)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-08 22:58:30 UTC (rev 24727)
@@ -126,6 +126,9 @@
 # -----------------------------------------------------------------------------
 # Has to be set by the target/device
 
+LINUX26_MKIMAGE_DIR:=
+LINUX26_MKIMAGE_DEP:=
+
 # --------------
 # VMLINUX
 ifeq ($(LINUX26_FORMAT),vmlinux)
@@ -138,6 +141,8 @@
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
+LINUX26_MKIMAGE_DIR:=$(PROJECT_BUILD_DIR)/u-boot-tools
+LINUX26_MKIMAGE_DEP:=linux26-mkimage
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
@@ -191,7 +196,7 @@
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LZMA="$(LZMA)" \
-	PATH=$(STAGING_DIR)/usr/bin:$(PATH)
+	PATH=$(LINUX26_MKIMAGE_DIR):$(PATH)
 
 # =============================================================================
 # ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
@@ -380,7 +385,7 @@
 	touch $@
 
 # -----------------------------------------------------------------------------
-$(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured
+$(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured $(LINUX26_MKIMAGE_DEP)
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
@@ -446,10 +451,16 @@
 	-mkdir -p /tftpboot
 	-cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
 
+ifneq ($(LINUX_COPYTO),/tftpboot)
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)
 	cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
+endif
 
+linux26-mkimage:	u-boot
+	mkdir -p $(LINUX26_MKIMAGE_DIR)
+	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
+
 linux26: $(LINUX26_TARGETS)
 
 linux26-modules: cross-depmod26 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
