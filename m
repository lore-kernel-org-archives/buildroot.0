From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  6 Nov 2018 15:06:46 +0100
Subject: [Buildroot] [PATCH 3/4] fs/f2fs: simplify overprovision option
In-Reply-To: <20181106140647.18251-1-grzegorz@blach.pl>
References: <20181106140647.18251-1-grzegorz@blach.pl>
Message-ID: <20181106140647.18251-3-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setting overprovision to 0 and omitting this option has exactly
the same effect.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 fs/f2fs/f2fs.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index d4b8310ba3..f35bb60ad0 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -16,10 +16,6 @@ F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
 F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
 F2FS_HOT_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_HOT_FILES))
 
-ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
-F2FS_OVERPROVISION = $(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
-endif
-
 ifeq ($(BR2_TARGET_ROOTFS_F2FS_DISCARD),y)
 F2FS_DISCARD = 1
 else
@@ -32,9 +28,9 @@ F2FS_OPTS = \
 	-f \
 	-l "$(F2FS_LABEL)" \
 	-t $(F2FS_DISCARD) \
+	-o $(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION) \
 	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
 	$(if $(F2FS_HOT_FILES),-E "$(F2FS_HOT_FILES)") \
-	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION)) \
 	$(if $(F2FS_FEATURES),-O "$(F2FS_FEATURES)")
 
 ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
-- 
2.19.1
