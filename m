From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:17 -0000
Subject: [Buildroot] [git commit branch/next] fbv: Allow selection of
	supported image formats.
Message-ID: <20120802195240.2E7CE800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e41f5628b98f9827236a8499e45aefd40282623
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This removes fbv's compulsory dependency on either libpng and/or libjpeg and/or libungif.
The user can choose which compressed image format's fbv should support.
By default PNG, JPEG and GIF are selected.
Note that BMP format support will still always be included.

[Peter: Drop (unneeded) png specific libs]
Signed-off-by: Arn R <arnerro@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbv/Config.in |   28 +++++++++++++++++++++++++---
 package/fbv/fbv.mk    |   21 +++++++++++++++++++--
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/package/fbv/Config.in b/package/fbv/Config.in
index ea54401..b8a9fe4 100644
--- a/package/fbv/Config.in
+++ b/package/fbv/Config.in
@@ -1,11 +1,33 @@
 config BR2_PACKAGE_FBV
 	bool "fbv"
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBUNGIF
 	help
 	  fbv is a very simple graphic file viewer for the framebuffer console,
 	  capable of displaying GIF, JPEG, PNG and BMP files using libungif,
 	  libjpeg and libpng.
 
 	  http://freshmeat.net/projects/fbv/
+
+if BR2_PACKAGE_FBV
+
+config BR2_PACKAGE_FBV_PNG
+	bool "PNG support"
+	default y
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Enable support for PNG using libpng.
+
+config BR2_PACKAGE_FBV_JPEG
+	bool "JPEG support"
+	default y
+	select BR2_PACKAGE_JPEG
+	help
+	  Enable support for JPEG using IJG's libjpeg.
+
+config BR2_PACKAGE_FBV_GIF
+	bool "GIF support"
+	default y
+	select BR2_PACKAGE_LIBUNGIF
+	help
+	  Enable support for GIF using libungif.
+
+endif # BR2_PACKAGE_FBV
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 855a0d4..7db6802 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -7,7 +7,24 @@ FBV_VERSION:=1.0b
 FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
 FBV_SITE:=http://s-tech.elsat.net.pl/fbv
 
-FBV_DEPENDENCIES = libpng jpeg libungif
+### image format dependencies and configure options
+FBV_DEPENDENCIES = # empty
+FBV_CONFIGURE_OPTS = # empty
+ifeq ($(BR2_PACKAGE_FBV_PNG),y)
+FBV_DEPENDENCIES += libpng
+else
+FBV_CONFIGURE_OPTS += --without-libpng
+endif
+ifeq ($(BR2_PACKAGE_FBV_JPEG),y)
+FBV_DEPENDENCIES += jpeg
+else
+FBV_CONFIGURE_OPTS += --without-libjpeg
+endif
+ifeq ($(BR2_PACKAGE_FBV_GIF),y)
+FBV_DEPENDENCIES += libungif
+else
+FBV_CONFIGURE_OPTS += --without-libungif
+endif
 
 #fbv donesn't support cross-compilation
 define FBV_CONFIGURE_CMDS
@@ -16,7 +33,7 @@ define FBV_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
-		--libs="-lz -lm" \
+		$(FBV_CONFIGURE_OPTS) \
 	)
 endef
 
