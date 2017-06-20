From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:14:16 +0200
Subject: [Buildroot] [git commit] e2fsprogs: don't link with librt
Message-ID: <20170620201445.76EA57FED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=428821de120c31507ea948740fafddd495ed2b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to link with librt for clock_* system calls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch | 35 ----------------------
 1 file changed, 35 deletions(-)

diff --git a/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch b/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
deleted file mode 100644
index bd86c4e..0000000
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
