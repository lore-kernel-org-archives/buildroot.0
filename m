From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:20:40 +0200
Subject: [Buildroot] [git commit] package/ncftp: fix build with gcc 10
Message-ID: <20200823111340.A3528815A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c979b57ef8bf70bf201463fa660d276b8a21057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncftp/0001-fix-gcc-10.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/ncftp/0001-fix-gcc-10.patch b/package/ncftp/0001-fix-gcc-10.patch
new file mode 100644
index 0000000000..8ff9c44c50
--- /dev/null
+++ b/package/ncftp/0001-fix-gcc-10.patch
@@ -0,0 +1,24 @@
+Fix build with gcc 10
+
+Add missing extern to gBm to fix the following build failure with
+-fno-common which is enabled by default with gcc 10:
+
+/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: bookmark.o:(.bss+0x10): multiple definition of `gBm'; gpshare.o:(.bss+0x24): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura ncftp-3.2.6-orig/sh_util/gpshare.c ncftp-3.2.6/sh_util/gpshare.c
+--- ncftp-3.2.6-orig/sh_util/gpshare.c	2020-08-21 10:46:34.173816750 +0200
++++ ncftp-3.2.6/sh_util/gpshare.c	2020-08-21 10:52:25.407976319 +0200
+@@ -28,7 +28,7 @@
+ 
+ static int gIsAtty1 = 1, gIsAtty2 = 1;
+ extern int gLoadedBm, gBookmarkMatchMode;
+-Bookmark gBm;
++extern Bookmark gBm;
+ 
+ double
+ FileSize(double size, const char **uStr0, double *uMult0)
