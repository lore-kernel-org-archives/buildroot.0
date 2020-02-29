From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 21:24:42 +0100
Subject: [Buildroot] [PATCH 3/3] package/openjpeg: fix CVE-2020-8112
In-Reply-To: <20200229202442.3455662-1-fontaine.fabrice@gmail.com>
References: <20200229202442.3455662-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229202442.3455662-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opj_t1_clbl_decode_processor in openjp2/t1.c in OpenJPEG 2.3.1 through
2020-01-28 has a heap-based buffer overflow in the qmfbid==1 case, a
different issue than CVE-2020-6851.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tcd_init_tile-avoid-integer-overflow.patch | 46 +++++++++++++++++++
 package/openjpeg/openjpeg.mk                  |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch

diff --git a/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch b/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch
new file mode 100644
index 0000000000..7d82377d52
--- /dev/null
+++ b/package/openjpeg/0007-opj_tcd_init_tile-avoid-integer-overflow.patch
@@ -0,0 +1,46 @@
+From 05f9b91e60debda0e83977e5e63b2e66486f7074 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 30 Jan 2020 00:59:57 +0100
+Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
+
+That could lead to later assertion failures.
+
+Fixes #1231 / CVE-2020-8112
+[Retrieved from:
+https://github.com/uclouvain/openjpeg/commit/05f9b91e60debda0e83977e5e63b2e66486f7074]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/openjp2/tcd.c b/src/lib/openjp2/tcd.c
+index deecc4dff..aa419030a 100644
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -905,8 +905,24 @@ static INLINE OPJ_BOOL opj_tcd_init_tile(opj_tcd_t *p_tcd, OPJ_UINT32 p_tile_no,
+             /* p. 64, B.6, ISO/IEC FDIS15444-1 : 2000 (18 august 2000)  */
+             l_tl_prc_x_start = opj_int_floordivpow2(l_res->x0, (OPJ_INT32)l_pdx) << l_pdx;
+             l_tl_prc_y_start = opj_int_floordivpow2(l_res->y0, (OPJ_INT32)l_pdy) << l_pdy;
+-            l_br_prc_x_end = opj_int_ceildivpow2(l_res->x1, (OPJ_INT32)l_pdx) << l_pdx;
+-            l_br_prc_y_end = opj_int_ceildivpow2(l_res->y1, (OPJ_INT32)l_pdy) << l_pdy;
++            {
++                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->x1,
++                                  (OPJ_INT32)l_pdx)) << l_pdx;
++                if (tmp > (OPJ_UINT32)INT_MAX) {
++                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
++                    return OPJ_FALSE;
++                }
++                l_br_prc_x_end = (OPJ_INT32)tmp;
++            }
++            {
++                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->y1,
++                                  (OPJ_INT32)l_pdy)) << l_pdy;
++                if (tmp > (OPJ_UINT32)INT_MAX) {
++                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
++                    return OPJ_FALSE;
++                }
++                l_br_prc_y_end = (OPJ_INT32)tmp;
++            }
+             /*fprintf(stderr, "\t\t\tprc_x_start=%d, prc_y_start=%d, br_prc_x_end=%d, br_prc_y_end=%d \n", l_tl_prc_x_start, l_tl_prc_y_start, l_br_prc_x_end ,l_br_prc_y_end );*/
+ 
+             l_res->pw = (l_res->x0 == l_res->x1) ? 0U : (OPJ_UINT32)((
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 28d6e97b01..1ff3111d64 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -17,6 +17,9 @@ OPENJPEG_IGNORE_CVES += CVE-2019-12973
 # 0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
 OPENJPEG_IGNORE_CVES += CVE-2020-6851
 
+# 0007-opj_tcd_init_tile-avoid-integer-overflow.patch
+OPENJPEG_IGNORE_CVES += CVE-2020-8112
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.25.0
