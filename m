From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Mar 2017 16:09:57 +0100
Subject: [Buildroot] [PATCH 2/9] package/darktable: new package
In-Reply-To: <20170305151004.2815-1-romain.naour@gmail.com>
References: <20170305151004.2815-1-romain.naour@gmail.com>
Message-ID: <20170305151004.2815-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a small note about adwaita icon to avoid a Gtk warning:

Gtk-WARNING **: Could not find the icon 'pan-down-symbolic-ltr'. The 'hicolor' theme
was not found either, perhaps you need to install it.
You can get a copy from:
        http://icon-theme.freedesktop.org/releases

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/darktable/Config.in      | 59 ++++++++++++++++++++++++++++++++++++
 package/darktable/darktable.hash |  2 ++
 package/darktable/darktable.mk   | 64 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 127 insertions(+)
 create mode 100644 package/darktable/Config.in
 create mode 100644 package/darktable/darktable.hash
 create mode 100644 package/darktable/darktable.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c9c9255..8b64244 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1286,6 +1286,7 @@ F:	package/vnstat/
 N:	Romain Naour <romain.naour@gmail.com>
 F:	package/aubio/
 F:	package/bullet/
+F:	package/darktable/
 F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
diff --git a/package/Config.in b/package/Config.in
index 8b5ba05..7f11791 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -236,6 +236,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/darktable/Config.in"
 	source "package/expedite/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/darktable/Config.in b/package/darktable/Config.in
new file mode 100644
index 0000000..6a4f81b
--- /dev/null
+++ b/package/darktable/Config.in
@@ -0,0 +1,59 @@
+
+# Darktable is only available for x86_64 or aarch64 little endian system only.
+# Experimental support for i386 (not recommended).
+# Building without SSE2 on x86_64 is highly experimental.
+# See src/is_supported_platform.h
+config BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
+	bool
+	default y if (BR2_x86_64 && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2) || \
+		BR2_aarch64
+
+config BR2_PACKAGE_DARKTABLE
+	bool "darktable"
+	depends on BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_USE_WCHAR # libgtk3 -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3 -> glib2
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk3 -> pango
+	depends on !BR2_STATIC_LIBS # exiv2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3 -> pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBGL # libgtk3
+	select BR2_PACKAGE_EXIV2
+	select BR2_PACKAGE_JPEG # jpeg-turbo only
+	select BR2_PACKAGE_JPEG_TURBO
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LENSFUN
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBRSVG
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PUGIXML
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_TIFF
+	help
+	  Darktable is an open source photography workflow application
+	  and raw developer. A virtual lighttable and darkroom for
+	  photographers. It manages your digital negatives in a
+	  database, lets you view them through a zoomable lighttable
+	  and enables you to develop raw images and enhance them.
+
+	  adwaita-icon-theme can be selected to provide some icon to
+	  Gtk3.
+
+	  http://www.darktable.org
+
+comment "darktable needs a toolchain w/ gcc >= 4.8, dynamic library, wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "darktable needs an OpenGL or an OpenGL-EGL/wayland backend"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DARKTABLE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/darktable/darktable.hash b/package/darktable/darktable.hash
new file mode 100644
index 0000000..cbb9bae
--- /dev/null
+++ b/package/darktable/darktable.hash
@@ -0,0 +1,2 @@
+# From https://github.com/darktable-org/darktable/releases/tag/release-2.2.3
+sha256 1b33859585bf283577680c61e3c0ea4e48214371453b9c17a86664d2fbda48a0  darktable-2.2.3.tar.xz
diff --git a/package/darktable/darktable.mk b/package/darktable/darktable.mk
new file mode 100644
index 0000000..53a8637
--- /dev/null
+++ b/package/darktable/darktable.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# darktable
+#
+################################################################################
+
+DARKTABLE_VERSION = 2.2.3
+DARKTABLE_SITE = https://github.com/darktable-org/darktable/releases/download/release-$(DARKTABLE_VERSION)
+DARKTABLE_SOURCE = darktable-$(DARKTABLE_VERSION).tar.xz
+
+DARKTABLE_LICENSE = GPLv3+
+DARKTABLE_LICENSE_FILES = LICENSE
+
+# Darktable doesn't support in source build.
+DARKTABLE_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# Install some shared libraries in /usr/lib/darktable/plugins
+DARKTABLE_INSTALL_STAGING = YES
+
+# From: http://redmine.darktable.org/projects/darktable/wiki/Building_darktable_20
+# Minimal dependencies.
+# host-gettext: Native Language Support.
+# host-libxml2: provide xmllint host tool.
+# host-libxslt: provide xsltproc host tool.
+# Force to use a bundled version of rawspeed library (linked statically).
+DARKTABLE_DEPENDENCIES = host-gettext host-intltool host-libxml2 host-libxslt \
+	exiv2 jpeg json-glib lcms2 lensfun libcurl libgtk3 librsvg libxml2 \
+	pugixml sqlite tiff
+
+# Disable cmstest: needs colord.
+# Disable print module: needs cups.
+# Disable Camera support: needs Gphoto2.
+# Disable colord: needs libcolord-gtk.
+# Disable Map View parts: needs libosmgpsmap.
+# Disable OpenCL support (needs llvm compiler).
+# Disable OpenExr: no openexr package.
+# Use CFLAGS provided by Buildroot.
+DARKTABLE_CONF_OPTS = \
+	-DBUILD_CMSTEST=OFF \
+	-DBUILD_PRINT=OFF \
+	-DBUILD_USERMANUAL=OFF \
+	-DCUSTOM_CFLAGS=ON \
+	-DUSE_CAMERA_SUPPORT=OFF \
+	-DUSE_COLORD=OFF \
+	-DUSE_FLICKR=OFF \
+	-DUSE_GRAPHICSMAGICK=OFF \
+	-DUSE_KWALLET=OFF \
+	-DUSE_LIBSECRET=OFF \
+	-DUSE_LUA=OFF \
+	-DUSE_MAP=OFF \
+	-DUSE_NLS=ON \
+	-DUSE_OPENCL=OFF \
+	-DUSE_OPENJPEG=OFF \
+	-DUSE_OPENMP=OFF \
+	-DUSE_OPENEXR=OFF \
+	-DUSE_WEBP=OFF
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=ON
+else
+DARKTABLE_CONF_OPTS += -DBUILD_SSE2_CODEPATHS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.9.3
