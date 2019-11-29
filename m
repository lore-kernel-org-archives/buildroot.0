From: Michael Vetter <jubalh@iodoru.org>
Date: Fri, 29 Nov 2019 11:12:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to 4.1.0
Message-ID: <20191129101238.9492-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:
  * CVE-2018-12900
  * CVE-2018-17000
  * CVE-2019-6128
  * CVE-2019-7663
  * CVE-2019-14973
  * CVE-2018-19210

Remove because contained upstream:
0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 ...mory-leak-that-was-assigned-CVE-2019-6128.patch | 53 ----------------------
 package/tiff/tiff.hash                             |  2 +-
 package/tiff/tiff.mk                               |  2 +-
 3 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch

diff --git a/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch b/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch
deleted file mode 100644
index 638760b71e..0000000000
--- a/package/tiff/0001-Fix-for-simple-memory-leak-that-was-assigned-CVE-2019-6128.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
-From: Scott Gayou <github.scott@gmail.com>
-Date: Wed, 23 Jan 2019 15:03:53 -0500
-Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
-
-pal2rgb failed to free memory on a few errors. This was reported
-here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.com/libtiff/libtiff/commit/ae0bed1fe530a82faf2e9ea1775109dbf301a971]
----
- tools/pal2rgb.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
-index 01d8502e..9492f1cf 100644
---- a/tools/pal2rgb.c
-+++ b/tools/pal2rgb.c
-@@ -118,12 +118,14 @@ main(int argc, char* argv[])
- 	    shortv != PHOTOMETRIC_PALETTE) {
- 		fprintf(stderr, "%s: Expecting a palette image.\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
- 		fprintf(stderr,
- 		    "%s: No colormap (not a valid palette image).\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	bitspersample = 0;
-@@ -131,11 +133,14 @@ main(int argc, char* argv[])
- 	if (bitspersample != 8) {
- 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	out = TIFFOpen(argv[optind+1], "w");
--	if (out == NULL)
-+	if (out == NULL) {
-+		(void) TIFFClose(in);
- 		return (-2);
-+	}
- 	cpTags(in, out);
- 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
- 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
--- 
-2.18.1
-
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 21eb4bd37a..36f30c4418 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4  tiff-4.0.10.tar.gz
+sha256 5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634  tiff-4.1.0.tar.gz
 sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  COPYRIGHT
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index aef08b341d..b26900ac70 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.0.10
+TIFF_VERSION = 4.1.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
-- 
2.16.4
