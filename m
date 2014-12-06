From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 23:40:06 +0100
Subject: [Buildroot] [PATCH 3/3 v4] fs/ext2: add option to specify a
	filesystem label
In-Reply-To: <cover.1417905401.git.yann.morin.1998@free.fr>
References: <cover.1417905401.git.yann.morin.1998@free.fr>
Message-ID: <7dfc8f18b87384622f5e99d73f9efe274a4539ff.1417905401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Filesystems of the ext familly can carry a filesystem label.
Add an option for the user to specify such a label.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: K?roly Kasza <kaszak@gmail.com>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - fix quoting for when the label contains a space  (K?roly)
---
 fs/ext2/Config.in | 3 +++
 fs/ext2/ext2.mk   | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 8751b62..5b1cd0c 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -41,6 +41,9 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 	default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
 	default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
 
+config BR2_TARGET_ROOTFS_EXT2_LABEL
+	string "filesystem label"
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 96b7a4a..1cac72e 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,6 +18,14 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
+# Not qstrip-ing the variable, because it may contain spaces, but we must
+# qstrip it when checking. Furthermore, we need to further quote it, so
+# that the quotes do not get eaten by the echo statement when creating the
+# fakeroot script
+ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
+EXT2_OPTS += -l '$(BR2_TARGET_ROOTFS_EXT2_LABEL)'
+endif
+
 ROOTFS_EXT2_DEPENDENCIES = host-mke2img
 
 define ROOTFS_EXT2_CMD
-- 
1.9.1
