From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:53 +0200
Subject: [Buildroot] [PATCH 19/53] Globally replace $(HOST_DIR)/usr/sbin
	with $(HOST_DIR)/sbin
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-20-arnout@mind.be>
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
 fs/ubifs/ubi.mk                          | 2 +-
 fs/ubifs/ubifs.mk                        | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk | 2 +-
 package/gptfdisk/gptfdisk.mk             | 2 +-
 package/libselinux/libselinux.mk         | 2 +-
 package/mtd/mtd.mk                       | 4 ++--
 package/tzdump/tzdump.mk                 | 4 ++--
 package/zic/zic.mk                       | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

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
index 56be76543c..2efa47cceb 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -53,7 +53,7 @@ define HOST_GPTFDISK_BUILD_CMDS
 endef
 
 define HOST_GPTFDISK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/usr/sbin/sgdisk
+	$(INSTALL) -D -m 0755 $(@D)/sgdisk $(HOST_DIR)/sbin/sgdisk
 endef
 
 $(eval $(generic-package))
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index ca7836f162..75cf8e30e3 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -100,7 +100,7 @@ endef
 define HOST_LIBSELINUX_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
-		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
+		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/sbin install
 	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d6f0be2773..218265af9f 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -49,8 +49,8 @@ define HOST_MTD_INSTALL_CMDS
 	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
 endef
 
-MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
+MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
+SUMTOOL = $(HOST_DIR)/sbin/sumtool
 
 MTD_STAGING_y = lib/libmtd.a ubi-utils/libubi.a
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
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
index 2419c0c20f..ad2acdff20 100644
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
2.11.0
