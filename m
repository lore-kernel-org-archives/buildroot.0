From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jan 2021 18:10:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: security bump to version
 2.4.0
Message-ID: <20210104171042.1620641-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop upstreamed patches
- Update indentation in hash file (two spaces)
- Fix CVE-2020-27814, CVE-2020-27823, CVE-2020-27824 and
  CVE-2020-27841 to CVE-2020-27845

https://github.com/uclouvain/openjpeg/releases/v2.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...detect-invalid-file-dimensions-early.patch | 71 ---------------
 ...4_data-avoid-potential-infinite-loop.patch | 86 -------------------
 ...ions-reject-images-whose-coordinates.patch | 32 -------
 ...tcd_init_tile-avoid-integer-overflow.patch | 46 ----------
 ...on-input-directory-with-mix-of-valid.patch | 43 ----------
 package/openjpeg/openjpeg.hash                |  4 +-
 package/openjpeg/openjpeg.mk                  | 15 +---
 7 files changed, 3 insertions(+), 294 deletions(-)
 delete mode 100644 package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
 delete mode 100644 package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
 delete mode 100644 package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
 delete mode 100644 package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch
 delete mode 100644 package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch

diff --git a/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch b/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
deleted file mode 100644
index c648020bf7..0000000000
--- a/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 21399f6b7d318fcdf4406d5e88723c4922202aa3 Mon Sep 17 00:00:00 2001
-From: Young Xiao <YangX92@hotmail.com>
-Date: Sat, 16 Mar 2019 19:57:27 +0800
-Subject: [PATCH] convertbmp: detect invalid file dimensions early
-
-width/length dimensions read from bmp headers are not necessarily
-valid. For instance they may have been maliciously set to very large
-values with the intention to cause DoS (large memory allocation, stack
-overflow). In these cases we want to detect the invalid size as early
-as possible.
-
-This commit introduces a counter which verifies that the number of
-written bytes corresponds to the advertized width/length.
-
-See commit 8ee335227bbc for details.
-
-Signed-off-by: Young Xiao <YangX92@hotmail.com>
-[Retrieved from:
-https://github.com/uclouvain/openjpeg/commit/21399f6b7d318fcdf4406d5e88723c4922202aa3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/bin/jp2/convertbmp.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
-index 0af52f816..ec34f535b 100644
---- a/src/bin/jp2/convertbmp.c
-+++ b/src/bin/jp2/convertbmp.c
-@@ -622,13 +622,13 @@ static OPJ_BOOL bmp_read_rle8_data(FILE* IN, OPJ_UINT8* pData,
- static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-                                    OPJ_UINT32 stride, OPJ_UINT32 width, OPJ_UINT32 height)
- {
--    OPJ_UINT32 x, y;
-+    OPJ_UINT32 x, y, written;
-     OPJ_UINT8 *pix;
-     const OPJ_UINT8 *beyond;
- 
-     beyond = pData + stride * height;
-     pix = pData;
--    x = y = 0U;
-+    x = y = written = 0U;
-     while (y < height) {
-         int c = getc(IN);
-         if (c == EOF) {
-@@ -642,6 +642,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-             for (j = 0; (j < c) && (x < width) &&
-                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
-                 *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
-+                written++;
-             }
-         } else { /* absolute mode */
-             c = getc(IN);
-@@ -671,6 +672,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-                         c1 = (OPJ_UINT8)getc(IN);
-                     }
-                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
-+                    written++;
-                 }
-                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
-                     getc(IN);
-@@ -678,6 +680,10 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-             }
-         }
-     }  /* while(y < height) */
-+    if (written != width * height) {
-+        fprintf(stderr, "warning, image's actual size does not match advertized one\n");
-+        return OPJ_FALSE;
-+    }
-     return OPJ_TRUE;
- }
- 
diff --git a/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch b/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
deleted file mode 100644
index dbaea3c8da..0000000000
--- a/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 3aef207f90e937d4931daf6d411e092f76d82e66 Mon Sep 17 00:00:00 2001
-From: Young Xiao <YangX92@hotmail.com>
-Date: Sat, 16 Mar 2019 20:09:59 +0800
-Subject: [PATCH] bmp_read_rle4_data(): avoid potential infinite loop
-
-[Retrieved from:
-https://github.com/uclouvain/openjpeg/commit/3aef207f90e937d4931daf6d411e092f76d82e66]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/bin/jp2/convertbmp.c | 32 ++++++++++++++++++++++++++------
- 1 file changed, 26 insertions(+), 6 deletions(-)
-
-diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
-index ec34f535b..2fc4e9bc4 100644
---- a/src/bin/jp2/convertbmp.c
-+++ b/src/bin/jp2/convertbmp.c
-@@ -632,12 +632,18 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-     while (y < height) {
-         int c = getc(IN);
-         if (c == EOF) {
--            break;
-+            return OPJ_FALSE;
-         }
- 
-         if (c) { /* encoded mode */
--            int j;
--            OPJ_UINT8 c1 = (OPJ_UINT8)getc(IN);
-+            int j, c1_int;
-+            OPJ_UINT8 c1;
-+
-+            c1_int = getc(IN);
-+            if (c1_int == EOF) {
-+                return OPJ_FALSE;
-+            }
-+            c1 = (OPJ_UINT8)c1_int;
- 
-             for (j = 0; (j < c) && (x < width) &&
-                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
-@@ -647,7 +653,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-         } else { /* absolute mode */
-             c = getc(IN);
-             if (c == EOF) {
--                break;
-+                return OPJ_FALSE;
-             }
- 
-             if (c == 0x00) { /* EOL */
-@@ -658,8 +664,14 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-                 break;
-             } else if (c == 0x02) { /* MOVE by dxdy */
-                 c = getc(IN);
-+                if (c == EOF) {
-+                    return OPJ_FALSE;
-+                }
-                 x += (OPJ_UINT32)c;
-                 c = getc(IN);
-+                if (c == EOF) {
-+                    return OPJ_FALSE;
-+                }
-                 y += (OPJ_UINT32)c;
-                 pix = pData + y * stride + x;
-             } else { /* 03 .. 255 : absolute mode */
-@@ -669,13 +681,21 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
-                 for (j = 0; (j < c) && (x < width) &&
-                         ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
-                     if ((j & 1) == 0) {
--                        c1 = (OPJ_UINT8)getc(IN);
-+                        int c1_int;
-+                        c1_int = getc(IN);
-+                        if (c1_int == EOF) {
-+                            return OPJ_FALSE;
-+                        }
-+                        c1 = (OPJ_UINT8)c1_int;
-                     }
-                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
-                     written++;
-                 }
-                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
--                    getc(IN);
-+                    c = getc(IN);
-+                    if (c == EOF) {
-+                        return OPJ_FALSE;
-+                    }
-                 }
-             }
-         }
diff --git a/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch b/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
deleted file mode 100644
index fe1390a310..0000000000
--- a/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 11 Jan 2020 01:51:19 +0100
-Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
- coordinates are beyond INT_MAX (fixes #1228)
-
-[Retrieved from:
-https://github.com/uclouvain/openjpeg/commit/024b8407392cb0b82b04b58ed256094ed5799e04]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/lib/openjp2/j2k.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
-index 14f6ff41a..922550eb1 100644
---- a/src/lib/openjp2/j2k.c
-+++ b/src/lib/openjp2/j2k.c
-@@ -9221,6 +9221,14 @@ static OPJ_BOOL opj_j2k_update_image_dimensions(opj_image_t* p_image,
-     l_img_comp = p_image->comps;
-     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
-         OPJ_INT32 l_h, l_w;
-+        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
-+                p_image->y0 > (OPJ_UINT32)INT_MAX ||
-+                p_image->x1 > (OPJ_UINT32)INT_MAX ||
-+                p_image->y1 > (OPJ_UINT32)INT_MAX) {
-+            opj_event_msg(p_manager, EVT_ERROR,
-+                          "Image coordinates above INT_MAX are not supported\n");
-+            return OPJ_FALSE;
-+        }
- 
-         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
-                          (OPJ_INT32)l_img_comp->dx);
diff --git a/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch b/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch
deleted file mode 100644
index 7d82377d52..0000000000
--- a/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 05f9b91e60debda0e83977e5e63b2e66486f7074 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 30 Jan 2020 00:59:57 +0100
-Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
-
-That could lead to later assertion failures.
-
-Fixes #1231 / CVE-2020-8112
-[Retrieved from:
-https://github.com/uclouvain/openjpeg/commit/05f9b91e60debda0e83977e5e63b2e66486f7074]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
- 1 file changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/openjp2/tcd.c b/src/lib/openjp2/tcd.c
-index deecc4dff..aa419030a 100644
---- a/src/lib/openjp2/tcd.c
-+++ b/src/lib/openjp2/tcd.c
-@@ -905,8 +905,24 @@ static INLINE OPJ_BOOL opj_tcd_init_tile(opj_tcd_t *p_tcd, OPJ_UINT32 p_tile_no,
-             /* p. 64, B.6, ISO/IEC FDIS15444-1 : 2000 (18 august 2000)  */
-             l_tl_prc_x_start = opj_int_floordivpow2(l_res->x0, (OPJ_INT32)l_pdx) << l_pdx;
-             l_tl_prc_y_start = opj_int_floordivpow2(l_res->y0, (OPJ_INT32)l_pdy) << l_pdy;
--            l_br_prc_x_end = opj_int_ceildivpow2(l_res->x1, (OPJ_INT32)l_pdx) << l_pdx;
--            l_br_prc_y_end = opj_int_ceildivpow2(l_res->y1, (OPJ_INT32)l_pdy) << l_pdy;
-+            {
-+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->x1,
-+                                  (OPJ_INT32)l_pdx)) << l_pdx;
-+                if (tmp > (OPJ_UINT32)INT_MAX) {
-+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
-+                    return OPJ_FALSE;
-+                }
-+                l_br_prc_x_end = (OPJ_INT32)tmp;
-+            }
-+            {
-+                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->y1,
-+                                  (OPJ_INT32)l_pdy)) << l_pdy;
-+                if (tmp > (OPJ_UINT32)INT_MAX) {
-+                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
-+                    return OPJ_FALSE;
-+                }
-+                l_br_prc_y_end = (OPJ_INT32)tmp;
-+            }
-             /*fprintf(stderr, "\t\t\tprc_x_start=%d, prc_y_start=%d, br_prc_x_end=%d, br_prc_y_end=%d \n", l_tl_prc_x_start, l_tl_prc_y_start, l_br_prc_x_end ,l_br_prc_y_end );*/
- 
-             l_res->pw = (l_res->x0 == l_res->x1) ? 0U : (OPJ_UINT32)((
diff --git a/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch b/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
deleted file mode 100644
index 4c1b3eb2a8..0000000000
--- a/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 28 Jun 2020 14:19:59 +0200
-Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
- of valid and invalid images (CVE-2020-15389)
-
-Fixes #1261
-
-Credits to @Ruia-ruia for reporting and analysis.
-
-[Retrieved from:
-https://github.com/uclouvain/openjpeg/commit/e8e258ab049240c2dd1f1051b4e773b21e2d3dc0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/bin/jp2/opj_decompress.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
-index 7eeb0952f..2634907f0 100644
---- a/src/bin/jp2/opj_decompress.c
-+++ b/src/bin/jp2/opj_decompress.c
-@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
- int main(int argc, char **argv)
- {
-     opj_decompress_parameters parameters;           /* decompression parameters */
--    opj_image_t* image = NULL;
--    opj_stream_t *l_stream = NULL;              /* Stream */
--    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
--    opj_codestream_index_t* cstr_index = NULL;
- 
-     OPJ_INT32 num_images, imageno;
-     img_fol_t img_fol;
-@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
- 
-     /*Decoding image one by one*/
-     for (imageno = 0; imageno < num_images ; imageno++)  {
-+        opj_image_t* image = NULL;
-+        opj_stream_t *l_stream = NULL;              /* Stream */
-+        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
-+        opj_codestream_index_t* cstr_index = NULL;
- 
-         if (!parameters.quiet) {
-             fprintf(stderr, "\n");
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 31c5b50409..8798245256 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 63f5a4713ecafc86de51bfad89cc07bb788e9bba24ebbf0c4ca637621aadb6a9  openjpeg-2.3.1.tar.gz
-sha256 a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
+sha256  8702ba68b442657f11aaeb2b338443ca8d5fb95b0d845757968a7be31ef7f16d  openjpeg-2.4.0.tar.gz
+sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index b65dbce807..7663cbb0b9 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,25 +4,12 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.3.1
+OPENJPEG_VERSION = 2.4.0
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
 
-# 0004-convertbmp-detect-invalid-file-dimensions-early.patch
-# 0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
-OPENJPEG_IGNORE_CVES += CVE-2019-12973
-
-# 0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
-OPENJPEG_IGNORE_CVES += CVE-2020-6851
-
-# 0007-opj_tcd_init_tile-avoid-integer-overflow.patch
-OPENJPEG_IGNORE_CVES += CVE-2020-8112
-
-# 0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
-OPENJPEG_IGNORE_CVES += CVE-2020-15389
-
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.29.2
