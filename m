From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 10:00:09 +0200
Subject: [Buildroot] [git commit] package/mesa3d: reorder platforms to fix
 EGL
Message-ID: <20200516080302.2C2FC8F51B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e79f543239672e2c8cf41d300511a4bec0f0e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mesa chooses the first platform specified in -Dplatforms as the default
EGL native platform. [0]

    Configure Options

    -D platforms=...
        List the platforms (window systems) to support. Its argument is
        a comma separated string such as -D platforms=x11,drm. It
        decides the platforms a driver may support. The first listed
        platform is also used by the main library to decide the native
        platform.

This has the effect of breaking EGL applications running on X11 and
possibly Wayland when the first platform specified isn't x11 or wayland,
and EGL_PLATFORM isn't set.

Reorder the specified platforms to use x11, wayland, and drm before
surfaceless, as this is the order chosen by other common distributions,
such as Arch Linux [1], Debian [2], and Fedora [3].

Users preferring drm or surfaceless over x11 or wayland likely know how
to override the native EGL platform, and likely have x11 and wayland
disabled anyway.

[0] https://www.mesa3d.org/egl.html
[1] https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa#n45
[2] https://salsa.debian.org/xorg-team/lib/mesa/-/blob/fb8c1efb57ea8106525ed01c41218164f8be7f3b/debian/rules#L38
[3] https://src.fedoraproject.org/rpms/mesa/blob/master/f/mesa.spec#_337

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/mesa3d.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5304b05de0..d1933dabfd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -167,7 +167,22 @@ endef
 MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
 endif
 
-MESA3D_PLATFORMS = surfaceless
+ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
+MESA3D_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXdamage \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xlib_libXxf86vm \
+	xorgproto \
+	libxcb
+MESA3D_PLATFORMS += x11
+endif
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+MESA3D_DEPENDENCIES += wayland wayland-protocols
+MESA3D_PLATFORMS += wayland
+endif
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D),y)
@@ -189,22 +204,7 @@ MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
 MESA3D_PLATFORMS += drm
 endif
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MESA3D_DEPENDENCIES += wayland wayland-protocols
-MESA3D_PLATFORMS += wayland
-endif
-ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
-MESA3D_DEPENDENCIES += \
-	xlib_libX11 \
-	xlib_libXext \
-	xlib_libXdamage \
-	xlib_libXfixes \
-	xlib_libXrandr \
-	xlib_libXxf86vm \
-	xorgproto \
-	libxcb
-MESA3D_PLATFORMS += x11
-endif
+MESA3D_PLATFORMS += surfaceless
 
 MESA3D_CONF_OPTS += \
 	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
