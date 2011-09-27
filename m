From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Sep 2011 21:21:09 +0200
Subject: [Buildroot] [PATCH 1 of 3] linux: add linux-update-config and
 linux-update-defconfig targets
In-Reply-To: <patchbomb.1317151268@localhost6.localdomain6>
References: <patchbomb.1317151268@localhost6.localdomain6>
Message-ID: <81756817dc47990f5c42.1317151269@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy to build targets uclibc-update and busybox-update, add
extra targets to copy the current configuration to the custom
configuration file set in buildroot. These targets facilitate the
work of developers adding support for a specific board.

linux-update-config copies .config directly.
linux-update-defconfig first creates a defconfig and copies that.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: add defconfig target and rename.

 linux/linux.mk |  11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -190,6 +190,17 @@
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+linux-update-config linux26-update-config: $(LINUX_DIR)/.config
+	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+
+linux-update-defconfig linux26-update-defconfig: linux-savedefconfig
+	cp -f $(LINUX_DIR)/defconfig $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+else
+linux-update-config linux26-update-config: ;
+linux-update-defconfig linux26-update-defconfig: ;
+endif
+
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.initramfs
