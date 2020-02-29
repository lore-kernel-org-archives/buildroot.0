From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 21:24:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/openjpeg: fix CVE-2019-12973
Message-ID: <20200229202442.3455662-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In OpenJPEG 2.3.1, there is excessive iteration in the
opj_t1_encode_cblks function of openjp2/t1.c. Remote attackers could
leverage this vulnerability to cause a denial of service via a crafted
bmp file. This issue is similar to CVE-2018-6616.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...detect-invalid-file-dimensions-early.patch | 71 +++++++++++++++
 ...4_data-avoid-potential-infinite-loop.patch | 86 +++++++++++++++++++
 package/openjpeg/openjpeg.mk                  |  4 +
 3 files changed, 161 insertions(+)
 create mode 100644 package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
 create mode 100644 package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch

diff --git a/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch b/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
new file mode 100644
index 0000000000..c648020bf7
--- /dev/null
+++ b/package/openjpeg/0004-convertbmp-detect-invalid-file-dimensions-early.patch
@@ -0,0 +1,71 @@
+From 21399f6b7d318fcdf4406d5e88723c4922202aa3 Mon Sep 17 00:00:00 2001
+From: Young Xiao <YangX92@hotmail.com>
+Date: Sat, 16 Mar 2019 19:57:27 +0800
+Subject: [PATCH] convertbmp: detect invalid file dimensions early
+
+width/length dimensions read from bmp headers are not necessarily
+valid. For instance they may have been maliciously set to very large
+values with the intention to cause DoS (large memory allocation, stack
+overflow). In these cases we want to detect the invalid size as early
+as possible.
+
+This commit introduces a counter which verifies that the number of
+written bytes corresponds to the advertized width/length.
+
+See commit 8ee335227bbc for details.
+
+Signed-off-by: Young Xiao <YangX92@hotmail.com>
+[Retrieved from:
+https://github.com/uclouvain/openjpeg/commit/21399f6b7d318fcdf4406d5e88723c4922202aa3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/bin/jp2/convertbmp.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
+index 0af52f816..ec34f535b 100644
+--- a/src/bin/jp2/convertbmp.c
++++ b/src/bin/jp2/convertbmp.c
+@@ -622,13 +622,13 @@ static OPJ_BOOL bmp_read_rle8_data(FILE* IN, OPJ_UINT8* pData,
+ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                                    OPJ_UINT32 stride, OPJ_UINT32 width, OPJ_UINT32 height)
+ {
+-    OPJ_UINT32 x, y;
++    OPJ_UINT32 x, y, written;
+     OPJ_UINT8 *pix;
+     const OPJ_UINT8 *beyond;
+ 
+     beyond = pData + stride * height;
+     pix = pData;
+-    x = y = 0U;
++    x = y = written = 0U;
+     while (y < height) {
+         int c = getc(IN);
+         if (c == EOF) {
+@@ -642,6 +642,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+             for (j = 0; (j < c) && (x < width) &&
+                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+                 *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
++                written++;
+             }
+         } else { /* absolute mode */
+             c = getc(IN);
+@@ -671,6 +672,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                         c1 = (OPJ_UINT8)getc(IN);
+                     }
+                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
++                    written++;
+                 }
+                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
+                     getc(IN);
+@@ -678,6 +680,10 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+             }
+         }
+     }  /* while(y < height) */
++    if (written != width * height) {
++        fprintf(stderr, "warning, image's actual size does not match advertized one\n");
++        return OPJ_FALSE;
++    }
+     return OPJ_TRUE;
+ }
+ 
diff --git a/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch b/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
new file mode 100644
index 0000000000..dbaea3c8da
--- /dev/null
+++ b/package/openjpeg/0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
@@ -0,0 +1,86 @@
+From 3aef207f90e937d4931daf6d411e092f76d82e66 Mon Sep 17 00:00:00 2001
+From: Young Xiao <YangX92@hotmail.com>
+Date: Sat, 16 Mar 2019 20:09:59 +0800
+Subject: [PATCH] bmp_read_rle4_data(): avoid potential infinite loop
+
+[Retrieved from:
+https://github.com/uclouvain/openjpeg/commit/3aef207f90e937d4931daf6d411e092f76d82e66]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/bin/jp2/convertbmp.c | 32 ++++++++++++++++++++++++++------
+ 1 file changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
+index ec34f535b..2fc4e9bc4 100644
+--- a/src/bin/jp2/convertbmp.c
++++ b/src/bin/jp2/convertbmp.c
+@@ -632,12 +632,18 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+     while (y < height) {
+         int c = getc(IN);
+         if (c == EOF) {
+-            break;
++            return OPJ_FALSE;
+         }
+ 
+         if (c) { /* encoded mode */
+-            int j;
+-            OPJ_UINT8 c1 = (OPJ_UINT8)getc(IN);
++            int j, c1_int;
++            OPJ_UINT8 c1;
++
++            c1_int = getc(IN);
++            if (c1_int == EOF) {
++                return OPJ_FALSE;
++            }
++            c1 = (OPJ_UINT8)c1_int;
+ 
+             for (j = 0; (j < c) && (x < width) &&
+                     ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+@@ -647,7 +653,7 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+         } else { /* absolute mode */
+             c = getc(IN);
+             if (c == EOF) {
+-                break;
++                return OPJ_FALSE;
+             }
+ 
+             if (c == 0x00) { /* EOL */
+@@ -658,8 +664,14 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                 break;
+             } else if (c == 0x02) { /* MOVE by dxdy */
+                 c = getc(IN);
++                if (c == EOF) {
++                    return OPJ_FALSE;
++                }
+                 x += (OPJ_UINT32)c;
+                 c = getc(IN);
++                if (c == EOF) {
++                    return OPJ_FALSE;
++                }
+                 y += (OPJ_UINT32)c;
+                 pix = pData + y * stride + x;
+             } else { /* 03 .. 255 : absolute mode */
+@@ -669,13 +681,21 @@ static OPJ_BOOL bmp_read_rle4_data(FILE* IN, OPJ_UINT8* pData,
+                 for (j = 0; (j < c) && (x < width) &&
+                         ((OPJ_SIZE_T)pix < (OPJ_SIZE_T)beyond); j++, x++, pix++) {
+                     if ((j & 1) == 0) {
+-                        c1 = (OPJ_UINT8)getc(IN);
++                        int c1_int;
++                        c1_int = getc(IN);
++                        if (c1_int == EOF) {
++                            return OPJ_FALSE;
++                        }
++                        c1 = (OPJ_UINT8)c1_int;
+                     }
+                     *pix = (OPJ_UINT8)((j & 1) ? (c1 & 0x0fU) : ((c1 >> 4) & 0x0fU));
+                     written++;
+                 }
+                 if (((c & 3) == 1) || ((c & 3) == 2)) { /* skip padding byte */
+-                    getc(IN);
++                    c = getc(IN);
++                    if (c == EOF) {
++                        return OPJ_FALSE;
++                    }
+                 }
+             }
+         }
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 1b119fa5fe..0fe2aed536 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -10,6 +10,10 @@ OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
 
+# 0004-convertbmp-detect-invalid-file-dimensions-early.patch
+# 0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
+OPENJPEG_IGNORE_CVES += CVE-2019-12973
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.25.0
