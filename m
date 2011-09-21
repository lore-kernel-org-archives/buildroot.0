From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:46:15 +0200
Subject: [Buildroot] [PATCH 1 of 2] linux: add linux-update target to save
	configuration
In-Reply-To: <patchbomb.1316587574@localhost6.localdomain6>
References: <patchbomb.1316587574@localhost6.localdomain6>
Message-ID: <9c76ca74224570a6b9e8.1316587575@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy to build targets uclibc-update and busybox-update, add linux-update
that copies the current configuration to the custom configuration file set in
buildroot.
This facilitates the work of developers adding support for a specific board
to buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/linux.mk |  7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,6 +188,13 @@
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+linux-update linux26-update: $(LINUX_DIR)/.config
+	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+else
+linux-update linux26-update: ;
+endif
+
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.initramfs
