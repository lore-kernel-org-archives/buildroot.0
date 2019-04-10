From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Apr 2019 20:59:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pixman: bump version to 0.38.4
Message-ID: <20190410185901.9444-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, applied upstream
https://cgit.freedesktop.org/pixman/commit/?id=7c6066b700c7cdd4aeb8be426b14b3a5f0de4b6c

Added md5 hash provided by upstream and sha256 hashes for tarball and
license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ivate-include-float.h-only-in-C-code.patch | 46 -------------------
 package/pixman/pixman.hash                    |  8 +++-
 package/pixman/pixman.mk                      |  2 +-
 3 files changed, 7 insertions(+), 49 deletions(-)
 delete mode 100644 package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch

diff --git a/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch b/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch
deleted file mode 100644
index 455cebb265..0000000000
--- a/package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2a5b33fe5cb921993573392afac19185e224b49a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 17 Jan 2016 14:14:28 +0100
-Subject: [PATCH] pixman-private: include <float.h> only in C code
-
-<float.h> is included unconditionally by pixman-private.h, which in
-turn gets included by assembler files. Unfortunately, with certain C
-libraries (like the musl C library), <float.h> cannot be included in
-assembler files:
-
-  CCLD     libpixman-arm-simd.la
-/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h: Assembler messages:
-/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h:8: Error: bad instruction `int __flt_rounds(void)'
-/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h: Assembler messages:
-/home/test/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/float.h:8: Error: bad instruction `int __flt_rounds(void)'
-
-It turns out however that <float.h> is not needed by assembly files,
-so we move its inclusion within the #ifndef __ASSEMBLER__ condition,
-which solves the problem.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- pixman/pixman-private.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/pixman/pixman-private.h b/pixman/pixman-private.h
-index 73108a0..73a5414 100644
---- a/pixman/pixman-private.h
-+++ b/pixman/pixman-private.h
-@@ -1,5 +1,3 @@
--#include <float.h>
--
- #ifndef PIXMAN_PRIVATE_H
- #define PIXMAN_PRIVATE_H
- 
-@@ -30,6 +28,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <stddef.h>
-+#include <float.h>
- 
- #include "pixman-compiler.h"
- 
--- 
-2.6.4
-
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index d5b8934e46..7a79c206f1 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,2 +1,6 @@
-# From http://lists.x.org/archives/xorg-announce/2016-January/002672.html
-sha1	367698744e74d6d4f363041482965b9ea7fbe4a5	pixman-0.34.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-April/002991.html
+md5 16a350a8a40116ddf67632a1d2623711  pixman-0.38.4.tar.bz2
+sha1 87e1abc91ac4e5dfcc275f744f1d0ec3277ee7cd  pixman-0.38.4.tar.bz2
+# Locally computed
+sha256 84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550  pixman-0.38.4.tar.bz2
+sha256 fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index c797b3e60c..e566603d29 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.34.0
+PIXMAN_VERSION = 0.38.4
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.bz2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
-- 
2.20.1
