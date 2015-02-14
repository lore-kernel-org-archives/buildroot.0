From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 16:37:50 +0100
Subject: [Buildroot] [git commit branch/next] linux: migrate to the kconfig
	infrastructure
Message-ID: <20150214163206.7B15280408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dff25ea2b9902ac786f4dbfa13056b79b902a734
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate the linux package to the kconfig infrastructure.
A notable change compared to the original behavior:

- the targets linux-update-(def)config are now always saving the config
  file, even for a defconfig bundled in the linux sources. This is done
  to keep the kconfig infrastructure simple.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   36 ++++++++----------------------------
 1 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a321fa7..86dd1ee 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,6 +55,8 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
+LINUX_MAKE_ENV = $(TARGET_MAKE_ENV)
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
@@ -174,10 +176,11 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
-define LINUX_CONFIGURE_CMDS
-	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
+LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
+
+define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
@@ -222,7 +225,6 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
-	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
@@ -319,29 +321,7 @@ endef
 
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
-$(eval $(generic-package))
-
-ifeq ($(BR2_LINUX_KERNEL),y)
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig: linux-configure
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
-		$(subst linux-,,$@)
-	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
-
-linux-savedefconfig: linux-configure
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
-		$(subst linux-,,$@)
-
-ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-linux-update-config: linux-configure $(LINUX_DIR)/.config
-	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
-
-linux-update-defconfig: linux-savedefconfig
-	cp -f $(LINUX_DIR)/defconfig $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
-else
-linux-update-config: ;
-linux-update-defconfig: ;
-endif
-endif
+$(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
