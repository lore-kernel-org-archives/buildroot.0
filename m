From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:07:22 +0100
Subject: [Buildroot] [git commit] fs/ext2: add option to specify a
	filesystem label
Message-ID: <20141207210727.3B5E6800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c83fa6b0af75650724208598628058802d2f7192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Filesystems of the ext familly can carry a filesystem label.
Add an option for the user to specify such a label.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: K??roly Kasza <kaszak@gmail.com>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in |    3 +++
 fs/ext2/ext2.mk   |    8 ++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

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
