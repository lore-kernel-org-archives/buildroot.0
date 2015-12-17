From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:52:59 +0100
Subject: [Buildroot] [git commit] package/efl/libefl: add webp dependency
Message-ID: <20151217230816.2B9FA7F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=128526c7678c912f6636a165a810f27bacc30fcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebP is a new image format that provides lossless and lossy
compression for images on the web. So enabling webp support in efl
libraries allow to loads images using WebP.

Also, it one of the "highly recommended" dependencies [1] according to
the README but disabling it doesn't need the
--enable-i-really-know-what-i-am-doing... option.  That's why
BR2_PACKAGE_LIBEFL_WEBP is not added to
BR2_PACKAGE_LIBEFL_HAS_RECOMMENDED_CONFIG.

[1] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n486

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libefl/Config.in | 6 ++++++
 package/efl/libefl/libefl.mk | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 7d635d9..41b1243 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -137,4 +137,10 @@ config BR2_PACKAGE_LIBEFL_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
+config BR2_PACKAGE_LIBEFL_WEBP
+	bool "libevas webp image loader"
+	select BR2_PACKAGE_WEBP
+	help
+	  This enables the loader code that loads images using WebP.
+
 endif # BR2_PACKAGE_LIBEFL
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index e21d89c..2ebf6fb 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -32,7 +32,6 @@ LIBEFL_GETTEXTIZE = YES
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-fb: disable frame buffer support.
 # --disable-image-loader-jp2k: disable JPEG 2000 support.
-# --disable-image-loader-webp: disable webp support.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
@@ -44,7 +43,6 @@ LIBEFL_CONF_OPTS = \
 	--disable-cxx-bindings \
 	--disable-fb \
 	--disable-image-loader-jp2k \
-	--disable-image-loader-webp \
 	--disable-sdl \
 	--disable-systemd \
 	--enable-lua-old \
@@ -176,6 +174,13 @@ else
 LIBEFL_CONF_OPTS += --disable-image-loader-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
+LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
+LIBEFL_DEPENDENCIES += webp
+else
+LIBEFL_CONF_OPTS += --disable-image-loader-webp
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
