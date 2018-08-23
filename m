From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Thu, 23 Aug 2018 21:26:51 +0100
Subject: [Buildroot] [PATCH 2/2] fs/btrfs: Introducing btrfs rootfs support.
Message-ID: <20180823202651.3108-1-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes it possible to format the rootfs using btrfs.
It introduces the option; BR2_TARGET_ROOTFS_BTRFS

When selected, the user is able to specify the filesystem size,
label, options, and node and sector sizes.
The new files are based on fs/ext2/{Config.in,ext2.mk}

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 fs/Config.in       |  1 +
 fs/btrfs/Config.in | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/btrfs/btrfs.mk  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 fs/btrfs/Config.in
 create mode 100644 fs/btrfs/btrfs.mk

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
index 0000000000..6537c85fdb
--- /dev/null
+++ b/fs/btrfs/Config.in
@@ -0,0 +1,54 @@
+config BR2_TARGET_ROOTFS_BTRFS
+	bool "btrfs root filesystem"
+	select BR2_PACKAGE_HOST_BTRFS_PROGS
+	help
+	  Build a btrfs root filesystem. If you enable this option, you
+	  probably want to enable the btrfs-progs package too.
+
+
+if BR2_TARGET_ROOTFS_BTRFS
+
+config BR2_TARGET_ROOTFS_BTRFS_LABEL
+	string "filesystem label"
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE
+	string "filesystem size"
+	default "100M"
+	help
+	  The size of the filesystem image. If it does not have a
+	  suffix, it is interpreted as power-of-two kilobytes. If it is
+	  suffixed by 'k', 'm', 'g', 't' (either upper-case or
+	  lower-case), then it is interpreted in power-of-two kilobytes,
+	  megabytes, gigabytes, terabytes, etc.
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
+	string "btree node size"
+	default 16384
+	help
+	  The tree block size in which btrfs stores metadata. This must
+	  be a multiple of the sectorsize, but not larger than 64KiB.
+	  (65536).
+	  If it is suffixed by 'k' (either upper-case or lower-case),
+	  then it is interpreted in power-of-two kilobytes.
+
+config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
+	string "sector size"
+	default 4096
+	help
+	  This value should be set to the page size. The default value of
+	  4096 is the the most common page size for most systems.
+	  If the sectorsize differs from the page size, the created
+	  filesystem may not be mountable by the kernel.
+	  Therefore it is recommended to leave this value at 4096.
+	  If it is suffixed by 'k' (either upper-case or lower-case),
+	  then it is interpreted in power-of-two kilobytes.
+
+config BR2_TARGET_ROOTFS_BTRFS_FEATURES
+	string "Filesystem Features"
+	help
+	  A comma separated string of features that can be enabled
+	  during creation time.
+	  For a list of available options, use;
+	    `.../host/bin/mkfs.btrfs -O list-all`
+
+endif # BR2_TARGET_ROOTFS_BTRFS
diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
new file mode 100644
index 0000000000..37b2937825
--- /dev/null
+++ b/fs/btrfs/btrfs.mk
@@ -0,0 +1,39 @@
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
+	-r '$(TARGET_DIR)' \
+	-L '$(BTRFS_LABEL)' \
+	$(if $(BTRFS_SIZE_NODE),--nodesize '$(BTRFS_SIZE_NODE)') \
+	$(if $(BTRFS_SIZE_SECTOR),--sectorsize '$(BTRFS_SIZE_SECTOR)') \
+	$(if $(BTRFS_FEATURES),--features '$(BTRFS_FEATURES)')
+
+ROOTFS_BTRFS_DEPENDENCIES = host-btrfs-progs
+
+define ROOTFS_BTRFS_CMD
+	rm -f $@
+	truncate -s $(BTRFS_SIZE) $@
+	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@ \
+	|| { ret=$$?; \
+	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_BTRFS_SIZE)" 1>&2; \
+	     exit $$ret; \
+	}
+endef
+
+$(eval $(rootfs))
-- 
2.11.0
