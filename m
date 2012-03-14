From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 17:36:49 +0100
Subject: [Buildroot] [PATCH] linux.mk: check for y explicitly
Message-ID: <189747daec208a7d29d7.1331743009@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LINUX_CONFIGURE_CMDS uses the construct
$(if $(BR2_x), ...
which don't work as expected when BR2_x=n.

This patch modifies linux.mk to use the construct
$(if $(filter y,$(BR2_x)), ...

See http://lists.busybox.net/pipermail/buildroot/2012-March/051523.html
for more information about a specific problem case.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/linux.mk |  8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

Note: the problematic construct seems to be present in many files in buildroot.
I'd say we need to fix them all, but I'm not sure if you agree. Feedback
welcome!

diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -128,14 +128,14 @@ define LINUX_CONFIGURE_CMDS
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
-	$(if $(BR2_ARM_EABI),
+	$(if $(filter y,$(BR2_ARM_EABI)),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
 	# rebuilt using the linux26-rebuild-with-initramfs target.
-	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+	$(if $(filter y,$(BR2_TARGET_ROOTFS_INITRAMFS)),
 		touch $(BINARIES_DIR)/rootfs.cpio
 		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
@@ -143,10 +143,10 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
+	$(if $(filter y,$(BR2_ROOTFS_DEVICE_CREATION_STATIC)),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
+	$(if $(filter y,$(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV)),
 		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
 endef
