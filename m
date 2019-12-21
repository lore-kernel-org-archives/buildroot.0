From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:22:42 +0100
Subject: [Buildroot] [git commit] package/genimage: add patch to support
 vfat volume-label
Message-ID: <20191221212320.354B08D318@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb517522fc60747caa340cc0f2500fc94106b63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import "0001-image-vfat-Add-label-option-to-set-volume-name.patch" from
the upstream repository. The changes made to the README.rst file had to
be removed from the patch so that the package can be compiled in
buildroot. The patch has been accepted upstream, but no releases have
been made yet which includes the feature.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-vfat-Add-label-option-to-set-volume-name.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch b/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch
new file mode 100644
index 0000000000..a77b8260a0
--- /dev/null
+++ b/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch
@@ -0,0 +1,69 @@
+From c1a165731298b96175b9b0dd80ad088dc8b33dc1 Mon Sep 17 00:00:00 2001
+From: Florent Viard <fviard@cxignited.com>
+Date: Sun, 27 Oct 2019 23:48:16 +0100
+Subject: [PATCH] image-vfat: Add label option to set volume name.
+
+Signed-off-by: Florent Viard <fviard@cxignited.com>
+[dariobin at libero.it: remove README.rst changes]
+Signed-off-by: Dario Binacchi <dariobin@libero.it>
+---
+ image-vfat.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/image-vfat.c b/image-vfat.c
+index f16242c..3ea7288 100644
+--- a/image-vfat.c
++++ b/image-vfat.c
+@@ -27,14 +27,20 @@ static int vfat_generate(struct image *image)
+ 	int ret;
+ 	struct partition *part;
+ 	char *extraargs = cfg_getstr(image->imagesec, "extraargs");
++	char *label = cfg_getstr(image->imagesec, "label");
++
++	if (label && label[0] != '\0')
++		xasprintf(&label, "-n '%s'", label);
++	else
++		label = "";
+ 
+ 	ret = systemp(image, "%s if=/dev/zero of=\"%s\" seek=%lld count=0 bs=1 2>/dev/null",
+ 			get_opt("dd"), imageoutfile(image), image->size);
+ 	if (ret)
+ 		return ret;
+ 
+-	ret = systemp(image, "%s %s '%s'", get_opt("mkdosfs"),
+-			extraargs, imageoutfile(image));
++	ret = systemp(image, "%s %s %s '%s'", get_opt("mkdosfs"),
++			extraargs, label, imageoutfile(image));
+ 	if (ret)
+ 		return ret;
+ 
+@@ -72,11 +78,18 @@ static int vfat_generate(struct image *image)
+ 
+ static int vfat_setup(struct image *image, cfg_t *cfg)
+ {
++	char *label = cfg_getstr(image->imagesec, "label");
++
+ 	if (!image->size) {
+ 		image_error(image, "no size given or must not be zero\n");
+ 		return -EINVAL;
+ 	}
+ 
++	if (label && strlen(label) > 11) {
++		image_error(image, "vfat volume name cannot be longer than 11 characters\n");
++		return -EINVAL;
++	}
++
+ 	return 0;
+ }
+ 
+@@ -112,6 +125,7 @@ static cfg_opt_t file_opts[] = {
+ 
+ static cfg_opt_t vfat_opts[] = {
+ 	CFG_STR("extraargs", "", CFGF_NONE),
++	CFG_STR("label", "", CFGF_NONE),
+ 	CFG_STR_LIST("files", 0, CFGF_NONE),
+ 	CFG_SEC("file", file_opts, CFGF_MULTI | CFGF_TITLE),
+ 	CFG_END()
+-- 
+2.24.0
+
