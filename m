From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:28:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/gd: add
 post-2.2.5 security fixes from upstream
Message-ID: <20191030122142.399C08E018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=132bbb36c8989be2fffd733045d4635e307149d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerablities:

- CVE-2018-1000222: Libgd version 2.2.5 contains a Double Free Vulnerability
  vulnerability in gdImageBmpPtr Function that can result in Remote Code
  Execution .  This attack appear to be exploitable via Specially Crafted
  Jpeg Image can trigger double free

- CVE-2018-5711: gd_gif_in.c in the GD Graphics Library (aka libgd), as used
  in PHP before 5.6.33, 7.0.x before 7.0.27, 7.1.x before 7.1.13, and 7.2.x
  before 7.2.1, has an integer signedness error that leads to an infinite
  loop via a crafted GIF file, as demonstrated by a call to the
  imagecreatefromgif or imagecreatefromstring PHP function

- CVE-2019-11038: When using the gdImageCreateFromXbm() function in the GD
  Graphics Library (aka LibGD) 2.2.5, as used in the PHP GD extension in PHP
  versions 7.1.x below 7.1.30, 7.2.x below 7.2.19 and 7.3.x below 7.3.6, it
  is possible to supply data that will cause the function to use the value
  of uninitialized variable.  This may lead to disclosing contents of the
  stack that has been left there by previous code

- CVE-2019-6978: The GD Graphics Library (aka LibGD) 2.2.5 has a double free
  in the gdImage*Ptr() functions in gd_gif_out.c, gd_jpeg.c, and gd_wbmp.c

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 505a70edbe3656a3cce3b4a776f7af510cc778d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-bmp-check-return-value-in-gdImageBmpPtr.patch |  80 ++++++++
 ...ential-infinite-loop-in-gdImageCreateFrom.patch |  61 ++++++
 ...nitialized-read-in-gdImageCreateFromXbm-C.patch |  41 ++++
 ...-492-Potential-double-free-in-gdImage-Ptr.patch | 219 +++++++++++++++++++++
 4 files changed, 401 insertions(+)

