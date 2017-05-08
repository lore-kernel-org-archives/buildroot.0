From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 May 2017 21:11:15 +0200
Subject: [Buildroot] [git commit] mpv: fix X11 logic after bump to 0.25.0
Message-ID: <20170508192840.8C3767F9A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b72b54fd3b0074864e5ad36ec2fdcd30f4d58eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Between 0.24.0 and 0.25.0, mpv has changed its logic around the
detection/usage of X11 (in upstream commit
https://github.com/mpv-player/mpv/commit/927afa311d4a89b022305508acbf4e7325fe3928). Instead
of having fine grained option for x11, xext, xinerama, xscreensaver and
xrandr, mpv now requires all five libraries to be available in order to
enable X.org support.

Therefore, this commit adjusts the mpv packaging so that:

 1. All necessary X11 libraries are selected if BR2_PACKAGE_XORG7 is
    enabled. It would indeed be too cumbersome for the user to know that
    all of x11, xext, xinerama, xscreensaver and xrandr are necessary in
    order to have X.org support.

 2. mpv.mk is simplified by enabling X.org support when
    BR2_PACKAGE_XORG7 is enabled.

Fixes:

  http://autobuild.buildroot.net/results/b470cfba451ce9ba648e3a2f3ae08429db8bdee9/
  (--disable-xss was used to disable xscreensaver support, and this
  option no longer exists)

[Peter: reword X11 comment in .mk]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in |  6 ++++++
 package/mpv/mpv.mk    | 33 +++++++--------------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 6e115ae..ce6f367 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -12,6 +12,12 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_ZLIB
 	# Select xkbcommon for wayland to avoid being mysterious
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+	# Select all necessary X11 dependencies if X.org is enabled
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  mpv is a fork of mplayer2 and MPlayer. It shares some features
 	  with the former projects while introducing many more.
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 24ccf8c..37548c9 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -173,7 +173,7 @@ endif
 # This requires one or more of the egl-drm, wayland, x11 backends
 # For now we support wayland and x11
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),)
+ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XORG7),)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
 else
@@ -191,31 +191,12 @@ else
 MPV_CONF_OPTS += --disable-wayland
 endif
 
-# Base X11 support
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-MPV_CONF_OPTS += --enable-x11 --disable-xss
-MPV_DEPENDENCIES += xlib_libX11
-# xext
-ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
-MPV_CONF_OPTS += --enable-xext
-MPV_DEPENDENCIES += xlib_libXext
-else
-MPV_CONF_OPTS += --disable-xext
-endif
-# xinerama
-ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-MPV_CONF_OPTS += --enable-xinerama
-MPV_DEPENDENCIES += xlib_libXinerama
-else
-MPV_CONF_OPTS += --disable-xinerama
-endif
-# xrandr
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-MPV_CONF_OPTS += --enable-xrandr
-MPV_DEPENDENCIES += xlib_libXrandr
-else
-MPV_CONF_OPTS += --disable-xrandr
-endif
+# Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
+# enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
+# xlib_libXrandr, xlib_libXScrnSaver.
+ifeq ($(BR2_PACKAGE_XORG7),y)
+MPV_CONF_OPTS += --enable-x11
+MPV_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXinerama xlib_libXrandr xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 MPV_CONF_OPTS += --enable-xv
