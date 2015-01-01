From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:23:48 +0100
Subject: [Buildroot] [PATCH 2/7] linux: add option to rely on a
	bootloader-provided DTB
In-Reply-To: <cover.1420142707.git.yann.morin.1998@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
Message-ID: <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some platforms (e.g. the Raspberry Pi), the DTB is already bundled
with the bootloader, and installed with it. On some other platforms, the
DTB might even be stored on the device itself (which is the ultimate
goal of the DTB).

So far, when we build a kernel with DT support, we forcibly want a to
also build the DTB blob, which goes against the situations described
above.

Add a new option in the DT choice, to specify the DTB will be provided
by the bootloader or the device itself.

This also means we must be a little bit more selective when we check the
validity of the DTS name at build time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 12 +++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index ba4b574..6d994ee 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -313,6 +313,14 @@ config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 	  Use a custom device tree file, i.e, a device
 	  tree file that does not belong to the kernel
 	  source tree.
+
+config BR2_LINUX_KERNEL_USE_EXTERNAL_DTS
+	bool "Use a bootloader-provided device tree blob"
+	help
+	  Say 'y' here if your device tree blob is already
+	  bundled by the bootloader, or already present on
+	  the board.
+
 endchoice
 
 config BR2_LINUX_KERNEL_INTREE_DTS_NAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 8256641..9b1f19b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -59,16 +59,20 @@ LINUX_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS)$(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
+ifeq ($(KERNEL_DTS_NAME),)
 $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
 endif
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 ifneq ($(words $(KERNEL_DTS_NAME)),1)
@@ -79,6 +83,8 @@ endif
 
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
+endif # BR2_LINUX_KERNEL_DTS_SUPPORT == y
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
 LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
@@ -212,12 +218,15 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_DTS_SUPPORT),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_USE_OF,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+ifeq ($(BR2_LINUX_KERNEL_USE_EXTERNAL_DTS),)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
@@ -238,6 +247,7 @@ define LINUX_INSTALL_DTB_TARGET
 endef
 endif
 endif
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
-- 
1.9.1
