From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:47:03 +0200
Subject: [Buildroot] [git commit] linux: remove support of linux26-* targets
Message-ID: <20140729214725.550C49D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=025d4a17298e85e6efad42bdde619e47bb78ba20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux-* mirror targets of linux26-* have been added a very long time ago
(2010) and linux 2.6 is now considered 'old' anyway. It no longer makes
sense to support these linux26-* targets, so this patch removes them.

This is a simplification introduced in preparation of the kconfig-package
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/initramfs/initramfs.mk |    2 +-
 linux/linux.mk            |   20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 5d3ea89..308924d 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -7,7 +7,7 @@
 
 ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
 
-ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
+ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs
 
 
 # The generic fs infrastructure isn't very useful here.
diff --git a/linux/linux.mk b/linux/linux.mk
index a5699f9..6c0b272 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -183,7 +183,7 @@ define LINUX_CONFIGURE_CMDS
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
-	# rebuilt using the linux26-rebuild-with-initramfs target.
+	# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
@@ -312,24 +312,24 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 $(eval $(generic-package))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: linux-configure
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
-		$(subst linux-,,$(subst linux26-,,$@))
+		$(subst linux-,,$@)
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
-linux-savedefconfig linux26-savedefconfig: linux-configure
+linux-savedefconfig: linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
-		$(subst linux-,,$(subst linux26-,,$@))
+		$(subst linux-,,$@)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-linux-update-config linux26-update-config: linux-configure $(LINUX_DIR)/.config
+linux-update-config: linux-configure $(LINUX_DIR)/.config
 	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 
-linux-update-defconfig linux26-update-defconfig: linux-savedefconfig
+linux-update-defconfig: linux-savedefconfig
 	cp -f $(LINUX_DIR)/defconfig $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 else
-linux-update-config linux26-update-config: ;
-linux-update-defconfig linux26-update-defconfig: ;
+linux-update-config: ;
+linux-update-defconfig: ;
 endif
 endif
 
@@ -348,7 +348,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
-linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
+linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
