From: Ben Whitten <ben.whitten@gmail.com>
Date: Fri, 23 Mar 2018 18:21:19 +0000
Subject: [Buildroot] [PATCH RESEND 2/2] fs/squashfs: enable squashfs to
 generate a verity hashtable
In-Reply-To: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
References: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
Message-ID: <1521829279-5156-3-git-send-email-ben.whitten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For those times that you want to verify that your readonly filesystem
hasn't been tampered we can generate a dm-verity hash table.
The root hash is enclosed in .table file and must be secured else where.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 fs/squashfs/Config.in   |  6 ++++++
 fs/squashfs/squashfs.mk | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index ca9ddb2..d435249 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -28,4 +28,10 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
 	bool "xz"
 
 endchoice
+
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+	bool "Generate verity hashtable"
+	help
+	  As squashfs is readonly it is possible to generate a dm-verity
+	  hashtable for use in verified boot systems.
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 51abd5d..8fe09c8 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -5,6 +5,9 @@
 ################################################################################
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
+ROOTFS_SQUASHFS_DEPENDENCIES += host-cryptsetup
+endif
 
 ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
 
@@ -24,4 +27,11 @@ define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
+define ROOTFS_SQUASHFS_VERITY
+	$(HOST_DIR)/sbin/veritysetup format $@ $@.verity > $@.verity.table
+endef
+ROOTFS_SQUASHFS_POST_GEN_HOOKS += ROOTFS_SQUASHFS_VERITY
+endif
+
 $(eval $(rootfs))
-- 
2.7.4
