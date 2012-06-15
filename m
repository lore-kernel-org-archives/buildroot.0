From: Arn R <arnerro@gmail.com>
Date: Fri, 15 Jun 2012 18:10:18 +1000
Subject: [Buildroot] [PATCH] fbv: Allow selection of supported image formats.
Message-ID: <1339747818-5118-1-git-send-email-arnerro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This removes fbv's compulsory dependency on either libpng and/or libjpeg and/or libungif.
The user can choose which compressed image format's fbv should support.
By default PNG, JPEG and GIF are selected.
Note that BMP format support will still always be included.

Signed-off-by: Arn R <arnerro@gmail.com>
---
 package/fbv/Config.in |   28 +++++++++++++++++++++++++---
 package/fbv/fbv.mk    |   20 +++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)

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
index 855a0d4..466a708 100644
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
@@ -17,6 +34,7 @@ define FBV_CONFIGURE_CMDS
 		./configure \
 		--prefix=/usr \
 		--libs="-lz -lm" \
+		$(FBV_CONFIGURE_OPTS) \
 	)
 endef
 
-- 
1.7.5.4
