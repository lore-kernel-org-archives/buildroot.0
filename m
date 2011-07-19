From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 19 Jul 2011 14:35:45 +0200
Subject: [Buildroot] [PATCH] [resend] linux: add linux-update target to save
	configuration
Message-ID: <df2d47a2798ac5fe5920.1311078945@localhost6.localdomain6>
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
@@ -184,6 +184,13 @@
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+linux-update linux26-update: $(LINUX26_DIR)/.config
+	cp -f $(LINUX26_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+else
+linux-update linux26-update: ;
+endif
+
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.initramfs
