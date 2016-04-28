From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 20:35:39 +0200
Subject: [Buildroot] [git commit] mpv: va-api requires egl-drm,
	wayland and/or x11
Message-ID: <20160428193041.EE6468198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=038d82eda4819d78cd68e8b4bf8e8494edcd6eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VA-API acceleration requires one or more of the egl-drm, wayland
and/or x11 backends.
Since the egl-drm backend means LIBGL (X11) + EGL + DRM we'll handle it
later once the mesa3d libgl hidden knob is applied.
So for now we'll support wayland and x11 until that happens. Fixes:
http://autobuild.buildroot.net/results/4b9/4b98d0c2c0617715e77fb47b3d97037c6b7562ec/

[Peter: pass --disable-vaapi if libva isn't enabled,
 invert wayland/X11 test as suggested by Thomas]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 605e891..3c6e392 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -177,12 +177,18 @@ MPV_CONF_OPTS += --disable-sdl1 --disable-sdl2
 endif
 
 # va-api support
+# This requires one or more of the egl-drm, wayland, x11 backends
+# For now we support wayland and x11
 ifeq ($(BR2_PACKAGE_LIBVA),y)
+ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
 else
 MPV_CONF_OPTS += --disable-vaapi
 endif
+else
+MPV_CONF_OPTS += --disable-vaapi
+endif
 
 # wayland support
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
