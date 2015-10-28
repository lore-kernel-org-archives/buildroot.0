From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2015 00:06:16 +0100
Subject: [Buildroot] [PATCH] fs/ext2: add options for extra space and extra
	inodes
Message-ID: <1446073576-20337-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two options to the ext2 filesystem, one to add extra free space, one
to add extra free inodes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 fs/ext2/Config.in       | 20 ++++++++++++++++++--
 fs/ext2/ext2.mk         |  2 ++
 package/mke2img/mke2img |  8 +++++++-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 5b1cd0c..fb06cdd 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -45,13 +45,29 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
-	int "size in blocks (leave at 0 for auto calculation)"
+	int "exact size in blocks (leave at 0 for auto calculation)"
 	default 0
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
-	int "inodes (leave at 0 for auto calculation)"
+	int "exact number of inodes (leave at 0 for auto calculation)"
 	default 0
 
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
+	int "extra size in blocks" if BR2_TARGET_ROOTFS_EXT2_BLOCKS = 0
+	default 0
+	help
+	  Enter here the nmuber of extra blocks of free space you
+	  want on your filesystem. By default, Buildroot will not
+	  leave much space free.
+
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
+	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
+	default 0
+	help
+	  Enter here the nmuber of extra free inodes you want on
+	  your filesystem. By default, Buildroot will not leave
+	  many free inodes.
+
 config BR2_TARGET_ROOTFS_EXT2_RESBLKS
 	int "reserved blocks percentage"
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index cab66a5..7417f81 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -9,10 +9,12 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endif
+EXT2_OPTS += -B $(BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
 endif
+EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 5e2f62f..d772af5 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -17,12 +17,16 @@ main() {
     # Default values
     gen=2
     rev=1
+    nb_extra_blocks=0
+    nb_extra_inodes=0
 
-    while getopts :hb:i:r:d:o:G:R:l:u: OPT; do
+    while getopts :hb:B:i:I:r:d:o:G:R:l:u: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         b)  nb_blocks=${OPTARG};;
+        B)  nb_extra_blocks=${OPTARG};;
         i)  nb_inodes=${OPTARG};;
+        I)  nb_extra_inodes=${OPTARG};;
         r)  nb_res_blocks=${OPTARG};;
         d)  root_dir="${OPTARG}";;
         o)  image="${OPTARG}";;
@@ -58,6 +62,7 @@ main() {
         nb_inodes=$(find "${root_dir}" | wc -l)
         nb_inodes=$((nb_inodes+400))
     fi
+    nb_inodes=$((nb_inodes+nb_extra_inodes))
 
     # calculate needed blocks
     if [ -z "${nb_blocks}" ]; then
@@ -73,6 +78,7 @@ main() {
             nb_blocks=$((nb_blocks+1300))
         fi
     fi
+    nb_blocks=$((nb_blocks+nb_extra_blocks))
 
     # Upgrade to rev1 if needed
     if [ ${rev} -ge 1 ]; then
-- 
1.9.1
