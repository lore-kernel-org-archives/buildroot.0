From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 21:48:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090125214834.783FA76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 21:48:33 +0000 (Sun, 25 Jan 2009)
New Revision: 25024

Log:

Use new SHELL variable BUILDROOT_KERNEL_CONFIG_METHOD
which will override selection between xconfig and menuconfig

make xconfig will, if it fails, or user does not save configuration
result in make menuconfig beeing tried

Fix several issues causing final part of linux to be regenerated
on each make.
 


Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 21:01:33 UTC (rev 25023)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 21:48:33 UTC (rev 25024)
@@ -406,7 +406,7 @@
 
 choice
 	prompt "Preferred config tool"
-	default BR2_MAKE_MENUCONFIG
+	default BR2_MAKE_XCONFIG
 	depends on BR2_PACKAGE_LINUX_USE_XCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 21:01:33 UTC (rev 25023)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 21:48:33 UTC (rev 25024)
@@ -109,12 +109,17 @@
 endif
 endif
 
+# Override config method with shell variable
+ifneq ($(BUILDROOT_KERNEL_CONFIG_METHOD),)
+KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BUILDROOT_KERNEL_CONFIG_METHOD)))
+#"))
+else
 KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
 #"))
 ifeq ($(KERNEL_CONFIG_METHOD),)
-KERNEL_CONFIG_METHOD:=menuconfig
+KERNEL_CONFIG_METHOD:=xconfig
 endif
-
+endif
 # -----------------------------------------------------------------------------
 ifndef LINUX26_FORMAT
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
@@ -145,7 +150,7 @@
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
 LINUX26_MKIMAGE_DIR:=$(PROJECT_BUILD_DIR)/u-boot-tools
-LINUX26_MKIMAGE_DEP:=linux26-mkimage
+LINUX26_MKIMAGE_DEP:=$(LINUX26_MKIMAGE_DIR)/mkimage
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
@@ -170,10 +175,11 @@
 KERNEL_EXT:=.bz
 endif
 
-
+ROOTFS_STRIPPED_SUFFIX=$(strip $(subst ",,$(ROOTFS_SUFFIX)))
+#"))
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)$(ROOTFS_SUFFIX)$(KERNEL_EXT)
+LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)$(ROOTFS_STRIPPED_SUFFIX)$(KERNEL_EXT)
 
 
 ifeq ($(BOARD_NAME),)
@@ -226,7 +232,7 @@
 
 
 # -----------------------------------------------------------------------------
-LINUX26_TARGETS+=$(LINUX26_KERNEL) linux26-version
+LINUX26_TARGETS+=$(LINUX26_KERNEL) $(PROJECT_BUILD_DIR)/.linux-version
 
 ifeq ($(BR2_LINUX_COPYTO_ROOTFS),y)
 LINUX26_TARGETS+=$(TARGET_DIR)/boot/$(LINUX26_KERNEL_NAME)
@@ -316,8 +322,13 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_XCONFIG),y)
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD)
+ifeq ($(KERNEL_CONFIG_METHOD),xconfig)
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig || \
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig \
+else
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 endif
+endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 	# Try user defined config
 	if [ -f "$(LINUX26_KCONFIG)" ] ; then \
@@ -397,10 +408,11 @@
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
+	touch $@
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/$(LINUX26_BINLOC)
 	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
-	touch -c $@
+	touch $@
 
 # -----------------------------------------------------------------------------
 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.depend_done
@@ -453,19 +465,21 @@
 
 /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	-mkdir -p /tftpboot
-	-cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
+	-cp -dpf $(LINUX26_KERNEL) $@
+	touch $@
 
 ifneq ($(LINUX_COPYTO),/tftpboot)
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)
-	cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
+	cp -dpf $(LINUX26_KERNEL) $@
+	touch $@
 endif
 
-$(PROJECT_BUILD_DIR)/.linux-version:
+$(PROJECT_BUILD_DIR)/.linux-version: $(LINUX26_KERNEL)
 	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
-	echo LINUX_MODULES=$(LINUX26_VERSION_PROBED)	
+	echo LINUX_MODULES=`$(LINUX26_VERSION_PROBED)`
 
-linux26-mkimage:	u-boot
+$(LINUX26_MKIMAGE_DIR)/mkimage:	$(MKIMAGE)
 	mkdir -p $(LINUX26_MKIMAGE_DIR)
 	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
 
