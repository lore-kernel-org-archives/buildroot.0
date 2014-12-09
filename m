From: Karoly Kasza <kaszak@gmail.com>
Date: Tue,  9 Dec 2014 17:03:27 +0100
Subject: [Buildroot] [PATCH v2 3/3] fs/rawimg: new rootfs target
In-Reply-To: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
References: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
Message-ID: <1418141008-18739-4-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rootfs target to call the new mkrawimg package.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v1 -> v2:
  - Removed script into new mkrawimg package.

 fs/Config.in        |    1 +
 fs/rawimg/Config.in |   15 +++++++++++++++
 fs/rawimg/rawimg.mk |   13 +++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 fs/rawimg/Config.in
 create mode 100644 fs/rawimg/rawimg.mk

diff --git a/fs/Config.in b/fs/Config.in
index 5853113..36961db 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -8,6 +8,7 @@ source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
 source "fs/romfs/Config.in"
+source "fs/rawimg/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
diff --git a/fs/rawimg/Config.in b/fs/rawimg/Config.in
new file mode 100644
index 0000000..68b518e
--- /dev/null
+++ b/fs/rawimg/Config.in
@@ -0,0 +1,15 @@
+config BR2_TARGET_ROOTFS_RAWIMG
+	bool "raw disk image"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_HOST_MKRAWIMG
+	select BR2_LINUX_KERNEL_INSTALL_TARGET
+	select BR2_TARGET_ROOTFS_EXT2
+	help
+	  Build a bootable raw disk image, that can be booted in a VM (e.g. QEMU),
+	  or directly written to disk. Creates a valid partition table with MBR,
+	  and one primary ext* partition.
+
+comment "raw disk image needs a Linux kernel to be built"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_LINUX_KERNEL
diff --git a/fs/rawimg/rawimg.mk b/fs/rawimg/rawimg.mk
new file mode 100644
index 0000000..c0a720d
--- /dev/null
+++ b/fs/rawimg/rawimg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the raw disk image
+#
+################################################################################
+
+ROOTFS_RAWIMG_DEPENDENCIES = rootfs-ext2 host-mkrawimg
+
+define ROOTFS_RAWIMG_CMD
+	PATH=$(BR_PATH) mkrawimg $(BINARIES_DIR) $@
+endef
+
+$(eval $(call ROOTFS_TARGET,rawimg))
-- 
1.7.10.4
