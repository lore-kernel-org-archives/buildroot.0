From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 23:16:30 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/sshfs: bump to version 3.7.1
Message-ID: <20201112221630.820452-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

https://github.com/libfuse/sshfs/blob/sshfs-3.7.1/ChangeLog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-sshfs.c-fix-build-with-gcc-4.8.patch | 47 -------------------
 package/sshfs/sshfs.hash                      |  2 +-
 package/sshfs/sshfs.mk                        |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/sshfs/0001-sshfs.c-fix-build-with-gcc-4.8.patch

diff --git a/package/sshfs/0001-sshfs.c-fix-build-with-gcc-4.8.patch b/package/sshfs/0001-sshfs.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 312985d8dc..0000000000
--- a/package/sshfs/0001-sshfs.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 35ff9ed71b89f34e5462de1ee63f88edf98aeb69 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Oct 2020 21:08:53 +0100
-Subject: [PATCH] sshfs.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8:
-
-../sshfs.c:1092:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < sshfs.max_conns; i++) {
-  ^
-
-This build failure has been added with
-https://github.com/libfuse/sshfs/commit/8822b60d9dbd9907065e7999f616b11ddce6d584
-
-Fixes:
- - http://autobuild.buildroot.org/results/2dbdc579c55543175716d5f739cabe2ad0864ed6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libfuse/sshfs/pull/233]
----
- sshfs.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/sshfs.c b/sshfs.c
-index d5f2ff7..2c2db42 100644
---- a/sshfs.c
-+++ b/sshfs.c
-@@ -1068,6 +1068,7 @@ static struct conn* get_conn(const struct sshfs_file *sf,
- 			     const char *path)
- {
- 	struct conntab_entry *ce;
-+	int i;
- 
- 	if (sshfs.max_conns == 1)
- 		return &sshfs.conns[0];
-@@ -1089,7 +1090,7 @@ static struct conn* get_conn(const struct sshfs_file *sf,
- 
- 	int best_index = 0;
- 	uint64_t best_score = ~0ULL; /* smaller is better */
--	for (int i = 0; i < sshfs.max_conns; i++) {
-+	for (i = 0; i < sshfs.max_conns; i++) {
- 		uint64_t score = ((uint64_t) sshfs.conns[i].req_count << 43) +
- 				 ((uint64_t) sshfs.conns[i].dir_count << 22) +
- 				 ((uint64_t) sshfs.conns[i].file_count << 1) +
--- 
-2.28.0
-
diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index b8488013a7..106f06f09f 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  6e7e86831f3066b356e7f16e22f1b8a8f177fda05146f6a5eb821c2fd0541c34  sshfs-3.7.0.tar.xz
+sha256  fe5d3436d61b46974889e0c4515899c21a9d67851e3793c209989f72353d7750  sshfs-3.7.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 70e7feab1d..6759f6ab3b 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 3.7.0
+SSHFS_VERSION = 3.7.1
 SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
-- 
2.28.0
