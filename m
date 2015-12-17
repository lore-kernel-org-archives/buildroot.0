From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:54:04 +0100
Subject: [Buildroot] [git commit] package/efl/libefl: add jp2k config option
Message-ID: <20151217230816.3AE7882650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b93493ffabb541a4a6b462b27684dcbe8eae53d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for webp format, add an option to enable the JPEG 2000
codec support in the efl libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libefl/Config.in | 7 +++++++
 package/efl/libefl/libefl.mk | 9 +++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 2a5149e..3ce5606 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -123,6 +123,13 @@ config BR2_PACKAGE_LIBEFL_PNG
 	  This enables the loader code that loads png files using
 	  libpng.
 
+config BR2_PACKAGE_LIBEFL_JP2K
+	bool "libevas jp2k loader"
+	select BR2_PACKAGE_OPENJPEG
+	help
+	  This enables the loader code that loads jp2k files using
+	  openjpeg.
+
 config BR2_PACKAGE_LIBEFL_JPEG
 	bool "libevas jpeg loader"
 	help
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 75af6c9..5c02440 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -30,7 +30,6 @@ LIBEFL_GETTEXTIZE = YES
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
-# --disable-image-loader-jp2k: disable JPEG 2000 support.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
@@ -40,7 +39,6 @@ LIBEFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
-	--disable-image-loader-jp2k \
 	--disable-sdl \
 	--disable-systemd \
 	--enable-lua-old \
@@ -178,6 +176,13 @@ else
 LIBEFL_CONF_OPTS += --disable-image-loader-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_JP2K),y)
+LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=yes
+LIBEFL_DEPENDENCIES += openjpeg
+else
+LIBEFL_CONF_OPTS += --disable-image-loader-jp2k
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
 LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
 LIBEFL_DEPENDENCIES += webp
