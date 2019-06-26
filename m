From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 26 Jun 2019 14:18:25 -0700
Subject: [Buildroot] [PATCH v6 1/1] python-kivy: new package
Message-ID: <20190626211825.27922-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Changes v5 -> v6:
- Bump to version 1.11.1
- Enable building with OpenGL ES and SDL2 window provider


Changes v4 -> v5:
- Explicitly disable unavailable optional features
- Fix DEVELOPERS


Changes v3 -> v4:
- Remove dependency on glibc (tested on aarch64 w/ musl and X11 window
  provider, sdl2 still segfaults)
- Fix dependency on xlib_libX11 and xlib_libXrender


Changes v2 -> v3:
- Bump version to 1.10.1
- Remove upstreamed patch to remove getconf dependency
- Split config comments for OpenGL and glibc deps
- check-packages fixes


Changes v1 -> v2:
- Remove unnecessary build dependencies (suggested by Yegor)
- Require toolchain w/ glibc, as Kivy builds with others, but
  seems to segfault with (at least) musl.


 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-kivy/Config.in        | 26 ++++++++++++
 package/python-kivy/python-kivy.hash |  4 ++
 package/python-kivy/python-kivy.mk   | 62 ++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+)
 create mode 100644 package/python-kivy/Config.in
 create mode 100644 package/python-kivy/python-kivy.hash
 create mode 100644 package/python-kivy/python-kivy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ce3fcb2de8..279f4fe5a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1219,6 +1219,7 @@ F:	package/gconf/
 F:	package/libnss/
 F:	package/llvm/
 F:	package/python-cython/
+F:	package/python-kivy/
 F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-sentry-sdk/
diff --git a/package/Config.in b/package/Config.in
index bc529e0b56..1a2223a366 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -927,6 +927,7 @@ menu "External python modules"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
+	source "package/python-kivy/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
diff --git a/package/python-kivy/Config.in b/package/python-kivy/Config.in
new file mode 100644
index 0000000000..521c69e389
--- /dev/null
+++ b/package/python-kivy/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_KIVY_USE_GLES
+	bool
+	default y
+	depends on !BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_HAS_LIBGLES
+
+config BR2_PACKAGE_PYTHON_KIVY
+	bool "python-kivy"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
+	select BR2_PACKAGE_LIBPNG # runtime
+	select BR2_PACKAGE_MTDEV # runtime
+	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_SDL2 if BR2_PACKAGE_KIVY_USE_GLES
+	select BR2_PACKAGE_SDL2_IMAGE if BR2_PACKAGE_KIVY_USE_GLES
+	select BR2_PACKAGE_SDL2_MIXER if BR2_PACKAGE_KIVY_USE_GLES
+	select BR2_PACKAGE_SDL2_TTF if BR2_PACKAGE_KIVY_USE_GLES
+	select BR2_PACKAGE_SDL2_OPENGLES if BR2_PACKAGE_KIVY_USE_GLES # runtime
+	help
+	  A software library for rapid development of
+	  hardware-accelerated multitouch applications.
+
+	  http://kivy.org
+
+comment "python-kivy needs an OpenGL or OpenGL ES provider"
+	depends on !(BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES)
diff --git a/package/python-kivy/python-kivy.hash b/package/python-kivy/python-kivy.hash
new file mode 100644
index 0000000000..5ea435ad94
--- /dev/null
+++ b/package/python-kivy/python-kivy.hash
@@ -0,0 +1,4 @@
+# sha256 locally computed
+sha256	8fad63cf6abaf72220b899d776b87327f22c8898d45dbe9635c9ff919ec4de93  python-kivy-1.11.1.tar.gz
+# License file, locally calculated
+sha256	282b3d8735ef6cbdcf8cc480947d50e0aea4ad1cc931d41f3f6a6bc23956f2d6  LICENSE
diff --git a/package/python-kivy/python-kivy.mk b/package/python-kivy/python-kivy.mk
new file mode 100644
index 0000000000..deefa8fd07
--- /dev/null
+++ b/package/python-kivy/python-kivy.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# python-kivy
+#
+################################################################################
+
+PYTHON_KIVY_VERSION = 1.11.1
+PYTHON_KIVY_SITE = $(call github,kivy,kivy,$(PYTHON_KIVY_VERSION))
+PYTHON_KIVY_SETUP_TYPE = distutils
+PYTHON_KIVY_LICENSE = MIT
+PYTHON_KIVY_LICENSE_FILES = LICENSE
+PYTHON_KIVY_DEPENDENCIES = host-python-cython libgl
+
+ifeq ($(BR2_PACKAGE_KIVY_USE_GLES),y)
+PYTHON_KIVY_ENV += USE_OPENGL_ES2=1
+# disable linking to libGL
+PYTHON_KIVY_ENV += USE_OPENGL_MOCK=1
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+PYTHON_KIVY_DEPENDENCIES += gstreamer
+PYTHON_KIVY_ENV += USE_GSTREAMER=1
+else
+PYTHON_KIVY_ENV += USE_GSTREAMER=0
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+PYTHON_KIVY_DEPENDENCIES += libegl
+PYTHON_KIVY_ENV += USE_EGL=1
+else
+PYTHON_KIVY_ENV += USE_EGL=0
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_IMAGE)$(BR2_PACKAGE_SDL2_MIXER)$(BR2_PACKAGE_SDL2_TTF),yyyy)
+PYTHON_KIVY_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
+PYTHON_KIVY_ENV += USE_SDL2=1
+PYTHON_KIVY_ENV += KIVY_SDL2_PATH=$(STAGING_DIR)/usr/include/SDL2
+else
+PYTHON_KIVY_ENV += USE_SDL2=0
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+PYTHON_KIVY_DEPENDENCIES += wayland
+PYTHON_KIVY_ENV += USE_WAYLAND=1
+else
+PYTHON_KIVY_ENV += USE_WAYLAND=0
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
+PYTHON_KIVY_DEPENDENCIES += xlib_libX11 xlib_libXrender
+PYTHON_KIVY_ENV += USE_X11=1
+else
+PYTHON_KIVY_ENV += USE_X11=0
+endif
+
+define PYTHON_KIVY_REMOVE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/share/kivy-examples
+endef
+
+PYTHON_KIVY_POST_INSTALL_TARGET_HOOKS += PYTHON_KIVY_REMOVE_EXAMPLES
+
+$(eval $(python-package))
--
2.22.0
