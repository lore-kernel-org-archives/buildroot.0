From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Oct 2014 23:11:38 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v4_1/1=5D_glmark2=3A_new_package?=
Message-ID: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: - rebased Spenser?s patch: http://patchwork.ozlabs.org/patch/278304/
    - switched to new official repo, see https://launchpad.net/glmark2
      this also removes fbdev support, since I can not test it
    - removed Spencer?s SUNXI_MALI patches, due to lack of hardware I can not
      test it
    - renamed options for virtual GL packages
    - reworked dependencies, I hope I got all combinations right
    - added patch to support current libpng

runtime-time tested on an uClibc-based system:

=======================================================
    glmark2 2012.12
=======================================================
    OpenGL Information
    GL_VENDOR:     Intel Open Source Technology Center
    GL_RENDERER:   Mesa DRI Intel(R) Haswell Desktop
    GL_VERSION:    3.0 Mesa 10.3.1
=======================================================


 package/Config.in                           |    1 +
 package/glmark2/Config.in                   |   31 +++++++++++++
 package/glmark2/glmark2-0001-libpng16.patch |   16 +++++++
 package/glmark2/glmark2.mk                  |   64 +++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2-0001-libpng16.patch
 create mode 100644 package/glmark2/glmark2.mk

diff --git a/package/Config.in b/package/Config.in
index 0d5f212..661de71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -183,6 +183,7 @@ menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
 	source "package/fswebcam/Config.in"
+	source "package/glmark2/Config.in"
 	source "package/gnuplot/Config.in"
 	source "package/jhead/Config.in"
 	source "package/mesa3d-demos/Config.in"
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
new file mode 100644
index 0000000..b60d9d1
--- /dev/null
+++ b/package/glmark2/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GLMARK2_EGL_GLES
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GLMARK2_GL
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND
+
+comment "glmark2 needs an OpenGL or an openGL ES and EGL backend with mesa3d, libX11 or wayland"
+	depends on BR2_LARGEFILE
+	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
+
+comment "glmark2 needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_GLMARK2
+	bool "glmark2"
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_GLMARK2_EGL_GLES || BR2_PACKAGE_GLMARK2_GL
+	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
+
+	  https://github.com/glmark2/glmark2
diff --git a/package/glmark2/glmark2-0001-libpng16.patch b/package/glmark2/glmark2-0001-libpng16.patch
new file mode 100644
index 0000000..05d4804
--- /dev/null
+++ b/package/glmark2/glmark2-0001-libpng16.patch
@@ -0,0 +1,16 @@
+glmark2: Add support for libpng16
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
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
new file mode 100644
index 0000000..f2bfd45
--- /dev/null
+++ b/package/glmark2/glmark2.mk
@@ -0,0 +1,64 @@
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
+GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng
+
+GLMARK2_CONF_OPTS = --prefix=/usr
+
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES)$(BR2_PACKAGE_XLIB_LIBX11),yyy)
+GLMARK2_DEPENDENCIES += libegl libgles xlib_libX11
+GLMARK2_FLAVORS += x11-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+GLMARK2_DEPENDENCIES += libgl xlib_libX11
+GLMARK2_FLAVORS += x11-gl
+endif
+
+# drm support depends on gbm which is only provided by mesa3d with enabled egl
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES)$(BR2_PACKAGE_MESA3D),yyy)
+GLMARK2_DEPENDENCIES += libegl libgles mesa3d
+GLMARK2_FLAVORS += drm-glesv2
+endif
+
+# drm support depends on gbm which is only provided by mesa3d with enabled egl
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_MESA3D),yyy)
+GLMARK2_DEPENDENCIES += libgl mesa3d
+GLMARK2_FLAVORS += drm-gl
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
+GLMARK2_DEPENDENCIES += libegl libgles wayland
+GLMARK2_FLAVORS += wayland-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBGL),yy)
+GLMARK2_DEPENDENCIES += libgl wayland
+GLMARK2_FLAVORS += wayland-gl
+endif
+
+GLMARK2_CONF_OPTS += \
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
