From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 10:46:23 +0100
Subject: [Buildroot] [git commit] package/weston: bump to 1.4.0
Message-ID: <20140202094931.E2BDD9C730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71094c716d7d62171bef7d9a2e01875cb07fa81f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches applied upstream.

Mark the rpi-backend as broken, since it segfaults.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in                           |    1 +
 ...eston-0000-dont-leak-fd-on-launcher-error.patch |   77 --------------------
 .../weston-0001-enable-build-without-libdrm.patch  |   45 ------------
 ...on-0002-fbdev-fix-compilation-without-EGL.patch |   29 --------
 package/weston/weston-0003-dont-build-tests.patch  |   15 ++--
 ...weston-0004-fbdev-open-launcher-only-once.patch |   46 ------------
 package/weston/weston.mk                           |    3 +-
 7 files changed, 10 insertions(+), 206 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 247efc8..1ab3c2f 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -41,6 +41,7 @@ comment "RPi compositor needs a toolchain w/ C++, largefile, threads"
 
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
+	depends on BROKEN                       # rpi-backend broken in 1.4.0
 	depends on BR2_arm                      # rpi-userland
 	depends on BR2_INSTALL_LIBSTDCPP        # rpi-userland
 	depends on BR2_LARGEFILE                # rpi-userland
