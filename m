From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  6 Nov 2018 15:06:45 +0100
Subject: [Buildroot] [PATCH 2/4] fs/f2fs: add option to define list of hot
 file extensions
In-Reply-To: <20181106140647.18251-1-grzegorz@blach.pl>
References: <20181106140647.18251-1-grzegorz@blach.pl>
Message-ID: <20181106140647.18251-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 fs/f2fs/Config.in | 7 +++++++
 fs/f2fs/f2fs.mk   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index a44fc0d8db..74712541a4 100644
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
 
-- 
2.19.1
