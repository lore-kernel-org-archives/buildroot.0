From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  7 Apr 2018 20:19:50 +0200
Subject: [Buildroot] [PATCH v1 2/3] squashfs: bump version to
 e38956b92f738518c29734399629e7cdb33072d3
In-Reply-To: <20180407181951.22037-1-ps.report@gmx.net>
References: <20180407181951.22037-1-ps.report@gmx.net>
Message-ID: <20180407181951.22037-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- delete patch 0001-musl.patch (superseeded by upstream commit [1])
- add zstd support

[1] https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git/commit/?id=a81678d6a698b8a016f9abac9f3d981281cc52eb

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/squashfs/0001-musl.patch | 71 ----------------------------------------
 package/squashfs/Config.in       |  6 ++++
 package/squashfs/squashfs.hash   |  2 +-
 package/squashfs/squashfs.mk     | 14 ++++++--
 4 files changed, 18 insertions(+), 75 deletions(-)
 delete mode 100644 package/squashfs/0001-musl.patch

diff --git a/package/squashfs/0001-musl.patch b/package/squashfs/0001-musl.patch
deleted file mode 100644
index 891b1717a2..0000000000
--- a/package/squashfs/0001-musl.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Fix musl build
-
-Downloaded from
-http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
-and adjusted paths.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Define FNM_EXTMATCH if not defined its glibc specific define
-include missing sys/stat.h for stat* function declarations
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: squashfs-tools/action.c
-===================================================================
---- a/squashfs-tools.orig/action.c
-+++ b/squashfs-tools/action.c
-@@ -44,6 +44,10 @@
- #include "action.h"
- #include "error.h"
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- /*
-  * code to parse actions
-  */
-Index: squashfs-tools/mksquashfs.c
-===================================================================
---- a/squashfs-tools.orig/mksquashfs.c
-+++ b/squashfs-tools/mksquashfs.c
-@@ -1286,6 +1286,10 @@ void write_dir(squashfs_inode *inode, st
- 		dir_size + 3, directory_block, directory_offset, NULL, NULL,
- 		dir, 0);
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- #ifdef SQUASHFS_TRACE
- 	{
- 		unsigned char *dirp;
-Index: squashfs-tools/pseudo.c
-===================================================================
---- a/squashfs-tools.orig/pseudo.c
-+++ b/squashfs-tools/pseudo.c
-@@ -32,6 +32,7 @@
- #include <stdlib.h>
- #include <sys/types.h>
- #include <sys/wait.h>
-+#include <sys/stat.h>
- #include <ctype.h>
- 
- #include "pseudo.h"
-Index: squashfs-tools/unsquashfs.c
-===================================================================
---- a/squashfs-tools.orig/unsquashfs.c
-+++ b/squashfs-tools/unsquashfs.c
-@@ -38,6 +38,10 @@
- #include <limits.h>
- #include <ctype.h>
- 
-+#ifndef FNM_EXTMATCH
-+#define FNM_EXTMATCH 0
-+#endif
-+
- struct cache *fragment_cache, *data_cache;
- struct queue *to_reader, *to_inflate, *to_writer, *from_writer;
- pthread_t *thread, *inflator_thread;
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 70c0fc9808..c16ebbf27f 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -41,6 +41,12 @@ config BR2_PACKAGE_SQUASHFS_XZ
 	help
 	  Support XZ compression algorithm
 
+config BR2_PACKAGE_SQUASHFS_ZSTD
+	bool "zstd support"
+	select BR2_PACKAGE_ZSTD
+	help
+	  Support ZSTD compression algorithm
+
 endif
 
 comment "squashfs needs a toolchain w/ threads"
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 74fdb44354..82a650022c 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	2c49392816615b73bf5d6cdce9776cb66a01f5a1494b1d9af580667e32bab001  squashfs-3de1687d7432ea9b302c2db9521996f506c140a3.tar.gz
+sha256 bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779 squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 9599d892b2..bec867d676 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 3de1687d7432ea9b302c2db9521996f506c140a3
+SQUASHFS_VERSION = e38956b92f738518c29734399629e7cdb33072d3
 SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 SQUASHFS_SITE_METHOD = git
 SQUASHFS_LICENSE = GPL-2.0+
@@ -46,7 +46,14 @@ else
 SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
 endif
 
-HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
+ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
+SQUASHFS_DEPENDENCIES += zstd
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
+else
+SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
+endif
+
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
 
 HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=1 \
@@ -54,7 +61,8 @@ HOST_SQUASHFS_MAKE_ARGS = \
 	GZIP_SUPPORT=1 \
 	LZ4_SUPPORT=1 \
 	LZO_SUPPORT=1 \
-	LZMA_XZ_SUPPORT=1
+	LZMA_XZ_SUPPORT=1 \
+	ZSTD_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
-- 
2.16.3
