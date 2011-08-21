From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 21 Aug 2011 19:52:02 +0300
Subject: [Buildroot] [PATCH 2/2] grub: fix ext2 segfaults
Message-ID: <20110821165202.25078.23846.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix grub issue when loading stage2 from ext2.
The symptom is periodically rebooting system.
This fix is borrowed from *somewhere* but it
does the job.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 boot/grub/grub.600-ext2-fix.patch |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 boot/grub/grub.600-ext2-fix.patch

diff --git a/boot/grub/grub.600-ext2-fix.patch b/boot/grub/grub.600-ext2-fix.patch
new file mode 100644
index 0000000..8bbd199
--- /dev/null
+++ b/boot/grub/grub.600-ext2-fix.patch
@@ -0,0 +1,32 @@
+diff -uprN grub-0.97-orig//debian/patches/00list grub-0.97/debian/patches/00list
+--- grub-0.97-orig//debian/patches/00list	2011-08-21 17:08:01.651441450 +0300
++++ grub-0.97/debian/patches/00list	2011-08-21 17:13:11.712978964 +0300
+@@ -24,6 +24,7 @@ crossreference_manpages.diff
+ ext3_256byte_inode.diff
+ use_grub-probe_in_grub-install.diff
+ 128gib_disk_limit.diff
++ext2_fix.diff
+ 
+ # We aren't building amd64 binaries, see #244498
+ #fix_amd64_compile.diff
+diff -uprN grub-0.97-orig//debian/patches/ext2_fix.diff grub-0.97/debian/patches/ext2_fix.diff
+--- grub-0.97-orig//debian/patches/ext2_fix.diff	1970-01-01 03:00:00.000000000 +0300
++++ grub-0.97/debian/patches/ext2_fix.diff	2011-08-21 17:12:10.088673380 +0300
+@@ -0,0 +1,17 @@
++diff -uprN grub-0.97-orig//stage2/fsys_ext2fs.c grub-0.97/stage2/fsys_ext2fs.c
++--- grub-0.97-orig//stage2/fsys_ext2fs.c	2011-08-21 17:08:01.647441447 +0300
+++++ grub-0.97/stage2/fsys_ext2fs.c	2011-08-21 17:11:05.312352171 +0300
++@@ -263,7 +263,12 @@ struct ext2_dir_entry
++ #define EXT2_ADDR_PER_BLOCK(s)          (EXT2_BLOCK_SIZE(s) / sizeof (__u32))
++ #define EXT2_ADDR_PER_BLOCK_BITS(s)		(log2(EXT2_ADDR_PER_BLOCK(s)))
++ 
++-#define EXT2_INODE_SIZE(s)		(SUPERBLOCK->s_inode_size)
+++#define EXT2_GOOD_OLD_REV   0   /* The good old (original) format */
+++#define EXT2_DYNAMIC_REV    1   /* V2 format w/ dynamic inode sizes */
+++#define EXT2_GOOD_OLD_INODE_SIZE 128
+++#define EXT2_INODE_SIZE(s)  (((s)->s_rev_level == EXT2_GOOD_OLD_REV) ? \
+++		EXT2_GOOD_OLD_INODE_SIZE : \
+++		(s)->s_inode_size)
++ #define EXT2_INODES_PER_BLOCK(s)	(EXT2_BLOCK_SIZE(s)/EXT2_INODE_SIZE(s))
++ 
++ /* linux/ext2_fs.h */
