From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:07 +0100
Subject: [Buildroot] [RFC PATCH v1 12/25] package/libgtkglext: new package
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-13-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in                  |  1 +
 package/libgtkglext/Config.in      | 18 ++++++++++++++++++
 package/libgtkglext/libgtkglext.mk | 29 +++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/libgtkglext/Config.in
 create mode 100644 package/libgtkglext/libgtkglext.mk

diff --git a/package/Config.in b/package/Config.in
index 56b01b3b31..79933bfa8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1323,6 +1323,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libgtkglext/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpangox/Config.in"
diff --git a/package/libgtkglext/Config.in b/package/libgtkglext/Config.in
new file mode 100644
index 0000000000..9502335eab
--- /dev/null
+++ b/package/libgtkglext/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBGTKGLEXT
+	bool "libgtkglext"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBPANGOX
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  GtkGLExt is an OpenGL extension to GTK+.
+
+	  https://projects-old.gnome.org/gtkglext/index.html
diff --git a/package/libgtkglext/libgtkglext.mk b/package/libgtkglext/libgtkglext.mk
new file mode 100644
index 0000000000..93a5d6382d
--- /dev/null
+++ b/package/libgtkglext/libgtkglext.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libgtkglext
+#
+################################################################################
+LIBGTKGLEXT_VERSION = 1.2.0
+LIBGTKGLEXT_SOURCE = gtkglext-$(LIBGTKGLEXT_VERSION).tar.gz
+LIBGTKGLEXT_SITE = http://downloads.sourceforge.net/gtkglext
+LIBGTKGLEXT_INSTALL_STAGING = YES
+LIBGTKGLEXT_DEPENDENCIES = \
+	host-pkgconf \
+	libglib2 \
+	libpangox \
+	pango \
+	xlib_libICE \
+	xlib_libSM \
+	xlib_libX11 \
+	xlib_libXmu \
+	xlib_libXt \
+	libglu \
+	libgtk2
+
+LIBGTKGLEXT_PATCH = \
+	https://sources.debian.org/data/main/g/gtkglext/1.2.0-9/debian/patches/01_fix_fontcache_nullderef.diff \
+	https://sources.debian.org/data/main/g/gtkglext/1.2.0-9/debian/patches/02_fix_gtk-2.20_deprecated_symbols.diff \
+	https://sources.debian.org/data/main/g/gtkglext/1.2.0-9/debian/patches/04_glibc2.27-ftbfs.diff \
+	https://sources.debian.org/data/main/g/gtkglext/1.2.0-9/debian/patches/libGL.so.1.diff
+
+$(eval $(autotools-package))
-- 
2.20.1
