From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:45:33 +0100
Subject: [Buildroot] [git commit] package/gd: bump to version 2.3.0
Message-ID: <20210123222631.3F4737F9EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e317d5ff209816ae6135f1f3a2028c1a5f90c11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- gdlib-config has been dropped since
  https://github.com/libgd/libgd/commit/d62f608c7c4a814c70d4ba777725e3e62d9e2cde
- Update license hash
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-bmp-check-return-value-in-gdImageBmpPtr.patch |  80 --------
 ...ential-infinite-loop-in-gdImageCreateFrom.patch |  61 ------
 ...nitialized-read-in-gdImageCreateFromXbm-C.patch |  41 ----
 ...-492-Potential-double-free-in-gdImage-Ptr.patch | 219 ---------------------
 ...-NULL-pointer-dereference-in-gdImageClone.patch |  44 -----
 ...Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch |  39 ----
 package/gd/gd.hash                                 |   4 +-
 package/gd/gd.mk                                   |  19 +-
 8 files changed, 4 insertions(+), 503 deletions(-)

diff --git a/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch b/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch
deleted file mode 100644
index f3c9ea481c..0000000000
--- a/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From ac16bdf2d41724b5a65255d4c28fb0ec46bc42f5 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sat, 14 Jul 2018 13:54:08 -0400
-Subject: [PATCH] bmp: check return value in gdImageBmpPtr
-
-Closes #447.
-
-CVE-2018-1000222
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/gd_bmp.c | 17 ++++++++++++++---
- 1 file changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/src/gd_bmp.c b/src/gd_bmp.c
-index bde0b9d..78f40d9 100644
---- a/src/gd_bmp.c
-+++ b/src/gd_bmp.c
-@@ -47,6 +47,8 @@ static int bmp_read_4bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp
- static int bmp_read_8bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp_hdr_t *header);
- static int bmp_read_rle(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info);
- 
-+static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression);
-+
- #define BMP_DEBUG(s)
- 
- static int gdBMPPutWord(gdIOCtx *out, int w)
-@@ -87,8 +89,10 @@ BGD_DECLARE(void *) gdImageBmpPtr(gdImagePtr im, int *size, int compression)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageBmpCtx(im, out, compression);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageBmpCtx(im, out, compression))
-+		rv = gdDPExtractData(out, size);
-+	else
-+		rv = NULL;
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -141,6 +145,11 @@ BGD_DECLARE(void) gdImageBmp(gdImagePtr im, FILE *outFile, int compression)
- 		compression - whether to apply RLE or not.
- */
- BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
-+{
-+	_gdImageBmpCtx(im, out, compression);
-+}
-+
-+static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- {
- 	int bitmap_size = 0, info_size, total_size, padding;
- 	int i, row, xpos, pixel;
-@@ -148,6 +157,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- 	unsigned char *uncompressed_row = NULL, *uncompressed_row_start = NULL;
- 	FILE *tmpfile_for_compression = NULL;
- 	gdIOCtxPtr out_original = NULL;
-+	int ret = 1;
- 
- 	/* No compression if its true colour or we don't support seek */
- 	if (im->trueColor) {
-@@ -325,6 +335,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- 		out_original = NULL;
- 	}
- 
-+	ret = 0;
- cleanup:
- 	if (tmpfile_for_compression) {
- #ifdef _WIN32
-@@ -338,7 +349,7 @@ cleanup:
- 	if (out_original) {
- 		out_original->gd_free(out_original);
- 	}
--	return;
-+	return ret;
- }
- 
- static int compress_row(unsigned char *row, int length)
--- 
-2.20.1
-
diff --git a/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch b/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
deleted file mode 100644
index 8d77f0ee18..0000000000
--- a/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a11f47475e6443b7f32d21f2271f28f417e2ac04 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Wed, 29 Nov 2017 19:37:38 +0100
-Subject: [PATCH] Fix #420: Potential infinite loop in gdImageCreateFromGifCtx
-
-Due to a signedness confusion in `GetCode_` a corrupt GIF file can
-trigger an infinite loop.  Furthermore we make sure that a GIF without
-any palette entries is treated as invalid *after* open palette entries
-have been removed.
-
-CVE-2018-5711
-
-See also https://bugs.php.net/bug.php?id=75571.
-
-[Peter: drop tests]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/gd_gif_in.c             |  12 ++++++------
- 1 files changed, 38 insertions(+), 6 deletions(-)
-
-diff --git a/src/gd_gif_in.c b/src/gd_gif_in.c
-index daf26e7..0a8bd71 100644
---- a/src/gd_gif_in.c
-+++ b/src/gd_gif_in.c
-@@ -335,11 +335,6 @@ terminated:
- 		return 0;
- 	}
- 
--	if(!im->colorsTotal) {
--		gdImageDestroy(im);
--		return 0;
--	}
--
- 	/* Check for open colors at the end, so
- 	 * we can reduce colorsTotal and ultimately
- 	 * BitsPerPixel */
-@@ -351,6 +346,11 @@ terminated:
- 		}
- 	}
- 
-+	if(!im->colorsTotal) {
-+		gdImageDestroy(im);
-+		return 0;
-+	}
-+
- 	return im;
- }
- 
-@@ -447,7 +447,7 @@ static int
- GetCode_(gdIOCtx *fd, CODE_STATIC_DATA *scd, int code_size, int flag, int *ZeroDataBlockP)
- {
- 	int i, j, ret;
--	unsigned char count;
-+	int count;
- 
- 	if(flag) {
- 		scd->curbit = 0;
-
--- 
-2.20.1
-
diff --git a/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch b/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
deleted file mode 100644
index 57df1a2fb1..0000000000
--- a/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e13a342c079aeb73e31dfa19eaca119761bac3f3 Mon Sep 17 00:00:00 2001
-From: Jonas Meurer <jonas@freesources.org>
-Date: Tue, 11 Jun 2019 12:16:46 +0200
-Subject: [PATCH] Fix #501: Uninitialized read in gdImageCreateFromXbm
- (CVE-2019-11038)
-
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2019-11038
-Bug-Debian: https://bugs.debian.org/929821
-Bug: https://github.com/libgd/libgd/issues/501
-
-We have to ensure that `sscanf()` does indeed read a hex value here,
-and bail out otherwise.
-
-Original patch by Christoph M. Becker <cmbecker69@gmx.de> for PHP libgd ext.
-https://git.php.net/?p=php-src.git;a=commit;h=ed6dee9a198c904ad5e03113e58a2d2c200f5184
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/gd_xbm.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_xbm.c b/src/gd_xbm.c
-index 4ca41ac..cf0545e 100644
---- a/src/gd_xbm.c
-+++ b/src/gd_xbm.c
-@@ -169,7 +169,11 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromXbm(FILE * fd)
- 			}
- 			h[3] = ch;
- 		}
--		sscanf(h, "%x", &b);
-+		if (sscanf(h, "%x", &b) != 1) {
-+			gd_error("invalid XBM");
-+			gdImageDestroy(im);
-+			return 0;
-+		}
- 		for (bit = 1; bit <= max_bit; bit = bit << 1) {
- 			gdImageSetPixel(im, x++, y, (b & bit) ? 1 : 0);
- 			if (x == im->sx) {
--- 
-2.20.1
-
diff --git a/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch b/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
deleted file mode 100644
index e51428a646..0000000000
--- a/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 553702980ae89c83f2d6e254d62cf82e204956d0 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Thu, 17 Jan 2019 11:54:55 +0100
-Subject: [PATCH] Fix #492: Potential double-free in gdImage*Ptr()
-
-Whenever `gdImage*Ptr()` calls `gdImage*Ctx()` and the latter fails, we
-must not call `gdDPExtractData()`; otherwise a double-free would
-happen.  Since `gdImage*Ctx()` are void functions, and we can't change
-that for BC reasons, we're introducing static helpers which are used
-internally.
-
-We're adding a regression test for `gdImageJpegPtr()`, but not for
-`gdImageGifPtr()` and `gdImageWbmpPtr()` since we don't know how to
-trigger failure of the respective `gdImage*Ctx()` calls.
-
-This potential security issue has been reported by Solmaz Salimi (aka.
-Rooney).
-
-CVE-2019-6978
-
-[Peter: drop tests]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/gd_gif_out.c                  | 18 +++++++++++++++---
- src/gd_jpeg.c                     | 20 ++++++++++++++++----
- src/gd_wbmp.c                     | 21 ++++++++++++++++++---
- 3 files changed, 84 insertions(+), 11 deletions(-)
-
-diff --git a/src/gd_gif_out.c b/src/gd_gif_out.c
-index 298a581..d5a9534 100644
---- a/src/gd_gif_out.c
-+++ b/src/gd_gif_out.c
-@@ -99,6 +99,7 @@ static void char_init(GifCtx *ctx);
- static void char_out(int c, GifCtx *ctx);
- static void flush_char(GifCtx *ctx);
- 
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out);
- 
- 
- 
-@@ -131,8 +132,11 @@ BGD_DECLARE(void *) gdImageGifPtr(gdImagePtr im, int *size)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageGifCtx(im, out);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageGifCtx(im, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -220,6 +224,12 @@ BGD_DECLARE(void) gdImageGif(gdImagePtr im, FILE *outFile)
- 
- */
- BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
-+{
-+	_gdImageGifCtx(im, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- {
- 	gdImagePtr pim = 0, tim = im;
- 	int interlace, BitsPerPixel;
-@@ -231,7 +241,7 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 		based temporary image. */
- 		pim = gdImageCreatePaletteFromTrueColor(im, 1, 256);
- 		if(!pim) {
--			return;
-+			return 1;
- 		}
- 		tim = pim;
- 	}
-@@ -247,6 +257,8 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 		/* Destroy palette based temporary image. */
- 		gdImageDestroy(	pim);
- 	}
-+
-+	return 0;
- }
- 
- 
-diff --git a/src/gd_jpeg.c b/src/gd_jpeg.c
-index fc05842..96ef430 100644
---- a/src/gd_jpeg.c
-+++ b/src/gd_jpeg.c
-@@ -117,6 +117,8 @@ static void fatal_jpeg_error(j_common_ptr cinfo)
- 	exit(99);
- }
- 
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality);
-+
- /*
-  * Write IM to OUTFILE as a JFIF-formatted JPEG image, using quality
-  * QUALITY.  If QUALITY is in the range 0-100, increasing values
-@@ -231,8 +233,11 @@ BGD_DECLARE(void *) gdImageJpegPtr(gdImagePtr im, int *size, int quality)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageJpegCtx(im, out, quality);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageJpegCtx(im, out, quality)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -253,6 +258,12 @@ void jpeg_gdIOCtx_dest(j_compress_ptr cinfo, gdIOCtx *outfile);
- 
- */
- BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
-+{
-+	_gdImageJpegCtx(im, outfile, quality);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- {
- 	struct jpeg_compress_struct cinfo;
- 	struct jpeg_error_mgr jerr;
-@@ -287,7 +298,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 		if(row) {
- 			gdFree(row);
- 		}
--		return;
-+		return 1;
- 	}
- 
- 	cinfo.err->emit_message = jpeg_emit_message;
-@@ -328,7 +339,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 	if(row == 0) {
- 		gd_error("gd-jpeg: error: unable to allocate JPEG row structure: gdCalloc returns NULL\n");
- 		jpeg_destroy_compress(&cinfo);
--		return;
-+		return 1;
- 	}
- 
- 	rowptr[0] = row;
-@@ -405,6 +416,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 	jpeg_finish_compress(&cinfo);
- 	jpeg_destroy_compress(&cinfo);
- 	gdFree(row);
-+	return 0;
- }
- 
- 
-diff --git a/src/gd_wbmp.c b/src/gd_wbmp.c
-index f19a1c9..a49bdbe 100644
---- a/src/gd_wbmp.c
-+++ b/src/gd_wbmp.c
-@@ -88,6 +88,8 @@ int gd_getin(void *in)
- 	return (gdGetC((gdIOCtx *)in));
- }
- 
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out);
-+
- /*
- 	Function: gdImageWBMPCtx
- 
-@@ -100,6 +102,12 @@ int gd_getin(void *in)
- 		out   - the stream where to write
- */
- BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
-+{
-+	_gdImageWBMPCtx(image, fg, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- {
- 	int x, y, pos;
- 	Wbmp *wbmp;
-@@ -107,7 +115,7 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- 	/* create the WBMP */
- 	if((wbmp = createwbmp(gdImageSX(image), gdImageSY(image), WBMP_WHITE)) == NULL) {
- 		gd_error("Could not create WBMP\n");
--		return;
-+		return 1;
- 	}
- 
- 	/* fill up the WBMP structure */
-@@ -123,11 +131,15 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- 
- 	/* write the WBMP to a gd file descriptor */
- 	if(writewbmp(wbmp, &gd_putout, out)) {
-+		freewbmp(wbmp);
- 		gd_error("Could not save WBMP\n");
-+		return 1;
- 	}
- 
- 	/* des submitted this bugfix: gdFree the memory. */
- 	freewbmp(wbmp);
-+
-+	return 0;
- }
- 
- /*
-@@ -271,8 +283,11 @@ BGD_DECLARE(void *) gdImageWBMPPtr(gdImagePtr im, int *size, int fg)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageWBMPCtx(im, fg, out);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageWBMPCtx(im, fg, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
--- 
-2.20.1
-
diff --git a/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch b/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
deleted file mode 100644
index 8234de45a2..0000000000
--- a/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a93eac0e843148dc2d631c3ba80af17e9c8c860f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?F=C3=A1bio=20Cabral=20Pacheco?= <fcabralpacheco@gmail.com>
-Date: Fri, 20 Dec 2019 12:03:33 -0300
-Subject: [PATCH] Fix potential NULL pointer dereference in gdImageClone()
-
-[Retrieved (and updated to remove .gitignore and tests) from:
-https://github.com/libgd/libgd/commit/a93eac0e843148dc2d631c3ba80af17e9c8c860f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gd.c                          |  9 +--------
- tests/gdimageclone/.gitignore     |  1 +
- tests/gdimageclone/CMakeLists.txt |  1 +
- tests/gdimageclone/Makemodule.am  |  3 ++-
- tests/gdimageclone/style.c        | 30 ++++++++++++++++++++++++++++++
- 5 files changed, 35 insertions(+), 9 deletions(-)
- create mode 100644 tests/gdimageclone/style.c
-
-diff --git a/src/gd.c b/src/gd.c
-index 592a0286..d564d1f9 100644
---- a/src/gd.c
-+++ b/src/gd.c
-@@ -2865,14 +2865,6 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
- 		}
- 	}
- 
--	if (src->styleLength > 0) {
--		dst->styleLength = src->styleLength;
--		dst->stylePos    = src->stylePos;
--		for (i = 0; i < src->styleLength; i++) {
--			dst->style[i] = src->style[i];
--		}
--	}
--
- 	dst->interlace   = src->interlace;
- 
- 	dst->alphaBlendingFlag = src->alphaBlendingFlag;
-@@ -2907,6 +2899,7 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
- 
- 	if (src->style) {
- 		gdImageSetStyle(dst, src->style, src->styleLength);
-+		dst->stylePos = src->stylePos;
- 	}
- 
- 	for (i = 0; i < gdMaxColors; i++) {
diff --git a/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch b/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
deleted file mode 100644
index 11c7575dd4..0000000000
--- a/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2e886046f86d0d6bfc14aab94a881259a081e3f4 Mon Sep 17 00:00:00 2001
-From: wilson chen <willson.chenwx@gmail.com>
-Date: Fri, 20 Dec 2019 10:12:04 +0800
-Subject: [PATCH] Fix #497: gdImageColorMatch Out Of Bounds Write on Heap
- (CVE-2019-6977)
-
-Fixed CVE-2019-6977 and add corresponding testcase.
-
-Original patch by Christoph M. Bechker <cmbecker69@gmx.de>
-https://gist.github.com/cmb69/1f36d285eb297ed326f5c821d7aafced
-
-[Retrieved (and updated to remove .gitignore and tests) from:
-https://github.com/libgd/libgd/commit/2e886046f86d0d6bfc14aab94a881259a081e3f4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gd_color_match.c                    |  5 ++---
- tests/gdimagecolormatch/.gitignore      |  1 +
- tests/gdimagecolormatch/CMakeLists.txt  |  1 +
- tests/gdimagecolormatch/Makemodule.am   |  1 +
- tests/gdimagecolormatch/cve_2019_6977.c | 25 +++++++++++++++++++++++++
- 5 files changed, 30 insertions(+), 3 deletions(-)
- create mode 100644 tests/gdimagecolormatch/cve_2019_6977.c
-
-diff --git a/src/gd_color_match.c b/src/gd_color_match.c
-index f0842b69..f0194302 100644
---- a/src/gd_color_match.c
-+++ b/src/gd_color_match.c
-@@ -31,9 +31,8 @@ BGD_DECLARE(int) gdImageColorMatch (gdImagePtr im1, gdImagePtr im2)
- 		return -4; /* At least 1 color must be allocated */
- 	}
- 
--	buf = (unsigned long *)gdMalloc(sizeof(unsigned long) * 5 * im2->colorsTotal);
--	memset (buf, 0, sizeof(unsigned long) * 5 * im2->colorsTotal );
--
-+	buf = (unsigned long *)gdMalloc(sizeof(unsigned long) * 5 * gdMaxColors);
-+	memset (buf, 0, sizeof(unsigned long) * 5 * gdMaxColors );
- 	for (x=0; x < im1->sx; x++) {
- 		for( y=0; y<im1->sy; y++ ) {
- 			color = im2->pixels[y][x];
diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index 1cd9e56b18..5aec317f2d 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8c302ccbf467faec732f0741a859eef4ecae22fea2d2ab87467be940842bde51	libgd-2.2.5.tar.xz
-sha256  d02dae2141d49b8a6b09b2b73e68a8f17d7bbeaaf02b3b841ee11fea2d9e328d	COPYING
+sha256  ecd9155b9a417fb3f837f29e5966323796de247789163761dd72dbf83bfcac58  libgd-2.3.0.tar.xz
+sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 419d9a6384..f54c2b37a2 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,29 +4,15 @@
 #
 ################################################################################
 
-GD_VERSION = 2.2.5
+GD_VERSION = 2.3.0
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
-GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
-# 0001-bmp-check-return-value-in-gdImageBmpPtr.patch
-GD_IGNORE_CVES += CVE-2018-1000222
-# 0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
-GD_IGNORE_CVES += CVE-2018-5711
-# 0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
-GD_IGNORE_CVES += CVE-2019-11038
-# 0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
-GD_IGNORE_CVES += CVE-2019-6978
-# 0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
-GD_IGNORE_CVES += CVE-2018-14553
-# 0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
-GD_IGNORE_CVES += CVE-2019-6977
-
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
@@ -47,8 +33,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GD_DEPENDENCIES += libiconv
-# not strictly needed for gd, but ensures -liconv ends up in
-# gdlib-config --libs output
+# not strictly needed for gd, but ensures -liconv ends up in gdlib.pc
 GD_CONF_ENV += LIBS="-liconv"
 endif
 
