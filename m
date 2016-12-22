From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:26:54 +0100
Subject: [Buildroot] [git commit] package/util-linux: bump version to 2.29
Message-ID: <20161222093427.1824A81A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b83b31a824606645c272b49309bb9e44b91497b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=7f0d4d56a2f1ed34c3da4501e65fb79497b3dda1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-lib-crc32-prefix-public-functions.patch   | 182 ---------------------
 package/util-linux/util-linux.hash                 |   4 +-
 package/util-linux/util-linux.mk                   |   4 +-
 3 files changed, 4 insertions(+), 186 deletions(-)

diff --git a/package/util-linux/0001-lib-crc32-prefix-public-functions.patch b/package/util-linux/0001-lib-crc32-prefix-public-functions.patch
deleted file mode 100644
index fa68bd0..0000000
--- a/package/util-linux/0001-lib-crc32-prefix-public-functions.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From b39b4cac29dcc5d060d8e30344f693462502066a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 10 Oct 2016 17:42:42 -0300
-Subject: [PATCH] lib/crc32: prefix public functions
-
-Make the publicly-visible crc32 library functions prefixed by ul_, such
-as crc32() -> ul_crc32().
-This is because it clashes with the crc32() function from zlib.
-For newer versions of glib (2.50+) zlib and libblkid are required
-dependencies and otherwise results in build failure when building
-statically.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: submitted upstream
-
- disk-utils/fsck.cramfs.c         | 12 ++++++------
- disk-utils/mkfs.cramfs.c         |  6 +++---
- include/crc32.h                  |  4 ++--
- lib/crc32.c                      |  4 ++--
- libblkid/src/partitions/gpt.c    |  2 +-
- libblkid/src/superblocks/nilfs.c |  6 +++---
- libfdisk/src/gpt.c               |  2 +-
- 7 files changed, 18 insertions(+), 18 deletions(-)
-
-diff --git a/disk-utils/fsck.cramfs.c b/disk-utils/fsck.cramfs.c
-index 12009f2..f34e79f 100644
---- a/disk-utils/fsck.cramfs.c
-+++ b/disk-utils/fsck.cramfs.c
-@@ -214,7 +214,7 @@ static void test_crc(int start)
- 		return;
- 	}
- 
--	crc = crc32(0L, Z_NULL, 0);
-+	crc = ul_crc32(0L, Z_NULL, 0);
- 
- 	buf =
- 	    mmap(NULL, super.size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
-@@ -231,8 +231,8 @@ static void test_crc(int start)
- 	}
- 	if (buf != MAP_FAILED) {
- 		((struct cramfs_super *)((unsigned char *) buf + start))->fsid.crc =
--		    crc32(0L, Z_NULL, 0);
--		crc = crc32(crc, (unsigned char *) buf + start, super.size - start);
-+		    ul_crc32(0L, Z_NULL, 0);
-+		crc = ul_crc32(crc, (unsigned char *) buf + start, super.size - start);
- 		munmap(buf, super.size);
- 	} else {
- 		int retval;
-@@ -249,15 +249,15 @@ static void test_crc(int start)
- 				break;
- 			if (length == 0)
- 				((struct cramfs_super *)buf)->fsid.crc =
--				    crc32(0L, Z_NULL, 0);
-+				    ul_crc32(0L, Z_NULL, 0);
- 			length += retval;
- 			if (length > (super.size - start)) {
--				crc = crc32(crc, buf,
-+				crc = ul_crc32(crc, buf,
- 					  retval - (length -
- 						    (super.size - start)));
- 				break;
- 			}
--			crc = crc32(crc, buf, retval);
-+			crc = ul_crc32(crc, buf, retval);
- 		}
- 		free(buf);
- 	}
-diff --git a/disk-utils/mkfs.cramfs.c b/disk-utils/mkfs.cramfs.c
-index 4e6b3ab..55d6871 100644
---- a/disk-utils/mkfs.cramfs.c
-+++ b/disk-utils/mkfs.cramfs.c
-@@ -406,7 +406,7 @@ static unsigned int write_superblock(struct entry *root, char *base, int size)
- 	super->size = size;
- 	memcpy(super->signature, CRAMFS_SIGNATURE, sizeof(super->signature));
- 
--	super->fsid.crc = crc32(0L, Z_NULL, 0);
-+	super->fsid.crc = ul_crc32(0L, Z_NULL, 0);
- 	super->fsid.edition = opt_edition;
- 	super->fsid.blocks = total_blocks;
- 	super->fsid.files = total_nodes;
-@@ -700,7 +700,7 @@ int main(int argc, char **argv)
- 	loff_t fslen_ub = sizeof(struct cramfs_super);
- 	unsigned int fslen_max;
- 	char const *dirname, *outfile;
--	uint32_t crc = crc32(0L, Z_NULL, 0);
-+	uint32_t crc = ul_crc32(0L, Z_NULL, 0);
- 	int c;
- 	cramfs_is_big_endian = HOST_IS_BIG_ENDIAN; /* default is to use host order */
- 
-@@ -856,7 +856,7 @@ int main(int argc, char **argv)
- 		       sizeof(struct cramfs_super));
- 
- 	/* Put the checksum in. */
--	crc = crc32(crc, (unsigned char *) (rom_image+opt_pad), (offset-opt_pad));
-+	crc = ul_crc32(crc, (unsigned char *) (rom_image+opt_pad), (offset-opt_pad));
- 	((struct cramfs_super *) (rom_image+opt_pad))->fsid.crc = u32_toggle_endianness(cramfs_is_big_endian, crc);
- 	if (verbose)
- 		printf(_("CRC: %x\n"), crc);
-diff --git a/include/crc32.h b/include/crc32.h
-index ff2dd99..2551f50 100644
---- a/include/crc32.h
-+++ b/include/crc32.h
-@@ -4,8 +4,8 @@
- #include <sys/types.h>
- #include <stdint.h>
- 
--extern uint32_t crc32(uint32_t seed, const unsigned char *buf, size_t len);
--extern uint32_t crc32_exclude_offset(uint32_t seed, const unsigned char *buf, size_t len,
-+extern uint32_t ul_crc32(uint32_t seed, const unsigned char *buf, size_t len);
-+extern uint32_t ul_crc32_exclude_offset(uint32_t seed, const unsigned char *buf, size_t len,
- 		                              size_t exclude_off, size_t exclude_len);
- 
- #endif
-diff --git a/lib/crc32.c b/lib/crc32.c
-index a5e3216..824693d 100644
---- a/lib/crc32.c
-+++ b/lib/crc32.c
-@@ -108,7 +108,7 @@ static inline uint32_t crc32_add_char(uint32_t crc, unsigned char c)
-  * and does __not__ xor at the end. Then individual users can do
-  * whatever they need.
-  */
--uint32_t crc32(uint32_t seed, const unsigned char *buf, size_t len)
-+uint32_t ul_crc32(uint32_t seed, const unsigned char *buf, size_t len)
- {
- 	uint32_t crc = seed;
- 	const unsigned char *p = buf;
-@@ -121,7 +121,7 @@ uint32_t crc32(uint32_t seed, const unsigned char *buf, size_t len)
- 	return crc;
- }
- 
--uint32_t crc32_exclude_offset(uint32_t seed, const unsigned char *buf, size_t len,
-+uint32_t ul_crc32_exclude_offset(uint32_t seed, const unsigned char *buf, size_t len,
- 			      size_t exclude_off, size_t exclude_len)
- {
- 	uint32_t crc = seed;
-diff --git a/libblkid/src/partitions/gpt.c b/libblkid/src/partitions/gpt.c
-index dcc04e6..e6baa59 100644
---- a/libblkid/src/partitions/gpt.c
-+++ b/libblkid/src/partitions/gpt.c
-@@ -105,7 +105,7 @@ struct gpt_entry {
- static inline uint32_t count_crc32(const unsigned char *buf, size_t len,
- 				   size_t exclude_off, size_t exclude_len)
- {
--	return (crc32_exclude_offset(~0L, buf, len, exclude_off, exclude_len) ^ ~0L);
-+	return (ul_crc32_exclude_offset(~0L, buf, len, exclude_off, exclude_len) ^ ~0L);
- }
- 
- static inline unsigned char *get_lba_buffer(blkid_probe pr,
-diff --git a/libblkid/src/superblocks/nilfs.c b/libblkid/src/superblocks/nilfs.c
-index ee5c5f9..95538ef 100644
---- a/libblkid/src/superblocks/nilfs.c
-+++ b/libblkid/src/superblocks/nilfs.c
-@@ -89,9 +89,9 @@ static int nilfs_valid_sb(blkid_probe pr, struct nilfs_super_block *sb, int is_b
- 	if (bytes < crc_start || bytes > sizeof(struct nilfs_super_block))
- 		return 0;
- 
--	crc = crc32(le32_to_cpu(sb->s_crc_seed), (unsigned char *)sb, sumoff);
--	crc = crc32(crc, sum, 4);
--	crc = crc32(crc, (unsigned char *)sb + crc_start, bytes - crc_start);
-+	crc = ul_crc32(le32_to_cpu(sb->s_crc_seed), (unsigned char *)sb, sumoff);
-+	crc = ul_crc32(crc, sum, 4);
-+	crc = ul_crc32(crc, (unsigned char *)sb + crc_start, bytes - crc_start);
- 
- 	return blkid_probe_verify_csum(pr, crc, le32_to_cpu(sb->s_sum));
- }
-diff --git a/libfdisk/src/gpt.c b/libfdisk/src/gpt.c
-index 8377192..208699b 100644
---- a/libfdisk/src/gpt.c
-+++ b/libfdisk/src/gpt.c
-@@ -850,7 +850,7 @@ fail:
- static inline uint32_t count_crc32(const unsigned char *buf, size_t len,
- 				   size_t ex_off, size_t ex_len)
- {
--	return (crc32_exclude_offset(~0L, buf, len, ex_off, ex_len) ^ ~0L);
-+	return (ul_crc32_exclude_offset(~0L, buf, len, ex_off, ex_len) ^ ~0L);
- }
- 
- static inline uint32_t gpt_header_count_crc32(struct gpt_header *header)
--- 
-2.7.3
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 340ee94..4f19851 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.28/sha256sums.asc
-sha256 b89d37146f20bede93a42c847bce881a17e6dbd8066ff2db2bee733fa409f0cd  util-linux-2.28.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.29/sha256sums.asc
+sha256 2c59ea67cc7b564104f60532f6e0a95fe17a91acb870ba8fd7e986f273abf9e7  util-linux-2.29.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf03fd4..1bf2046 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.28
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.29
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
