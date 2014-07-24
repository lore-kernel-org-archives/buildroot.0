From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:34 +0200
Subject: [Buildroot] [PATCH 7 of 7] linux: remove support of linux26-*
	targets
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <4dc6eccbfc4126669605.1406224174@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux-* mirror targets of linux26-* have been added a very long time ago
(2010) and linux 2.6 is now considered 'old' anyway. It no longer makes
sense to support these linux26-* targets, so this patch removes them.

This is a simplification introduced in preparation of the kconfig-package
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 fs/initramfs/initramfs.mk |   2 +-
 linux/linux.mk            |  20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff -r 01c5523b5777 -r 4dc6eccbfc41 fs/initramfs/initramfs.mk
--- a/fs/initramfs/initramfs.mk	Wed Jul 23 20:13:38 2014 +0200
+++ b/fs/initramfs/initramfs.mk	Wed Jul 23 20:19:19 2014 +0200
@@ -7,7 +7,7 @@
 
 ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
 
-ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
+ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs
 
 
 # The generic fs infrastructure isn't very useful here.
diff -r 01c5523b5777 -r 4dc6eccbfc41 linux/linux.mk
--- a/linux/linux.mk	Wed Jul 23 20:13:38 2014 +0200
+++ b/linux/linux.mk	Wed Jul 23 20:19:19 2014 +0200
@@ -183,7 +183,7 @@
 	# As the kernel gets compiled before root filesystems are
 	# built, we create a fake cpio file. It'll be
 	# replaced later by the real cpio archive, and the kernel will be
-	# rebuilt using the linux26-rebuild-with-initramfs target.
+	# rebuilt using the linux-rebuild-with-initramfs target.
 	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
 		touch $(BINARIES_DIR)/rootfs.cpio
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$(BINARIES_DIR)/rootfs.cpio",$(@D)/.config)
@@ -312,24 +312,24 @@
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
 
@@ -348,7 +348,7 @@
 
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
-linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
+linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
