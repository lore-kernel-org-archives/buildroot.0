From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 22:22:10 +0200
Subject: [Buildroot] [PATCH 18/21] linux: rename LINUX26 to LINUX
In-Reply-To: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a4977d5e54d9297565a3bbe345dfb2ef9c53ea25.1305577083.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |  108 ++++++++++++++++++++++++++++----------------------------
 1 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a59a237..0aab92d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -3,22 +3,22 @@
 # Linux kernel 2.6 target
 #
 ###############################################################################
-LINUX26_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
-# Compute LINUX26_SOURCE and LINUX26_SITE from the configuration
-ifeq ($(LINUX26_VERSION),custom)
-LINUX26_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-LINUX26_SITE:=$(dir $(LINUX26_TARBALL))
-LINUX26_SOURCE:=$(notdir $(LINUX26_TARBALL))
+# Compute LINUX_SOURCE and LINUX_SITE from the configuration
+ifeq ($(LINUX_VERSION),custom)
+LINUX_TARBALL:=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
+LINUX_SITE:=$(dir $(LINUX_TARBALL))
+LINUX_SOURCE:=$(notdir $(LINUX_TARBALL))
 else
-LINUX26_SOURCE:=linux-$(LINUX26_VERSION).tar.bz2
-LINUX26_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+LINUX_SOURCE:=linux-$(LINUX_VERSION).tar.bz2
+LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 endif
 
-LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
-LINUX26_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_DIR:=$(BUILD_DIR)/linux-$(LINUX_VERSION)
+LINUX_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
-LINUX26_MAKE_FLAGS = \
+LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
@@ -28,27 +28,27 @@ LINUX26_MAKE_FLAGS = \
 
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
+LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
-LINUX26_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 ifeq ($(KERNEL_ARCH),blackfin)
 # a uImage, but with a different file name
-LINUX26_IMAGE_NAME=vmImage
+LINUX_IMAGE_NAME=vmImage
 else
-LINUX26_IMAGE_NAME=uImage
+LINUX_IMAGE_NAME=uImage
 endif
-LINUX26_DEPENDENCIES+=host-uboot-mkimage
+LINUX_DEPENDENCIES+=host-uboot-mkimage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
-LINUX26_IMAGE_NAME=bzImage
+LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
-LINUX26_IMAGE_NAME=zImage
+LINUX_IMAGE_NAME=zImage
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
-LINUX26_IMAGE_NAME=vmlinux.bin
+LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX26_IMAGE_NAME=vmlinux
+LINUX_IMAGE_NAME=vmlinux
 endif
 endif
 
@@ -57,44 +57,44 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/x86
+KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/x86
+KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/x86
 else
-KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)
+KERNEL_ARCH_PATH=$(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/$(LINUX26_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
-LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX26_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
 else
-LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX26_IMAGE_NAME)
+LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
 # Download
-$(LINUX26_DIR)/.stamp_downloaded:
+$(LINUX_DIR)/.stamp_downloaded:
 	@$(call MESSAGE,"Downloading kernel")
-	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
-	$(foreach patch,$(filter ftp://% http://%,$(LINUX26_PATCH)),\
+	$(call DOWNLOAD,$(LINUX_SITE),$(LINUX_SOURCE))
+	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCH)),\
 		$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
 	mkdir -p $(@D)
 	touch $@
 
 # Extraction
-$(LINUX26_DIR)/.stamp_extracted: $(LINUX26_DIR)/.stamp_downloaded
+$(LINUX_DIR)/.stamp_extracted: $(LINUX_DIR)/.stamp_downloaded
 	@$(call MESSAGE,"Extracting kernel")
 	mkdir -p $(@D)
-	$(Q)$(INFLATE$(suffix $(LINUX26_SOURCE))) $(DL_DIR)/$(LINUX26_SOURCE) | \
+	$(Q)$(INFLATE$(suffix $(LINUX_SOURCE))) $(DL_DIR)/$(LINUX_SOURCE) | \
 		tar -C $(@D) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
 	$(Q)touch $@
 
 # Patch
-$(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
+$(LINUX_DIR)/.stamp_patched: $(LINUX_DIR)/.stamp_extracted
 	@$(call MESSAGE,"Patching kernel")
-	for p in $(LINUX26_PATCH) ; do \
+	for p in $(LINUX_PATCH) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
@@ -116,7 +116,7 @@ KERNEL_DEFCONFIG_NAME = buildroot_defconfig
 KERNEL_DEFCONFIG_PATH = $(KERNEL_ARCH_PATH)/configs/$(KERNEL_DEFCONFIG_NAME)
 
 # Configuration
-$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
+$(LINUX_DIR)/.stamp_configured: $(LINUX_DIR)/.stamp_patched
 	@$(call MESSAGE,"Configuring kernel")
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 	cp $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig $(KERNEL_DEFCONFIG_PATH)
@@ -148,62 +148,62 @@ endif
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(KERNEL_DEFCONFIG_PATH))
 endif
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(KERNEL_DEFCONFIG_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DEFCONFIG_NAME)
 	rm $(KERNEL_DEFCONFIG_PATH)
 	$(Q)touch $@
 
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
-$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
+$(LINUX_DIR)/.stamp_compiled: $(LINUX_DIR)/.stamp_configured $(LINUX_DIR)/.config
 	@$(call MESSAGE,"Compiling kernel")
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) modules ;	\
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(Q)touch $@
 
 # Installation
-$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
+$(LINUX_DIR)/.stamp_installed: $(LINUX_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
-	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
-	install -m 0644 -D $(LINUX26_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX26_IMAGE_NAME)
+	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
 endif
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
+	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX_DIR)/.config) != 0 ] ; then 	\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
 			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
-		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;	\
+		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
 	fi
 	$(Q)touch $@
 
-linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux linux26: host-module-init-tools $(LINUX_DEPENDENCIES) $(LINUX_DIR)/.stamp_installed
 
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
-$(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
+$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Remove the previously generated initramfs which was empty,
 	# to make sure the kernel will actually regenerate it.
 	$(RM) -f $(@D)/usr/initramfs_data.cpio*
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	# Copy the kernel image to its final destination
-	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	$(Q)touch $@
 
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
-linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
+linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-TARGETS+=linux26
+TARGETS+=linux
 endif
 
 # Checks to give errors that the user can understand
-- 
1.7.1
