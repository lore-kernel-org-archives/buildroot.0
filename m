From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu,  5 Apr 2018 14:03:30 -0500
Subject: [Buildroot] [PATCH] fs/cramfs: re-enable big endian support
Message-ID: <1522955010-10443-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After https://patchwork.ozlabs.org/patch/873134/ and
https://patchwork.ozlabs.org/patch/873135/ are merged, this patch adds
back in big endian support.

Upstream: https://github.com/npitre/cramfs-tools/pull/1

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 fs/cramfs/cramfs.mk                                |   4 +
 .../0001-mkcramfs-option-to-swap-endian.patch      | 157 +++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 package/cramfs/0001-mkcramfs-option-to-swap-endian.patch

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 68b776f..baf275a 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -4,6 +4,10 @@
 #
 ################################################################################
 
+ifeq ($(BR2_ENDIAN),"BIG")
+CRAMFS_OPTS = -r
+endif
+
 ifeq ($(BR2_TARGET_ROOTFS_CRAMFS_XIP),y)
 ifeq ($(BR2_USE_MMU),y)
 CRAMFS_OPTS = -X -X
diff --git a/package/cramfs/0001-mkcramfs-option-to-swap-endian.patch b/package/cramfs/0001-mkcramfs-option-to-swap-endian.patch
new file mode 100644
index 0000000..44f85e0
--- /dev/null
+++ b/package/cramfs/0001-mkcramfs-option-to-swap-endian.patch
@@ -0,0 +1,157 @@
+From ff7642bb17256033ed260117a0e20e71424a0ba2 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 5 Apr 2018 13:26:17 -0500
+Subject: [PATCH] mkcramfs: option to swap endian
+
+It has been tested on linux-x86 (little endian) host to generate a
+linux powerpc-e300c3 (big endian) cramfs image.
+
+Based on this original patchset
+https://sourceforge.net/p/cramfs/patches/10/
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ mkcramfs.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 59 insertions(+), 3 deletions(-)
+
+diff --git a/mkcramfs.c b/mkcramfs.c
+index bbfbc78..af8bd29 100644
+--- a/mkcramfs.c
++++ b/mkcramfs.c
+@@ -122,6 +122,7 @@ static int opt_xip = 0;
+ static int opt_xip_mmu = 0;
+ static char *opt_image = NULL;
+ static char *opt_name = NULL;
++static int swap_endian = 0;
+ 
+ static int warn_dev, warn_gid, warn_namelen, warn_skip, warn_size, warn_uid;
+ static const char *const memory_exhausted = "memory exhausted";
+@@ -160,6 +161,7 @@ static void usage(int status)
+ 		" -i file    insert a file image into the filesystem (requires >= 2.4.0)\n"
+ 		" -n name    set name of cramfs filesystem\n"
+ 		" -p         pad by %d bytes for boot code\n"
++		" -r         reverse endian-ness of filesystem\n"
+ 		" -s         sort directory entries (old option, ignored)\n"
+ 		" -v         be more verbose\n"
+ 		" -x         use extended block pointers (requires >= 4.15)\n"
+@@ -511,6 +513,49 @@ static unsigned int parse_directory(struct entry *root_entry, const char *name,
+ 	return totalsize;
+ }
+ 
++/* routines to swap endianness/bitfields in inode/superblock block data */
++static void fix_inode(struct cramfs_inode *inode)
++{
++#define wswap(x)    (((x)>>24) | (((x)>>8)&0xff00) | (((x)&0xff00)<<8) | (((x)&0xff)<<24))
++	/* attempt #2 */
++	inode->mode = (inode->mode >> 8) | ((inode->mode&0xff)<<8);
++	inode->uid = (inode->uid >> 8) | ((inode->uid&0xff)<<8);
++	inode->size = (inode->size >> 16) | (inode->size&0xff00) |
++		((inode->size&0xff)<<16);
++	((u32*)inode)[2] = wswap(inode->offset | (inode->namelen<<26));
++}
++
++static void fix_offset(struct cramfs_inode *inode, u32 offset)
++{
++	u32 tmp = wswap(((u32*)inode)[2]);
++	((u32*)inode)[2] = wswap((offset >> 2) | (tmp&0xfc000000));
++}
++
++static void fix_block_pointer(u32 *p)
++{
++	*p = wswap(*p);
++}
++
++static void fix_super(struct cramfs_super *super)
++{
++	u32 *p = (u32*)super;
++
++	/* fix superblock fields */
++	p[0] = wswap(p[0]);	/* magic */
++	p[1] = wswap(p[1]);	/* size */
++	p[2] = wswap(p[2]);	/* flags */
++	p[3] = wswap(p[3]);	/* future */
++
++	/* fix filesystem info fields */
++	p = (u32*)&super->fsid;
++	p[0] = wswap(p[0]);	/* crc */
++	p[1] = wswap(p[1]);	/* edition */
++	p[2] = wswap(p[2]);	/* blocks */
++	p[3] = wswap(p[3]);	/* files */
++
++	fix_inode(&super->root);
++}
++
+ /* Returns sizeof(struct cramfs_super), which includes the root inode. */
+ static unsigned int write_superblock(struct entry *root, unsigned char *base,
+ 				     int size)
+@@ -545,6 +590,7 @@ static unsigned int write_superblock(struct entry *root, unsigned char *base,
+ 	super->root.gid = root->gid;
+ 	super->root.size = root->size;
+ 	super->root.offset = offset >> 2;
++	if (swap_endian) fix_super(super);
+ 
+ 	return offset;
+ }
+@@ -559,7 +605,10 @@ static void set_data_offset(struct entry *entry, unsigned char *base, unsigned l
+ 	if (offset >= (1 << (2 + CRAMFS_OFFSET_WIDTH))) {
+ 		error_msg_and_die("filesystem too big");
+ 	}
+-	inode->offset = (offset >> 2);
++	if (swap_endian)
++		fix_offset(inode, offset);
++	else
++		inode->offset = (offset >> 2);
+ }
+ 
+ /*
+@@ -645,6 +694,7 @@ static unsigned int write_directory_structure(struct entry *entry,
+ 				stack_entries++;
+ 			}
+ 			entry = entry->next;
++			if (swap_endian) fix_inode(inode);
+ 		}
+ 
+ 		/*
+@@ -858,6 +908,7 @@ static unsigned int write_blocks(unsigned char *base, unsigned int offset, struc
+ 		data += input;
+ 		size -= input;
+ 		*(u32 *) (base + offset) = blockptr_val;
++		if (swap_endian) fix_block_pointer((u32*)(base + offset));
+ 		offset += 4;
+ 		if (blockptr_val & CRAMFS_BLK_FLAGS)
+ 			super_flags |= CRAMFS_FLAG_EXT_BLOCK_POINTERS;
+@@ -1272,7 +1323,7 @@ int main(int argc, char **argv)
+ 		progname = argv[0];
+ 
+ 	/* command line options */
+-	while ((c = getopt(argc, argv, "hEe:i:n:psvxXzD:q")) != EOF) {
++	while ((c = getopt(argc, argv, "hEe:i:n:prsvxXzD:q")) != EOF) {
+ 		switch (c) {
+ 		case 'h':
+ 			usage(MKFS_OK);
+@@ -1300,6 +1351,10 @@ int main(int argc, char **argv)
+ 			opt_pad = PAD_SIZE;
+ 			fslen_ub += PAD_SIZE;
+ 			break;
++		case 'r':
++			swap_endian = 1;
++			printf("Swapping filesystem endian-ness\n");
++			break;
+ 		case 's':
+ 			/* old option, ignored */
+ 			break;
+@@ -1416,9 +1471,10 @@ int main(int argc, char **argv)
+ 	/* Put the checksum in. */
+ 	crc = crc32(0L, Z_NULL, 0);
+ 	crc = crc32(crc, (rom_image+opt_pad), (offset-opt_pad));
+-	((struct cramfs_super *) (rom_image+opt_pad))->fsid.crc = crc;
+ 	if (opt_verbose)
+ 	printf("CRC: %x\n", crc);
++	if (swap_endian) crc = wswap(crc);
++	((struct cramfs_super *) (rom_image+opt_pad))->fsid.crc = crc;
+ 
+ 	/* Check to make sure we allocated enough space. */
+ 	if (fslen_ub < offset) {
+-- 
+1.9.1
+
-- 
1.9.1
