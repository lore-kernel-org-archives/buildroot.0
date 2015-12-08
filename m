From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Dec 2015 00:02:14 +0100
Subject: [Buildroot] [PATCH v8 11/33] package/efl/libefl: add jp2k config
	option
In-Reply-To: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449615756-19115-12-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for webp format, add an option to enable the JPEG 2000
codec support in the efl libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: use --disable option
v4: rename to libefl
    improve commit log
---
 package/efl/libefl/Config.in | 7 +++++++
 package/efl/libefl/libefl.mk | 9 +++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 4a202a0..72b7347 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -98,6 +98,13 @@ config BR2_PACKAGE_LIBEFL_PNG
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
index cdc28bb..e1eb313 100644
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
-- 
2.4.3
