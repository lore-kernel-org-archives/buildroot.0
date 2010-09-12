From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:15 +0200
Subject: [Buildroot] [PATCH 29/74] e2fsprogs: convert old-style hooks to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cfe2c192d17c44291490c120d8bb33eeed2662e8.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk |   61 +++++++++++++++++++++++++++------------
 1 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 78bf21c..f525804 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -30,9 +30,6 @@ define HOST_E2FSPROGS_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
 
-$(eval $(call AUTOTARGETS,package,e2fsprogs))
-$(eval $(call AUTOTARGETS,package,e2fsprogs,host))
-
 # binaries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BLKID) += usr/sbin/blkid
@@ -68,32 +65,58 @@ E2FSPROGS_TXTTARGETS_ = \
 	usr/sbin/findfs \
 	usr/sbin/tune2fs
 
-$(E2FSPROGS_HOOK_POST_INSTALL):
-	$(call MESSAGE,"Post installing")
-	# remove unneeded
+define E2FSPROGS_TARGET_REMOVE_UNNEEDED
 	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_BINTARGETS_))
 	rm -f $(addprefix $(TARGET_DIR)/, $(E2FSPROGS_TXTTARGETS_))
-	# make symlinks
+endef
+
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_REMOVE_UNNEEDED
+
+define E2FSPROGS_TARGET_MKE2FS_SYMLINKS
+	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext2
+	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext3
+	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4
+	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4dev
+endef
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
-	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext2
-	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext3
-	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext4
-	ln -sf mke2fs ${TARGET_DIR}/usr/sbin/mkfs.ext4dev
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_MKE2FS_SYMLINKS
 endif
+
+define E2FSPROGS_TARGET_E2FSCK_SYMLINKS
+	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext2
+	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext3
+	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4
+	ln -sf e2fsck $(TARGET_DIR)/usr/sbin/fsck.ext4dev
+endef
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
-	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext2
-	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext3
-	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext4
-	ln -sf e2fsck ${TARGET_DIR}/usr/sbin/fsck.ext4dev
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
 endif
+
+define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
+	ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
+endef
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
-	ln -sf e2label ${TARGET_DIR}/usr/sbin/tune2fs
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_TUNE2FS_SYMLINK
 endif
+
+define E2FSPROGS_TARGET_FINDFS_SYMLINK
+	ln -sf e2label $(TARGET_DIR)/usr/sbin/findfs
+endef
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
-	ln -sf e2label ${TARGET_DIR}/usr/sbin/findfs
+E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
+
+define E2FSPROGS_STAGING_LIBUUID_INSTALL
+	install -D $(@D)/lib/uuid/uuid.h $(STAGING_DIR)/usr/include/uuid/uuid.h
+endef
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
-	install -D ${E2FSPROGS_SRCDIR}/lib/uuid/uuid.h ${STAGING_DIR}/usr/include/uuid/uuid.h
+E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBUUID_INSTALL
 endif
-	touch $@
 
+$(eval $(call AUTOTARGETS,package,e2fsprogs))
+$(eval $(call AUTOTARGETS,package,e2fsprogs,host))
-- 
1.7.0.4
