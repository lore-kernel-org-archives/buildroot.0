From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Mar 2016 00:00:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/efl: enable luajit support
In-Reply-To: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
References: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457132443-15973-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lua-old support is currently broken for Lua 5.2+ due to [1] and it's not
yet fixed with efl 1.17.

In order to bump to a newer efl version, we need to enable the luajit support
and use it by default.

We need to build Elua for the host to enable luajit support for the target.

[1] https://phab.enlightenment.org/T2728

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 13 ++++++++++---
 package/efl/efl.mk    | 32 ++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 88e2c36..0851961 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_EFL
 	bool "efl"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # luajit or Lua 5.1
 	# https://phab.enlightenment.org/T2728
-	depends on BR2_PACKAGE_LUA_5_1 # needs lua 5.1, broken with 5.2+
+	depends on !BR2_PACKAGE_LUA_5_2 # broken with 5.2+
+	depends on !BR2_PACKAGE_LUA_5_3 # broken with 5.2+
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
@@ -186,6 +188,11 @@ comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library,
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
-comment "efl needs lua 5.1"
-	depends on !BR2_PACKAGE_LUA_5_1
+comment "efl needs a lua interpreter (luajit or lua 5.1)"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_USE_MMU
+
+comment "efl needs Lua 5.1"
+	depends on BR2_PACKAGE_LUA_5_2 # broken with 5.2+
+	depends on BR2_PACKAGE_LUA_5_3 # broken with 5.2+
 	depends on BR2_USE_MMU
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 2ea2592..ed6cee6 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -19,8 +19,8 @@ EFL_LICENSE_FILES = \
 
 EFL_INSTALL_STAGING = YES
 
-EFL_DEPENDENCIES = host-pkgconf host-efl dbus freetype jpeg lua udev \
-	util-linux zlib
+EFL_DEPENDENCIES = host-pkgconf host-efl host-luainterpreter dbus freetype \
+	jpeg luainterpreter udev util-linux zlib
 
 # Regenerate the autotools:
 #  - to fix an issue in eldbus-codegen: https://phab.enlightenment.org/T2718
@@ -32,16 +32,15 @@ EFL_GETTEXTIZE = YES
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
 	--disable-sdl \
 	--disable-systemd \
 	--disable-xinput22 \
-	--enable-lua-old \
 	--with-opengl=none
 
 # Disable untested configuration warning.
@@ -49,6 +48,15 @@ ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
 EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
 endif
 
+# We need to build Elua for the host to enable luajit support for the target.
+# --disable-lua-old: build elua for the target.
+# --enable-lua-old: disable Elua and remove luajit dependency.
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+EFL_CONF_OPTS += --disable-lua-old
+else
+EFL_CONF_OPTS += --enable-lua-old
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += --enable-libmount
@@ -227,7 +235,8 @@ $(eval $(autotools-package))
 # * host-freetype: for libevas
 # * host-libglib2: for libecore
 # * host-libjpeg, host-libpng: for libevas image loader
-# * host-lua: disable luajit dependency
+# * host-luainterpreter: host-luajit for Elua tool for the host
+#   or host-lua for lua-old option
 HOST_EFL_DEPENDENCIES = \
 	host-pkgconf \
 	host-dbus \
@@ -235,9 +244,18 @@ HOST_EFL_DEPENDENCIES = \
 	host-libglib2 \
 	host-libjpeg \
 	host-libpng \
-	host-lua \
+	host-luainterpreter \
 	host-zlib
 
+# If luajit is enabled for the target, we need to build Elua for the host.
+# --disable-lua-old: build elua for the host.
+# --enable-lua-old: disable Elua and remove luajit dependency.
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+HOST_EFL_CONF_OPTS += --disable-lua-old
+else
+HOST_EFL_CONF_OPTS += --enable-lua-old
+endif
+
 # Configure options:
 # --disable-audio, --disable-multisense remove libsndfile dependency.
 # --disable-cxx-bindings: disable C++11 bindings.
@@ -249,7 +267,6 @@ HOST_EFL_DEPENDENCIES = \
 # --disable-physics: remove Bullet dependency.
 # --enable-image-loader-gif=no: disable Gif dependency.
 # --enable-image-loader-tiff=no: disable Tiff dependency.
-# --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-crypto=none: remove dependencies on openssl or gnutls.
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
@@ -267,7 +284,6 @@ HOST_EFL_CONF_OPTS += \
 	--enable-image-loader-jpeg=yes \
 	--enable-image-loader-png=yes \
 	--enable-image-loader-tiff=no \
-	--enable-lua-old \
 	--with-crypto=none \
 	--with-glib=yes \
 	--with-opengl=none \
-- 
2.5.0
