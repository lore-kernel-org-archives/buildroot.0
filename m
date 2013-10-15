From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Oct 2013 08:37:55 +0200
Subject: [Buildroot] [git commit] package/weston: bump to 1.3.0
Message-ID: <20131015064210.022989B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dda59a65a010524a92dc4d55985906353acb9625
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needs three patches from upstream, plus a custom patch to disable tests.
Drop old patches, all applied upstream or no longer needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eston-0000-dont-leak-fd-on-launcher-error.patch |   77 ++++++++++++++++++++
 ...pendent-code-only-when-the-DRM-compositor.patch |   47 ------------
 .../weston-0001-enable-build-without-libdrm.patch  |   45 ++++++++++++
 ...on-0002-fbdev-fix-compilation-without-EGL.patch |   29 ++++++++
 ...02-fix-configure.ac-check-wayland-scanner.patch |   26 -------
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch |   22 ------
 package/weston/weston-0003-dont-build-tests.patch  |   18 +++++
 package/weston/weston.mk                           |    4 +-
 8 files changed, 171 insertions(+), 97 deletions(-)

diff --git a/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch b/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
new file mode 100644
index 0000000..0929d01
--- /dev/null
+++ b/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
@@ -0,0 +1,77 @@
+commit 4a74d5a4a45423752105f865a8310ce878b1790a
+Author: Kristian H??gsberg <krh@bitplanet.net>
+Date:   Wed Oct 9 11:19:11 2013 -0700
+
+    launcher: Don't leak tty file descriptor on error
+
+---
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/src/launcher-util.c b/src/launcher-util.c
+index d90271f..8ab61f1 100644
+--- a/src/launcher-util.c
++++ b/src/launcher-util.c
+@@ -275,7 +275,7 @@ setup_tty(struct weston_launcher *launcher, int tty)
+ 		weston_log("%s not a vt\n", tty_device);
+ 		weston_log("if running weston from ssh, "
+ 			   "use --tty to specify a tty\n");
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	ret = ioctl(launcher->tty, KDGETMODE, &kd_mode);
+@@ -286,7 +286,7 @@ setup_tty(struct weston_launcher *launcher, int tty)
+ 	if (kd_mode != KD_TEXT) {
+ 		weston_log("%s is already in graphics mode, "
+ 			   "is another display server running?\n", tty_device);
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	ret = ioctl(launcher->tty, VT_ACTIVATE, minor(buf.st_rdev));
+@@ -297,19 +297,19 @@ setup_tty(struct weston_launcher *launcher, int tty)
+ 
+ 	if (ioctl(launcher->tty, KDGKBMODE, &launcher->kb_mode)) {
+ 		weston_log("failed to read keyboard mode: %m\n");
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	if (ioctl(launcher->tty, KDSKBMUTE, 1) &&
+ 	    ioctl(launcher->tty, KDSKBMODE, K_OFF)) {
+ 		weston_log("failed to set K_OFF keyboard mode: %m\n");
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	ret = ioctl(launcher->tty, KDSETMODE, KD_GRAPHICS);
+ 	if (ret) {
+ 		weston_log("failed to set KD_GRAPHICS mode on tty: %m\n");
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	mode.mode = VT_PROCESS;
+@@ -317,16 +317,20 @@ setup_tty(struct weston_launcher *launcher, int tty)
+ 	mode.acqsig = SIGUSR1;
+ 	if (ioctl(launcher->tty, VT_SETMODE, &mode) < 0) {
+ 		weston_log("failed to take control of vt handling\n");
+-		return -1;
++		goto err_close;
+ 	}
+ 
+ 	loop = wl_display_get_event_loop(launcher->compositor->wl_display);
+ 	launcher->vt_source =
+ 		wl_event_loop_add_signal(loop, SIGUSR1, vt_handler, launcher);
+ 	if (!launcher->vt_source)
+-		return -1;
++		goto err_close;
+ 
+ 	return 0;
++
++ err_close:
++	close(launcher->tty);
++	return -1;
+ }
+ 
+ int
diff --git a/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch b/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
deleted file mode 100644
index d390b02..0000000
--- a/package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b8a831387a37f09ea5479eeb1d435a26680299c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 19 Apr 2013 06:19:05 +0200
-Subject: [PATCH] Pull DRM dependent code only when the DRM compositor is
- enabled
-
-The <xf86drm.h> header and the drm*() functions may not be available
-at all when the DRM compositor is not enabled, so they should not be
-used. Fixes build failures when building the fbdev compositor on
-systems where DRM is not available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/launcher-util.c |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/launcher-util.c b/src/launcher-util.c
-index 9196e4f..d2fb160 100644
---- a/src/launcher-util.c
-+++ b/src/launcher-util.c
-@@ -31,7 +31,9 @@
- #include <sys/uio.h>
- #include <fcntl.h>
- 
-+#ifdef BUILD_DRM_COMPOSITOR
- #include <xf86drm.h>
-+#endif
- 
- #include "compositor.h"
- #include "launcher-util.h"
-@@ -103,6 +105,7 @@ weston_launcher_open(struct weston_compositor *compositor,
- 	return data->fd;
- }
- 
-+#ifdef BUILD_DRM_COMPOSITOR
- int
- weston_launcher_drm_set_master(struct weston_compositor *compositor,
- 			       int drm_fd, char master)
-@@ -157,4 +160,4 @@ weston_launcher_drm_set_master(struct weston_compositor *compositor,
- 
- 	return ret;
- }
--
-+#endif
--- 
-1.7.9.5
-
diff --git a/package/weston/weston-0001-enable-build-without-libdrm.patch b/package/weston/weston-0001-enable-build-without-libdrm.patch
new file mode 100644
index 0000000..9d11623
--- /dev/null
+++ b/package/weston/weston-0001-enable-build-without-libdrm.patch
@@ -0,0 +1,45 @@
+commit 0b12db5f519a347ce0e1d5262e0cb2e9e2cc6990
+Author: Tomeu Vizoso <tomeu@tomeuvizoso.net>
+Date:   Wed Oct 9 11:30:57 2013 +0200
+
+    launcher: Wrap drmGetMagic and drmAuthMagic so we can build without libdrm
+
+---
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/src/launcher-util.c b/src/launcher-util.c
+index 6b6a5f3..35a5698 100644
+--- a/src/launcher-util.c
++++ b/src/launcher-util.c
+@@ -80,9 +80,19 @@ drm_set_master(int drm_fd)
+ 		return drmSetMaster(drm_fd);
+ 	return -EBADF;
+ }
++static int
++drm_check_master(int drm_fd)
++{
++	drm_magic_t magic;
++	if (drm_fd != -1)
++		return drmGetMagic(drm_fd, &magic) != 0 ||
++		       drmAuthMagic(drm_fd, magic) != 0;
++	return 0;
++}
+ #else
+ static int drm_drop_master(int drm_fd) {return 0;}
+ static int drm_set_master(int drm_fd) {return 0;}
++static int drm_check_master(int drm_fd) {return 1;}
+ #endif
+ 
+ int
+@@ -110,10 +120,8 @@ weston_launcher_open(struct weston_launcher *launcher,
+ 		}
+ 
+ 		if (major(s.st_rdev) == DRM_MAJOR) {
+-			drm_magic_t magic;
+ 			launcher->drm_fd = fd;
+-			if (drmGetMagic(fd, &magic) != 0 ||
+-			    drmAuthMagic(fd, magic) != 0) {
++			if (!drm_check_master(fd)) {
+ 				weston_log("drm fd not master\n");
+ 				close(fd);
+ 				return -1;
diff --git a/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch b/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
new file mode 100644
index 0000000..501822b
--- /dev/null
+++ b/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
@@ -0,0 +1,29 @@
+commit 9acd374822022793b09427d67ea4033915343dd8
+Author: Kristian H??gsberg <krh@bitplanet.net>
+Date:   Fri Oct 11 15:25:42 2013 -0700
+
+    fbdev: Fix compilation without EGL
+    
+    We have to duplicate #defines and typedefs for the EGL types and constants
+    we use in gl-renderer.h so we can compile the fbdev backend without EGL.
+    
+    https://bugs.freedesktop.org/show_bug.cgi?id=70392
+
+---
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+To be noted: the bug referenced above was opened by me,
+and quickly fixed during an IRC session. Nice! :-)
+
+diff --git a/src/gl-renderer.h b/src/gl-renderer.h
+index 4919a1e..d16ade2 100644
+--- a/src/gl-renderer.h
++++ b/src/gl-renderer.h
+@@ -56,6 +56,7 @@ typedef void *EGLDisplay;
+ typedef void *EGLSurface;
+ typedef intptr_t EGLNativeDisplayType;
+ typedef intptr_t EGLNativeWindowType;
++#define EGL_DEFAULT_DISPLAY NULL
+ 
+ static const EGLint gl_renderer_opaque_attribs[];
+ static const EGLint gl_renderer_alpha_attribs[];
diff --git a/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch b/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
deleted file mode 100644
index ca7368f..0000000
--- a/package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-commit 9f43cb48aac9d27aa49fe955104f5cfd204703ed
-Author: Quentin Glidic <sardemff7+git@sardemff7.net>
-Date:   Sat Aug 24 20:36:10 2013 +0200
-
-    autotools: Fix AC_PATH_PROG call
-    
-    Signed-off-by: Quentin Glidic <sardemff7+git@sardemff7.net>
-    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.ac b/configure.ac
-index 0129157..43e5e5c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -424,8 +424,10 @@ if test "x$have_lcms" = xyes; then
- fi
- AM_CONDITIONAL(HAVE_LCMS, [test "x$have_lcms" = xyes])
- 
--AC_PATH_PROG([wayland_scanner], [wayland-scanner],
--	     [AC_MSG_ERROR("wayland-scanner is needed to compile weston")])
-+AC_PATH_PROG([wayland_scanner], [wayland-scanner])
-+if test x$wayland_scanner = x; then
-+	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
-+fi
- 
- AC_CONFIG_FILES([Makefile
- 		 shared/Makefile
diff --git a/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch b/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch
deleted file mode 100644
index dfc20de..0000000
--- a/package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-commit 7b8e970ad1f1ef96db23b379a41edeb40ef1e8b6
-Author: Adrian Negreanu <adrian.m.negreanu@intel.com>
-Date:   Thu Sep 26 19:31:32 2013 +0300
-
-    compositor-fbdev: drop dependency on libdrm
-    
-    Signed-off-by: Adrian Negreanu <adrian.m.negreanu@intel.com>
-    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/configure.ac b/configure.ac
-index 7c2da44..a43bf5b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -190,7 +190,7 @@ AM_CONDITIONAL([ENABLE_FBDEV_COMPOSITOR],
-                [test x$enable_fbdev_compositor = xyes])
- AS_IF([test x$enable_fbdev_compositor = xyes], [
-   AC_DEFINE([BUILD_FBDEV_COMPOSITOR], [1], [Build the fbdev compositor])
--  PKG_CHECK_MODULES([FBDEV_COMPOSITOR], [libudev >= 136 mtdev >= 1.1.0 libdrm >= 2.4.30])
-+  PKG_CHECK_MODULES([FBDEV_COMPOSITOR], [libudev >= 136 mtdev >= 1.1.0])
- ])
- 
- AC_ARG_ENABLE([rdp-compositor], [  --enable-rdp-compositor],,
diff --git a/package/weston/weston-0003-dont-build-tests.patch b/package/weston/weston-0003-dont-build-tests.patch
new file mode 100644
index 0000000..a8ace51
--- /dev/null
+++ b/package/weston/weston-0003-dont-build-tests.patch
@@ -0,0 +1,18 @@
+Makefile: do not build tests
+
+Tests are broken if no EGL support is available.
+
+Reported-by: Peter Korsgaard <jacmet@uclibc.org>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN weston-1.3.0.orig/Makefile.am weston-1.3.0/Makefile.am
+--- weston-1.3.0.orig/Makefile.am	2013-08-20 20:15:19.000000000 +0200
++++ weston-1.3.0/Makefile.am	2013-10-14 23:08:12.016392097 +0200
+@@ -2,7 +2,7 @@
+ wcap_subdir = wcap
+ endif
+ 
+-SUBDIRS = shared src clients data protocol tests $(wcap_subdir) man
++SUBDIRS = shared src clients data protocol $(wcap_subdir) man
+ 
+ DISTCHECK_CONFIGURE_FLAGS = --disable-setuid-install
+ 
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index c8b47a7..1682fdf 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.2.2
+WESTON_VERSION = 1.3.0
 WESTON_SITE = http://wayland.freedesktop.org/releases/
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -13,7 +13,7 @@ WESTON_LICENSE_FILES = COPYING
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 
-# We touch configure.ac with one of our patches
+# We're touching Makefile.am
 WESTON_AUTORECONF = YES
 
 WESTON_CONF_OPT = \
