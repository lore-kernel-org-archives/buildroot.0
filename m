From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Apr 2017 23:14:22 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/efl: bump to version 1.19.0
Message-ID: <20170414211424.9283-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new version of the EFL enables systemd support by default, so
we have to disable it explicitely for host-efl by adding an
additional --disable-systemd option to HOST_EFL_CONF_OPTS.

Also handle newly introduced options vnc-server and net-control
which brings additional dependencies. Disable them by default.

Select wayland-protocol package which is now required to build
the efl wayland support [1].

See the release announcement [2].

[1] https://git.enlightenment.org/core/efl.git/commit/?id=55750d41fad6055a549664ae92a34e636d7fb1f0
[2] https://sourceforge.net/p/enlightenment/mailman/message/35785467

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: improve commit log (ThomasP)
---
 package/efl/Config.in |  1 +
 package/efl/efl.hash  |  4 ++--
 package/efl/efl.mk    | 14 ++++++++++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 0785ab8..371ed3f 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -179,6 +179,7 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_EFL_EEZE # efl drm
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	select BR2_PACKAGE_EFL_DRM
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 comment "Wayland support needs udev /dev management (eeze) and OpenGL ES w/ EGL, threads"
 	depends on BR2_PACKAGE_WAYLAND
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 5d7a90d..39e0f93 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.18.4.tar.xz.sha256
-sha256	39ebc07e37437d6ecdeb0f645783484e28a882b38f7e619ad12c2bf9b5548025	efl-1.18.4.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.19.0.tar.xz.sha256
+sha256	a4e0341081778007db414f8cd4e3b77b9d5398870292cab67e6b40cc1445eadf	efl-1.19.0.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 8772871..c71c084 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.18.4
+EFL_VERSION = 1.19.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
@@ -28,7 +28,9 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 # --disable-sdl: disable sdl2 support.
 # --disable-spectre: disable spectre image loader.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
+# --disable-vnc-server: remove libvncserver dependency.
 # --enable-liblz4: use liblz4 from lz4 package.
+# --with-net-control=none: disable connman networkmanager.
 # --with-doxygen: disable doxygen documentation
 EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
@@ -39,11 +41,13 @@ EFL_CONF_OPTS = \
 	--with-elua=$(HOST_DIR)/usr/bin/elua \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-image-loader-jp2k \
+	--with-net-control=none \
 	--disable-lua-old \
 	--disable-poppler \
 	--disable-sdl \
 	--disable-spectre \
 	--disable-xinput22 \
+	--disable-vnc-server \
 	--enable-liblz4 \
 	--with-doxygen=no
 
@@ -212,7 +216,7 @@ endif
 # which depends on wayland-client to build.
 # So enable gl_drm only when wayland support is selected.
 ifeq ($(BR2_PACKAGE_EFL_WAYLAND),y)
-EFL_DEPENDENCIES += wayland
+EFL_DEPENDENCIES += wayland wayland-protocols
 EFL_CONF_OPTS += --enable-wayland --enable-gl-drm
 else
 EFL_CONF_OPTS += --disable-wayland --disable-gl-drm
@@ -323,10 +327,13 @@ HOST_EFL_DEPENDENCIES = \
 # --disable-physics: remove Bullet dependency.
 # --disable-poppler: disable poppler image loader.
 # --disable-spectre: disable spectre image loader.
+# --disable-systemd: disable systemd dependency.
+# --disable-vnc-server: remove libvncserver dependency.
 # --enable-image-loader-gif=no: disable Gif dependency.
 # --enable-image-loader-tiff=no: disable Tiff dependency.
 # --with-crypto=none: remove dependencies on openssl or gnutls.
 # --with-doxygen: disable doxygen documentation
+# --with-net-control=none: disable connman networkmanager.
 # --with-x11=none: remove dependency on X.org.
 #   Yes I really know what I am doing.
 HOST_EFL_CONF_OPTS += \
@@ -343,7 +350,9 @@ HOST_EFL_CONF_OPTS += \
 	--disable-physics \
 	--disable-poppler \
 	--disable-spectre \
+	--disable-systemd \
 	--disable-xcf \
+	--disable-vnc-server \
 	--enable-image-loader-gif=no \
 	--enable-image-loader-jpeg=yes \
 	--enable-image-loader-png=yes \
@@ -351,6 +360,7 @@ HOST_EFL_CONF_OPTS += \
 	--with-crypto=none \
 	--with-doxygen=no \
 	--with-glib=yes \
+	--with-net-control=none \
 	--with-opengl=none \
 	--with-x11=none \
 	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
-- 
2.9.3
