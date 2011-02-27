From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 27 Feb 2011 15:37:23 +0100
Subject: [Buildroot] [PATCH 1 of 2] linux: add linux-update target to save
	configuration
In-Reply-To: <patchbomb.1298817442@localhost6.localdomain6>
References: <patchbomb.1298817442@localhost6.localdomain6>
Message-ID: <06eeb477324b418b8fdb.1298817443@localhost6.localdomain6>
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
@@ -163,6 +163,13 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+linux-update linux26-update: $(LINUX26_DIR)/.config
+	cp -f $(LINUX26_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+else
+linux-update linux26-update: ;
+endif
+
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
 $(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINARIES_DIR)/rootfs.initramfs
