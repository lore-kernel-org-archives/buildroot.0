From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Jan 2015 13:23:22 +0100
Subject: [Buildroot] [git commit] package/kodi: add missing dependency on
	libdrm
Message-ID: <20150119122535.7B541804CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43fbfc30c8fdc74341ec413c89d4113e13a881ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building Kodi with X11 support, libdrm is a mandatory dependency,
and it uses pkg-config to find it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in |    1 +
 package/kodi/kodi.mk   |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7d89b5b..5141629 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -85,6 +85,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 1fb7256..3e649f7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -77,9 +77,11 @@ endif
 
 # quote from kodi/configure.in: "GLES overwrites GL if both set to yes."
 # we choose the opposite because opengl offers more features, like libva support
+# GL means X11, and under X11, Kodi needs libdrm; libdrm is forcefully selected
+# by a modular Xorg server, which Kodi already depends on.
 ifeq ($(BR2_PACKAGE_KODI_GL),y)
 KODI_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
-	xlib_libXmu xlib_libXrandr xlib_libXt
+	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
 KODI_CONF_OPTS += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
 ifeq ($(BR2_PACKAGE_KODI_RSXS),y)
 # fix rsxs compile
