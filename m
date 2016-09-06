From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:41:09 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.18.0
Message-ID: <20160906195111.D67B382263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da91eaae731a0ec0bd1dbd1dc55805afd1fa0b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Elementary, evas-generic-loaders and emotion-generic-loaders are now
part of efl 1.18 package [1].

Merge the elementery and evas-generic-loaders package to the efl one.

Rename librsvg option (srvg/libsrvg)

[1] https://phab.enlightenment.org/w/efl_and_elementary_1_18/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/Config.in | 14 ++++++++++++++
 package/efl/efl.hash  |  4 ++--
 package/efl/efl.mk    | 35 ++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 97157f8..1cc681c 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -199,6 +199,20 @@ config BR2_PACKAGE_EFL_WEBP
 	help
 	  This enables the loader code that loads images using WebP.
 
+config BR2_PACKAGE_EFL_LIBRAW
+	bool "libraw loader"
+	select BR2_PACKAGE_LIBRAW
+	help
+	  This option enables the Evas generic Libraw loader
+
+config BR2_PACKAGE_EFL_SVG
+	bool "SVG loader"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_CAIRO
+	help
+	  This option enables the Evas generic SVG loader
+
 endif # BR2_PACKAGE_EFL
 
 comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 2ddc005..81727a2 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.17.2.tar.xz.sha256
-sha256	9aa93ff0ab4bdf95d5cf9606bd7efece611691ca22eb6fc3484fe6e7a92bf8b6	efl-1.17.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.0.tar.xz.sha256
+sha256	06a0bbf5c28f96731b115b0adfa11374d07beb983ae4612ed25b34f4ab5cbf9e	efl-1.18.0.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d404e71..83588c1 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.17.2
+EFL_VERSION = 1.18.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
@@ -24,16 +24,26 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 
 # Configure options:
 # --disable-lua-old: build elua for the target.
+# --disable-poppler: disable poppler image loader.
 # --disable-sdl: disable sdl2 support.
+# --disable-spectre: disable spectre image loader.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
 # --with-opengl=none: disable opengl support.
+# --with-doxygen: disable doxygen documentation
 EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-elementary-codegen=$(HOST_DIR)/usr/bin/elementary_codegen \
+	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
 	--with-elua=$(HOST_DIR)/usr/bin/elua \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-lua-old \
+	--disable-poppler \
 	--disable-sdl \
+	--disable-spectre \
 	--disable-xinput22 \
+	--with-doxygen=no \
 	--with-opengl=none
 
 # Disable untested configuration warning.
@@ -217,6 +227,20 @@ else
 EFL_CONF_OPTS += --disable-image-loader-webp
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_LIBRAW),y)
+EFL_DEPENDENCIES += libraw
+EFL_CONF_OPTS += --enable-libraw
+else
+EFL_CONF_OPTS += --disable-libraw
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_SVG),y)
+EFL_DEPENDENCIES += librsvg cairo
+EFL_CONF_OPTS += --enable-librsvg
+else
+EFL_CONF_OPTS += --disable-librsvg
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
@@ -254,9 +278,12 @@ HOST_EFL_DEPENDENCIES = \
 # --disable-libmount: remove dependency on host-util-linux libmount.
 # --disable-lua-old: build elua for the host.
 # --disable-physics: remove Bullet dependency.
+# --disable-poppler: disable poppler image loader.
+# --disable-spectre: disable spectre image loader.
 # --enable-image-loader-gif=no: disable Gif dependency.
 # --enable-image-loader-tiff=no: disable Tiff dependency.
 # --with-crypto=none: remove dependencies on openssl or gnutls.
+# --with-doxygen: disable doxygen documentation
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
 HOST_EFL_CONF_OPTS += \
@@ -266,14 +293,20 @@ HOST_EFL_CONF_OPTS += \
 	--disable-gstreamer1 \
 	--disable-libeeze \
 	--disable-libmount \
+	--disable-libraw \
+	--disable-librsvg \
 	--disable-lua-old \
 	--disable-multisense \
 	--disable-physics \
+	--disable-poppler \
+	--disable-spectre \
+	--disable-xcf \
 	--enable-image-loader-gif=no \
 	--enable-image-loader-jpeg=yes \
 	--enable-image-loader-png=yes \
 	--enable-image-loader-tiff=no \
 	--with-crypto=none \
+	--with-doxygen=no \
 	--with-glib=yes \
 	--with-opengl=none \
 	--with-x11=none \
