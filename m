From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:36:29 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Fix compile error for
	microblaze
Message-ID: <20140921203635.F17A59B9EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de31a9f7d7ce09ae65e725baaf07a73c8fcdd064
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
mipushpxl.c: In function 'miPushPixels':
mipushpxl.c:110:38: error: 'IMAGE_BYTE_ORDER' undeclared (first use in this function)
     if (screenInfo.bitmapBitOrder == IMAGE_BYTE_ORDER)

Patch submitted upstream: https://bugs.freedesktop.org/show_bug.cgi?id=83582

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server-0003-microblaze.patch      |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch
new file mode 100644
index 0000000..b99b669
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch
@@ -0,0 +1,33 @@
+xserver_xorg-server: Fix compile error for microblaze
+
+Fixes
+mipushpxl.c: In function 'miPushPixels':
+mipushpxl.c:110:38: error: 'IMAGE_BYTE_ORDER' undeclared (first use in this function)
+     if (screenInfo.bitmapBitOrder == IMAGE_BYTE_ORDER)
+
+Patch submitted upstream: https://bugs.freedesktop.org/show_bug.cgi?id=83582
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xorg-server-1.16.0.glyph/include/servermd.h xorg-server-1.16.0/include/servermd.h
+--- xorg-server-1.16.0.glyph/include/servermd.h	2014-09-07 11:32:34.297332811 +0200
++++ xorg-server-1.16.0/include/servermd.h	2014-09-07 11:31:33.470099995 +0200
+@@ -176,6 +176,18 @@
+ 
+ #endif                          /* mips */
+ 
++#if defined(__microblaze__) || defined(microblaze)
++
++#ifdef __BIG_ENDIAN__
++#define IMAGE_BYTE_ORDER	MSBFirst
++#define BITMAP_BIT_ORDER	MSBFirst
++#else
++#define IMAGE_BYTE_ORDER	LSBFirst
++#define BITMAP_BIT_ORDER	LSBFirst
++#endif
++
++#endif
++
+ #if defined(__alpha) || defined(__alpha__)
+ #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the Alpha only */
+ #define BITMAP_BIT_ORDER       LSBFirst
