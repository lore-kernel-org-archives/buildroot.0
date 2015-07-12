From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:27 +0200
Subject: [Buildroot] [PATCH 5/7] package/linux: check for config file before
	calling kconfig-package
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <5d4fdb7baf9e62ac16e63724ccc5c54e4d102d21.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b2c9481..e9866b8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -342,6 +342,24 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING),y)
+
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
+$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+$(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
+endif # BR_BUILDIING
+
 $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
@@ -360,19 +378,3 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
-
-# Checks to give errors that the user can understand
-ifeq ($(BR_BUILDING),y)
-ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
-$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
-endif
-endif
-
-ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
-$(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
-endif
-endif
-
-endif
-- 
1.9.1
