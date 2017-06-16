From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:55 +0300
Subject: [Buildroot] [PATCH 10/14] e2fsprogs: don't link with librt
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <87422f222dc219a098bf8189c9214eac0f59074b.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to link with librt for clock_* system calls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch | 35 ----------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch

diff --git a/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch b/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
deleted file mode 100644
index bd86c4e21a3d..000000000000
--- a/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b5baf15b36107925186d89af9097b4b8e2d7cad6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 21 Sep 2016 08:38:21 +0200
-Subject: [PATCH] MCONFIG.in: handle CLOCK_GETTIME_LIB
-
-Commit 62bc243f1bfe623312a350e4cd0d2e17a69aac45 ("fuse2fs: might need
-librt") added a check for the clock_gettime() to verify whether linking
-with the librt library is needed or not to use this function.
-
-However, this commit forgot the change in MCONFIG.in that allows to
-define the make variable CLOCK_GETTIME_LIB from the CLOCK_GETTIME_LIB
-variable substituted by the configure script. Due to this, from a make
-perspective $(CLOCK_GETTIME_LIB) is always empty, and we get link
-failure on platforms where clock_gettime() is available in librt.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- MCONFIG.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/MCONFIG.in b/MCONFIG.in
-index e82963d..9ba9ce2 100644
---- a/MCONFIG.in
-+++ b/MCONFIG.in
-@@ -125,6 +125,7 @@ LIBSUPPORT = $(LIBINTL) $(LIB)/libsupport at STATIC_LIB_EXT@
- LIBBLKID = @LIBBLKID@ @PRIVATE_LIBS_CMT@ $(LIBUUID)
- LIBINTL = @LIBINTL@
- SYSLIBS = @LIBS@
-+CLOCK_GETTIME_LIB = @CLOCK_GETTIME_LIB@
- DEPLIBSS = $(LIB)/libss at LIB_EXT@
- DEPLIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@
- DEPLIBUUID = @DEPLIBUUID@
--- 
-2.7.4
-
-- 
2.11.0
