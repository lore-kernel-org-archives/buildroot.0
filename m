From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:10:29 +0100
Subject: [Buildroot] [PATCH 4/4] fs/ext: add support for ext2 rev0 and rev1
In-Reply-To: <cover.1361142401.git.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
Message-ID: <2f41f484f574512df6919967f641cf2152049a22.1361142401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some bootloaders have a buggy ext2 support, and require ext2 rev1
instead of the traditional ext2 rev0 that genext2fs produces.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext/Config.in   |   19 ++++++++++++-------
 fs/ext/genextfs.sh |   38 +++++++++++++++++++++++++++-----------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/fs/ext/Config.in b/fs/ext/Config.in
index 1a7a315..be0ed9c 100644
--- a/fs/ext/Config.in
+++ b/fs/ext/Config.in
@@ -7,10 +7,14 @@ if BR2_TARGET_ROOTFS_EXT
 
 choice
 	bool "ext generation"
-	default BR2_TARGET_ROOTFS_EXT_EXT2
+	default BR2_TARGET_ROOTFS_EXT_EXT2r0
 
-config BR2_TARGET_ROOTFS_EXT_EXT2
-	bool "ext2"
+config BR2_TARGET_ROOTFS_EXT_EXT2r0
+	bool "ext2 (rev0)"
+
+config BR2_TARGET_ROOTFS_EXT_EXT2r1
+	bool "ext2 (rev1)"
+	select BR2_PACKAGE_HOST_E2FSPROGS
 
 config BR2_TARGET_ROOTFS_EXT_EXT3
 	bool "ext3"
@@ -23,10 +27,11 @@ config BR2_TARGET_ROOTFS_EXT_EXT4
 endchoice
 
 config BR2_TARGET_ROOTFS_EXT_GEN
-	int
-	default 2 if BR2_TARGET_ROOTFS_EXT_EXT2
-	default 3 if BR2_TARGET_ROOTFS_EXT_EXT3
-	default 4 if BR2_TARGET_ROOTFS_EXT_EXT4
+	string
+	default 2.0 if BR2_TARGET_ROOTFS_EXT_EXT2r0
+	default 2.1 if BR2_TARGET_ROOTFS_EXT_EXT2r1
+	default 3   if BR2_TARGET_ROOTFS_EXT_EXT3
+	default 4   if BR2_TARGET_ROOTFS_EXT_EXT4
 
 config BR2_TARGET_ROOTFS_EXT_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
diff --git a/fs/ext/genextfs.sh b/fs/ext/genextfs.sh
index fcbd43c..ef47a25 100755
--- a/fs/ext/genextfs.sh
+++ b/fs/ext/genextfs.sh
@@ -6,11 +6,13 @@ export LC_ALL=C
 
 CALC_BLOCKS=1
 CALC_INODES=1
+EXT2_REV=0
 
 while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv234 f
 do
     case $f in
-	2|3|4) GEN=$f ;;
+	2.*) GEN=2; EXT2_REV=${f#*.} ;;
+	3|4) GEN=$f ;;
 	b) CALC_BLOCKS=0 ;;
 	N) CALC_INODES=0; INODES=$OPTARG ;;
 	d) TARGET_DIR=$OPTARG ;;
@@ -56,25 +58,39 @@ for o; do
     esac
 done
 
+ext_fsck() {
+    gen="${1}"
+    img="${2}"
+    ret=0
+    fsck.ext${gen} -pDf "${img}" >/dev/null || ret=$?
+    # Exit codes 1 & 2 are OK, it means fs errors
+    # were successfully corrected
+    case ${ret} in
+	0|1|2) ;;
+	*)   exit 1;;
+    esac
+    # fsck.ext* will force a UUID, which we do not want
+    tune2fs -U clear "${img}" >/dev/null
+}
+
 # Generate the base ext2 file system
 genext2fs "$@"
 
+# Upgrade to ext2 rev1 if needed
+if [ ${EXT2_REV} -ge 1 -o ${GEN} -ge 3 ]; then
+    tune2fs -O filetype "${IMG}" >/dev/null
+    ext_fsck 2 "${IMG}"
+fi
+
 # Upgrade to ext3 if needed
 if [ ${GEN} -ge 3 ]; then
     tune2fs -j -J size=1 "${IMG}" >/dev/null
+    ext_fsck 3 "${IMG}"
 fi
 
 # Upgrade to ext4 if needed
 if [ ${GEN} -ge 4 ]; then
     tune2fs -O extents,uninit_bg,dir_index "${IMG}" >/dev/null
-    ret=0
-    fsck.ext4 -pDf "${IMG}" >/dev/null || ret=$?
-    # Exit codes 1 & 2 are OK, it means fs errors
-    # were successfully corrected
-    case ${ret} in
-	0|1|2) ;;
-	*)   exit 1;;
-    esac
-    # fsck.ext4 will force a UUID, which we do not want
-    tune2fs -U clear "${IMG}" >/dev/null
+    NEED_FSCK=1
+    ext_fsck 4 "${IMG}"
 fi
-- 
1.7.2.5
