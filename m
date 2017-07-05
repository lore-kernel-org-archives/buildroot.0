From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:20 +0200
Subject: [Buildroot] [PATCH v4 03/36] Globally replace $(HOST_DIR)/usr/sbin
	with $(HOST_DIR)/sbin
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/sbin' | xargs sed -i 's%$(HOST_DIR)/usr/sbin%$(HOST_DIR)/sbin%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/ext2.mk                          | 2 +-
 fs/ubifs/ubi.mk                          | 2 +-
 fs/ubifs/ubifs.mk                        | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk | 2 +-
 package/gptfdisk/gptfdisk.mk             | 2 +-
 package/libselinux/libselinux.mk         | 2 +-
 package/mtd/mtd.mk                       | 4 ++--
 package/tzdump/tzdump.mk                 | 4 ++--
 package/zic/zic.mk                       | 4 ++--
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index ff04b78efb..99d03f10cf 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -20,7 +20,7 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
 	rm -f $@
-	$(HOST_DIR)/usr/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
+	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
 		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endef
 
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index e488cb5f8a..2baece5fb0 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -25,7 +25,7 @@ endif
 define ROOTFS_UBI_CMD
 	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
 		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
-	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
+	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
 
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index f1e4126e86..7b2b0fb2cc 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -21,7 +21,7 @@ UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))
 ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
 define ROOTFS_UBIFS_CMD
-	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
+	$(HOST_DIR)/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
 $(eval $(call ROOTFS_TARGET,ubifs))
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index c05cee31db..f24216da26 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -21,7 +21,7 @@ define IMX_UUC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/uuc $(TARGET_DIR)/usr/bin/uuc
 	$(INSTALL) -D -m 755 $(@D)/sdimage $(TARGET_DIR)/usr/bin/sdimage
 	dd if=/dev/zero of=$(TARGET_DIR)/fat bs=1M count=1
-	$(HOST_DIR)/usr/sbin/mkfs.vfat $(TARGET_DIR)/fat
+	$(HOST_DIR)/sbin/mkfs.vfat $(TARGET_DIR)/fat
 endef
 
 define IMX_UUC_INSTALL_INIT_SYSV
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index c5826dfb8d..a7bc41c89f 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -48,7 +48,7 @@ define HOST_GPTFDISK_BUILD_CMDS
 endef
 
 define HOST_GPTFDISK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/usr/sbin/sgdisk
+	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/sbin/sgdisk
 endef
 
 $(eval $(generic-package))
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b6c5809134..6362792201 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -106,7 +106,7 @@ endef
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
+		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/sbin install
 	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index df2e5a3ecd..7c3a2b6bda 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -46,8 +46,8 @@ endif
 
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
-MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
+MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
+SUMTOOL = $(HOST_DIR)/sbin/sumtool
 
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
diff --git a/package/tzdump/tzdump.mk b/package/tzdump/tzdump.mk
index 3f035a56cb..baad978c4f 100644
--- a/package/tzdump/tzdump.mk
+++ b/package/tzdump/tzdump.mk
@@ -13,9 +13,9 @@ define HOST_TZDUMP_BUILD_CMDS
 endef
 
 define HOST_TZDUMP_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tzdump $(HOST_DIR)/usr/sbin/tzdump
+	$(INSTALL) -m 0755 -D $(@D)/tzdump $(HOST_DIR)/sbin/tzdump
 endef
 
 $(eval $(host-generic-package))
 
-TZDUMP = $(HOST_DIR)/usr/sbin/tzdump
+TZDUMP = $(HOST_DIR)/sbin/tzdump
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index de2f3c9676..cbda414d3e 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -15,10 +15,10 @@ define HOST_ZIC_BUILD_CMDS
 endef
 
 define HOST_ZIC_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/sbin/zic
 	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/usr/include/tzfile.h
 endef
 
 $(eval $(host-generic-package))
 
-ZIC = $(HOST_DIR)/usr/sbin/zic
+ZIC = $(HOST_DIR)/sbin/zic
-- 
2.13.2
