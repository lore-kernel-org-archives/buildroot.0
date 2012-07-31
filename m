From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:28 +0200
Subject: [Buildroot] [git commit branch/next] Revert "Microblaze: build
	kernel with device tree"
Message-ID: <20120802195303.DC37A827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=942fc4c554f4850810118dba3f9036fc9e39a830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is way too specific to microblaze-only. Remove this support to
introduce a more generic way to do support device tree kernels.

This reverts commit aaed42d15643e0cb64c96fa400a6097a19d19ef4.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    8 --------
 linux/linux.mk  |   14 --------------
 2 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e0c1c7e..915b1b6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,14 +125,6 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	help
 	  Path to the kernel configuration file
 
-config BR2_LINUX_KERNEL_DTS_FILE
-    string "Device Tree dts file location"
-    depends on BR2_microblaze
-    help
-      Path from where the dts file has to be copied
-      The final "custom target" name depends on the
-      dts file name:
-          <name>.dts --> simpleImage.<name>
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index ca216a3..1b7e0b7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -119,18 +119,6 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
-ifeq ($(KERNEL_ARCH),microblaze)
-# on microblaze, we always want mkimage
-LINUX_DEPENDENCIES+=host-uboot-tools
-
-define LINUX_COPY_DTS
-    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
-        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
-    else \
-        echo "Cannot copy dts file!" ; \
-    fi
-endef
-endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
@@ -145,8 +133,6 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-    $(if $(BR2_microblaze),
-        $(call LINUX_COPY_DTS))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
