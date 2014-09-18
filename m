From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 18 Sep 2014 22:13:44 +0200
Subject: [Buildroot] [PATCH v3] Add support for Flattened Image Trees
Message-ID: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides an option to specify a FIT source
file (*.its), that will usually be stored in a board directory,
and the resulting blob file name (*.itb).

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v3: fix syntax errors, remove itb name, add uboot-tools dependency
        v2: moved configuration to fs infra instead of linux

 fs/Config.in     |  1 +
 fs/fit/Config.in | 23 +++++++++++++++++++++++
 fs/fit/fit.mk    | 23 +++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 fs/fit/Config.in
 create mode 100644 fs/fit/fit.mk

diff --git a/fs/Config.in b/fs/Config.in
index 5853113..8d882d0 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -4,6 +4,7 @@ source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/fit/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/fit/Config.in b/fs/fit/Config.in
new file mode 100644
index 0000000..12e977b
--- /dev/null
+++ b/fs/fit/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_ROOTFS_FIT
+	bool "Flattened Image Tree support"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Compile a flattened image tree source into a flattened
+	  image tree blob. Specify the *.its file to compile in the
+	  options below.
+
+if BR2_TARGET_ROOTFS_FIT
+
+config BR2_FIT_PATH
+	string "Flattened Image Tree source file path"
+	help
+	  Path to the image tree source files.
+
+config BR2_FIT_INSTALL_TARGET
+	bool "Install Flattened Image Tree blob to /boot in target"
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	help
+	  Select this option to have the FIT image installed to
+	  /boot in the target root filesystem.
+
+endif
diff --git a/fs/fit/fit.mk b/fs/fit/fit.mk
new file mode 100644
index 0000000..2283cd7
--- /dev/null
+++ b/fs/fit/fit.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# Build the FIT image
+#
+################################################################################
+
+ROOTFS_FIT_DEPENDENCIES = host-uboot-tools
+
+ifeq ($(BR2_FIT_INSTALL_TARGET),y)
+define ROOTFS_FIT_CMD
+	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
+	$(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb && \
+	mkdir -p $(TARGET_DIR)/boot/ && \
+	cp $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb $(TARGET_DIR)/boot/
+endef
+else
+define ROOTFS_FIT_CMD
+	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
+	$(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call qstrip,$(BR2_FIT_PATH)))).itb
+endef
+endif
+
+$(eval $(call ROOTFS_TARGET,fit))
-- 
1.8.3.2