diff --git a/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch b/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
deleted file mode 100644
index 0929d01..0000000
--- a/package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-commit 4a74d5a4a45423752105f865a8310ce878b1790a
-Author: Kristian H??gsberg <krh@bitplanet.net>
-Date:   Wed Oct 9 11:19:11 2013 -0700
-
-    launcher: Don't leak tty file descriptor on error
-
----
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/src/launcher-util.c b/src/launcher-util.c
-index d90271f..8ab61f1 100644
---- a/src/launcher-util.c
-+++ b/src/launcher-util.c
-@@ -275,7 +275,7 @@ setup_tty(struct weston_launcher *launcher, int tty)
- 		weston_log("%s not a vt\n", tty_device);
- 		weston_log("if running weston from ssh, "
- 			   "use --tty to specify a tty\n");
--		return -1;
-+		goto err_close;
- 	}
- 
- 	ret = ioctl(launcher->tty, KDGETMODE, &kd_mode);
-@@ -286,7 +286,7 @@ setup_tty(struct weston_launcher *launcher, int tty)
- 	if (kd_mode != KD_TEXT) {
- 		weston_log("%s is already in graphics mode, "
- 			   "is another display server running?\n", tty_device);
--		return -1;
-+		goto err_close;
- 	}
- 
- 	ret = ioctl(launcher->tty, VT_ACTIVATE, minor(buf.st_rdev));
-@@ -297,19 +297,19 @@ setup_tty(struct weston_launcher *launcher, int tty)
- 
- 	if (ioctl(launcher->tty, KDGKBMODE, &launcher->kb_mode)) {
- 		weston_log("failed to read keyboard mode: %m\n");
--		return -1;
-+		goto err_close;
- 	}
- 
- 	if (ioctl(launcher->tty, KDSKBMUTE, 1) &&
- 	    ioctl(launcher->tty, KDSKBMODE, K_OFF)) {
- 		weston_log("failed to set K_OFF keyboard mode: %m\n");
--		return -1;
-+		goto err_close;
- 	}
- 
- 	ret = ioctl(launcher->tty, KDSETMODE, KD_GRAPHICS);
- 	if (ret) {
- 		weston_log("failed to set KD_GRAPHICS mode on tty: %m\n");
--		return -1;
-+		goto err_close;
- 	}
- 
- 	mode.mode = VT_PROCESS;
-@@ -317,16 +317,20 @@ setup_tty(struct weston_launcher *launcher, int tty)
- 	mode.acqsig = SIGUSR1;
- 	if (ioctl(launcher->tty, VT_SETMODE, &mode) < 0) {
- 		weston_log("failed to take control of vt handling\n");
--		return -1;
-+		goto err_close;
- 	}
- 
- 	loop = wl_display_get_event_loop(launcher->compositor->wl_display);
- 	launcher->vt_source =
- 		wl_event_loop_add_signal(loop, SIGUSR1, vt_handler, launcher);
- 	if (!launcher->vt_source)
--		return -1;
-+		goto err_close;
- 
- 	return 0;
-+
-+ err_close:
-+	close(launcher->tty);
-+	return -1;
- }
- 
- int
diff --git a/package/weston/weston-0001-enable-build-without-libdrm.patch b/package/weston/weston-0001-enable-build-without-libdrm.patch
deleted file mode 100644
index 9d11623..0000000
--- a/package/weston/weston-0001-enable-build-without-libdrm.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-commit 0b12db5f519a347ce0e1d5262e0cb2e9e2cc6990
-Author: Tomeu Vizoso <tomeu@tomeuvizoso.net>
-Date:   Wed Oct 9 11:30:57 2013 +0200
-
-    launcher: Wrap drmGetMagic and drmAuthMagic so we can build without libdrm
-
----
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/src/launcher-util.c b/src/launcher-util.c
-index 6b6a5f3..35a5698 100644
---- a/src/launcher-util.c
-+++ b/src/launcher-util.c
-@@ -80,9 +80,19 @@ drm_set_master(int drm_fd)
- 		return drmSetMaster(drm_fd);
- 	return -EBADF;
- }
-+static int
-+drm_check_master(int drm_fd)
-+{
-+	drm_magic_t magic;
-+	if (drm_fd != -1)
-+		return drmGetMagic(drm_fd, &magic) != 0 ||
-+		       drmAuthMagic(drm_fd, magic) != 0;
-+	return 0;
-+}
- #else
- static int drm_drop_master(int drm_fd) {return 0;}
- static int drm_set_master(int drm_fd) {return 0;}
-+static int drm_check_master(int drm_fd) {return 1;}
- #endif
- 
- int
-@@ -110,10 +120,8 @@ weston_launcher_open(struct weston_launcher *launcher,
- 		}
- 
- 		if (major(s.st_rdev) == DRM_MAJOR) {
--			drm_magic_t magic;
- 			launcher->drm_fd = fd;
--			if (drmGetMagic(fd, &magic) != 0 ||
--			    drmAuthMagic(fd, magic) != 0) {
-+			if (!drm_check_master(fd)) {
- 				weston_log("drm fd not master\n");
- 				close(fd);
- 				return -1;
diff --git a/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch b/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
deleted file mode 100644
index 501822b..0000000
--- a/package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-commit 9acd374822022793b09427d67ea4033915343dd8
-Author: Kristian H??gsberg <krh@bitplanet.net>
-Date:   Fri Oct 11 15:25:42 2013 -0700
-
-    fbdev: Fix compilation without EGL
-    
-    We have to duplicate #defines and typedefs for the EGL types and constants
-    we use in gl-renderer.h so we can compile the fbdev backend without EGL.
-    
-    https://bugs.freedesktop.org/show_bug.cgi?id=70392
-
----
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-To be noted: the bug referenced above was opened by me,
-and quickly fixed during an IRC session. Nice! :-)
-
-diff --git a/src/gl-renderer.h b/src/gl-renderer.h
-index 4919a1e..d16ade2 100644
---- a/src/gl-renderer.h
-+++ b/src/gl-renderer.h
-@@ -56,6 +56,7 @@ typedef void *EGLDisplay;
- typedef void *EGLSurface;
- typedef intptr_t EGLNativeDisplayType;
- typedef intptr_t EGLNativeWindowType;
-+#define EGL_DEFAULT_DISPLAY NULL
- 
- static const EGLint gl_renderer_opaque_attribs[];
- static const EGLint gl_renderer_alpha_attribs[];
diff --git a/package/weston/weston-0003-dont-build-tests.patch b/package/weston/weston-0003-dont-build-tests.patch
index a8ace51..daf8452 100644
--- a/package/weston/weston-0003-dont-build-tests.patch
+++ b/package/weston/weston-0003-dont-build-tests.patch
@@ -7,12 +7,11 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN weston-1.3.0.orig/Makefile.am weston-1.3.0/Makefile.am
 --- weston-1.3.0.orig/Makefile.am	2013-08-20 20:15:19.000000000 +0200
 +++ weston-1.3.0/Makefile.am	2013-10-14 23:08:12.016392097 +0200
-@@ -2,7 +2,7 @@
- wcap_subdir = wcap
- endif
- 
--SUBDIRS = shared src clients data protocol tests $(wcap_subdir) man
-+SUBDIRS = shared src clients data protocol $(wcap_subdir) man
- 
- DISTCHECK_CONFIGURE_FLAGS = --disable-setuid-install
+@@ -14,7 +14,6 @@
+ 	clients					\
+ 	data					\
+ 	protocol				\
+-	tests					\
+ 	$(wcap_subdir)				\
+ 	man
  
diff --git a/package/weston/weston-0004-fbdev-open-launcher-only-once.patch b/package/weston/weston-0004-fbdev-open-launcher-only-once.patch
deleted file mode 100644
index eaf7e31..0000000
--- a/package/weston/weston-0004-fbdev-open-launcher-only-once.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1641d14b824df487bba23597aa128219c057df88 Mon Sep 17 00:00:00 2001
-From: David Herrmann <dh.herrmann@gmail.com>
-Date: Tue, 15 Oct 2013 14:29:57 +0200
-Subject: [PATCH] fbdev: open launcher only once
-
-We currently call launcher_connect() twice, which is redundant and
-amazingly works (ugh?). Fix this and connect only once to the launcher.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/compositor-fbdev.c |   12 ++----------
- 1 file changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/src/compositor-fbdev.c b/src/compositor-fbdev.c
-index 002ce0b..4376345 100644
---- a/src/compositor-fbdev.c
-+++ b/src/compositor-fbdev.c
-@@ -883,15 +883,6 @@ fbdev_compositor_create(struct wl_display *display, int *argc, char *argv[],
- 	                           config) < 0)
- 		goto out_free;
-
--	/* Check if we run fbdev-backend using weston-launch */
--	compositor->base.launcher =
--		weston_launcher_connect(&compositor->base, param->tty);
--	if (compositor->base.launcher == NULL && geteuid() != 0) {
--		weston_log("fatal: fbdev backend should be run "
--			   "using weston-launch binary or as root\n");
--		goto out_compositor;
--	}
--
- 	compositor->udev = udev_new();
- 	if (compositor->udev == NULL) {
- 		weston_log("Failed to initialize udev context.\n");
-@@ -905,7 +896,8 @@ fbdev_compositor_create(struct wl_display *display, int *argc, char *argv[],
- 	compositor->base.launcher =
- 		weston_launcher_connect(&compositor->base, param->tty);
- 	if (!compositor->base.launcher) {
--		weston_log("Failed to set up launcher.\n");
-+		weston_log("fatal: fbdev backend should be run "
-+			   "using weston-launch binary or as root\n");
- 		goto out_udev;
- 	}
-
---
-1.7.9.5
-
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 1682fdf..6d1408f 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.3.0
+WESTON_VERSION = 1.4.0
 WESTON_SITE = http://wayland.freedesktop.org/releases/
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -17,6 +17,7 @@ WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 WESTON_AUTORECONF = YES
 
 WESTON_CONF_OPT = \
+	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-egl \
 	--disable-simple-egl-clients \
 	--disable-xwayland \
