From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri, 31 Jan 2020 17:59:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump to version 12
Message-ID: <1580489971-27640-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also drop upstreamed patch

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...-vfat-Add-label-option-to-set-volume-name.patch | 69 ----------------------
 package/genimage/genimage.hash                     |  2 +-
 package/genimage/genimage.mk                       |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch

diff --git a/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch b/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch
deleted file mode 100644
index a77b826..0000000
--- a/package/genimage/0001-image-vfat-Add-label-option-to-set-volume-name.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From c1a165731298b96175b9b0dd80ad088dc8b33dc1 Mon Sep 17 00:00:00 2001
-From: Florent Viard <fviard@cxignited.com>
-Date: Sun, 27 Oct 2019 23:48:16 +0100
-Subject: [PATCH] image-vfat: Add label option to set volume name.
-
-Signed-off-by: Florent Viard <fviard@cxignited.com>
-[dariobin at libero.it: remove README.rst changes]
-Signed-off-by: Dario Binacchi <dariobin@libero.it>
----
- image-vfat.c | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/image-vfat.c b/image-vfat.c
-index f16242c..3ea7288 100644
---- a/image-vfat.c
-+++ b/image-vfat.c
-@@ -27,14 +27,20 @@ static int vfat_generate(struct image *image)
- 	int ret;
- 	struct partition *part;
- 	char *extraargs = cfg_getstr(image->imagesec, "extraargs");
-+	char *label = cfg_getstr(image->imagesec, "label");
-+
-+	if (label && label[0] != '\0')
-+		xasprintf(&label, "-n '%s'", label);
-+	else
-+		label = "";
- 
- 	ret = systemp(image, "%s if=/dev/zero of=\"%s\" seek=%lld count=0 bs=1 2>/dev/null",
- 			get_opt("dd"), imageoutfile(image), image->size);
- 	if (ret)
- 		return ret;
- 
--	ret = systemp(image, "%s %s '%s'", get_opt("mkdosfs"),
--			extraargs, imageoutfile(image));
-+	ret = systemp(image, "%s %s %s '%s'", get_opt("mkdosfs"),
-+			extraargs, label, imageoutfile(image));
- 	if (ret)
- 		return ret;
- 
-@@ -72,11 +78,18 @@ static int vfat_generate(struct image *image)
- 
- static int vfat_setup(struct image *image, cfg_t *cfg)
- {
-+	char *label = cfg_getstr(image->imagesec, "label");
-+
- 	if (!image->size) {
- 		image_error(image, "no size given or must not be zero\n");
- 		return -EINVAL;
- 	}
- 
-+	if (label && strlen(label) > 11) {
-+		image_error(image, "vfat volume name cannot be longer than 11 characters\n");
-+		return -EINVAL;
-+	}
-+
- 	return 0;
- }
- 
-@@ -112,6 +125,7 @@ static cfg_opt_t file_opts[] = {
- 
- static cfg_opt_t vfat_opts[] = {
- 	CFG_STR("extraargs", "", CFGF_NONE),
-+	CFG_STR("label", "", CFGF_NONE),
- 	CFG_STR_LIST("files", 0, CFGF_NONE),
- 	CFG_SEC("file", file_opts, CFGF_MULTI | CFGF_TITLE),
- 	CFG_END()
--- 
-2.24.0
-
diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index c1f2270..fb5d235 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz
+sha256	2e9b43d1288f4e216d6c79de2a0c53ce1bd41f93cec750d8ab057aa2d0b0ee4a	genimage-12.tar.xz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 5ef7d30..8960393 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 11
+GENIMAGE_VERSION = 12
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.7.4
