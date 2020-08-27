From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:10:12 +0200
Subject: [Buildroot] [git commit] package/openjpeg: fix CVE-2020-15389
Message-ID: <20200827210255.01DD181D9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b006cc373f96ec86c027779e113c8f70bc40d1c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-15389: jp2/opj_decompress.c in OpenJPEG through 2.3.1 has a
use-after-free that can be triggered if there is a mix of valid and
invalid files in a directory operated on by the decompressor. Triggering
a double-free may also be possible. This is related to calling
opj_image_destroy twice.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...free-on-input-directory-with-mix-of-valid.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch b/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
new file mode 100644
index 0000000000..4c1b3eb2a8
--- /dev/null
+++ b/package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch
@@ -0,0 +1,43 @@
+From e8e258ab049240c2dd1f1051b4e773b21e2d3dc0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 28 Jun 2020 14:19:59 +0200
+Subject: [PATCH] opj_decompress: fix double-free on input directory with mix
+ of valid and invalid images (CVE-2020-15389)
+
+Fixes #1261
+
+Credits to @Ruia-ruia for reporting and analysis.
+
+[Retrieved from:
+https://github.com/uclouvain/openjpeg/commit/e8e258ab049240c2dd1f1051b4e773b21e2d3dc0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/bin/jp2/opj_decompress.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index 7eeb0952f..2634907f0 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1316,10 +1316,6 @@ static opj_image_t* upsample_image_components(opj_image_t* original)
+ int main(int argc, char **argv)
+ {
+     opj_decompress_parameters parameters;           /* decompression parameters */
+-    opj_image_t* image = NULL;
+-    opj_stream_t *l_stream = NULL;              /* Stream */
+-    opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
+-    opj_codestream_index_t* cstr_index = NULL;
+ 
+     OPJ_INT32 num_images, imageno;
+     img_fol_t img_fol;
+@@ -1393,6 +1389,10 @@ int main(int argc, char **argv)
+ 
+     /*Decoding image one by one*/
+     for (imageno = 0; imageno < num_images ; imageno++)  {
++        opj_image_t* image = NULL;
++        opj_stream_t *l_stream = NULL;              /* Stream */
++        opj_codec_t* l_codec = NULL;                /* Handle to a decompressor */
++        opj_codestream_index_t* cstr_index = NULL;
+ 
+         if (!parameters.quiet) {
+             fprintf(stderr, "\n");
