From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Mar 2016 23:11:23 +0100
Subject: [Buildroot] [PATCH] package/efl: switch to luajit support
Message-ID: <1459030283-31627-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In efl 1.15.x, Lua "old" support is broken with Lua 5.2+ [1].

With the patch added in efl 1.16 to fixes this issue, libevas fail to link with
the following error:

CCLD bin/ecore_evas/ecore_evas_convert
host-efl-1.16.1/src/lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
collect2: error: ld returned 1 exit status
Makefile:19021: recipe for target 'bin/ecore_evas/ecore_evas_convert' failed

Since 9ba8d1cce4ab00307827083bae234d87b37fb967, the luajit support can be
enabled in efl package.
In order to update the efl stack to 1.17, switch to luajit support and remove
Lua "old" support since it's not fixed upstream yet. But the drawback is the
efl stack depends implicitely on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS.

[1] https://phab.enlightenment.org/T2728

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in |  6 +++---
 package/efl/efl.mk    | 17 +++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 88e2c36..c8e17d2 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_EFL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	# https://phab.enlightenment.org/T2728
-	depends on BR2_PACKAGE_LUA_5_1 # needs lua 5.1, broken with 5.2+
+	depends on BR2_PACKAGE_LUAJIT # Lua support broken with 5.2+
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
@@ -186,6 +186,6 @@ comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library,
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
-comment "efl needs lua 5.1"
-	depends on !BR2_PACKAGE_LUA_5_1
+comment "efl needs luajit"
+	depends on !BR2_PACKAGE_LUAJIT
 	depends on BR2_USE_MMU
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 2ea2592..916999d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -19,8 +19,8 @@ EFL_LICENSE_FILES = \
 
 EFL_INSTALL_STAGING = YES
 
-EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev \
-	util-linux zlib
+EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
+	jpeg luajit udev util-linux zlib
 
 # Regenerate the autotools:
 #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
@@ -29,19 +29,20 @@ EFL_GETTEXTIZE = YES
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
+# --disable-lua-old: build elua for the target.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
-# --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-opengl=none: disable opengl support.
 EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-elua=$(HOST_DIR)/usr/bin/elua \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
+	--disable-lua-old \
 	--disable-sdl \
 	--disable-systemd \
 	--disable-xinput22 \
-	--enable-lua-old \
 	--with-opengl=none
 
 # Disable untested configuration warning.
@@ -227,7 +228,7 @@ $(eval $(autotools-package))
 # * host-freetype: for libevas
 # * host-libglib2: for libecore
 # * host-libjpeg, host-libpng: for libevas image loader
-# * host-lua: disable luajit dependency
+# * host-luajit for Elua tool for the host
 HOST_EFL_DEPENDENCIES = \
 	host-pkgconf \
 	host-dbus \
@@ -235,7 +236,7 @@ HOST_EFL_DEPENDENCIES = \
 	host-libglib2 \
 	host-libjpeg \
 	host-libpng \
-	host-lua \
+	host-luajit \
 	host-zlib
 
 # Configure options:
@@ -246,10 +247,10 @@ HOST_EFL_DEPENDENCIES = \
 # --disable-gstreamer1: remove dependency on gtreamer 1.0.
 # --disable-libeeze: remove libudev dependency.
 # --disable-libmount: remove dependency on host-util-linux libmount.
+# --disable-lua-old: build elua for the host.
 # --disable-physics: remove Bullet dependency.
 # --enable-image-loader-gif=no: disable Gif dependency.
 # --enable-image-loader-tiff=no: disable Tiff dependency.
-# --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-crypto=none: remove dependencies on openssl or gnutls.
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
@@ -261,13 +262,13 @@ HOST_EFL_CONF_OPTS += \
 	--disable-gstreamer1 \
 	--disable-libeeze \
 	--disable-libmount \
+	--disable-lua-old \
 	--disable-multisense \
 	--disable-physics \
 	--enable-image-loader-gif=no \
 	--enable-image-loader-jpeg=yes \
 	--enable-image-loader-png=yes \
 	--enable-image-loader-tiff=no \
-	--enable-lua-old \
 	--with-crypto=none \
 	--with-glib=yes \
 	--with-opengl=none \
-- 
2.5.5
