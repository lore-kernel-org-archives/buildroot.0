From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:10:32 -0700
Subject: [Buildroot] [PATCH 5/6] package/gstreamer1/gst1-python: new package
In-Reply-To: <20200315201034.1552960-1-aduskett@gmail.com>
References: <20200315201034.1552960-1-aduskett@gmail.com>
Message-ID: <20200315201034.1552960-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GStreamer Python binding overrides.

This package also includes a simple upstream patch that fixes building against
python-3.8.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/gstreamer1/Config.in                  |  1 +
 .../0001-fix-builds-with-python-3.8.patch     | 43 +++++++++++++++++++
 package/gstreamer1/gst1-python/Config.in      | 24 +++++++++++
 .../gstreamer1/gst1-python/gst1-python.hash   |  3 ++
 package/gstreamer1/gst1-python/gst1-python.mk | 32 ++++++++++++++
 6 files changed, 104 insertions(+)
 create mode 100644 package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch
 create mode 100644 package/gstreamer1/gst1-python/Config.in
 create mode 100644 package/gstreamer1/gst1-python/gst1-python.hash
 create mode 100644 package/gstreamer1/gst1-python/gst1-python.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5394150e5a..36b7f618aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/gstreamer1/gst1-plugins-bad/
 F:	package/gstreamer1/gst1-plugins-base/
 F:	package/gstreamer1/gst1-plugins-good/
 F:	package/gstreamer1/gst1-plugins-ugly/
+F:	package/gstreamer1/gst1-python/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index bb5c1d2af8..0e47d78e68 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -11,6 +11,7 @@ source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-interpipe/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
+source "package/gstreamer1/gst1-python/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
diff --git a/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch b/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch
new file mode 100644
index 0000000000..edff445a7a
--- /dev/null
+++ b/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch
@@ -0,0 +1,43 @@
+From 10707f437f2fc3632067c6a0efa4432f7ebaf362 Mon Sep 17 00:00:00 2001
+From: Sebastian Dr?ge <sebastian@centricular.com>
+Date: Fri, 13 Dec 2019 10:46:20 +0200
+Subject: [PATCH] backport of "fix build with Python 3.8 by also checking for
+ python-3.X-embed.pc"
+
+Since Python 3.8 the normal checks don't include the Python libraries
+anymore and linking of the gst-python module would fail.
+
+See also https://github.com/mesonbuild/meson/issues/5629
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gst-python/issues/28
+
+Upstream commit: 22f28155d86e27c4134de4ed2861264003fcfd23
+
+Signed-off-by: Sebastian Dr?ge <sebastian@centricular.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 744b7ce..492af1a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -25,6 +25,14 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
+ pymod = import('python')
+ python = pymod.find_installation(get_option('python'))
+ python_dep = python.dependency(required : true)
++pythonver = python.language_version()
++
++# Workaround for https://github.com/mesonbuild/meson/issues/5629
++# https://gitlab.freedesktop.org/gstreamer/gst-python/issues/28
++python_dep = dependency('python- at 0@-embed'.format(pythonver), version: '>=3', required: false)
++if not python_dep.found()
++  python_dep = python.dependency(required : true)
++endif
+ 
+ python_abi_flags = python.get_variable('ABIFLAGS', '')
+ pylib_loc = get_option('libpython-dir')
+-- 
+2.24.1
+
diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
new file mode 100644
index 0000000000..9149703354
--- /dev/null
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GST1_PYTHON
+	bool "gst1-python"
+	depends on BR2_USE_MMU # libglib2, gobject-introspection
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	help
+	  GStreamer python overrides for the gobject-introspection-based
+	  pygst bindings.
+
+	  https://gstreamer.freedesktop.org/modules/gst-python.html
+
+comment "gst1-python needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
+comment "gst1-python needs a glibc toolchain, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
new file mode 100644
index 0000000000..1d3c687dd4
--- /dev/null
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -0,0 +1,3 @@
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.16.2.tar.xz.sha256sum
+sha256  208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8  gst-python-1.16.2.tar.xz
+sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
new file mode 100644
index 0000000000..f0a3bacd1f
--- /dev/null
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# gst1-python
+#
+################################################################################
+
+GST1_PYTHON_VERSION = 1.16.2
+GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
+GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
+GST1_PYTHON_INSTALL_STAGING = YES
+GST1_PYTHON_LICENSE_FILES = COPYING
+GST1_PYTHON_LICENSE = LGPL-2.1+
+
+GST1_PYTHON_DEPENDENCIES = \
+	gstreamer1 \
+	python-gobject
+
+# A sysconfigdata_name must be manually specified or the resulting .so
+# will have a x86_64 prefix, which causes "from gi.repository import Gst"
+# to fail.A pythonpath must be specified or the host python path will be used resulting
+# in a "not a valid python" error.
+GST1_PYTHON_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
+
+# Due to the CONF_ENV options, libpython-dir must be set to the host directory
+# or else the error: "Python dynamic library path could not be determined"
+# will occure
+GST1_PYTHON_CONF_OPTS += \
+	-Dlibpython-dir=$(HOST_DIR)/lib/python3.8
+
+$(eval $(meson-package))
-- 
2.24.1
