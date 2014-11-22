From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Nov 2014 14:01:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] glmark2: new package
Message-ID: <1416661289-9294-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

---
v2: renamed patch according to new naming convention
    depend on mesa3d (Yann)
---
 package/Config.in                   |    1 +
 package/glmark2/0001-libpng16.patch |   18 +++++++++++
 package/glmark2/Config.in           |   37 ++++++++++++++++++++++
 package/glmark2/glmark2.mk          |   59 +++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 package/glmark2/0001-libpng16.patch
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2.mk

diff --git a/package/Config.in b/package/Config.in
index dd38dcb..796c9f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -187,6 +187,7 @@ menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
 	source "package/fswebcam/Config.in"
+	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/mesa3d-demos/Config.in"
diff --git a/package/glmark2/0001-libpng16.patch b/package/glmark2/0001-libpng16.patch
new file mode 100644
index 0000000..d47243c
--- /dev/null
+++ b/package/glmark2/0001-libpng16.patch
@@ -0,0 +1,18 @@
+glmark2: Add support for libpng16
+
+Patch sent upstream: https://github.com/glmark2/glmark2/issues/5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr glmark2-0005100d7221190720dc130605d07cbd56e83047.org/wscript glmark2-0005100d7221190720dc130605d07cbd56e83047/wscript
+--- glmark2-0005100d7221190720dc130605d07cbd56e83047.org/wscript	2014-09-26 11:14:47.000000000 +0200
++++ glmark2-0005100d7221190720dc130605d07cbd56e83047/wscript	2014-10-17 19:40:16.011722310 +0200
+@@ -94,7 +94,7 @@
+                       uselib = uselib, mandatory = True)
+ 
+     # Check for a supported version of libpng
+-    supp_png_pkgs = (('libpng12', '1.2'), ('libpng15', '1.5'),)
++    supp_png_pkgs = (('libpng12', '1.2'), ('libpng15', '1.5'), ('libpng16', '1.6'),)
+     have_png = False
+     for (pkg, atleast) in supp_png_pkgs:
+         try:
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
new file mode 100644
index 0000000..9fbfb0d
--- /dev/null
+++ b/package/glmark2/Config.in
@@ -0,0 +1,37 @@
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
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_HAS_UDEV # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
+	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
+
+config BR2_PACKAGE_GLMARK2
+	bool "glmark2"
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
+	depends on BR2_PACKAGE_HAS_UDEV # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
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
index 0000000..79db7fe
--- /dev/null
+++ b/package/glmark2/glmark2.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# glmark2
+#
+################################################################################
+
+GLMARK2_VERSION = 0005100d7221190720dc130605d07cbd56e83047
+GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
+GLMARK2_LICENSE = GPLv3+ SGIv1
+GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
+GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng mesa3d
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
+	cd $(@D) && \
+		$(TARGET_MAKE_ENV) $(GLMARK2_CONF_ENV) $(TARGET_CONFIGURE_OPTS) \
+		./waf configure $(GLMARK2_CONF_OPTS)
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
