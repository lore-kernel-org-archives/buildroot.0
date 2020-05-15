From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:07:29 +0200
Subject: [Buildroot] [git commit] package/exfatprogs: bump to version 1.0.3
Message-ID: <20200515195124.518FE91958@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbad745139125ea0995a436fd81ce7ea233638c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches that are now upstream.

We don't need to autoreconf since we are using a release tarball.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xfatprogs-add-missing-include-sys-types.h.patch |  49 -------
 ...-use-PRIu64-PRIx64-to-printf-64-bit-types.patch | 144 ---------------------
 ...3-fsck-fix-node-may-be-used-uninitialized.patch |  63 ---------
 .../0004-fsck-Zero-init-using-memset.patch         |  37 ------
 package/exfatprogs/exfatprogs.hash                 |   2 +-
 package/exfatprogs/exfatprogs.mk                   |   5 +-
 6 files changed, 3 insertions(+), 297 deletions(-)

diff --git a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
deleted file mode 100644
index f3705d2ebc..0000000000
--- a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c00522e0a890265d18dcdc92738e524d48297ed5 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 17 Apr 2020 13:10:49 -0600
-Subject: [PATCH] exfatprogs: add missing #include <sys/types.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-../include/libexfat.h:72:1: error: unknown type name ???ssize_t???
- ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
- ^
-../include/libexfat.h:72:52: error: unknown type name ???off_t???
- ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
-                                                    ^
-../include/libexfat.h:73:1: error: unknown type name ???ssize_t???
- ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
- ^
-../include/libexfat.h:73:53: error: unknown type name ???off_t???
- ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
-                                                     ^
-../include/libexfat.h:75:1: error: unknown type name ???ssize_t???
- ssize_t exfat_utf16_enc(const char *in_str, __u16 *out_str, size_t out_size);
- ^
-../include/libexfat.h:76:1: error: unknown type name ???ssize_t???
- ssize_t exfat_utf16_dec(const __u16 *in_str, size_t in_len,
- ^
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status: https://github.com/exfatprogs/exfatprogs/pull/50]
----
- include/libexfat.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/libexfat.h b/include/libexfat.h
-index ed1fb4c..36c8bdd 100644
---- a/include/libexfat.h
-+++ b/include/libexfat.h
-@@ -6,6 +6,7 @@
- #ifndef _LIBEXFAT_H
- 
- #include <stdbool.h>
-+#include <sys/types.h>
- #include <wchar.h>
- 
- #define KB			(1024)
--- 
-2.20.1
-
diff --git a/package/exfatprogs/0002-mkfs-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch b/package/exfatprogs/0002-mkfs-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
deleted file mode 100644
index 67dcc070ec..0000000000
--- a/package/exfatprogs/0002-mkfs-fsck-use-PRIu64-PRIx64-to-printf-64-bit-types.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From fb96662501a13c7a82304b2c145146c4a8741bf8 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 9 May 2020 13:43:37 +0200
-Subject: [PATCH] mkfs/fsck: use PRIu64/PRIx64 to print 64-bit types
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Change cpu_to_le64()/cpu_to_le32()/cpu_to_le16() defines to
-return determined types (instead of __le64/__le32/__le16) and
-use PRIu64/PRIx64 to print 64-bit types.
-
-Fixes:
-
-  mkfs.c:60:14: error: format ???%llu??? expects argument of type ???long long unsigned int???, but argument 2 has type ???long unsigned int??? [-Werror=format=]
-    exfat_debug("Volume Length(sectors) : %llu\n",
-                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-  fsck.c:484:13: error: format ???%llu??? expects argument of type ???long long unsigned int???, but argument 2 has type ???long unsigned int??? [-Werror=format=]
-     exfat_err("too large sector count: %llu\n, expected: %llu\n",
-               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-  fsck.c:851:13: error: format ???%llu??? expects argument of type ???long long unsigned int???, but argument 2 has type ???long unsigned int??? [-Werror=format=]
-     exfat_err("valid size %llu greater than size %llu: %s\n",
-               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-  fsck.c:930:14: error: format ???%llx??? expects argument of type ???long long unsigned int???, but argument 3 has type ???long unsigned int??? [-Werror=format=]
-     exfat_debug("start cluster %#x, size %#llx\n",
-                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-  fsck.c:938:13: error: format ???%llx??? expects argument of type ???long long unsigned int???, but argument 2 has type ???long unsigned int??? [-Werror=format=]
-     exfat_err("invalid size of allocation bitmap. 0x%llx\n",
-               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-  fsck.c:992:13: error: format ???%llx??? expects argument of type ???long long unsigned int???, but argument 2 has type ???long unsigned int??? [-Werror=format=]
-     exfat_err("invalid size of upcase table. 0x%llx\n",
-               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-[Upstream: https://github.com/exfatprogs/exfatprogs/pull/91]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- fsck/fsck.c            | 11 ++++++-----
- include/exfat_ondisk.h |  6 +++---
- mkfs/mkfs.c            |  3 ++-
- 3 files changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/fsck/fsck.c b/fsck/fsck.c
-index 9e04407..6b48a17 100644
---- a/fsck/fsck.c
-+++ b/fsck/fsck.c
-@@ -8,6 +8,7 @@
- #include <stdlib.h>
- #include <stdio.h>
- #include <getopt.h>
-+#include <inttypes.h>
- #include <string.h>
- #include <errno.h>
- #include <locale.h>
-@@ -481,7 +482,7 @@ static bool exfat_boot_region_check(struct exfat *exfat)
- 
- 	if (le64_to_cpu(bs->bsx.vol_length) * EXFAT_SECTOR_SIZE(bs) >
- 			exfat->blk_dev->size) {
--		exfat_err("too large sector count: %llu\n, expected: %llu\n",
-+		exfat_err("too large sector count: %" PRIu64 "\n, expected: %llu\n",
- 				le64_to_cpu(bs->bsx.vol_length),
- 				exfat->blk_dev->num_sectors);
- 		goto err;
-@@ -848,7 +849,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
- 
- 	if (le64_to_cpu(stream_de->stream_valid_size) > node->size) {
- 		resolve_path_parent(&path_resolve_ctx, iter->parent, node);
--		exfat_err("valid size %llu greater than size %llu: %s\n",
-+		exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
- 			le64_to_cpu(stream_de->stream_valid_size), node->size,
- 			path_resolve_ctx.local_path);
- 		goto err;
-@@ -927,7 +928,7 @@ static bool read_alloc_bitmap(struct exfat_de_iter *iter)
- 	if (exfat_de_iter_get(iter, 0, &dentry))
- 		return false;
- 
--	exfat_debug("start cluster %#x, size %#llx\n",
-+	exfat_debug("start cluster %#x, size %#" PRIx64 "\n",
- 			le32_to_cpu(dentry->bitmap_start_clu),
- 			le64_to_cpu(dentry->bitmap_size));
- 
-@@ -935,7 +936,7 @@ static bool read_alloc_bitmap(struct exfat_de_iter *iter)
- 
- 	if (le64_to_cpu(dentry->bitmap_size) <
- 			DIV_ROUND_UP(exfat->bit_count, 8)) {
--		exfat_err("invalid size of allocation bitmap. 0x%llx\n",
-+		exfat_err("invalid size of allocation bitmap. 0x%" PRIx64 "\n",
- 				le64_to_cpu(dentry->bitmap_size));
- 		return false;
- 	}
-@@ -989,7 +990,7 @@ static bool read_upcase_table(struct exfat_de_iter *iter)
- 	size = (size_t)le64_to_cpu(dentry->upcase_size);
- 	if (size > EXFAT_MAX_UPCASE_CHARS * sizeof(__le16) ||
- 			size == 0 || size % sizeof(__le16)) {
--		exfat_err("invalid size of upcase table. 0x%llx\n",
-+		exfat_err("invalid size of upcase table. 0x%" PRIx64 "\n",
- 			le64_to_cpu(dentry->upcase_size));
- 		return false;
- 	}
-diff --git a/include/exfat_ondisk.h b/include/exfat_ondisk.h
-index ae2827b..70546a3 100644
---- a/include/exfat_ondisk.h
-+++ b/include/exfat_ondisk.h
-@@ -26,9 +26,9 @@
- #define cpu_to_le64(x)	(x)
- #endif
- 
--#define le64_to_cpu(x)  cpu_to_le64(x)
--#define le32_to_cpu(x)  cpu_to_le32(x)
--#define le16_to_cpu(x)  cpu_to_le16(x)
-+#define le64_to_cpu(x)  ((uint64_t)cpu_to_le64(x))
-+#define le32_to_cpu(x)  ((uint32_t)cpu_to_le32(x))
-+#define le16_to_cpu(x)  ((uint16_t)cpu_to_le16(x))
- 
- #define PBR_SIGNATURE		0xAA55
- 
-diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
-index 021a51a..87035ef 100644
---- a/mkfs/mkfs.c
-+++ b/mkfs/mkfs.c
-@@ -13,6 +13,7 @@
- #include <sys/ioctl.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <inttypes.h>
- #include <errno.h>
- #include <math.h>
- #include <locale.h>
-@@ -57,7 +58,7 @@ static void exfat_setup_boot_sector(struct pbr *ppbr,
- 	memset(ppbr->boot_code, 0, 390);
- 	ppbr->signature = cpu_to_le16(PBR_SIGNATURE);
- 
--	exfat_debug("Volume Length(sectors) : %llu\n",
-+	exfat_debug("Volume Length(sectors) : %" PRIu64 "\n",
- 		le64_to_cpu(pbsx->vol_length));
- 	exfat_debug("FAT Offset(sector offset) : %u\n",
- 		le32_to_cpu(pbsx->fat_offset));
--- 
-2.26.2
-
diff --git a/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch b/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch
deleted file mode 100644
index b62aaf3d1c..0000000000
--- a/package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 1b0a48ef0aa33a4f5b9c8d23d9f647482d0f28dd Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 9 May 2020 15:05:46 +0200
-Subject: [PATCH] fsck: fix node may be used uninitialized
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The complicated way of gcc to tell not all failure pathes
-set a return value != 0 in the calls before.
-
-Fixes:
-
-  fsck.c:1063:18: error: ???node??? may be used uninitialized in this function [-Werror=maybe-uninitialized]
-       node->parent = dir;
-                    ^
-  fsck.c:871:22: note: ???node??? was declared here
-    struct exfat_inode *node;
-                        ^
-[Upstream: https://github.com/exfatprogs/exfatprogs/pull/92]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- fsck/fsck.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/fsck/fsck.c b/fsck/fsck.c
-index 67d7946..f0daa1d 100644
---- a/fsck/fsck.c
-+++ b/fsck/fsck.c
-@@ -801,12 +801,12 @@ static int read_file_dentries(struct exfat_de_iter *iter,
- 	ret = exfat_de_iter_get(iter, 0, &file_de);
- 	if (ret || file_de->type != EXFAT_FILE) {
- 		exfat_err("failed to get file dentry. %d\n", ret);
--		return ret;
-+		return -EINVAL;
- 	}
- 	ret = exfat_de_iter_get(iter, 1, &stream_de);
- 	if (ret || stream_de->type != EXFAT_STREAM) {
- 		exfat_err("failed to get stream dentry. %d\n", ret);
--		return ret;
-+		return -EINVAL;
- 	}
- 
- 	*new_node = NULL;
-@@ -825,6 +825,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
- 		ret = exfat_de_iter_get(iter, i, &name_de);
- 		if (ret || name_de->type != EXFAT_NAME) {
- 			exfat_err("failed to get name dentry. %d\n", ret);
-+			ret = -EINVAL;
- 			goto err;
- 		}
- 
-@@ -852,6 +853,7 @@ static int read_file_dentries(struct exfat_de_iter *iter,
- 		exfat_err("valid size %" PRIu64 " greater than size %llu: %s\n",
- 			le64_to_cpu(stream_de->stream_valid_size), node->size,
- 			path_resolve_ctx.local_path);
-+		ret = -EINVAL;
- 		goto err;
- 	}
- 
--- 
-2.26.2
-
diff --git a/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch b/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch
deleted file mode 100644
index 0ba15149c9..0000000000
--- a/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2a60e32258e6eb34a68d29202855d98661c78abb Mon Sep 17 00:00:00 2001
-From: Luca Stefani <luca.stefani.ge1@gmail.com>
-Date: Sun, 26 Apr 2020 15:28:21 +0200
-Subject: [PATCH] fsck: Zero-init using memset
-
-* Clang 9.0 incorrectly issues the -Wmissing-braces warning
-
-[Upstream: https://github.com/exfatprogs/exfatprogs/commit/b0519f4fa7ce513d65d0f94c4d5a05be42730e7d.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- fsck/fsck.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/fsck/fsck.c b/fsck/fsck.c
-index 6b48a17..67d7946 100644
---- a/fsck/fsck.c
-+++ b/fsck/fsck.c
-@@ -1211,11 +1211,14 @@ void exfat_show_stat(void)
- int main(int argc, char * const argv[])
- {
- 	int c, ret;
--	struct fsck_user_input ui = {0,};
--	struct exfat_blk_dev bd = {0,};
-+	struct fsck_user_input ui;
-+	struct exfat_blk_dev bd;
- 	struct exfat *exfat = NULL;
- 	bool version_only = false;
- 
-+	memset(&ui, 0, sizeof(ui));
-+	memset(&bd, 0, sizeof(bd));
-+
- 	print_level = EXFAT_ERROR;
- 
- 	if (!setlocale(LC_CTYPE, ""))
--- 
-2.26.2
-
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 654366d865..6beb2777c2 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7f14f32dd67601ff42717f432093a400de878774796f6f1684fb9dbf0d499e1  exfatprogs-1.0.2.tar.gz
+sha256  e73863d2f27901834e0dae678ecbb3d899e206d6036cca27d9b24b9479487f65  exfatprogs-1.0.3.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 508f4ffff5..a78cde3373 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.0.2
-EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
+EXFATPROGS_VERSION = 1.0.3
+EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
-EXFATPROGS_AUTORECONF = YES
 EXFATPROGS_DEPENDENCIES = host-pkgconf
 HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
 
