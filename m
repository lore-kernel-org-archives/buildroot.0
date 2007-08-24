From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 23 Aug 2007 22:36:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/kernel-headers
Message-ID: <20070824053646.76995A5D2D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-23 22:36:46 -0700 (Thu, 23 Aug 2007)
New Revision: 19671

Log:
This patch allows each project to have a private linux build.

Split build of kernel headers and kernel image into two source trees.
Kernel headers are built in $(TOOL_BUILD_DIR)
Kernel build is in $(PROJECT_BUILD_DIR)

Make sure that kernel patches are applied to the kernel tree in
$(PROJECT_BUILD_DIR)
Add board specific patches, if available.


Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-24 05:31:07 UTC (rev 19670)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-24 05:36:46 UTC (rev 19671)
@@ -6,49 +6,54 @@
 ifneq ($(filter $(TARGETS),linux26),)
 
 
+ifeq ($(DOWNLOAD_LINUX26_VERSION),)
+# User did not define linux version, try using headers
 ifeq ($(LINUX_HEADERS_VERSION),)
-# Version of Linux to download and then apply patches to
-# XXX: andersee, i do not understand why we need this (BF)
-DOWNLOAD_LINUX26_VERSION=2.6.19.2
+# We did not have headers (this is for real???)
+# Version of linuc before patches
+DOWNLOAD_LINUX26_VERSION=2.6.22.1
 # Version of Linux after applying any patches
-LINUX26_VERSION=2.6.19.2
+LINUX26_VERSION=2.6.22.1
 else
+# OK, we have headers, use them...
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
+endif
 
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
 LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
 
-#LINUX26_FORMAT=vmlinux
-#LINUX26_BINLOC=$(LINUX26_FORMAT)
+ifeq ($(BOARD_PATH),)
+BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
+#"))
+endif
 
 # Linux kernel configuration file
 # Has to be set by the target/device
 # If it is not set by the target/device, then pick the one from .config
-# LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
 ifndef LINUX26_KCONFIG
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG))),)
 LINUX26_KCONFIG=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
 #"))
 #"))
+else
+# LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
 endif
+
 ifndef LINUX26_FORMAT
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
 LINUX26_FORMAT=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
 #"))
 #"))
+else
+LINUX26_FORMAT=zImage
 endif
 endif
 
 # Has to be set by the target/device
-# LINUX26_FORMAT=bzImage
-ifndef LINUX26_FORMAT
-LINUX26_FORMAT=zImage
-endif
-# Has to be set by the target/device
 ifndef LINUX26_BINLOC
 # default:
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
@@ -60,15 +65,20 @@
 endif
 
 # Version of Linux AFTER patches
-LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
-LINUX_VERSION:=$(LINUX_VERSION)
+LINUX_VERSION:=$(LINUX26_VERSION)
 LINUX_DIR=$(LINUX26_DIR)
 LINUX_KERNEL=$(LINUX26_KERNEL)
 
 # kernel patches
-LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/
+ifeq ($(strip $(LINUX26_PATCH_DIR)),)
+ifneq ($(BOARD_PATH),)
+LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
+#"))
+endif
+endif
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS=$(HOSTCFLAGS) \
 	ARCH=$(KERNEL_ARCH) \
@@ -88,20 +98,43 @@
 ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	@echo "*** Unpacking kernel source"
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
 endif
 	touch $@
 
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) \*.patch
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+ifeq ($(BR2_KERNEL_HEADERS_IPMI),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers/ipmi \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_KERNEL_HEADERS_LZMA),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers/lzma \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_PACKAGE_OPENSWAN),y)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifneq ($(LINUX26_PATCH_DIR),)
+	if [ -d $(LINUX26_PATCH_DIR) ] ; then \
+		toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) linux-$(LINUX26_VERSION)\*.patch ; \
+	fi
+endif
 	touch $@
-endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-24 05:31:07 UTC (rev 19670)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-24 05:36:46 UTC (rev 19671)
@@ -13,7 +13,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -28,7 +28,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -43,7 +43,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -56,8 +56,8 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
-	[ -d $(BUILD_DIR) ] || $(INSTALL) -d $(BUILD_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2007-08-24 05:31:07 UTC (rev 19670)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2007-08-24 05:36:46 UTC (rev 19671)
@@ -37,5 +37,6 @@
 
 kernel-headers-dirclean:
 	rm -rf $(LINUX_HEADERS_DIR)
+	rm -rf $(LINUX_HEADERS_UNPACK_DIR)
 
 .PHONY: kernel-headers