diff --git a/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch b/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch
new file mode 100644
index 0000000000..f3c9ea481c
--- /dev/null
+++ b/package/gd/0001-bmp-check-return-value-in-gdImageBmpPtr.patch
@@ -0,0 +1,80 @@
+From ac16bdf2d41724b5a65255d4c28fb0ec46bc42f5 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 14 Jul 2018 13:54:08 -0400
+Subject: [PATCH] bmp: check return value in gdImageBmpPtr
+
+Closes #447.
+
+CVE-2018-1000222
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/gd_bmp.c | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/src/gd_bmp.c b/src/gd_bmp.c
+index bde0b9d..78f40d9 100644
+--- a/src/gd_bmp.c
++++ b/src/gd_bmp.c
+@@ -47,6 +47,8 @@ static int bmp_read_4bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp
+ static int bmp_read_8bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp_hdr_t *header);
+ static int bmp_read_rle(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info);
+ 
++static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression);
++
+ #define BMP_DEBUG(s)
+ 
+ static int gdBMPPutWord(gdIOCtx *out, int w)
+@@ -87,8 +89,10 @@ BGD_DECLARE(void *) gdImageBmpPtr(gdImagePtr im, int *size, int compression)
+ 	void *rv;
+ 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
+ 	if (out == NULL) return NULL;
+-	gdImageBmpCtx(im, out, compression);
+-	rv = gdDPExtractData(out, size);
++	if (!_gdImageBmpCtx(im, out, compression))
++		rv = gdDPExtractData(out, size);
++	else
++		rv = NULL;
+ 	out->gd_free(out);
+ 	return rv;
+ }
+@@ -141,6 +145,11 @@ BGD_DECLARE(void) gdImageBmp(gdImagePtr im, FILE *outFile, int compression)
+ 		compression - whether to apply RLE or not.
+ */
+ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
++{
++	_gdImageBmpCtx(im, out, compression);
++}
++
++static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ {
+ 	int bitmap_size = 0, info_size, total_size, padding;
+ 	int i, row, xpos, pixel;
+@@ -148,6 +157,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ 	unsigned char *uncompressed_row = NULL, *uncompressed_row_start = NULL;
+ 	FILE *tmpfile_for_compression = NULL;
+ 	gdIOCtxPtr out_original = NULL;
++	int ret = 1;
+ 
+ 	/* No compression if its true colour or we don't support seek */
+ 	if (im->trueColor) {
+@@ -325,6 +335,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ 		out_original = NULL;
+ 	}
+ 
++	ret = 0;
+ cleanup:
+ 	if (tmpfile_for_compression) {
+ #ifdef _WIN32
+@@ -338,7 +349,7 @@ cleanup:
+ 	if (out_original) {
+ 		out_original->gd_free(out_original);
+ 	}
+-	return;
++	return ret;
+ }
+ 
+ static int compress_row(unsigned char *row, int length)
+-- 
+2.20.1
+
diff --git a/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch b/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
new file mode 100644
index 0000000000..8d77f0ee18
--- /dev/null
+++ b/package/gd/0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
@@ -0,0 +1,61 @@
+From a11f47475e6443b7f32d21f2271f28f417e2ac04 Mon Sep 17 00:00:00 2001
+From: "Christoph M. Becker" <cmbecker69@gmx.de>
+Date: Wed, 29 Nov 2017 19:37:38 +0100
+Subject: [PATCH] Fix #420: Potential infinite loop in gdImageCreateFromGifCtx
+
+Due to a signedness confusion in `GetCode_` a corrupt GIF file can
+trigger an infinite loop.  Furthermore we make sure that a GIF without
+any palette entries is treated as invalid *after* open palette entries
+have been removed.
+
+CVE-2018-5711
+
+See also https://bugs.php.net/bug.php?id=75571.
+
+[Peter: drop tests]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/gd_gif_in.c             |  12 ++++++------
+ 1 files changed, 38 insertions(+), 6 deletions(-)
+
+diff --git a/src/gd_gif_in.c b/src/gd_gif_in.c
+index daf26e7..0a8bd71 100644
+--- a/src/gd_gif_in.c
++++ b/src/gd_gif_in.c
+@@ -335,11 +335,6 @@ terminated:
+ 		return 0;
+ 	}
+ 
+-	if(!im->colorsTotal) {
+-		gdImageDestroy(im);
+-		return 0;
+-	}
+-
+ 	/* Check for open colors at the end, so
+ 	 * we can reduce colorsTotal and ultimately
+ 	 * BitsPerPixel */
+@@ -351,6 +346,11 @@ terminated:
+ 		}
+ 	}
+ 
++	if(!im->colorsTotal) {
++		gdImageDestroy(im);
++		return 0;
++	}
++
+ 	return im;
+ }
+ 
+@@ -447,7 +447,7 @@ static int
+ GetCode_(gdIOCtx *fd, CODE_STATIC_DATA *scd, int code_size, int flag, int *ZeroDataBlockP)
+ {
+ 	int i, j, ret;
+-	unsigned char count;
++	int count;
+ 
+ 	if(flag) {
+ 		scd->curbit = 0;
+
+-- 
+2.20.1
+
diff --git a/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch b/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
new file mode 100644
index 0000000000..57df1a2fb1
--- /dev/null
+++ b/package/gd/0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
@@ -0,0 +1,41 @@
+From e13a342c079aeb73e31dfa19eaca119761bac3f3 Mon Sep 17 00:00:00 2001
+From: Jonas Meurer <jonas@freesources.org>
+Date: Tue, 11 Jun 2019 12:16:46 +0200
+Subject: [PATCH] Fix #501: Uninitialized read in gdImageCreateFromXbm
+ (CVE-2019-11038)
+
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2019-11038
+Bug-Debian: https://bugs.debian.org/929821
+Bug: https://github.com/libgd/libgd/issues/501
+
+We have to ensure that `sscanf()` does indeed read a hex value here,
+and bail out otherwise.
+
+Original patch by Christoph M. Becker <cmbecker69@gmx.de> for PHP libgd ext.
+https://git.php.net/?p=php-src.git;a=commit;h=ed6dee9a198c904ad5e03113e58a2d2c200f5184
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/gd_xbm.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_xbm.c b/src/gd_xbm.c
+index 4ca41ac..cf0545e 100644
+--- a/src/gd_xbm.c
++++ b/src/gd_xbm.c
+@@ -169,7 +169,11 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromXbm(FILE * fd)
+ 			}
+ 			h[3] = ch;
+ 		}
+-		sscanf(h, "%x", &b);
++		if (sscanf(h, "%x", &b) != 1) {
++			gd_error("invalid XBM");
++			gdImageDestroy(im);
++			return 0;
++		}
+ 		for (bit = 1; bit <= max_bit; bit = bit << 1) {
+ 			gdImageSetPixel(im, x++, y, (b & bit) ? 1 : 0);
+ 			if (x == im->sx) {
+-- 
+2.20.1
+
diff --git a/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch b/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
new file mode 100644
index 0000000000..e51428a646
--- /dev/null
+++ b/package/gd/0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
@@ -0,0 +1,219 @@
+From 553702980ae89c83f2d6e254d62cf82e204956d0 Mon Sep 17 00:00:00 2001
+From: "Christoph M. Becker" <cmbecker69@gmx.de>
+Date: Thu, 17 Jan 2019 11:54:55 +0100
+Subject: [PATCH] Fix #492: Potential double-free in gdImage*Ptr()
+
+Whenever `gdImage*Ptr()` calls `gdImage*Ctx()` and the latter fails, we
+must not call `gdDPExtractData()`; otherwise a double-free would
+happen.  Since `gdImage*Ctx()` are void functions, and we can't change
+that for BC reasons, we're introducing static helpers which are used
+internally.
+
+We're adding a regression test for `gdImageJpegPtr()`, but not for
+`gdImageGifPtr()` and `gdImageWbmpPtr()` since we don't know how to
+trigger failure of the respective `gdImage*Ctx()` calls.
+
+This potential security issue has been reported by Solmaz Salimi (aka.
+Rooney).
+
+CVE-2019-6978
+
+[Peter: drop tests]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/gd_gif_out.c                  | 18 +++++++++++++++---
+ src/gd_jpeg.c                     | 20 ++++++++++++++++----
+ src/gd_wbmp.c                     | 21 ++++++++++++++++++---
+ 3 files changed, 84 insertions(+), 11 deletions(-)
+
+diff --git a/src/gd_gif_out.c b/src/gd_gif_out.c
+index 298a581..d5a9534 100644
+--- a/src/gd_gif_out.c
++++ b/src/gd_gif_out.c
+@@ -99,6 +99,7 @@ static void char_init(GifCtx *ctx);
+ static void char_out(int c, GifCtx *ctx);
+ static void flush_char(GifCtx *ctx);
+ 
++static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out);
+ 
+ 
+ 
+@@ -131,8 +132,11 @@ BGD_DECLARE(void *) gdImageGifPtr(gdImagePtr im, int *size)
+ 	void *rv;
+ 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
+ 	if (out == NULL) return NULL;
+-	gdImageGifCtx(im, out);
+-	rv = gdDPExtractData(out, size);
++	if (!_gdImageGifCtx(im, out)) {
++		rv = gdDPExtractData(out, size);
++	} else {
++		rv = NULL;
++	}
+ 	out->gd_free(out);
+ 	return rv;
+ }
+@@ -220,6 +224,12 @@ BGD_DECLARE(void) gdImageGif(gdImagePtr im, FILE *outFile)
+ 
+ */
+ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
++{
++	_gdImageGifCtx(im, out);
++}
++
++/* returns 0 on success, 1 on failure */
++static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
+ {
+ 	gdImagePtr pim = 0, tim = im;
+ 	int interlace, BitsPerPixel;
+@@ -231,7 +241,7 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
+ 		based temporary image. */
+ 		pim = gdImageCreatePaletteFromTrueColor(im, 1, 256);
+ 		if(!pim) {
+-			return;
++			return 1;
+ 		}
+ 		tim = pim;
+ 	}
+@@ -247,6 +257,8 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
+ 		/* Destroy palette based temporary image. */
+ 		gdImageDestroy(	pim);
+ 	}
++
++	return 0;
+ }
+ 
+ 
+diff --git a/src/gd_jpeg.c b/src/gd_jpeg.c
+index fc05842..96ef430 100644
+--- a/src/gd_jpeg.c
++++ b/src/gd_jpeg.c
+@@ -117,6 +117,8 @@ static void fatal_jpeg_error(j_common_ptr cinfo)
+ 	exit(99);
+ }
+ 
++static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality);
++
+ /*
+  * Write IM to OUTFILE as a JFIF-formatted JPEG image, using quality
+  * QUALITY.  If QUALITY is in the range 0-100, increasing values
+@@ -231,8 +233,11 @@ BGD_DECLARE(void *) gdImageJpegPtr(gdImagePtr im, int *size, int quality)
+ 	void *rv;
+ 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
+ 	if (out == NULL) return NULL;
+-	gdImageJpegCtx(im, out, quality);
+-	rv = gdDPExtractData(out, size);
++	if (!_gdImageJpegCtx(im, out, quality)) {
++		rv = gdDPExtractData(out, size);
++	} else {
++		rv = NULL;
++	}
+ 	out->gd_free(out);
+ 	return rv;
+ }
+@@ -253,6 +258,12 @@ void jpeg_gdIOCtx_dest(j_compress_ptr cinfo, gdIOCtx *outfile);
+ 
+ */
+ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
++{
++	_gdImageJpegCtx(im, outfile, quality);
++}
++
++/* returns 0 on success, 1 on failure */
++static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
+ {
+ 	struct jpeg_compress_struct cinfo;
+ 	struct jpeg_error_mgr jerr;
+@@ -287,7 +298,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
+ 		if(row) {
+ 			gdFree(row);
+ 		}
+-		return;
++		return 1;
+ 	}
+ 
+ 	cinfo.err->emit_message = jpeg_emit_message;
+@@ -328,7 +339,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
+ 	if(row == 0) {
+ 		gd_error("gd-jpeg: error: unable to allocate JPEG row structure: gdCalloc returns NULL\n");
+ 		jpeg_destroy_compress(&cinfo);
+-		return;
++		return 1;
+ 	}
+ 
+ 	rowptr[0] = row;
+@@ -405,6 +416,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
+ 	jpeg_finish_compress(&cinfo);
+ 	jpeg_destroy_compress(&cinfo);
+ 	gdFree(row);
++	return 0;
+ }
+ 
+ 
+diff --git a/src/gd_wbmp.c b/src/gd_wbmp.c
+index f19a1c9..a49bdbe 100644
+--- a/src/gd_wbmp.c
++++ b/src/gd_wbmp.c
+@@ -88,6 +88,8 @@ int gd_getin(void *in)
+ 	return (gdGetC((gdIOCtx *)in));
+ }
+ 
++static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out);
++
+ /*
+ 	Function: gdImageWBMPCtx
+ 
+@@ -100,6 +102,12 @@ int gd_getin(void *in)
+ 		out   - the stream where to write
+ */
+ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
++{
++	_gdImageWBMPCtx(image, fg, out);
++}
++
++/* returns 0 on success, 1 on failure */
++static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
+ {
+ 	int x, y, pos;
+ 	Wbmp *wbmp;
+@@ -107,7 +115,7 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
+ 	/* create the WBMP */
+ 	if((wbmp = createwbmp(gdImageSX(image), gdImageSY(image), WBMP_WHITE)) == NULL) {
+ 		gd_error("Could not create WBMP\n");
+-		return;
++		return 1;
+ 	}
+ 
+ 	/* fill up the WBMP structure */
+@@ -123,11 +131,15 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
+ 
+ 	/* write the WBMP to a gd file descriptor */
+ 	if(writewbmp(wbmp, &gd_putout, out)) {
++		freewbmp(wbmp);
+ 		gd_error("Could not save WBMP\n");
++		return 1;
+ 	}
+ 
+ 	/* des submitted this bugfix: gdFree the memory. */
+ 	freewbmp(wbmp);
++
++	return 0;
+ }
+ 
+ /*
+@@ -271,8 +283,11 @@ BGD_DECLARE(void *) gdImageWBMPPtr(gdImagePtr im, int *size, int fg)
+ 	void *rv;
+ 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
+ 	if (out == NULL) return NULL;
+-	gdImageWBMPCtx(im, fg, out);
+-	rv = gdDPExtractData(out, size);
++	if (!_gdImageWBMPCtx(im, fg, out)) {
++		rv = gdDPExtractData(out, size);
++	} else {
++		rv = NULL;
++	}
+ 	out->gd_free(out);
+ 	return rv;
+ }
+-- 
+2.20.1
+
