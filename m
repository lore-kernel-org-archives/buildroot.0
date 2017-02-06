From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:19:32 +0100
Subject: [Buildroot] [git commit] imagemagick: fix build of png support when
	jpeg support is disabled
Message-ID: <20170206181943.6CE2F80DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6f8088fdd56384fb9dc61ca31a0c1772acfde93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d20/d20eecec8e7b947759185f77a6c8e610dd7393f3/
http://autobuild.buildroot.net/results/ee1/ee15efa8ae3f95244980810155ff7ba9f885a59d/
http://autobuild.buildroot.net/results/aa8/aa80f2fd4c7dd884ea8a1b55ad15a40c7bf40501/
http://autobuild.buildroot.net/results/9aa/9aaa044f78115d7f599ea09669c0d6bface5633e/

This combination is broken since 7.0.4-6.

Since commit a9e228f8ac26 (Implemented a private PNG caNv (canvas) chunk),
PNGsLong gets called unconditionally, but it is only defined if JPEG
support is enabled (which defines JNG_SUPPORTED), breaking the build:

MagickCore/.libs/libMagickCore-7.Q16HDRI.a(MagickCore_libMagickCore_7_Q16HDRI_la-png.o): In function `WriteOnePNGImage':
png.c:(.text+0x748d): undefined reference to `PNGsLong'
png.c:(.text+0x74b7): undefined reference to `PNGsLong'

Fix it by adding a patch unconditionally defining the helper function.

Patch submitted upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-png.c-unbreak-build-without-JPEG-support.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch b/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch
new file mode 100644
index 0000000..00a1045
--- /dev/null
+++ b/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch
@@ -0,0 +1,47 @@
+From 5d0e9c53f49022df5154eb3c04900f48b1c6448e Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 6 Feb 2017 17:39:31 +0100
+Subject: [PATCH] png.c: unbreak build without JPEG support
+
+Since commit a9e228f8ac26 (Implemented a private PNG caNv (canvas) chunk),
+PNGsLong gets called unconditionally, but it is only defined if JPEG
+support is enabled (which defines JNG_SUPPORTED), breaking the build:
+
+MagickCore/.libs/libMagickCore-7.Q16HDRI.a(MagickCore_libMagickCore_7_Q16HDRI_la-png.o): In function `WriteOnePNGImage':
+png.c:(.text+0x748d): undefined reference to `PNGsLong'
+png.c:(.text+0x74b7): undefined reference to `PNGsLong'
+
+For build log, see:
+http://autobuild.buildroot.net/results/d20/d20eecec8e7b947759185f77a6c8e610dd7393f3/build-end.log
+
+Fix it by unconditionally defining the helper function.
+
+Submitted-upstream: https://github.com/ImageMagick/ImageMagick/pull/373
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ coders/png.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index aebe59281..1328b1aab 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -1229,7 +1229,6 @@ static void PNGLong(png_bytep p,png_uint_32 value)
+   *p++=(png_byte) (value & 0xff);
+ }
+ 
+-#if defined(JNG_SUPPORTED)
+ static void PNGsLong(png_bytep p,png_int_32 value)
+ {
+   *p++=(png_byte) ((value >> 24) & 0xff);
+@@ -1237,7 +1236,6 @@ static void PNGsLong(png_bytep p,png_int_32 value)
+   *p++=(png_byte) ((value >> 8) & 0xff);
+   *p++=(png_byte) (value & 0xff);
+ }
+-#endif
+ 
+ static void PNGShort(png_bytep p,png_uint_16 value)
+ {
+-- 
+2.11.0
+
