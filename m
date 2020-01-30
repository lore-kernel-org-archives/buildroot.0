From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Thu, 30 Jan 2020 17:17:51 -0600
Subject: [Buildroot] [PATCH 1/1] squashfs: bump version to 4.4
Message-ID: <20200130231751.4773-1-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 4.4 and switch to github site since the kernel
repository has not been updated. See
https://github.com/plougher/squashfs-tools/blob/master/README.

Dropping patch that has been incorporated in the new release.

This version bump includes support for reproducible images. See the full
release notes for details at
https://github.com/plougher/squashfs-tools/blob/master/README-4.4

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/squashfs/0001-include-sysmacros.patch | 47 -------------------
 package/squashfs/squashfs.hash                |  2 +-
 package/squashfs/squashfs.mk                  |  5 +-
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 package/squashfs/0001-include-sysmacros.patch

diff --git a/package/squashfs/0001-include-sysmacros.patch b/package/squashfs/0001-include-sysmacros.patch
deleted file mode 100644
index d794836c04..0000000000
--- a/package/squashfs/0001-include-sysmacros.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 968aa53dd6d2c0831a9af01873441767c06b88d0 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Wed, 1 Aug 2018 12:17:10 +0200
-Subject: [PATCH] mksquashfs/unsquashfs: fix compilation with glibc 2.25+
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From glibc 2.25 release notes:
-https://sourceware.org/ml/libc-alpha/2017-02/msg00079.html
-"* The inclusion of <sys/sysmacros.h> by <sys/types.h> is deprecated.
-  This means that in a future release, the macros ?major?, ?minor?, and
-  ?makedev? will only be available from <sys/sysmacros.h>."
-
-See glibc bug https://sourceware.org/bugzilla/show_bug.cgi?id=19239 .
-
-Fetch from: https://github.com/plougher/squashfs-tools/pull/52.patch
-Signed-off-by: Richard Kunze <richard.kunze@web.de>
----
- squashfs-tools/mksquashfs.c | 1 +
- squashfs-tools/unsquashfs.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/squashfs-tools/mksquashfs.c b/squashfs-tools/mksquashfs.c
-index d696a51..8d57c3e 100644
---- a/squashfs-tools/mksquashfs.c
-+++ b/squashfs-tools/mksquashfs.c
-@@ -35,6 +35,7 @@
- #include <stddef.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <errno.h>
- #include <dirent.h>
-diff --git a/squashfs-tools/unsquashfs.c b/squashfs-tools/unsquashfs.c
-index a57f85c..a492b27 100644
---- a/squashfs-tools/unsquashfs.c
-+++ b/squashfs-tools/unsquashfs.c
-@@ -33,6 +33,7 @@
- #include "fnmatch_compat.h"
- 
- #include <sys/sysinfo.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <sys/resource.h>
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 4464e62c02..1f08b530a0 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779 squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
+sha256 a7fa4845e9908523c38d4acf92f8a41fdfcd19def41bd5090d7ad767a6dc75c3 squashfs-4.4.tar.gz
 
 # License files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 7467342c48..15707e198e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = e38956b92f738518c29734399629e7cdb33072d3
-SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
-SQUASHFS_SITE_METHOD = git
+SQUASHFS_VERSION = 4.4
+SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
-- 
2.23.0
