From: hsiangkao at aol.com <hsiangkao@aol.com>
Date: Wed,  3 Jun 2020 22:05:48 +0800
Subject: [Buildroot] [PATCH] package/erofs-utils: bump version to 1.1
References: <20200603140548.15836-1-hsiangkao.ref@aol.com>
Message-ID: <20200603140548.15836-1-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gao Xiang <hsiangkao@aol.com>

- removed 0001-erofs-utils-fix-configure.ac.patch [1];
- removed 0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch [2];
- removed 0003-erofs-utils-avoid-using-old-compatibility-type-uint.patch [3];
- removed 0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch [4];
- add host-pkgconf, util-linux dependencies for uuid support.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=eefd95b37e1042992cb07bec1ac3f6dbe199d8f0
[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=d4a161552becafeb1ebb98ec7e28675cb25fc548
[3] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=989947348dddf03a8292b5e32bca538f0a325cd9
[4] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=bdbabe54112d04c05819ebebf4e6f88ae863d436

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
Sent out due to the next cycle.

 .../0001-erofs-utils-fix-configure.ac.patch   | 33 --------
 ...d-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch | 58 --------------
 ...id-using-old-compatibility-type-uint.patch | 75 -------------------
 ...s-utils-avoid-PAGE_SIZE-redefinition.patch | 57 --------------
 package/erofs-utils/Config.in                 |  2 +
 package/erofs-utils/Config.in.host            |  1 +
 package/erofs-utils/erofs-utils.hash          |  2 +-
 package/erofs-utils/erofs-utils.mk            |  7 +-
 8 files changed, 8 insertions(+), 227 deletions(-)
 delete mode 100644 package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
 delete mode 100644 package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
 delete mode 100644 package/erofs-utils/0003-erofs-utils-avoid-using-old-compatibility-type-uint.patch
 delete mode 100644 package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch

diff --git a/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch b/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
deleted file mode 100644
index 7ced565995..0000000000
--- a/package/erofs-utils/0001-erofs-utils-fix-configure.ac.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From eefd95b37e1042992cb07bec1ac3f6dbe199d8f0 Mon Sep 17 00:00:00 2001
-From: Haruue Icymoon <i@haruue.moe>
-Date: Fri, 22 Nov 2019 16:58:59 +0800
-Subject: [PATCH] erofs-utils: fix configure.ac
-
-./configure will fail when --with-lz4-libdir is not set, since
-$with_lz4_libdir will be an empty string and generate an empty -L
-into LDFLAGS. This patch fixes it.
-
-Link: https://lore.kernel.org/r/20191122085859.GA2414688 at usamimi.host.haruue.net
-Signed-off-by: Haruue Icymoon <i@haruue.moe>
-Fixes: d51c2d043773 ("erofs-utils: introduce lz4/lz4hc compression algorithm")
-Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f925358..870dfb9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -174,7 +174,7 @@ if test "x$enable_lz4" = "xyes"; then
- 
-   if test "x${have_lz4h}" = "xyes" ; then
-     saved_LDFLAGS=${LDFLAGS}
--    LDFLAGS="-L$with_lz4_libdir ${LDFLAGS}"
-+    test -z "${with_lz4_libdir}" || LDFLAGS="-L$with_lz4_libdir ${LDFLAGS}"
-     AC_CHECK_LIB(lz4, LZ4_compress_destSize, [
-       have_lz4="yes"
-       have_lz4hc="yes"
--- 
-2.20.1
-
diff --git a/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch b/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
deleted file mode 100644
index 0b6ecab71b..0000000000
--- a/package/erofs-utils/0002-erofs-utils-avoid-_LARGEFILE64_SOURCE-and-_GNU_SOURC.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 41d6c984699f30c11e8c92550239bbe5a3e5ada1 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <gaoxiang25@huawei.com>
-Date: Sat, 14 Mar 2020 17:05:37 +0800
-Subject: [PATCH] erofs-utils: avoid _LARGEFILE64_SOURCE and _GNU_SOURCE
- redefinition
-
-This patch can be used to resolve the following build errors:
-
-compress.c:10: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
- #define _LARGEFILE64_SOURCE
-
-<command-line>: note: this is the location of the previous definition
-
-io.c:9: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
- #define _LARGEFILE64_SOURCE
-
-<command-line>: note: this is the location of the previous definition
-
-Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
----
- lib/compress.c | 2 ++
- lib/io.c       | 4 ++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/lib/compress.c b/lib/compress.c
-index 8337487..b14ff17 100644
---- a/lib/compress.c
-+++ b/lib/compress.c
-@@ -7,7 +7,9 @@
-  * Created by Miao Xie <miaoxie@huawei.com>
-  * with heavy changes by Gao Xiang <gaoxiang25@huawei.com>
-  */
-+#ifndef _LARGEFILE64_SOURCE
- #define _LARGEFILE64_SOURCE
-+#endif
- #include <string.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/lib/io.c b/lib/io.c
-index 52f9424..5b998d8 100644
---- a/lib/io.c
-+++ b/lib/io.c
-@@ -6,8 +6,12 @@
-  *             http://www.huawei.com/
-  * Created by Li Guifu <bluce.liguifu@huawei.com>
-  */
-+#ifndef _LARGEFILE64_SOURCE
- #define _LARGEFILE64_SOURCE
-+#endif
-+#ifndef _GNU_SOURCE
- #define _GNU_SOURCE
-+#endif
- #include <sys/stat.h>
- #include <sys/ioctl.h>
- #include "erofs/io.h"
--- 
-2.20.1
-
diff --git a/package/erofs-utils/0003-erofs-utils-avoid-using-old-compatibility-type-uint.patch b/package/erofs-utils/0003-erofs-utils-avoid-using-old-compatibility-type-uint.patch
deleted file mode 100644
index cef1256975..0000000000
--- a/package/erofs-utils/0003-erofs-utils-avoid-using-old-compatibility-type-uint.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 873c932b1119531355df23bacc3cf6824231804b Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@aol.com>
-Date: Tue, 24 Mar 2020 16:19:49 +0800
-Subject: [PATCH] erofs-utils: avoid using old compatibility type uint
-
-This should fix the following buildroot autobuild issues
-with some configration on ARM platform [1]:
-
-compress.c: In function 'vle_compress_one':
-compress.c:209:10: error: unknown type name 'uint'
-    const uint qh_aligned = round_down(ctx->head, EROFS_BLKSIZ);
-          ^~~~
-compress.c:210:10: error: unknown type name 'uint'
-    const uint qh_after = ctx->head - qh_aligned;
-          ^~~~
-compress.c: In function 'z_erofs_convert_to_compacted_format':
-compress.c:313:8: error: unknown type name 'uint'
-  const uint headerpos = Z_EROFS_VLE_EXTENT_ALIGN(inode->inode_isize +
-        ^~~~
-compress.c:316:8: error: unknown type name 'uint'
-  const uint totalidx = (legacymetasize -
-        ^~~~
-
-[1] http://autobuild.buildroot.net/results/842a3c6416416d7badf4db9f38e3b231093a786a
-Link: https://lore.kernel.org/r/20200324081949.26355-1-hsiangkao at aol.com
-Signed-off-by: Gao Xiang <hsiangkao@aol.com>
----
- lib/compress.c | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/lib/compress.c b/lib/compress.c
-index b14ff17..6cc68ed 100644
---- a/lib/compress.c
-+++ b/lib/compress.c
-@@ -204,8 +204,9 @@ nocompression:
- 		len -= count;
- 
- 		if (!final && ctx->head >= EROFS_CONFIG_COMPR_MAX_SZ) {
--			const uint qh_aligned = round_down(ctx->head, EROFS_BLKSIZ);
--			const uint qh_after = ctx->head - qh_aligned;
-+			const unsigned int qh_aligned =
-+				round_down(ctx->head, EROFS_BLKSIZ);
-+			const unsigned int qh_after = ctx->head - qh_aligned;
- 
- 			memmove(ctx->queue, ctx->queue + qh_aligned,
- 				len + qh_after);
-@@ -308,11 +309,11 @@ int z_erofs_convert_to_compacted_format(struct erofs_inode *inode,
- 					unsigned int legacymetasize,
- 					unsigned int logical_clusterbits)
- {
--	const uint headerpos = Z_EROFS_VLE_EXTENT_ALIGN(inode->inode_isize +
--							inode->xattr_isize) +
--			       sizeof(struct z_erofs_map_header);
--	const uint totalidx = (legacymetasize -
--			       Z_EROFS_LEGACY_MAP_HEADER_SIZE) / 8;
-+	const unsigned int mpos = Z_EROFS_VLE_EXTENT_ALIGN(inode->inode_isize +
-+							   inode->xattr_isize) +
-+				  sizeof(struct z_erofs_map_header);
-+	const unsigned int totalidx = (legacymetasize -
-+				       Z_EROFS_LEGACY_MAP_HEADER_SIZE) / 8;
- 	u8 *out, *in;
- 	struct z_erofs_compressindex_vec cv[16];
- 	/* # of 8-byte units so that it can be aligned with 32 bytes */
-@@ -324,7 +325,7 @@ int z_erofs_convert_to_compacted_format(struct erofs_inode *inode,
- 	if (logical_clusterbits > 14)	/* currently not supported */
- 		return -ENOTSUP;
- 	if (logical_clusterbits == 12) {
--		compacted_4b_initial = (32 - headerpos % 32) / 4;
-+		compacted_4b_initial = (32 - mpos % 32) / 4;
- 		if (compacted_4b_initial == 32 / 4)
- 			compacted_4b_initial = 0;
- 
--- 
-2.20.1
-
diff --git a/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch b/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch
deleted file mode 100644
index 2441a841ba..0000000000
--- a/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6c087a91c968197b5a95578fc645617947c943ad Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@aol.com>
-Date: Wed, 25 Mar 2020 15:42:22 +0800
-Subject: [PATCH] erofs-utils: avoid PAGE_SIZE redefinition
-
-Buildroot autobuild reported a PAGE_SIZE redefinition with some
-configrations on i586 toolchain [1] (I didn't notice such report
-from erofs-utils travis CI or distribution builds before.)
-
-In file included from config.c:11:
-../include/erofs/internal.h:27: error: "PAGE_SIZE" redefined [-Werror]
- #define PAGE_SIZE  (1U << PAGE_SHIFT)
-
-In file included from ../include/erofs/defs.h:17,
-                 from ../include/erofs/config.h:12,
-                 from ../include/erofs/print.h:12,
-                 from config.c:10:
-.../sysroot/usr/include/limits.h:89: note: this is the location of the previous definition
- #define PAGE_SIZE PAGESIZE
-
-cc1: all warnings being treated as errors
-
-Fix it now.
-
-[1] http://autobuild.buildroot.net/results/340b98caa45bafd43f109002be9da59ba7f6d971
-Link: https://lore.kernel.org/r/20200325082930.2025-1-hsiangkao at aol.com
-Signed-off-by: Gao Xiang <hsiangkao@aol.com>
----
- include/erofs/internal.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/include/erofs/internal.h b/include/erofs/internal.h
-index e7d5a64..41da189 100644
---- a/include/erofs/internal.h
-+++ b/include/erofs/internal.h
-@@ -23,8 +23,18 @@ typedef unsigned short umode_t;
- #define PATH_MAX        4096    /* # chars in a path name including nul */
- #endif
- 
-+#ifndef PAGE_SHIFT
- #define PAGE_SHIFT		(12)
-+#endif
-+
-+#ifndef PAGE_SIZE
- #define PAGE_SIZE		(1U << PAGE_SHIFT)
-+#endif
-+
-+/* no obvious reason to support explicit PAGE_SIZE != 4096 for now */
-+#if PAGE_SIZE != 4096
-+#error incompatible PAGE_SIZE is already defined
-+#endif
- 
- #define LOG_BLOCK_SIZE          (12)
- #define EROFS_BLKSIZ            (1U << LOG_BLOCK_SIZE)
--- 
-2.20.1
-
diff --git a/package/erofs-utils/Config.in b/package/erofs-utils/Config.in
index 75bcbdaae2..ffb2a891d8 100644
--- a/package/erofs-utils/Config.in
+++ b/package/erofs-utils/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_EROFS_UTILS
 	bool "erofs-utils"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Userspace utilities for EROFS filesystem
 
diff --git a/package/erofs-utils/Config.in.host b/package/erofs-utils/Config.in.host
index 31ea6eb2ea..c6fbc38887 100644
--- a/package/erofs-utils/Config.in.host
+++ b/package/erofs-utils/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_EROFS_UTILS
 	bool "host erofs-utils"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  Userspace utilities for EROFS filesystem
 
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 45d4883a01..31624b1817 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 508ee818dc6a02cf986647e37cb991b76f7b3e7ea303ffc9e980772de68f3b10  erofs-utils-1.0.tar.gz
+sha256 a14a30d0d941f6642cad130fbba70a2493fabbe7baa09a8ce7d20745ea3385d6  erofs-utils-1.1.tar.gz
 sha256 feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 562e3a427a..edc5288b1b 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.0
+EROFS_UTILS_VERSION = 1.1
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
 
 # From a git tree: no generated autotools files
-# Also: 0001-erofs-utils-fix-configure.ac.patch
 EROFS_UTILS_AUTORECONF = YES
 
+EROFS_UTILS_DEPENDENCIES = host-pkgconf util-linux
+
 ifeq ($(BR2_PACKAGE_EROFS_UTILS_LZ4),y)
 EROFS_UTILS_DEPENDENCIES += lz4
 EROFS_UTILS_CONF_OPTS += --enable-lz4
@@ -20,7 +21,7 @@ else
 EROFS_UTILS_CONF_OPTS += --disable-lz4
 endif
 
-HOST_EROFS_UTILS_DEPENDENCIES = host-lz4
+HOST_EROFS_UTILS_DEPENDENCIES = host-pkgconf host-util-linux host-lz4
 HOST_EROFS_UTILS_CONF_OPTS += --enable-lz4
 
 $(eval $(autotools-package))
-- 
2.24.0
