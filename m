From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:56 +0100
Subject: [Buildroot] [PATCH 5/8 RFC] fs: use HOST_PATH
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <bbaecb2c3e947a9b6c80a10dbc2589c86bc0dc96.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 fs/common.mk    | 6 +++---
 fs/ext2/ext2.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 528e194..b513f63 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -90,14 +90,14 @@ ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
-	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
+	PATH=$$(HOST_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	PATH=$$(HOST_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
+	PATH=$$(HOST_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
 	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
 
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 7417f81..ab876b7 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -31,7 +31,7 @@ endif
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
+	PATH=$(HOST_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
 endef
 
 rootfs-ext2-symlink:
-- 
1.9.1
