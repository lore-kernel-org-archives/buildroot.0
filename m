From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 11:05:54 +0100
Subject: [Buildroot] [git commit] package/weston: add selection menu for
 default backend
Message-ID: <20200203095829.EF7E188647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9670514b0c9fe1cb3fb016a745f00b6fca48b6e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming bump to weston 8, the meaning for the "native backend"
has been removed, and replaced by a new option to set the "default
backend". However, the way we handle the "native backend" option
nowadays is very semantically similar to the upcoming "default backend"
option.

However, as of today, when more than one backend are enabled, the last
one defined in the .mk wins, which is not obvious when looking at the
menuconfig order...

So, we introduce a choice to select the default backend. That enforces
the backend is enabed, leaving the others as additional backends.

It is to be noted that the RDP backend can't be selected as the native
(soon default) backend, so it does not get an entry in the choice.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - write a commit log
  - merge short lines
  - rename optons (no _BACKEND)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 38 ++++++++++++++++++++++++++++++--------
 package/weston/weston.mk | 15 ++++++---------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 696b85b54d..230417ac2c 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -20,8 +20,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBDRM
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	# Make sure at least one compositor is selected.
-	select BR2_PACKAGE_WESTON_FBDEV if !BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
 	  Weston is the reference implementation of a Wayland
 	  compositor, and a useful compositor in its own right.
@@ -32,14 +30,40 @@ config BR2_PACKAGE_WESTON
 
 if BR2_PACKAGE_WESTON
 
-# Helper to make sure at least one compositor is selected.
-config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
-	bool
+choice
+	prompt "default compositor"
+
+config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
+	bool "fbdev"
+	select BR2_PACKAGE_WESTON_FBDEV
+
+config BR2_PACKAGE_WESTON_DEFAULT_DRM
+	bool "drm"
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_WESTON_DRM
+
+comment "drm backend needs mesa3d w/ EGL driver"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
+config BR2_PACKAGE_WESTON_DEFAULT_X11
+	bool "X11"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_WESTON_X11
+
+comment "X11 backend needs X.org"
+	depends on !BR2_PACKAGE_XORG7
+
+endchoice
+
+config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
+	string
+	default "fbdev" if BR2_PACKAGE_WESTON_DEFAULT_FBDEV
+	default "drm"   if BR2_PACKAGE_WESTON_DEFAULT_DRM
+	default "x11"   if BR2_PACKAGE_WESTON_DEFAULT_X11
 
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
 # Uses libgbm from mesa3d
 comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
@@ -56,7 +80,6 @@ config BR2_PACKAGE_WESTON_RDP
 	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
 	select BR2_PACKAGE_FREERDP
-	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
 	  This enables the RDP backend, which allows accessing weston
 	  through the network with any RDP-compliant client.
@@ -80,7 +103,6 @@ config BR2_PACKAGE_WESTON_X11
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 
 comment "X11 compositor needs X.org enabled"
 	depends on !BR2_PACKAGE_XORG7
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 154ae38b83..746befd2b3 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -69,30 +69,27 @@ WESTON_CONF_OPTS += --disable-rdp-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPTS += \
-	--enable-fbdev-compositor \
-	WESTON_NATIVE_BACKEND=fbdev-backend.so
+WESTON_CONF_OPTS += --enable-fbdev-compositor
 else
 WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
-WESTON_CONF_OPTS += \
-	--enable-drm-compositor \
-	WESTON_NATIVE_BACKEND=drm-backend.so
+WESTON_CONF_OPTS += --enable-drm-compositor
 else
 WESTON_CONF_OPTS += --disable-drm-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_X11),y)
-WESTON_CONF_OPTS += \
-	--enable-x11-compositor \
-	WESTON_NATIVE_BACKEND=x11-backend.so
+WESTON_CONF_OPTS += --enable-x11-compositor
 WESTON_DEPENDENCIES += libxcb xlib_libX11
 else
 WESTON_CONF_OPTS += --disable-x11-compositor
 endif
 
+# We're guaranteed to have at least one backend
+WESTON_CONF_OPTS += WESTON_NATIVE_BACKEND=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR))
+
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += --enable-xwayland
 WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
