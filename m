From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri, 26 Oct 2018 22:00:16 +0200
Subject: [Buildroot] [PATCH 2/2] fs/f2fs: add support for creating a f2fs
 image
In-Reply-To: <20181026200016.30856-1-grzegorz@blach.pl>
References: <20181026200016.30856-1-grzegorz@blach.pl>
Message-ID: <20181026200016.30856-3-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes possible to create rootfs image using f2fs filesystem.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 fs/Config.in      |  1 +
 fs/f2fs/Config.in | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 fs/f2fs/Config.in
 create mode 100644 fs/f2fs/f2fs.mk

diff --git a/fs/Config.in b/fs/Config.in
index 24f22fd7e3..527051ef54 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -6,6 +6,7 @@ source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/f2fs/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
new file mode 100644
index 0000000000..d096057890
--- /dev/null
+++ b/fs/f2fs/Config.in
@@ -0,0 +1,49 @@
+config BR2_TARGET_ROOTFS_F2FS
+	bool "f2fs root filesystem"
+	select BR2_PACKAGE_HOST_F2FS_TOOLS
+	help
+	  Build a f2fs root filesystem. If you enable this option, you
+	  probably want to enable the f2fs-tools package too.
+
+if BR2_TARGET_ROOTFS_F2FS
+
+config BR2_TARGET_ROOTFS_F2FS_LABEL
+	string "filesystem label"
+
+config BR2_TARGET_ROOTFS_F2FS_SIZE
+	string "filesystem size"
+	default "100M"
+	help
+	  The size of the filesystem image in bytes.
+	  Suffix with K, M, G or T for power-of-two kilo-, mega-, giga-
+	  or terabytes.
+
+config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
+	string "extension list for cold files"
+	help
+	  Specify a file extension list in order f2fs to treat them
+	  as cold files. The default list includes most of multimedia
+	  file extensions such as jpg, gif, mpeg, mkv, and so on.
+
+config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
+	int "size for overprovision area (0 for auto calculation)"
+	default 0
+	help
+	  Specify the percentage over the volume size for overprovision
+	  area. This area is hidden to users, and utilized by F2FS
+	  cleaner. If not specified, the best number will be assigned
+	  automatically accoring to the partition size.
+
+config BR2_TARGET_ROOTFS_F2FS_FEATURES
+	string "filesystem features"
+	help
+	  A feature list in order f2fs filesystem will supports.
+	  e.g "encrypt" and so on.
+
+config BR2_TARGET_ROOTFS_F2FS_DISCARD
+	bool "discard policy"
+	default y
+	help
+	  Enable or disable discard policy.
+
+endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
new file mode 100644
index 0000000000..19c0082d67
--- /dev/null
+++ b/fs/f2fs/f2fs.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# Build the f2fs root filesystem image
+#
+################################################################################
+
+F2FS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_F2FS)-$(F2FS_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_F2FS_SIZE cannot be empty)
+endif
+
+F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
+F2FS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_FEATURES))
+# qstrip results in stripping consecutive spaces into a single one. So the
+# variable is not qstrip-ed to preserve the integrity of the string value.
+F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
+# ")
+
+ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
+F2FS_OVERPROVISION=$(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_F2FS_DISCARD),y)
+F2FS_DISCARD=1
+else
+F2FS_DISCARD=0
+endif
+
+F2FS_OPTS = \
+	-f \
+	-l "$(F2FS_LABEL)" \
+	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
+	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION)) \
+	$(if $(F2FS_FEATURES),-O "$(F2FS_FEATURES)") \
+	-t $(F2FS_DISCARD)
+
+ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
+
+define ROOTFS_F2FS_CMD
+	$(RM) -f $@
+	dd if=/dev/zero of=$@ bs=1 count=0 seek=$(F2FS_SIZE)
+	$(HOST_DIR)/sbin/mkfs.f2fs $(F2FS_OPTS) $@
+	$(HOST_DIR)/sbin/sload.f2fs -f $(TARGET_DIR) $@
+endef
+
+$(eval $(rootfs))
-- 
2.17.2
