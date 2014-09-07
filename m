From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 12:06:29 +0200
Subject: [Buildroot] [PATCH 2/2] xserver_xorg-server: Fix compile error for
	microblaze
In-Reply-To: <1410084389-5971-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410084389-5971-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1410084389-5971-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
mipushpxl.c: In function 'miPushPixels':
mipushpxl.c:110:38: error: 'IMAGE_BYTE_ORDER' undeclared (first use in this function)
     if (screenInfo.bitmapBitOrder == IMAGE_BYTE_ORDER)

Patch submitted upstream: https://bugs.freedesktop.org/show_bug.cgi?id=83582

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xserver_xorg-server-0003-microblaze.patch      |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-0003-microblaze.patch

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
-- 
1.7.10.4
