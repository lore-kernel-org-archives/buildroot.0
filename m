From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 21:07:40 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add option to define list of hot
 file extensions
Message-ID: <20181108202325.05A0E817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25076c94c0bfbd02790ba2486db5ee558016a1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 7 +++++++
 fs/f2fs/f2fs.mk   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index 57473fdc43..20d70fbfa5 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -26,6 +26,13 @@ config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
 	  of multimedia file extensions such as jpg, gif, mpeg, mkv,
 	  and so on.
 
+config BR2_TARGET_ROOTFS_F2FS_HOT_FILES
+	string "extension list for hot files"
+	help
+	  Specify a comma separated file extension list in order f2fs
+	  to treat them as hot files. The default list includes only
+	  a db extension.
+
 config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
 	int "overprovision ratio"
 	default 0
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index 63e3cdae7b..d4b8310ba3 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -14,6 +14,7 @@ endif
 F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
 # ")
 F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
+F2FS_HOT_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_HOT_FILES))
 
 ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
 F2FS_OVERPROVISION = $(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
@@ -32,6 +33,7 @@ F2FS_OPTS = \
 	-l "$(F2FS_LABEL)" \
 	-t $(F2FS_DISCARD) \
 	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
+	$(if $(F2FS_HOT_FILES),-E "$(F2FS_HOT_FILES)") \
 	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION)) \
 	$(if $(F2FS_FEATURES),-O "$(F2FS_FEATURES)")
 
