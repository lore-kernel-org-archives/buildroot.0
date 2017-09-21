From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 14:36:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/librsync:
	security bump to version 2.0.0
Message-ID: <20170921125626.6BB0B8042A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3196246a9ba12d246805a9f7f9491baa137a1590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Removed patch applied upstream, switched to cmake-package following
upstream removal of autoconf.

Short summary of changes:

version 1.0.1
- switched from autoconf to cmake

version 1.0.0:
- fixed CVE-2014-8242
- project moved to github

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b860bd83b22429175542f885fdd1fc52d770eeb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsync/0001-fix-build-with-clang.patch | 37 ------------------------
 package/librsync/Config.in                       |  2 +-
 package/librsync/librsync.hash                   |  2 +-
 package/librsync/librsync.mk                     |  6 ++--
 4 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/package/librsync/0001-fix-build-with-clang.patch b/package/librsync/0001-fix-build-with-clang.patch
deleted file mode 100644
index ea513c0..0000000
--- a/package/librsync/0001-fix-build-with-clang.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1175b1cd102ee15512185c7983868e5746959da0 Mon Sep 17 00:00:00 2001
-From: Adam Schubert <feartohell@seznam.cz>
-Date: Mon, 11 May 2015 04:25:45 +0200
-Subject: [PATCH] Fix build under clang
-
-Downloaded from upstream commit:
-https://github.com/librsync/librsync/commit/1175b1cd102ee15512185c7983868e5746959da0.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
----
- delta.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/delta.c b/delta.c
-index 19498f9..72afdf6 100644
---- a/delta.c
-+++ b/delta.c
-@@ -126,12 +126,12 @@ static rs_result rs_delta_s_scan(rs_job_t *job);
- static rs_result rs_delta_s_flush(rs_job_t *job);
- static rs_result rs_delta_s_end(rs_job_t *job);
- void rs_getinput(rs_job_t *job);
--inline int rs_findmatch(rs_job_t *job, rs_long_t *match_pos, size_t *match_len);
--inline rs_result rs_appendmatch(rs_job_t *job, rs_long_t match_pos, size_t match_len);
--inline rs_result rs_appendmiss(rs_job_t *job, size_t miss_len);
--inline rs_result rs_appendflush(rs_job_t *job);
--inline rs_result rs_processmatch(rs_job_t *job);
--inline rs_result rs_processmiss(rs_job_t *job);
-+static inline int rs_findmatch(rs_job_t *job, rs_long_t *match_pos, size_t *match_len);
-+static inline rs_result rs_appendmatch(rs_job_t *job, rs_long_t match_pos, size_t match_len);
-+static inline rs_result rs_appendmiss(rs_job_t *job, size_t miss_len);
-+static inline rs_result rs_appendflush(rs_job_t *job);
-+static inline rs_result rs_processmatch(rs_job_t *job);
-+static inline rs_result rs_processmiss(rs_job_t *job);
- 
- /**
-  * \brief Get a block of data if possible, and see if it matches.
diff --git a/package/librsync/Config.in b/package/librsync/Config.in
index 5dcdfc8..652f0cb 100644
--- a/package/librsync/Config.in
+++ b/package/librsync/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBRSYNC
 	  remote file synchronization that was popularized by the
 	  rsync utility and is used in rproxy.
 
-	  http://sourceforge.net/projects/librsync/
+	  https://github.com/librsync/librsync
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 55ace76..2d5e2e0 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6633e4605662763a03bb6388529cbdfd3b11a9ec55b8845351c1bd9a92bc41d6  librsync-0.9.7.tar.gz
+sha256 b5c4dd114289832039397789e42d4ff0d1108ada89ce74f1999398593fae2169  librsync-v2.0.0.tar.gz
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index d475c73..3031f1a 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 0.9.7
-LIBRSYNC_SITE = http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
+LIBRSYNC_VERSION = v2.0.0
+LIBRSYNC_SITE = $(call github,librsync,librsync,$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPLv2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
