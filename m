From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 08:43:04 +0200
Subject: [Buildroot] [git commit] e2fsprogs: fix linking against librt
Message-ID: <20160921064422.9E8F6821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5743830844e6ce6a633205ad22218034c787f9fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our previous patch to link against librt to access clock_gettime() was
merged upstreamed... but it lacked a crucial part which makes the whole
thing useless: $(CLOCK_GETTIME_LIB) is always empty from a make point of
view.

This commit adds a patch to e2fsprogs to fix the problem.

Fixes:

  http://autobuild.buildroot.net/results/41ea60bebfc741604a5499df74363b498ad77a48/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch b/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
new file mode 100644
index 0000000..bd86c4e
--- /dev/null
+++ b/package/e2fsprogs/0002-MCONFIG.in-handle-CLOCK_GETTIME_LIB.patch
@@ -0,0 +1,35 @@
+From b5baf15b36107925186d89af9097b4b8e2d7cad6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 21 Sep 2016 08:38:21 +0200
+Subject: [PATCH] MCONFIG.in: handle CLOCK_GETTIME_LIB
+
+Commit 62bc243f1bfe623312a350e4cd0d2e17a69aac45 ("fuse2fs: might need
+librt") added a check for the clock_gettime() to verify whether linking
+with the librt library is needed or not to use this function.
+
+However, this commit forgot the change in MCONFIG.in that allows to
+define the make variable CLOCK_GETTIME_LIB from the CLOCK_GETTIME_LIB
+variable substituted by the configure script. Due to this, from a make
+perspective $(CLOCK_GETTIME_LIB) is always empty, and we get link
+failure on platforms where clock_gettime() is available in librt.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ MCONFIG.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/MCONFIG.in b/MCONFIG.in
+index e82963d..9ba9ce2 100644
+--- a/MCONFIG.in
++++ b/MCONFIG.in
+@@ -125,6 +125,7 @@ LIBSUPPORT = $(LIBINTL) $(LIB)/libsupport at STATIC_LIB_EXT@
+ LIBBLKID = @LIBBLKID@ @PRIVATE_LIBS_CMT@ $(LIBUUID)
+ LIBINTL = @LIBINTL@
+ SYSLIBS = @LIBS@
++CLOCK_GETTIME_LIB = @CLOCK_GETTIME_LIB@
+ DEPLIBSS = $(LIB)/libss at LIB_EXT@
+ DEPLIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@
+ DEPLIBUUID = @DEPLIBUUID@
+-- 
+2.7.4
+
