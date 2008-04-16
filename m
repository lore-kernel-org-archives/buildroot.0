From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 16 Apr 2008 15:45:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel linux
Message-ID: <20080416224548.D5D8F3C617@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-16 15:45:47 -0700 (Wed, 16 Apr 2008)
New Revision: 21747

Log:
Fix bad linux kernel name

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2008-04-16 15:01:48 UTC (rev 21746)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2008-04-16 22:45:47 UTC (rev 21747)
@@ -37,7 +37,7 @@
 # This should be part of target/linux/Makefile.in
 LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
 
-LINUX26_BINLOC=$(LINUX26_FORMAT)
+#LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
 ifeq ($(strip $(BR2_avr32)),y)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/images/$(BR2_PACKAGE_LINUX_FORMAT)

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-16 15:01:48 UTC (rev 21746)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-16 22:45:47 UTC (rev 21747)
@@ -134,11 +134,7 @@
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
-ifeq ($(BR2_avr32),y)
-LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_FORMAT)
-else
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
-endif
 KERNEL_EXT:=.gz
 endif
 
@@ -153,29 +149,16 @@
 # BZIMAGE
 ifeq ($(LINUX26_FORMAT),bzImage)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
-KERNEL_EXT:=
+KERNEL_EXT:=.bz
 endif
 
 endif
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-ifeq ($(LINUX26_FORMAT),uImage)
-LINUX26_KERNEL_NAME:="uImage"
-endif
-ifeq ($(LINUX26_FORMAT),bzImage)
-LINUX26_KERNEL_NAME:="bzImage"
-endif
-ifeq ($(LINUX26_FORMAT),vmlinux)
-LINUX26_KERNEL_NAME:="vmlinux"
-endif
-ifeq ($(LINUX26_FORMAT),zImage)
-LINUX26_KERNEL_NAME:="zImage"
-endif
-ifeq ($(LINUX26_FORMAT),custom)
 LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
-endif
 
+
 ifeq ($(BOARD_NAME),)
 BOARD_NAME=$(ARCH)
 endif
@@ -387,10 +370,12 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
-$(LINUX26_KERNEL): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
+$(LINUX26_DIR)/$(LINUX26_BINLOC): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
+
+$(LINUX26_KERNEL): $(LINUX26_DIR)/$(LINUX26_BINLOC)
 	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
