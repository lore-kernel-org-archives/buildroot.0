From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:41:05 +0100
Subject: [Buildroot] [git commit] fs/ext2: Remove support for
	auto-calculation of rootfs size
Message-ID: <20170325134226.A8E8C8211A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Auto-calculation of the rootfs size cannot be done in a reliable way
as it depends on the host filesystem and is broken on non ext4 host
(see bugs [1] [2]). So let the user specify the size he wants for his
rootfs.

[1] https://bugs.busybox.net/show_bug.cgi?id=8831
[2] https://bugs.busybox.net/show_bug.cgi?id=9496

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: as suggested by Arnout, use 60 MB as the default size instead
of 64 MB.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy        | 14 ++++++++++++++
 fs/ext2/Config.in       | 13 +++----------
 fs/ext2/ext2.mk         |  1 -
 package/mke2img/mke2img | 20 +-------------------
 4 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4e14a98..dfd4d67 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,20 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
+	int "extra size in blocks has been removed"
+	default 0
+	help
+	  Since the support for auto calculation of the filesystem size has been
+	  removed, this option is now useless and must be 0.
+	  You may want to check that BR2_TARGET_ROOTFS_EXT2_BLOCKS matchs
+	  your needs.
+
+config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS != 0
+	select BR2_LEGACY
+
 config BR2_PACKAGE_SYSTEMD_KDBUS
 	bool "systemd-kdbus has been removed"
 	select BR2_LEGACY
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index b8eeed2..19ed140 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -44,22 +44,15 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 config BR2_TARGET_ROOTFS_EXT2_LABEL
 	string "filesystem label"
 
+# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
-	int "exact size in blocks (leave at 0 for auto calculation)"
-	default 0
+	int "exact size in blocks"
+	default 61440
 
 config BR2_TARGET_ROOTFS_EXT2_INODES
 	int "exact number of inodes (leave at 0 for auto calculation)"
 	default 0
 
-config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
-	int "extra size in blocks" if BR2_TARGET_ROOTFS_EXT2_BLOCKS = 0
-	default 0
-	help
-	  Enter here the number of extra blocks of free space you
-	  want on your filesystem. By default, Buildroot will not
-	  leave much space free.
-
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
 	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index cfb34c4..30f1d17 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -9,7 +9,6 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endif
-EXT2_OPTS += -B $(BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index c2e0d02..b773aa9 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -17,14 +17,12 @@ main() {
     # Default values
     gen=2
     rev=1
-    nb_extra_blocks=0
     nb_extra_inodes=0
 
-    while getopts :hb:B:i:I:r:d:o:G:R:l:u: OPT; do
+    while getopts :hb:i:I:r:d:o:G:R:l:u: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         b)  nb_blocks=${OPTARG};;
-        B)  nb_extra_blocks=${OPTARG};;
         i)  nb_inodes=${OPTARG};;
         I)  nb_extra_inodes=${OPTARG};;
         r)  nb_res_blocks=${OPTARG};;
@@ -64,22 +62,6 @@ main() {
     fi
     nb_inodes=$((nb_inodes+nb_extra_inodes))
 
-    # calculate needed blocks
-    if [ -z "${nb_blocks}" ]; then
-        # size ~= superblock, block+inode bitmaps, inodes (8 per block),
-        # blocks; we scale inodes / blocks with 10% to compensate for
-        # bitmaps size + slack
-        nb_blocks=$(du -s -k "${root_dir}" |sed -r -e 's/[[:space:]]+.*$//')
-        nb_blocks=$((500+(nb_blocks+nb_inodes/8)*11/10))
-        if [ ${gen} -ge 3 ]; then
-            # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks)
-            # for the journal
-            # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
-            nb_blocks=$((nb_blocks+1300))
-        fi
-    fi
-    nb_blocks=$((nb_blocks+nb_extra_blocks))
-
     # Upgrade to rev1 if needed
     if [ ${rev} -ge 1 ]; then
         tune2fs_O_opts+=",filetype,sparse_super"
