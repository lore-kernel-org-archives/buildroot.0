From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 11:42:56 +0100
Subject: [Buildroot] [git commit] sdl: fix X11 dependencies
Message-ID: <20120208133907.4F93990A32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a9fdf92893c0b5e3ed904b59bd30e63ba8987c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need to build the entire X server to build SDL with X11 support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl/Config.in |    2 ++
 package/sdl/sdl.mk    |    4 +++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 869173d..65ac8a2 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -24,5 +24,7 @@ config BR2_PACKAGE_SDL_QTOPIA
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
 
 endif
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index f15a521..5460f51 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -32,7 +32,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPT+=--enable-video-x11=yes
-SDL_DEPENDENCIES += xserver_xorg-server
+SDL_DEPENDENCIES += xlib_libX11 xlib_libXext \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
 else
 SDL_CONF_OPT+=--enable-video-x11=no
 endif
