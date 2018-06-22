From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 22 Jun 2018 10:35:22 -0700
Subject: [Buildroot] [PATCH v3 1/1] python-kivy: new package
Message-ID: <20180622173522.29768-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

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
 package/python-kivy/Config.in        | 21 ++++++++++++
 package/python-kivy/python-kivy.hash |  4 +++
 package/python-kivy/python-kivy.mk   | 48 ++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 package/python-kivy/Config.in
 create mode 100644 package/python-kivy/python-kivy.hash
 create mode 100644 package/python-kivy/python-kivy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 656dead14c..5a78df3e1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -943,6 +943,7 @@ N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/gconf/
 F:	package/libnss/
 F:	package/python-cython/
+F:	package/python-kivy/
 F:	package/python-raven/
 F:	package/python-schedule/
 F:	package/python-websockets/
diff --git a/package/Config.in b/package/Config.in
index ecee4938c9..436c957c54 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -822,6 +822,7 @@ menu "External python modules"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
+	source "package/python-kivy/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
diff --git a/package/python-kivy/Config.in b/package/python-kivy/Config.in
new file mode 100644
index 0000000000..2542158236
--- /dev/null
+++ b/package/python-kivy/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_PYTHON_KIVY
+	bool "python-kivy"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
+	select BR2_PACKAGE_LIBPNG # runtime
+	select BR2_PACKAGE_MTDEV # runtime
+	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  A software library for rapid development of
+	  hardware-accelerated multitouch applications.
+
+	  http://kivy.org
+
+comment "python-kivy needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "python-kivy needs an OpenGL provider"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/python-kivy/python-kivy.hash b/package/python-kivy/python-kivy.hash
new file mode 100644
index 0000000000..8949bc643f
--- /dev/null
+++ b/package/python-kivy/python-kivy.hash
@@ -0,0 +1,4 @@
+# sha256 locally computed
+sha256	794e45cc7bcc7882f7cd95f1673bc6701f3215a20a54c915cac0c5e46a449b4c  python-kivy-1.10.1.tar.gz
+# License file, locally calculated
+sha256	282b3d8735ef6cbdcf8cc480947d50e0aea4ad1cc931d41f3f6a6bc23956f2d6  LICENSE
diff --git a/package/python-kivy/python-kivy.mk b/package/python-kivy/python-kivy.mk
new file mode 100644
index 0000000000..07f4837adc
--- /dev/null
+++ b/package/python-kivy/python-kivy.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# python-kivy
+#
+################################################################################
+
+PYTHON_KIVY_VERSION = 1.10.1
+PYTHON_KIVY_SITE = $(call github,kivy,kivy,$(PYTHON_KIVY_VERSION))
+PYTHON_KIVY_SETUP_TYPE = distutils
+PYTHON_KIVY_LICENSE = MIT
+PYTHON_KIVY_LICENSE_FILES = LICENSE
+PYTHON_KIVY_DEPENDENCIES = host-python-cython libgl
+
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+PYTHON_KIVY_DEPENDENCIES += gstreamer
+PYTHON_KIVY_ENV += USE_GSTREAMER=1
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+PYTHON_KIVY_DEPENDENCIES += libegl
+PYTHON_KIVY_ENV += USE_EGL=1
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_X11)$(BR2_PACKAGE_SDL2_IMAGE)$(BR2_PACKAGE_SDL2_MIXER)$(BR2_PACKAGE_SDL2_TTF),yyyyy)
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
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
+PYTHON_KIVY_DEPENDENCIES += xserver_xorg-server
+PYTHON_KIVY_ENV += USE_X11=1
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
2.18.0
