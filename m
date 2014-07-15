From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Jul 2014 15:21:16 +0200
Subject: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can be
	booted over NFS.
Message-ID: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This options allows specifying a directory where the target rootfs is
copied to so it can be used to boot a device over NFS.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 Makefile         |  5 +++++
 fs/Config.in     |  1 +
 fs/nfs/Config.in | 13 +++++++++++++
 fs/nfs/nfs.mk    | 16 ++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 fs/nfs/Config.in
 create mode 100644 fs/nfs/nfs.mk

diff --git a/Makefile b/Makefile
index dcbf2b3..4c7a707 100644
--- a/Makefile
+++ b/Makefile
@@ -833,6 +833,11 @@ clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
+ifeq ($(BR2_TARGET_ROOTFS_NFS),y)
+		if [ -d $(TARGET_ROOTFS_NFS_PATH) ]; then \
+			rm -rf $(TARGET_ROOTFS_NFS_PATH) ;\
+		fi
+endif
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/fs/Config.in b/fs/Config.in
index 5853113..aa1460b 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -7,6 +7,7 @@ source "fs/ext2/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
+source "fs/nfs/Config.in"
 source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
diff --git a/fs/nfs/Config.in b/fs/nfs/Config.in
new file mode 100644
index 0000000..cf32619
--- /dev/null
+++ b/fs/nfs/Config.in
@@ -0,0 +1,13 @@
+config BR2_TARGET_ROOTFS_NFS
+	bool "create NFS boot directory"
+	help
+	  Creates a directory that contains the rootfs for booting over NFS.
+
+if BR2_TARGET_ROOTFS_NFS
+config BR2_TARGET_ROOTFS_NFS_PATH
+	string "path to the directory used for booting over NFS"
+	default "~/nfsrootfs"
+	help
+	  Path to the directory used for booting over NFS.
+	  (This should also be added to your /etc/exports file.)
+endif
diff --git a/fs/nfs/nfs.mk b/fs/nfs/nfs.mk
new file mode 100644
index 0000000..003ce71
--- /dev/null
+++ b/fs/nfs/nfs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# create a directory for booting the device from an NFS.
+#
+################################################################################
+
+TARGET_ROOTFS_NFS_PATH := $(call qstrip,$(BR2_TARGET_ROOTFS_NFS_PATH))
+
+define ROOTFS_NFS_CMD
+	rm -rf $(TARGET_ROOTFS_NFS_PATH) ;\
+	mkdir -p  $(TARGET_ROOTFS_NFS_PATH) ;\
+	cp -r $(TARGET_DIR)/* $(TARGET_ROOTFS_NFS_PATH)
+endef
+
+$(eval $(call ROOTFS_TARGET,nfs))
-- 
2.0.1
