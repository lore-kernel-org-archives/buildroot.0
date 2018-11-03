From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:28:00 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add option to define
 overprovision ratio
Message-ID: <20181103143122.00E3C88407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d27baa16a3ec67f454a6b558dd3d9925f763f0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: split from the initial patch from Grzegorz, reworded
Config.in help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 11 +++++++++++
 fs/f2fs/f2fs.mk   |  7 ++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index ca838096d9..71101d2b57 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -25,4 +25,15 @@ config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
 	  cold files. The default list includes most of multimedia
 	  file extensions such as jpg, gif, mpeg, mkv, and so on.
 
+config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
+	int "overprovision ratio"
+	default 0
+	help
+	  The percentage over the volume size for overprovision
+	  area. This area is hidden to users, and utilized by F2FS
+	  cleaner.
+
+	  Leave at 0 to use the default overprovision ratio of
+	  mkfs.f2fs.
+
 endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index 6025aad4bb..cf79779d2e 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -15,10 +15,15 @@ F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
 # ")
 F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
 
+ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
+F2FS_OVERPROVISION = $(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
+endif
+
 F2FS_OPTS = \
 	-f \
 	-l "$(F2FS_LABEL)" \
-	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)")
+	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
+	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION))
 
 ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
 
