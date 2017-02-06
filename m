From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Feb 2017 14:37:31 +0100
Subject: [Buildroot] [PATCH v3] efl: do not force dependency on libudev by
	making eeze a config option.
Message-ID: <20170206133731.6639-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>

Although highly recommended to be enabled, EFL's eeze can be disabled
and thus no dependency on libudev or dynamic device management.

Since 'BR2_PACKAGE_HAS_UDEV' has two ways to be satisfied (eudev or
systemd) we can't automatically select it, instead show a comment and
use 'depends on'.

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
[Romain:
  - Propagate the eeze dependency to enlightenment
  - Remove udev provider from eeze comment in efl's Config.in]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: Add missing udev in Enlightenment comment text (Baruch Siach)
v2: Propagate the eeze dependency to enlightenment
    Remove udev provider from eeze comment in efl's Config.in since
    we don't explicitely name all possible providers in comment.
---
 package/efl/Config.in           | 25 ++++++++++++++++++++++---
 package/efl/efl.mk              |  9 ++++++++-
 package/enlightenment/Config.in |  7 +++++--
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 8b06a49..79346b3 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_EFL
 	depends on BR2_HOST_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_HAS_UDEV # libudev
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
@@ -37,6 +36,19 @@ config BR2_PACKAGE_EFL_BULLET
 	  simply not tested so you are on your own in terms of
 	  ensuring everything works if you do this.
 
+config BR2_PACKAGE_EFL_EEZE
+	bool "Enable eeze (udev) support (recommended)"
+	depends on BR2_PACKAGE_HAS_UDEV # libudev
+	default y
+	help
+	  Eeze is EFL's hardware abstraction layer on top of udev.
+	  Having it off will disable some hardware detection, such as
+	  'drm' graphics engine or 'elput', as well as mounting
+	  removable media.
+
+comment "eeze needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_EFL_FONTCONFIG
 	bool "Enable fontconfig support (recommended)"
 	select BR2_PACKAGE_FONTCONFIG
@@ -98,6 +110,7 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
+	depends on BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	# libblkid is part of required tools, see EFL's README.
@@ -108,9 +121,13 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	  devices etc... and disabling this will hurt support for
 	  Enlightenment and its filemanager.
 
+comment "efl's libmount support needs eeze"
+	depends on !BR2_PACKAGE_EFL_EEZE
+
 config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
 	default y if BR2_PACKAGE_EFL_BULLET && \
+		BR2_PACKAGE_EFL_EEZE && \
 		BR2_PACKAGE_EFL_FONTCONFIG && \
 		BR2_PACKAGE_EFL_GSTREAMER1 && \
 		BR2_PACKAGE_EFL_LIBFRIBIDI && \
@@ -198,6 +215,7 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_ELPUT
 	bool "Elput"
+	depends on BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
@@ -208,6 +226,7 @@ config BR2_PACKAGE_EFL_ELPUT
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
+	depends on BR2_PACKAGE_EFL_EEZE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
 	select BR2_PACKAGE_EFL_ELPUT
@@ -279,8 +298,8 @@ config BR2_PACKAGE_EFL_SVG
 
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_HOST_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ab08946..1e54f72 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -20,7 +20,7 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	jpeg luajit lz4 udev zlib
+	jpeg luajit lz4 zlib
 
 # Configure options:
 # --disable-lua-old: build elua for the target.
@@ -59,6 +59,13 @@ else
 EFL_CONF_OPTS += --disable-cxx-bindings
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_EEZE),y)
+EFL_DEPENDENCIES += udev
+EFL_CONF_OPTS += --enable-libeeze
+else
+EFL_CONF_OPTS += --disable-libeeze
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += --enable-libmount
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index b5d889b..d1dee25 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -9,10 +9,12 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	# libedbus -> dbus, efl libraries
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_EFL
+	depends on BR2_PACKAGE_HAS_UDEV # efl (eeze) -> libudev
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_EFL_X_XLIB
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_PNG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_SVG
@@ -26,7 +28,8 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs a toolchain w/ wchar, C++, threads"
+comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.9.3
