From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 14:30:51 +0200
Subject: [Buildroot] [git commit] fs/btrfs: add support for generating a
 btrfs image
Message-ID: <20180907111604.4EC52807D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aade4df1f80d7bff58da2b5d3dfd9d8d6ec4b7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes it possible to format the rootfs using btrfs. It
introduces the option; BR2_TARGET_ROOTFS_BTRFS.

When selected, the user is able to specify the filesystem size, label,
options, and node and sector sizes. The new files are based on
fs/ext2/{Config.in,ext2.mk}

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas:
 - fix issues pointed by Yann (duplicated empty line, missing quotes
   around default values for string options)
 - use -f option so that we don't have to remove the image file before
   creating it again
 - use the --byte-count option to set the filesystem size, which
   avoids the need for doing a "truncate -s"
 - remove the possible explanation of a mkfs.btrfs error. Indeed,
   mkfs.btrfs automatically extends the size of the image as needed,
   so the size passed can never be "too small".
 - fix check-package warnings in Config.in file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/Config.in       |  1 +
 fs/btrfs/Config.in | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/btrfs/btrfs.mk  | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/fs/Config.in b/fs/Config.in
index c25b01c3de..24f22fd7e3 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,6 +1,7 @@
 menu "Filesystem images"
 
 source "fs/axfs/Config.in"
+source "fs/btrfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
diff --git a/fs/btrfs/Config.in b/fs/btrfs/Config.in
new file mode 100644
index 0000000000..85be68e7e9
--- /dev/null
+++ b/fs/btrfs/Config.in
@@ -0,0 +1,50 @@
+config BR2_TARGET_ROOTFS_BTRFS
+	bool "btrfs root filesystem"
+	select BR2_PACKAGE_HOST_BTRFS_PROGS
+	help
+	  Build a btrfs root filesystem. If you enable this option, you
+	  probably want to enable the btrfs-progs package too.
+
+if BR2_TARGET_ROOTFS_BTRFS
+
+config BR2_TARGET_ROOTFS_BTRFS_LABEL
+	string "filesystem label"
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE
+	string "filesystem size"
+	default "100m"
+	help
+	  The size of the filesystem image in bytes.
+	  Suffix with k, m, g or t for power-of-two kilo-, mega-, giga-
+	  or terabytes.
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
+	string "sector size"
+	default "4096"
+	help
+	  This value should be set to the page size in bytes. The
+	  default value of 4096 is the the most common page size for
+	  most systems.  If the sectorsize differs from the page size,
+	  the created filesystem may not be mountable by the kernel.
+	  Therefore it is recommended to leave this value at
+	  4096. Unless you know that your kernel uses a different page
+	  size.  Suffix with k for power-of-two kilobytes.
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
+	string "btree node size"
+	default "16384"
+	help
+	  The tree block size in which btrfs stores metadata in bytes.
+	  This must be a multiple of the sectorsize, but not larger
+	  than 64KiB (65536).
+	  Suffix with k for power-of-two kilobytes.
+
+config BR2_TARGET_ROOTFS_BTRFS_FEATURES
+	string "Filesystem Features"
+	help
+	  A comma separated string of features that can be enabled
+	  during creation time.
+	  For a list of available options, use:
+	    `.../host/bin/mkfs.btrfs -O list-all`
+
+endif # BR2_TARGET_ROOTFS_BTRFS
diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
new file mode 100644
index 0000000000..ad00153c26
--- /dev/null
+++ b/fs/btrfs/btrfs.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# Build the btrfs root filesystem image
+#
+################################################################################
+
+BTRFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_BTRFS)-$(BTRFS_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_BTRFS_SIZE cannot be empty)
+endif
+
+BTRFS_SIZE_NODE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE))
+BTRFS_SIZE_SECTOR = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR))
+BTRFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_FEATURES))
+# qstrip results in stripping consecutive spaces into a single one. So the
+# variable is not qstrip-ed to preserve the integrity of the string value.
+BTRFS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
+# ")
+
+BTRFS_OPTS = \
+	-f \
+	-r '$(TARGET_DIR)' \
+	-L '$(BTRFS_LABEL)' \
+	--byte-count '$(BTRFS_SIZE)' \
+	$(if $(BTRFS_SIZE_NODE),--nodesize '$(BTRFS_SIZE_NODE)') \
+	$(if $(BTRFS_SIZE_SECTOR),--sectorsize '$(BTRFS_SIZE_SECTOR)') \
+	$(if $(BTRFS_FEATURES),--features '$(BTRFS_FEATURES)')
+
+ROOTFS_BTRFS_DEPENDENCIES = host-btrfs-progs
+
+define ROOTFS_BTRFS_CMD
+	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@
+endef
+
+$(eval $(rootfs))
