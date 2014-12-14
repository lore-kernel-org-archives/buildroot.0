From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 11:30:22 +0100
Subject: [Buildroot] [PATCH v6 1/1] glmark2: new package
Message-ID: <1418553022-24508-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
v6: - bumped version (Yann)
    - removed patch to add support for libpng16, committed upstream (Yann)
    - reworked dependencies and GLMARK2_CONFIGURE_CMDS (Yann)
v5: - renamed patch according to new naming convention
    - depend on mesa3d (Yann)
v4: - rebased Spenser?s patch: http://patchwork.ozlabs.org/patch/278304/
    - switched to new official repo, see https://launchpad.net/glmark2
      this also removes fbdev support, since I can not test it
    - removed Spencer?s SUNXI_MALI patches, due to lack of hardware I can not
      test it
    - renamed options for virtual GL packages
    - reworked dependencies, I hope I got all combinations right
    - added patch to support current libpng

sq glmark2
---
 package/Config.in          |    1 +
 package/glmark2/Config.in  |   31 ++++++++++++++++++++
 package/glmark2/glmark2.mk |   67 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2.mk

diff --git a/package/Config.in b/package/Config.in
index 848956a..3bb625b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
 	source "package/fswebcam/Config.in"
+	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/mesa3d-demos/Config.in"
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
new file mode 100644
index 0000000..2d799fe
--- /dev/null
+++ b/package/glmark2/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GLMARK2_EGL_GLES
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_MESA3D
+
+config BR2_PACKAGE_GLMARK2_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_MESA3D
+
+comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
+	depends on BR2_LARGEFILE
+	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
+
+config BR2_PACKAGE_GLMARK2
+	bool "glmark2"
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
+
+	  https://github.com/glmark2/glmark2
+
+comment "glmark2 needs udev /dev management and a toolchain w/ C++, largefile, NPTL"
+	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
new file mode 100644
index 0000000..ffaea73
--- /dev/null
+++ b/package/glmark2/glmark2.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# glmark2
+#
+################################################################################
+
+GLMARK2_VERSION = 499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc
+GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
+GLMARK2_LICENSE = GPLv3+ SGIv1
+GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
+GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
+	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
+	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+GLMARK2_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+GLMARK2_FLAVORS += x11-glesv2
+endif
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+GLMARK2_FLAVORS += x11-gl
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+GLMARK2_FLAVORS += drm-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yy)
+GLMARK2_FLAVORS += drm-gl
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
+GLMARK2_DEPENDENCIES += wayland
+GLMARK2_FLAVORS += wayland-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBGL),yy)
+GLMARK2_DEPENDENCIES += wayland
+GLMARK2_FLAVORS += wayland-gl
+endif
+
+GLMARK2_CONF_OPTS += \
+	--prefix=/usr \
+	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
+
+define GLMARK2_CONFIGURE_CMDS
+	(cd $(@D); \
+		PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python-config" \
+		python_LDFLAGS="" \
+		python_LIBDIR="" \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(GLMARK2_CONF_ENV) \
+		./waf configure $(GLMARK2_CONF_OPTS) \
+	)
+endef
+
+define GLMARK2_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) ./waf
+endef
+
+define GLMARK2_INSTALL_TARGET_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) ./waf install --destdir=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
