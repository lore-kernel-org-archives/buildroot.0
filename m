From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu,  4 May 2017 17:26:02 +0200
Subject: [Buildroot] [PATCH 2/3] fs/ext2: Add
	BR2_TARGET_ROOTFS_EXT2_FEATURES option
In-Reply-To: <1493911563-2453-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1493911563-2453-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <1493911563-2453-2-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option lets the user specify ext2/3/4 features.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 fs/ext2/Config.in | 10 ++++++++++
 fs/ext2/ext2.mk   |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 842000a..eaf9aee 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -57,6 +57,16 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
 	default 0
 
+config BR2_TARGET_ROOTFS_EXT2_FEATURES
+	string "Filesystem features"
+	default "^64bit"
+	help
+	  Specify a comma-separated list of ext2/3/4 features.
+	  For more information about this option, see the mkefs' -O option in
+	  the manual page mke2fs(8).
+	  For more information about the features which can be set, see then
+	  manual page ext4(5).
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 1da74d5..2d93258 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,6 +12,11 @@ endif
 EXT2_OPTS = -d $(TARGET_DIR)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
 
+EXT2_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_FEATURES))
+ifneq ($(EXT2_FEATURES),)
+EXT2_OPTS += -O "$(EXT2_FEATURES)"
+endif
+
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
-- 
2.7.3
