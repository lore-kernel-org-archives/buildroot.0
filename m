From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 24 Mar 2017 17:20:32 +0100
Subject: [Buildroot] [PATCH 4/4] fs/ext2: Make filesystem size a string
In-Reply-To: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <1490372432-879-4-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It allows the user to enter a size with 'k', 'm', 'g', or 't' suffix.
Also drop BR2_TARGET_ROOTFS_EXT2_BLOCKS and use
BR2_TARGET_ROOTFS_EXT2_SIZE instead.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 Config.in.legacy  | 13 +++++++++++++
 fs/ext2/Config.in | 11 ++++++++---
 fs/ext2/ext2.mk   |  2 +-
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b5a68aa..04fd247 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,19 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_TARGET_ROOTFS_EXT2_BLOCKS
+	int "exact size in KB has been removed"
+	default 65536
+	help
+	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
+	  Set this option to 65536 and set BR2_TARGET_ROOTFS_EXT2_SIZE to your
+	  needs.
+
+config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 65536
+	select BR2_LEGACY
+
 config BR2_PACKAGE_HOST_MKE2IMG
 	bool "host mke2img has been removed"
 	select BR2_LEGACY
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index dfc3b0a..8486a1e 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -44,9 +44,14 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
-config BR2_TARGET_ROOTFS_EXT2_BLOCKS
-	int "exact size in KB"
-	default 65536
+config BR2_TARGET_ROOTFS_EXT2_SIZE
+	string "exact size"
+	default "64M"
+	help
+	  The size of the filesystem image. If it does not have a suffix, it is
+	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
+	  'g', 't' (either upper-case or lower-case), then it is interpreted in
+	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 3872e52..7b64c42 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -30,7 +30,7 @@ endif
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
+	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(strip $(BR2_TARGET_ROOTFS_EXT2_SIZE))
 endef
 
 rootfs-ext2-symlink:
-- 
2.7.3
