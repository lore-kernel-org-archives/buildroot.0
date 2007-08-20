From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 20 Aug 2007 10:34:50 +0200
Subject: [Buildroot] [RFC] Building linux kernel in $(PROJECT_BUILD_DIR)
In-Reply-To: <20070727155915.GB25147@aon.at>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
	<1185196685.21840.25.camel@elrond.sweden.atmel.com>
	<20070723133400.GC7902@aon.at>
	<1185429498.31437.11.camel@localhost.localdomain>
	<20070727155915.GB25147@aon.at>
Message-ID: <1187598890.29832.19.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Proposed fix to allow each project to build its own linux kernel
in $(PROJECT_BUILD_DIR)  == project_build_dir/<project>

Basic approach is to unpack the linux header source in 
"$(TOOL_BUILD_DIR)" instead of in "$(BUILD_DIR)"
Patches are applied (some depending on BR2_<xxx>) as in current trunk,

Each board can add additional patches by defining
KERNEL_HEADERS_PATCH_DIR to point at the directory with additional
patches (That patch just applied to get rid of AVR32 patches in 
toolchain/kernel-headers).

Headers are still installed in "$(TOOL_BUILD_DIR)/linux"
The kernel-headers source tree is unpacked once per toolchain.

The target/linux build (modules and kernel) will unpack a 
second linux source tree in "$(PROJECT_BUILD_DIR)".
This source tree is generated once per *project*.

Since this is a fresh unpack, the same patches as were applied
to the kernel-headers are applied to "$(PROJECT_BUILD_DIR)/linux-*".

A common linux source tree for all projects is not possible, since
different boards can require different patches to be applied.
There is a significant risk that the linux build breaks if patches for
one project are applied on top of patches for another project
in the same source tree.

With a single source, you therefore will have to remove the linux source
tree each time you work on a new project.
With a separate source, you can move between projects without removing
the linux source directory.


The patch is also include it as an attachement, due to linewrap.

Tested this on x86/Atmel targets.

Comments?


Index: toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- toolchain/kernel-headers/kernel-headers-new.makefile	(revision
19588)
+++ toolchain/kernel-headers/kernel-headers-new.makefile	(arbetskopia)
@@ -13,7 +13,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=
$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -28,7 +28,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=
$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -43,7 +43,7 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_UNPACK_DIR:=
$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_IS_KERNEL=y
 endif
@@ -56,8 +56,8 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked:
$(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
-	[ -d $(BUILD_DIR) ] || $(INSTALL) -d $(BUILD_DIR)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C
$(BUILD_DIR) $(TAR_OPTIONS) -
+	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
+	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C
$(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
Index: toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- toolchain/kernel-headers/kernel-headers.mk	(revision 19588)
+++ toolchain/kernel-headers/kernel-headers.mk	(arbetskopia)
@@ -37,5 +37,6 @@
 
 kernel-headers-dirclean:
 	rm -rf $(LINUX_HEADERS_DIR)
+	rm -rf $(LINUX_HEADERS_UNPACK_DIR)
 
 .PHONY: kernel-headers
Index: target/linux/Makefile.in
===================================================================
--- target/linux/Makefile.in	(revision 19588)
+++ target/linux/Makefile.in	(arbetskopia)
@@ -68,7 +68,7 @@
 endif
 
 # Version of Linux AFTER patches
-LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
 LINUX_VERSION:=$(LINUX_VERSION)
@@ -76,7 +76,9 @@
 LINUX_KERNEL=$(LINUX26_KERNEL)
 
 # kernel patches
+ifeq ($(strip $(LINUX26_PATCH_DIR)),)
 LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/
+endif
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS=$(HOSTCFLAGS) \
 	ARCH=$(KERNEL_ARCH) \
@@ -96,20 +98,38 @@
 ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C
$(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch
version
-	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION)
$(LINUX26_DIR)
 endif
 	touch $@
 
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) \*.patch
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+ifeq ($(BR2_KERNEL_HEADERS_IPMI),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers/ipmi
\
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_KERNEL_HEADERS_LZMA),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers/lzma
\
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+ifeq ($(BR2_PACKAGE_OPENSWAN),y)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan
\
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+endif
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
linux-$(LINUX26_VERSION)\*.patch
 	touch $@
-endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config


Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-bsp.patch
Type: text/x-patch
Size: 5155 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070820/f89b5bb9/attachment-0001.bin 
