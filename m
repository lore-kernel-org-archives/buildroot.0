From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri,  3 Oct 2014 15:43:54 +0200
Subject: [Buildroot] [PATCH v5] Add support for Flattened Image Trees
Message-ID: <1412343834-2532-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a new file system image type FIT. User
can specify one or more *.its files, that will be compiled and
copied into images or installed into /boot directory.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v5: change patch description
        v4: add support for multiple *.its files, reduce code duplication
        v3: fix syntax errors, remove itb name, add uboot-tools dependency
        v2: moved configuration to fs infra instead of linux

 fs/Config.in     |  1 +
 fs/fit/Config.in | 31 +++++++++++++++++++++++++++++++
 fs/fit/fit.mk    | 29 +++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
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
index 0000000..f05b2a7
--- /dev/null
+++ b/fs/fit/Config.in
@@ -0,0 +1,31 @@
+config BR2_TARGET_ROOTFS_FIT
+	bool "Flattened Image Tree support"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Compile a flattened image tree sources into a flattened
+	  image tree blobs. Specify the *.its files to compile in
+	  the options below.
+
+	  Please note, that all files referenced in *.its files,
+	  should be available in output/images folder.
+
+if BR2_TARGET_ROOTFS_FIT
+
+config BR2_FIT_PATH
+	string "Flattened Image Tree source file paths"
+	help
+	  Paths to the image tree source files. You can
+	  provide a list of *.its paths to copy and build,
+	  separated by spaces.
+
+	  Please note, that all *.its files must be named uniquely,
+	  otherwise the files with the same name will be overwritten.
+
+config BR2_FIT_INSTALL_TARGET
+	bool "Install Flattened Image Tree blobs to /boot in target"
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	help
+	  Select this option to have the FIT images installed to
+	  /boot in the target root filesystem.
+
+endif
diff --git a/fs/fit/fit.mk b/fs/fit/fit.mk
new file mode 100644
index 0000000..68a9557
--- /dev/null
+++ b/fs/fit/fit.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# Build the FIT image
+#
+################################################################################
+
+ROOTFS_FIT_DEPENDENCIES = host-uboot-tools
+
+FIT_SRCS = $(addprefix $(BINARIES_DIR)/,$(notdir $(call qstrip,$(BR2_FIT_PATH))))
+FIT_BLOBS = $(addsuffix .itb, $(basename $(FIT_SRCS)))
+
+ifeq ($(BR2_FIT_INSTALL_TARGET),y)
+define FIT_INSTALL_ITB_TARGET
+	mkdir -p $(TARGET_DIR)/boot/ && \
+	cp $(FIT_BLOBS) $(TARGET_DIR)/boot/
+endef
+else
+define FIT_INSTALL_ITB_TARGET
+	true
+endef
+endif
+
+define ROOTFS_FIT_CMD
+	cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
+	$(foreach its,$(FIT_SRCS),$(HOST_DIR)/usr/bin/mkimage -f $(its) $(basename $(its)).itb &&) \
+	$(FIT_INSTALL_ITB_TARGET)
+endef
+
+$(eval $(call ROOTFS_TARGET,fit))
-- 
1.8.3.2
