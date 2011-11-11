From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 20:13:14 +0100
Subject: [Buildroot] [git commit] linux: add linux-update-config and
	linux-update-defconfig targets
Message-ID: <20111111191541.89AE38F4D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0900c12556ced3155ef890ef0f23c2a6b66945e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In analogy to build targets uclibc-update and busybox-update, add
extra targets to copy the current configuration to the custom
configuration file set in buildroot. These targets facilitate the
work of developers adding support for a specific board.

linux-update-config copies .config directly.
linux-update-defconfig first creates a defconfig and copies that.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9beb706..5c5a1d2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -196,6 +196,17 @@ linux-savedefconfig linux26-savedefconfig: dirs $(LINUX_DIR)/.stamp_configured
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
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
