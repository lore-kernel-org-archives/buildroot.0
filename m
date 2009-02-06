From: correa at uclibc.org <correa@uclibc.org>
Date: Fri,  6 Feb 2009 17:38:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: linux u-boot
Message-ID: <20090206173806.E00E77669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-02-06 17:38:05 +0000 (Fri, 06 Feb 2009)
New Revision: 25258

Log:
Simplify kernel naming scheme. Only use kernel name plus the rootfs suffix if one is provided

Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2009-02-06 01:57:15 UTC (rev 25257)
+++ trunk/buildroot/target/linux/Makefile.in	2009-02-06 17:38:05 UTC (rev 25258)
@@ -67,9 +67,11 @@
 endif
 endif
 
+ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
+#"))
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL
-LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
+LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
 endif
 
 # Version of Linux AFTER patches
@@ -78,7 +80,7 @@
 # for packages that need it
 LINUX_VERSION:=$(LINUX26_VERSION)
 LINUX_DIR=$(LINUX26_DIR)
-LINUX_KERNEL=$(LINUX26_KERNEL)
+LINUX_KERNEL=$(LINUX26_KERNEL_NAME)
 
 # kernel patches
 ifeq ($(strip $(LINUX26_PATCH_DIR)),)
@@ -192,11 +194,11 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
-$(LINUX26_KERNEL): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
+$(LINUX26_KERNEL_NAME): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
-	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
+	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL_NAME)
 	touch -c $@
 
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
@@ -227,7 +229,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: $(LINUX26_KERNEL)
+linux26: $(LINUX26_KERNEL_NAME)
 
 $(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 	touch $@
@@ -249,7 +251,7 @@
 
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
-	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
+	rm -f $(LINUX26_KERNEL_NAME) $(LINUX26_DIR)/.configured
 	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
 
 linux26-dirclean:

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-06 01:57:15 UTC (rev 25257)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-06 17:38:05 UTC (rev 25258)
@@ -138,7 +138,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=
 endif
 
 # --------------
@@ -149,7 +148,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=.gz
 endif
 
 # --------------
@@ -158,7 +156,6 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
-KERNEL_EXT:=.z
 endif
 
 # --------------
@@ -167,14 +164,13 @@
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
 endif
-KERNEL_EXT:=.bz
 endif
 
 ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
 #"))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)$(ROOTFS_STRIPPED_SUFFIX)$(KERNEL_EXT)
+LINUX26_KERNEL_NAME:=$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
 
 
 ifeq ($(BOARD_NAME),)
@@ -182,7 +178,7 @@
 endif
 
 ifndef LINUX26_KERNEL
-LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+LINUX26_KERNEL:=$(BINARIES_DIR)/$(LINUX26_KERNEL_NAME)
 endif
 
 # for packages that need it

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-02-06 01:57:15 UTC (rev 25257)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-02-06 17:38:05 UTC (rev 25258)
@@ -243,7 +243,7 @@
 ifneq ($(TARGET_UBOOT_NETMASK),)
 	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(U_BOOT_AUTOSCRIPT)
 endif
-	echo setenv linux $(LINUX26_KERNEL_NAME).gz >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv linux $(LINUX26_KERNEL_NAME) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
