From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  4 Dec 2014 23:01:14 +0100
Subject: [Buildroot] [PATCH 3/3 v2] fs/ext2: add option to specify a
	filesystem label
In-Reply-To: <cover.1417730349.git.yann.morin.1998@free.fr>
References: <cover.1417730349.git.yann.morin.1998@free.fr>
Message-ID: <d98afa0b717cf9585358913fd3d97ba6101d2a2b.1417730349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Filesystems of the ext familly can carry a filesystem label.
Add an option for the user to specify such a label.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in | 3 +++
 fs/ext2/ext2.mk   | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index adba6f3..65828f2 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -42,6 +42,9 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 	default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
 	default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
 
+config BR2_TARGET_ROOTFS_EXT2_LABEL
+	string "filesystem label"
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 96b7a4a..758b967 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,6 +18,12 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
+# Not qstrip-ing the variable, because it may contain spaces,
+# but we must qstrip it when checking.
+ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
+EXT2_OPTS += -l $(BR2_TARGET_ROOTFS_EXT2_LABEL)
+endif
+
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
 define ROOTFS_EXT2_CMD
-- 
1.9.1
