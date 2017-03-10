From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:50:48 +0100
Subject: [Buildroot] [git commit] imagemagick: bump version to 7.0.5-0
	(security)
Message-ID: <20170310205213.1D974825B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6cc5462535acf954abccd585efc3a07623cc416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fixed memory leak when creating nested exceptions in Magick++
  https://www.imagemagick.org/discourse-server/viewtopic.php?f=23&p=142634

- Fixed fd leak for webp coder
  https://github.com/ImageMagick/ImageMagick/pull/382

- Fixed Spurious memory allocation message
  https://www.imagemagick.org/discourse-server/viewtopic.php?f=3&t=31438

Full changelog: http://imagemagick.org/script/changelog.php

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-png.c-unbreak-build-without-JPEG-support.patch | 47 ----------------------
 package/imagemagick/imagemagick.hash               |  2 +-
 package/imagemagick/imagemagick.mk                 |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch b/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch
deleted file mode 100644
index 00a1045..0000000
--- a/package/imagemagick/0001-png.c-unbreak-build-without-JPEG-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5d0e9c53f49022df5154eb3c04900f48b1c6448e Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 6 Feb 2017 17:39:31 +0100
-Subject: [PATCH] png.c: unbreak build without JPEG support
-
-Since commit a9e228f8ac26 (Implemented a private PNG caNv (canvas) chunk),
-PNGsLong gets called unconditionally, but it is only defined if JPEG
-support is enabled (which defines JNG_SUPPORTED), breaking the build:
-
-MagickCore/.libs/libMagickCore-7.Q16HDRI.a(MagickCore_libMagickCore_7_Q16HDRI_la-png.o): In function `WriteOnePNGImage':
-png.c:(.text+0x748d): undefined reference to `PNGsLong'
-png.c:(.text+0x74b7): undefined reference to `PNGsLong'
-
-For build log, see:
-http://autobuild.buildroot.net/results/d20/d20eecec8e7b947759185f77a6c8e610dd7393f3/build-end.log
-
-Fix it by unconditionally defining the helper function.
-
-Submitted-upstream: https://github.com/ImageMagick/ImageMagick/pull/373
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- coders/png.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/coders/png.c b/coders/png.c
-index aebe59281..1328b1aab 100644
---- a/coders/png.c
-+++ b/coders/png.c
-@@ -1229,7 +1229,6 @@ static void PNGLong(png_bytep p,png_uint_32 value)
-   *p++=(png_byte) (value & 0xff);
- }
- 
--#if defined(JNG_SUPPORTED)
- static void PNGsLong(png_bytep p,png_int_32 value)
- {
-   *p++=(png_byte) ((value >> 24) & 0xff);
-@@ -1237,7 +1236,6 @@ static void PNGsLong(png_bytep p,png_int_32 value)
-   *p++=(png_byte) ((value >> 8) & 0xff);
-   *p++=(png_byte) (value & 0xff);
- }
--#endif
- 
- static void PNGShort(png_bytep p,png_uint_16 value)
- {
--- 
-2.11.0
-
diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 90e1db5..75bc9a9 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 1ee004740b7ab47fff3c92ae4a89dcbd0181c4d5f31fcb7e3697412ea384a0da  ImageMagick-7.0.4-6.tar.xz
+sha256 7362805eaa9f9b90cdb67a1f8762782bef4a42ca44939629aecad3c40305bf4c  ImageMagick-7.0.5-0.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a917297..d1cd608 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.4-6
+IMAGEMAGICK_VERSION = 7.0.5-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
