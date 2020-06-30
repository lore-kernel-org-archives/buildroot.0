From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  1 Jul 2020 00:07:14 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.5.1
Message-ID: <20200630220714.432660-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2.5.1 and remove local already upstreamed patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-nfs-utils-print-time-in-64-bit.patch | 84 -------------------
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch

diff --git a/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch b/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch
deleted file mode 100644
index 5cee989885..0000000000
--- a/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From cb75ec49c0a92f55b2241eb1cd95a3fdf63f0dac Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Mon, 13 Apr 2020 14:14:45 -0400
-Subject: [PATCH] nfs-utils: print time in 64-bit
-
-musl 1.2.0 defines time_t as 64-bit, even under 32-bit OSes.
-
-Fixes -Wformat errors.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- support/nfs/cacheio.c |  3 ++-
- utils/idmapd/idmapd.c | 11 ++++++-----
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
-index 7c4cf373..126c1283 100644
---- a/support/nfs/cacheio.c
-+++ b/support/nfs/cacheio.c
-@@ -20,6 +20,7 @@
- #endif
- 
- #include <nfslib.h>
-+#include <inttypes.h>
- #include <stdio.h>
- #include <stdio_ext.h>
- #include <string.h>
-@@ -238,7 +239,7 @@ cache_flush(int force)
- 	    stb.st_mtime > now)
- 		stb.st_mtime = time(0);
- 	
--	sprintf(stime, "%ld\n", stb.st_mtime);
-+	sprintf(stime, "%" PRId64 "\n", (int64_t)stb.st_mtime);
- 	for (c=0; cachelist[c]; c++) {
- 		int fd;
- 		sprintf(path, "/proc/net/rpc/%s/flush", cachelist[c]);
-diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index c187e7d7..893159f1 100644
---- a/utils/idmapd/idmapd.c
-+++ b/utils/idmapd/idmapd.c
-@@ -54,6 +54,7 @@
- #include <dirent.h>
- #include <unistd.h>
- #include <netdb.h>
-+#include <inttypes.h>
- #include <signal.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -172,7 +173,7 @@ flush_nfsd_cache(char *path, time_t now)
- 	int fd;
- 	char stime[32];
- 
--	sprintf(stime, "%ld\n", now);
-+	sprintf(stime, "%" PRId64 "\n", (int64_t)now);
- 	fd = open(path, O_RDWR);
- 	if (fd == -1)
- 		return -1;
-@@ -625,8 +626,8 @@ nfsdcb(int UNUSED(fd), short which, void *data)
- 		/* Name */
- 		addfield(&bp, &bsiz, im.im_name);
- 		/* expiry */
--		snprintf(buf1, sizeof(buf1), "%lu",
--			 time(NULL) + cache_entry_expiration);
-+		snprintf(buf1, sizeof(buf1), "%" PRId64,
-+			 (int64_t)time(NULL) + cache_entry_expiration);
- 		addfield(&bp, &bsiz, buf1);
- 		/* Note that we don't want to write the id if the mapping
- 		 * failed; instead, by leaving it off, we write a negative
-@@ -653,8 +654,8 @@ nfsdcb(int UNUSED(fd), short which, void *data)
- 		snprintf(buf1, sizeof(buf1), "%u", im.im_id);
- 		addfield(&bp, &bsiz, buf1);
- 		/* expiry */
--		snprintf(buf1, sizeof(buf1), "%lu",
--			 time(NULL) + cache_entry_expiration);
-+		snprintf(buf1, sizeof(buf1), "%" PRId64,
-+			 (int64_t)time(NULL) + cache_entry_expiration);
- 		addfield(&bp, &bsiz, buf1);
- 		/* Note we're ignoring the status field in this case; we'll
- 		 * just map to nobody instead. */
--- 
-2.20.1
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index a30013af93..266752071a 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.4.3/sha256sums.asc
-sha256 af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef264dc2c78c904f26599  nfs-utils-2.4.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.1/sha256sums.asc
+sha256 0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4  nfs-utils-2.5.1.tar.xz
 # Locally computed
 sha256 576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 7af229a57e..da85cb178f 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.4.3
+NFS_UTILS_VERSION = 2.5.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.25.1
