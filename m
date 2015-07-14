From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:27:52 +0200
Subject: [Buildroot] [git commit] package/linux: check for config file
	before calling kconfig-package
Message-ID: <20150714083402.E247C819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4b08844697dc763af0c980d2a88923466e2d10d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check. Move the check with
the existing checks for the DTS, for consistency.

[Thomas: put the checks together, but right before the kconfig-package
call, rather than in the middle of the code, were the DTS related
tests were located.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   61 ++++++++++++++++++++++++++-----------------------------
 1 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index cd32652..8c535f3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,22 +88,6 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
-ifeq ($(BR_BUILDING),y)
-
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
-$(error No kernel device tree source specified, check your \
-BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
-endif
-
-ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
-ifneq ($(words $(KERNEL_DTS_NAME)),1)
-$(error Kernel with appended device tree needs exactly one DTS source. \
-	Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
-endif
-endif
-
-endif # BR_BUILDING
-
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
@@ -346,6 +330,35 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
+# Checks to give errors that the user can understand
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
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+$(error No kernel device tree source specified, check your \
+BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifneq ($(words $(KERNEL_DTS_NAME)),1)
+$(error Kernel with appended device tree needs exactly one DTS source. \
+	Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
+endif
+endif
+
+endif # BR_BUILDING
+
 $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
@@ -364,19 +377,3 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
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
