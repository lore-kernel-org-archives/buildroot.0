From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jul 2012 14:32:45 +0200
Subject: [Buildroot] [PATCH 2/6] Rework support for the device tree
In-Reply-To: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1343651569-6450-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces some support for device tree-enabled kernels.

It replaces the former BR2_LINUX_KERNEL_DTS_FILE option that was
microblaze-only, that was quite limited. This option was quite
limited, first obviously because it was restricted to microblaze,
but also because it targetted only external device tree source files,
and allowed only to build simpleImages using the custom image name
mechanism.

This patch adds a much more generic one, that can work on basically
every architecture that supports device tree. It allows to build
both device tree source file that comes with the kernel source or to
set the path to the device tree file to use so that one can use a
custom device tree.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in |   42 ++++++++++++++++++++++++++++++++++++++++++
 linux/linux.mk  |   19 +++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 550371d..8ede89c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -174,6 +174,48 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_DTS_SUPPORT
+	bool "Device tree support"
+	help
+	  Compile a device tree source into a device tree blob.
+	  Select the dts file to compile in the options below.
+
+if BR2_LINUX_KERNEL_DTS_SUPPORT
+
+choice
+	prompt "Device tree source"
+	default BR2_LINUX_KERNEL_USE_INTREE_DTS
+
+config BR2_LINUX_KERNEL_USE_INTREE_DTS
+	bool "Use a device tree present in the kernel."
+	help
+	   Use a device tree source distributed with
+	   the kernel sources. The dts files are located
+           in the arch/<arch>/boot/dts folder.
+
+config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	bool "Use a custom device tree file"
+	help
+	  Use a custom device tree file, i.e, a device
+	  tree file that does not belong to the kernel
+	  source tree.
+endchoice
+
+config BR2_LINUX_KERNEL_INTREE_DTS_NAME
+	string "Device Tree Source file name"
+	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
+	help
+	 Name of the device tree source file, without
+	 the trailing .dts
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
+	string "Device Tree Source file path"
+	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	help
+	  Path to the device tree source file
+
+endif
+
 config BR2_LINUX_KERNEL_INSTALL_TARGET
 	bool "Install kernel image to /boot in target"
 	depends on !BR2_TARGET_ROOTFS_INITRAMFS
diff --git a/linux/linux.mk b/linux/linux.mk
index 09c8e79..25f5a05 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,12 @@ LINUX_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
+KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
+KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -153,13 +159,25 @@ define LINUX_CONFIGURE_CMDS
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+define LINUX_BUILD_DTB
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+endef
+define LINUX_INSTALL_DTB
+	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
+	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
+		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
+	$(LINUX_BUILD_DTB)
 endef
 
 
@@ -175,6 +193,7 @@ endef
 
 define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
+	$(LINUX_INSTALL_DTB)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
-- 
1.7.9.5
