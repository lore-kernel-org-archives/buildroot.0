From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:06 +0200
Subject: [Buildroot] [git commit] fs: introduce a macro for reproducible
 command
Message-ID: <20180331185352.50CA584B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31fd0b1cac219ec058b02281c5b5363513f585de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index a6ab6c6795..20e8446131 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -34,6 +34,12 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define ROOTFS_REPRODUCIBLE
+	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
+endef
+endif
+
 ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
 
 .PHONY: rootfs-common
@@ -119,9 +125,7 @@ endif
 		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-ifeq ($$(BR2_REPRODUCIBLE),y)
-	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
-endif
+	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
