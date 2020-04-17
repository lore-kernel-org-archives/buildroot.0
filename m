From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 17 Apr 2020 17:33:14 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: fix build failure with musl
 libc
Message-ID: <20200417153314.37637-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Musl libc defines time_t as 64-bit causing printf() to fail since it
tries to pass time_t as a 32-bit("%ld"). So let's add upstream patch[1]
to fix this issue.

[1]:
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cb75ec49c0a92f55b2241eb1cd95a3fdf63f0dac

Fixes:
http://autobuild.buildroot.net/results/35ce3dbd63a658953008ce7e7b99e0580d3f2c4b

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-nfs-utils-print-time-in-64-bit.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch

diff --git a/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch b/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch
new file mode 100644
index 0000000000..5cee989885
--- /dev/null
+++ b/package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch
@@ -0,0 +1,84 @@
+From cb75ec49c0a92f55b2241eb1cd95a3fdf63f0dac Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 13 Apr 2020 14:14:45 -0400
+Subject: [PATCH] nfs-utils: print time in 64-bit
+
+musl 1.2.0 defines time_t as 64-bit, even under 32-bit OSes.
+
+Fixes -Wformat errors.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/nfs/cacheio.c |  3 ++-
+ utils/idmapd/idmapd.c | 11 ++++++-----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
+index 7c4cf373..126c1283 100644
+--- a/support/nfs/cacheio.c
++++ b/support/nfs/cacheio.c
+@@ -20,6 +20,7 @@
+ #endif
+ 
+ #include <nfslib.h>
++#include <inttypes.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+ #include <string.h>
+@@ -238,7 +239,7 @@ cache_flush(int force)
+ 	    stb.st_mtime > now)
+ 		stb.st_mtime = time(0);
+ 	
+-	sprintf(stime, "%ld\n", stb.st_mtime);
++	sprintf(stime, "%" PRId64 "\n", (int64_t)stb.st_mtime);
+ 	for (c=0; cachelist[c]; c++) {
+ 		int fd;
+ 		sprintf(path, "/proc/net/rpc/%s/flush", cachelist[c]);
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
+index c187e7d7..893159f1 100644
+--- a/utils/idmapd/idmapd.c
++++ b/utils/idmapd/idmapd.c
+@@ -54,6 +54,7 @@
+ #include <dirent.h>
+ #include <unistd.h>
+ #include <netdb.h>
++#include <inttypes.h>
+ #include <signal.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -172,7 +173,7 @@ flush_nfsd_cache(char *path, time_t now)
+ 	int fd;
+ 	char stime[32];
+ 
+-	sprintf(stime, "%ld\n", now);
++	sprintf(stime, "%" PRId64 "\n", (int64_t)now);
+ 	fd = open(path, O_RDWR);
+ 	if (fd == -1)
+ 		return -1;
+@@ -625,8 +626,8 @@ nfsdcb(int UNUSED(fd), short which, void *data)
+ 		/* Name */
+ 		addfield(&bp, &bsiz, im.im_name);
+ 		/* expiry */
+-		snprintf(buf1, sizeof(buf1), "%lu",
+-			 time(NULL) + cache_entry_expiration);
++		snprintf(buf1, sizeof(buf1), "%" PRId64,
++			 (int64_t)time(NULL) + cache_entry_expiration);
+ 		addfield(&bp, &bsiz, buf1);
+ 		/* Note that we don't want to write the id if the mapping
+ 		 * failed; instead, by leaving it off, we write a negative
+@@ -653,8 +654,8 @@ nfsdcb(int UNUSED(fd), short which, void *data)
+ 		snprintf(buf1, sizeof(buf1), "%u", im.im_id);
+ 		addfield(&bp, &bsiz, buf1);
+ 		/* expiry */
+-		snprintf(buf1, sizeof(buf1), "%lu",
+-			 time(NULL) + cache_entry_expiration);
++		snprintf(buf1, sizeof(buf1), "%" PRId64,
++			 (int64_t)time(NULL) + cache_entry_expiration);
+ 		addfield(&bp, &bsiz, buf1);
+ 		/* Note we're ignoring the status field in this case; we'll
+ 		 * just map to nobody instead. */
+-- 
+2.20.1
+
-- 
2.20.1
