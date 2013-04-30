From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Apr 2013 10:10:14 +0200
Subject: [Buildroot] [git commit] weston: new package
Message-ID: <20130430081121.8B9EB97287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be33cb9ecae2b4427a23b213f44b96c3dbd1d540
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix udev comment, add upstream URL]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/weston/Config.in                           |   31 +++++++++++++
 ...pendent-code-only-when-the-DRM-compositor.patch |   47 ++++++++++++++++++++
 package/weston/weston.mk                           |   32 +++++++++++++
 4 files changed, 111 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 08ce2d4..a530afc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -151,6 +151,7 @@ endif
 
 source "package/qt5/Config.in"
 source "package/x11r7/Config.in"
+source "package/weston/Config.in"
 
 comment "X libraries and helper libraries"
 source "package/liberation/Config.in"
diff --git a/package/weston/Config.in b/package/weston/Config.in
new file mode 100644
index 0000000..8871ce5
--- /dev/null
+++ b/package/weston/Config.in
@@ -0,0 +1,31 @@
+comment "weston requires udev"
+	depends on !BR2_PACKAGE_UDEV
+
+config BR2_PACKAGE_WESTON
+	bool "weston"
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_MTDEV
+	depends on BR2_PACKAGE_UDEV
+	# Runtime dependency
+	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	# Make sure at least one backend is selected
+	select BR2_PACKAGE_WESTON_FBDEV
+	help
+	  Weston is the reference implementation of a Wayland
+	  compositor, and a useful compositor in its own right.
+	  Weston has various backends that lets it run on Linux kernel
+	  modesetting and evdev input as well as under X11.
+
+	  http://wayland.freedesktop.org/
+
+if BR2_PACKAGE_WESTON
+
+config BR2_PACKAGE_WESTON_FBDEV
+	bool "fbdev compositor"
+
+endif
diff --git a/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch b/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
new file mode 100644
index 0000000..d390b02
--- /dev/null
+++ b/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
@@ -0,0 +1,47 @@
+From b8a831387a37f09ea5479eeb1d435a26680299c6 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 19 Apr 2013 06:19:05 +0200
+Subject: [PATCH] Pull DRM dependent code only when the DRM compositor is
+ enabled
+
+The <xf86drm.h> header and the drm*() functions may not be available
+at all when the DRM compositor is not enabled, so they should not be
+used. Fixes build failures when building the fbdev compositor on
+systems where DRM is not available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/launcher-util.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/launcher-util.c b/src/launcher-util.c
+index 9196e4f..d2fb160 100644
+--- a/src/launcher-util.c
++++ b/src/launcher-util.c
+@@ -31,7 +31,9 @@
+ #include <sys/uio.h>
+ #include <fcntl.h>
+ 
++#ifdef BUILD_DRM_COMPOSITOR
+ #include <xf86drm.h>
++#endif
+ 
+ #include "compositor.h"
+ #include "launcher-util.h"
+@@ -103,6 +105,7 @@ weston_launcher_open(struct weston_compositor *compositor,
+ 	return data->fd;
+ }
+ 
++#ifdef BUILD_DRM_COMPOSITOR
+ int
+ weston_launcher_drm_set_master(struct weston_compositor *compositor,
+ 			       int drm_fd, char master)
+@@ -157,4 +160,4 @@ weston_launcher_drm_set_master(struct weston_compositor *compositor,
+ 
+ 	return ret;
+ }
+-
++#endif
+-- 
+1.7.9.5
+
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
new file mode 100644
index 0000000..4e7cada
--- /dev/null
+++ b/package/weston/weston.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# weston
+#
+#############################################################
+
+WESTON_VERSION = 1.1.0
+WESTON_SITE = http://wayland.freedesktop.org/releases/
+WESTON_SOURCE = weston-$(WAYLAND_VERSION).tar.xz
+WESTON_LICENSE = MIT
+WESTON_LICENSE_FILES = COPYING
+
+WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng jpeg mtdev udev
+WESTON_CONF_OPT = \
+	--disable-egl \
+	--disable-xwayland \
+	--disable-x11-compositor \
+	--disable-drm-compositor \
+	--disable-wayland-compositor \
+	--disable-headless-compositor \
+	--disable-rpi-compositor \
+	--disable-weston-launch \
+	--disable-libunwind
+
+ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
+WESTON_CONF_OPT += --enable-fbdev-compositor
+else
+WESTON_CONF_OPT += --disable-fbdev-compositor
+endif
+
+$(eval $(autotools-package))
+
