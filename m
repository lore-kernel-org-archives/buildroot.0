From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 7 Aug 2012 17:09:34 +0800
Subject: [Buildroot] [PATCH 2/5] linux: support unpacked kernel source tree
In-Reply-To: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Point the kernel build system to the unpacked source tree.
Allow the building folder differ from the source folder.

LINUX_DIR still refers to the building folder, while LINUX_SOURCE_DIR
refers to the customer specified source folder.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 linux/Config.in              |   11 ++++++++++-
 linux/linux-ext-ocf-linux.mk |    4 ++--
 linux/linux-ext-rtai.mk      |    6 +++---
 linux/linux-ext-xenomai.mk   |    2 +-
 linux/linux.mk               |   42 ++++++++++++++++++++++++++----------------
 package/pkg-generic.mk       |   11 +++++++++++
 6 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9c63215..2c9b79c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -53,6 +53,11 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Git repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_TREE
+	bool "Custom unpacked tree"
+	help
+	  This option allows use of an already unpacked linux tree.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -75,12 +80,16 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	  Git revision to use in the format used by git rev-parse,
 	  E.G. a sha id, a tag, branch, ..
 
+config BR2_LINUX_KERNEL_CUSTOM_PATH
+	string "PATH of custom kernel tree"
+	depends on BR2_LINUX_KERNEL_CUSTOM_TREE
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.4.7" if BR2_LINUX_KERNEL_3_4
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_TREE
 	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
 
 #
diff --git a/linux/linux-ext-ocf-linux.mk b/linux/linux-ext-ocf-linux.mk
index faf7360..1fe7ffd 100644
--- a/linux/linux-ext-ocf-linux.mk
+++ b/linux/linux-ext-ocf-linux.mk
@@ -13,9 +13,9 @@ LINUX_DEPENDENCIES += ocf-linux
 # It works for older kernel versions.
 # Run tested from 2.6.38+ and build tested from 2.6.35+
 define OCF_LINUX_PREPARE_KERNEL
-	support/scripts/apply-patches.sh $(LINUX_DIR) \
+	support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) \
 		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
-	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
+	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_SOURCE_DIR)/crypto/ocf ;
 endef
 
 LINUX_PRE_PATCH_HOOKS += OCF_LINUX_PREPARE_KERNEL
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 78488af..894b006 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -23,9 +23,9 @@ endif
 # Prepare kernel patch
 ifeq ($(RTAI_PATCH),)
 define RTAI_PREPARE_KERNEL
-	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
+	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		support/scripts/apply-patches.sh $(LINUX_DIR) 		\
+		support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) 		\
 			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
 			hal-linux-$${kver}-*patch ; \
 	else \
@@ -36,7 +36,7 @@ endef
 else
 define RTAI_PREPARE_KERNEL
 	support/scripts/apply-patches.sh 	\
-		$(LINUX_DIR)			\
+		$(LINUX_SOURCE_DIR)		\
 		$(dir $(RTAI_PATCH))		\
 		$(notdir $(RTAI_PATCH))
 endef
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 9b6772e..54a3fc7 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -19,7 +19,7 @@ endif
 # Prepare kernel patch
 define XENOMAI_PREPARE_KERNEL
 	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
-		--linux=$(LINUX_DIR) \
+		--linux=$(LINUX_SOURCE_DIR) \
 		--arch=$(KERNEL_ARCH) \
 		$(XENOMAI_ADEOS_OPT) \
 		--verbose
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..2e0671b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -9,9 +9,11 @@ LINUX_LICENSE_FILES = COPYING
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
+ifneq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(dir $(LINUX_TARBALL))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+endif
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
@@ -31,6 +33,12 @@ LINUX_SITE := $(LINUX_SITE)testing/
 endif # -rc
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
+LINUX_SOURCE_DIR := $(BR2_LINUX_KERNEL_CUSTOM_PATH)
+else
+LINUX_SOURCE_DIR := $(LINUX_DIR)
+endif
+
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
@@ -48,9 +56,13 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
 
+ifneq ($(LINUX_SOURCE_DIR),$(LINUX_DIR))
+LINUX_MAKE_FLAGS += O="$(LINUX_DIR)"
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
-LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
+LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)
@@ -135,11 +147,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
-			support/scripts/apply-patches.sh $(@D) $(DL_DIR) `basename $$p` ; \
+			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
-			support/scripts/apply-patches.sh $(@D) $$p linux-\*.patch ; \
+			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $$p linux-\*.patch ; \
 		else \
-			support/scripts/apply-patches.sh $(@D) `dirname $$p` `basename $$p` ; \
+			support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) `dirname $$p` `basename $$p` ; \
 		fi \
 	done
 endef
@@ -148,15 +160,13 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
-	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) $(KERNEL_SOURCE_CONFIG)
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
@@ -181,7 +191,7 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
-	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
+	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) oldconfig
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
@@ -213,9 +223,9 @@ endif
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) $(LINUX_IMAGE_TARGET)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
+		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) modules ;	\
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
@@ -247,7 +257,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
+		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) 	\
 			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ;	\
@@ -260,13 +270,13 @@ include linux/linux-ext-*.mk
 $(eval $(generic-package))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
+linux-config linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
 linux-savedefconfig linux26-savedefconfig: dirs linux-configure
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
+	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
@@ -286,7 +296,7 @@ endif
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) $(LINUX_IMAGE_NAME)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	# If there is a .ub file copy it to the final destination
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68d23ba..83d70aa 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -77,6 +77,7 @@ endif
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	$(Q)mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
@@ -296,8 +297,18 @@ $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
 $(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
+ifeq ($(2), LINUX)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
+$(2)_TARGET_EXTRACT =
+$(2)_TARGET_SOURCE =
+else
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
+endif
+else
+$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
+endif
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
-- 
1.7.0.4
