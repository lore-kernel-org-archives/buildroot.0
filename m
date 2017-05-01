From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 17:58:43 +0200
Subject: [Buildroot] [PATCH 8/9] package/mke2img: add option to specify
	block size
In-Reply-To: <cover.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <c91bac5c4f448379ad020c02fd4620aa16c82727.1493654310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ext filesystems can use a block size of 1024, 2048, or 4096 bytes, the
former being interesting to store small files, while the latter being
more intersting to store bigger files.

So far, we were using the defualt, which was to use a 1024-byte block.
Continue doing so (for now...).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/ext2.mk         |  1 +
 package/mke2img/mke2img | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 16e14777c3..0d5fc7f118 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -12,6 +12,7 @@ EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 EXT2_OPTS = \
 	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
 	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
+	-B 1024 \
 	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
 	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) \
diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 266df483aa..399012a2be 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -19,9 +19,10 @@ main() {
     rev=1
     nb_extra_inodes=0
 
-    while getopts :hb:i:I:r:d:o:G:R:l:u: OPT; do
+    while getopts :hB:b:i:I:r:d:o:G:R:l:u: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
+        B)  block_size="${OPTARG}";;
         b)  nb_blocks=${OPTARG};;
         i)  nb_inodes=${OPTARG};;
         I)  nb_extra_inodes=${OPTARG};;
@@ -47,6 +48,11 @@ main() {
     if [ -z "${nb_blocks}" ]; then
         error "you must specify the size of the output image with '-b'\n"
     fi
+    case "${block_size}" in
+    1024|2048|4096) ;; # Sole valid values
+    '') error "you must specify the size of a block with -B\n";;
+    *)  error "invalid block size '%s' (valid: 1024. 2048, 4096)\n" "${block_size}";;
+    esac
     case "${gen}:${rev}" in
     2:0|2:1|3:1|4:1)
         ;;
@@ -91,7 +97,7 @@ main() {
     fi
 
     # Generate the filesystem
-    genext2fs_opts=( -z -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
+    genext2fs_opts=( -z -B ${block_size} -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
     if [ -n "${nb_res_blocks}" ]; then
         genext2fs_opts+=( -m ${nb_res_blocks} )
     fi
-- 
2.11.0
