From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 10:42:32 +0100
Subject: [Buildroot] [git commit] package/openjpeg: fix CVE-2020-6851
Message-ID: <20200301093136.2DDB78F048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3b1f2885eeaf610eb98c5f419ece9d71e33e9c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenJPEG through 2.3.1 has a heap-based buffer overflow in
opj_t1_clbl_decode_processor in openjp2/t1.c because of lack of
opj_j2k_update_image_dimensions validation.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...imensions-reject-images-whose-coordinates.patch | 32 ++++++++++++++++++++++
 package/openjpeg/openjpeg.mk                       |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch b/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
new file mode 100644
index 0000000000..fe1390a310
--- /dev/null
+++ b/package/openjpeg/0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
@@ -0,0 +1,32 @@
+From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 11 Jan 2020 01:51:19 +0100
+Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
+ coordinates are beyond INT_MAX (fixes #1228)
+
+[Retrieved from:
+https://github.com/uclouvain/openjpeg/commit/024b8407392cb0b82b04b58ed256094ed5799e04]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lib/openjp2/j2k.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
+index 14f6ff41a..922550eb1 100644
+--- a/src/lib/openjp2/j2k.c
++++ b/src/lib/openjp2/j2k.c
+@@ -9221,6 +9221,14 @@ static OPJ_BOOL opj_j2k_update_image_dimensions(opj_image_t* p_image,
+     l_img_comp = p_image->comps;
+     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
+         OPJ_INT32 l_h, l_w;
++        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
++                p_image->y0 > (OPJ_UINT32)INT_MAX ||
++                p_image->x1 > (OPJ_UINT32)INT_MAX ||
++                p_image->y1 > (OPJ_UINT32)INT_MAX) {
++            opj_event_msg(p_manager, EVT_ERROR,
++                          "Image coordinates above INT_MAX are not supported\n");
++            return OPJ_FALSE;
++        }
+ 
+         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
+                          (OPJ_INT32)l_img_comp->dx);
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 0fe2aed536..28d6e97b01 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -14,6 +14,9 @@ OPENJPEG_INSTALL_STAGING = YES
 # 0005-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
 OPENJPEG_IGNORE_CVES += CVE-2019-12973
 
+# 0006-opj_j2k_update_image_dimensions-reject-images-whose-coordinates.patch
+OPENJPEG_IGNORE_CVES += CVE-2020-6851
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
