From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  5 Sep 2013 23:25:20 -0500
Subject: [Buildroot] [PATCH v2 6/7] glmark2: new package
In-Reply-To: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                                  |   1 +
 package/glmark2/Config.in                          |  16 ++++
 package/glmark2/glmark2-add-mali-support.patch     | 102 +++++++++++++++++++++
 package/glmark2/glmark2-fix-add-GLchar.patch       |  17 ++++
 .../glmark2-gl-to-glesv2-on-drm-flavor.patch       |  25 +++++
 package/glmark2/glmark2.mk                         |  69 ++++++++++++++
 6 files changed, 230 insertions(+)
 create mode 100644 package/glmark2/Config.in
 create mode 100644 package/glmark2/glmark2-add-mali-support.patch
 create mode 100644 package/glmark2/glmark2-fix-add-GLchar.patch
 create mode 100644 package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
 create mode 100644 package/glmark2/glmark2.mk

diff --git a/package/Config.in b/package/Config.in
index 3a8bd6d..27bd70a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ source "package/dmalloc/Config.in"
 source "package/dropwatch/Config.in"
 source "package/duma/Config.in"
 source "package/gdb/Config.in"
+source "package/glmark2/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
new file mode 100644
index 0000000..6dd7833
--- /dev/null
+++ b/package/glmark2/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GLMARK2
+	bool "glmark2"
+	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D_GBM # depends on udev cannot select
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_HAS_OPENGL || \
+		(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG12
+	help
+	  glmark2 is a benchmark for OpenGL (ES) 2.0. It uses only the subset of the
+	  OpenGL 2.0 API that is compatible with OpenGL ES 2.0.
+
+comment "glmark2 requires an OpenGL implementation and mesa3D to be enabled"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES \
+		|| !BR2_PACKAGE_XORG7
diff --git a/package/glmark2/glmark2-add-mali-support.patch b/package/glmark2/glmark2-add-mali-support.patch
new file mode 100644
index 0000000..c37c88c
--- /dev/null
+++ b/package/glmark2/glmark2-add-mali-support.patch
@@ -0,0 +1,102 @@
+Mali uses a slightly different windowing structure than most
+implementations add support through this patch.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: glmark2-279/src/gl-state-egl.cpp
+===================================================================
+--- glmark2-279.orig/src/gl-state-egl.cpp	2013-08-21 14:49:38.953803965 -0500
++++ glmark2-279/src/gl-state-egl.cpp	2013-08-21 14:59:42.389814979 -0500
+@@ -414,9 +414,12 @@
+ {
+     if (egl_display_)
+         return true;
+-
++#ifdef HAS_MALI
++    egl_display_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
++#else
+     egl_display_ = eglGetDisplay(native_display_);
+-    if (!egl_display_) {
++#endif
++    if (egl_display_ == EGL_NO_DISPLAY) {
+         Log::error("eglGetDisplay() failed with error: 0x%x\n", eglGetError());
+         return false;
+     }
+Index: glmark2-279/src/native-state-fbdev.cpp
+===================================================================
+--- glmark2-279.orig/src/native-state-fbdev.cpp	2013-08-19 17:36:32.000000000 -0500
++++ glmark2-279/src/native-state-fbdev.cpp	2013-08-21 14:59:58.629815276 -0500
+@@ -31,7 +31,9 @@
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+ #include <linux/fb.h>
+-
++#if HAS_MALI
++#include <EGL/egl.h>
++#endif
+ #ifdef ANDROID
+ #define FBDEV_DEV "/dev/graphics/fb"
+ #else
+@@ -79,7 +81,13 @@
+ NativeStateFBDEV::window(WindowProperties& properties)
+ {
+     properties = winprops;
++#ifdef HAS_MALI
++    native_window.height = winprops.height;
++    native_window.width = winprops.width;
++    return reinterpret_cast<void*>(&native_window);
++#else
+     return NULL;
++#endif
+ }
+ 
+ void
+Index: glmark2-279/src/native-state-fbdev.h
+===================================================================
+--- glmark2-279.orig/src/native-state-fbdev.h	2013-08-19 17:36:32.000000000 -0500
++++ glmark2-279/src/native-state-fbdev.h	2013-08-21 15:00:14.345815563 -0500
+@@ -30,6 +30,10 @@
+ #include <csignal>
+ #include <cstring>
+ 
++#ifdef HAS_MALI
++#include <EGL/egl.h>
++#endif
++
+ class NativeStateFBDEV : public NativeState
+ {
+ public:
+@@ -50,7 +54,9 @@
+     static volatile std::sig_atomic_t should_quit_;
+     int fd;
+     WindowProperties winprops;
+-
++#ifdef HAS_MALI
++    struct mali_native_window native_window;
++#endif
+     bool init();
+     void cleanup();
+ };
+Index: glmark2-279/wscript
+===================================================================
+--- glmark2-279.orig/wscript	2013-08-19 17:36:32.000000000 -0500
++++ glmark2-279/wscript	2013-08-21 15:00:24.245815743 -0500
+@@ -46,7 +46,8 @@
+                    dest = 'flavors',
+                    help = "a list of flavors to build (%s, all)" % FLAVORS_STR)
+     opt.parser.set_default('flavors', [])
+-
++    opt.add_option('--for-mali', action='store_true', dest = 'mali',
++                   default = False, help='enable ARM Mali GPU support')
+     opt.add_option('--no-debug', action='store_false', dest = 'debug',
+                    default = True, help='disable compiler debug information')
+     opt.add_option('--no-opt', action='store_false', dest = 'opt',
+@@ -132,6 +133,8 @@
+         ctx.env.prepend_value('CXXFLAGS', '-O2')
+     if Options.options.debug:
+         ctx.env.prepend_value('CXXFLAGS', '-g')
++    if Options.options.mali:
++        ctx.env.append_unique('DEFINES','HAS_MALI=1')
+ 
+     ctx.env.HAVE_EXTRAS = False
+     if Options.options.extras_path is not None:
diff --git a/package/glmark2/glmark2-fix-add-GLchar.patch b/package/glmark2/glmark2-fix-add-GLchar.patch
new file mode 100644
index 0000000..15653de
--- /dev/null
+++ b/package/glmark2/glmark2-fix-add-GLchar.patch
@@ -0,0 +1,17 @@
+Bug fix in program.cc.  There is no such type as GLchar.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: glmark2-2012.12/src/libmatrix/program.cc
+===================================================================
+--- glmark2-2012.12.orig/src/libmatrix/program.cc	2012-12-18 13:45:45.000000000 -0600
++++ glmark2-2012.12/src/libmatrix/program.cc	2013-08-13 20:08:27.005724911 -0500
+@@ -17,6 +17,8 @@
+ #include "gl-if.h"
+ #include "program.h"
+ 
++typedef char GLchar;
++
+ using std::string;
+ using LibMatrix::mat4;
+ using LibMatrix::mat3;
diff --git a/package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch b/package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
new file mode 100644
index 0000000..5f838cc
--- /dev/null
+++ b/package/glmark2/glmark2-gl-to-glesv2-on-drm-flavor.patch
@@ -0,0 +1,25 @@
+Bug in build script requires full opengl when only opengl es is actually
+required.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+---
+Index: glmark2-279/src/wscript_build
+===================================================================
+--- glmark2-279.orig/src/wscript_build	2013-08-19 17:36:32.000000000 -0500
++++ glmark2-279/src/wscript_build	2013-08-20 10:31:39.364629078 -0500
+@@ -23,11 +23,12 @@
+   'x11-gl' : ['x11', 'gl', 'matrix-gl'],
+   'x11-glesv2' : ['x11', 'egl', 'glesv2', 'matrix-glesv2'],
+   'drm-gl' : ['drm', 'gbm', 'egl', 'gl', 'matrix-gl'],
+-  'drm-glesv2' : ['drm', 'gbm', 'egl', 'glesv2', 'matrix-gl'],
++  'drm-glesv2' : ['drm', 'gbm', 'egl', 'glesv2', 'matrix-glesv2'],
+   'mir-gl' : ['mirclient', 'egl', 'gl', 'matrix-gl'],
+-  'mir-glesv2' : ['mirclient', 'egl', 'glesv2', 'matrix-gl'],
++  'mir-glesv2' : ['mirclient', 'egl', 'glesv2', 'matrix-glesv2'],
+   'wayland-gl' : ['wayland-client', 'wayland-egl', 'egl', 'gl', 'matrix-gl'],
+-  'wayland-glesv2' : ['wayland-client', 'wayland-egl', 'egl', 'glesv2', 'matrix-gl'],
++  'wayland-glesv2' : ['wayland-client', 'wayland-egl', 'egl', 'glesv2',
++  'matrix-glesv2'],
+   'fbdev-glesv2' : ['egl', 'glesv2', 'matrix-glesv2']
+ }
+ flavor_defines = {
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
new file mode 100644
index 0000000..b36eaf9
--- /dev/null
+++ b/package/glmark2/glmark2.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# glmark2
+#
+################################################################################
+
+GLMARK2_VERSION = 279
+GLMARK2_SITE = http://bazaar.launchpad.net/~laanwj/glmark2/fbdev
+GLMARK2_SITE_METHOD = bzr
+GLMARK2_SOURCE = glmark2-$(GLMARK2_VERSION).tar.gz
+GLMARK2_LICENSE = GPLv3+ SGIv1
+GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
+
+GLMARK2_DEPENDENCIES = jpeg libpng12 mesa3d host-python host-pkgconf
+
+GLMARK2_CONF_OPTS = --prefix=/usr/
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
+GLMARK2_DEPENDENCIES += libegl libgles
+GLMARK2_FLAVORS += x11-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER)$(BR2_PACKAGE_HAS_OPENGL),yy)
+GLMARK2_DEPENDENCIES += libgl
+GLMARK2_FLAVORS += x11-gl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
+GLMARK2_DEPENDENCIES += libdrm libegl libgles
+GLMARK2_FLAVORS += drm-glesv2 fbdev-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL)$(BR2_PACKAGE_HAS_OPENGL),yy)
+GLMARK2_DEPENDENCIES += libdrm libgl
+GLMARK2_FLAVORS += drm-gl
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_OPENGL_ES),yy)
+GLMARK2_DEPENDENCIES += wayland libegl libgles
+GLMARK2_FLAVORS += wayland-glesv2
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_OPENGL),yy)
+GLMARK2_DEPENDENCIES += wayland libgl
+GLMARK2_FLAVORS += wayland-gl
+endif
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+GLMARK2_CONF_OPTS += --for-mali
+endif
+
+GLMARK2_CONF_OPTS += \
+	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
+
+define GLMARK2_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) ./waf configure \
+		$(GLMARK2_CONF_OPTS)
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
1.8.1.2
