From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:16:41 +0100
Subject: [Buildroot] [git commit] Revert "linux: only depend on host-lzop if
	needed"
Message-ID: <20140304181827.4670090409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dc7901b00a581453896a65fb08ad8261c747521
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ca80782f4571f004c2b8cf2d0e60e83343beff34. The
whole host-lzop optional dependency logic cannot work, since the
configuration file will only be known after the kernel sources are
extracted, if an internal kernel defconfig is used, which is quite
common.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index cf728aa..f948e6c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -41,7 +41,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-kmod
+LINUX_DEPENDENCIES  += host-kmod host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
@@ -163,14 +163,7 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
-endif
-
-ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
-LINUX_DEPENDENCIES += host-lzop
-endif
-ifeq ($(call KCONFIG_GET_OPT,CONFIG_RD_LZO,$(KERNEL_SOURCE_CONFIG)),y)
-LINUX_DEPENDENCIES += host-lzop
+KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
