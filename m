From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 14:23:09 +0100
Subject: [Buildroot] [git commit] mjpegtools: add optional support for
	png/sdl/sdl_gfx/X11/gtk2
Message-ID: <20150203132331.BDA1480E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=088ca7f95988bc846f224e43b2a5e11fa6113334
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpegtools/mjpegtools.mk |   43 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index b5958c0..347fa68 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -10,4 +10,47 @@ MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_LICENSE = GPLv2+
 MJPEGTOOLS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+MJPEGTOOLS_CONF_OPTS += --with-libpng
+MJPEGTOOLS_DEPENDENCIES += libpng
+else
+MJPEGTOOLS_CONF_OPTS += --without-libpng
+endif
+
+# expects X11 backend in sdl
+ifeq ($(BR2_PACKAGE_SDL_X11),y)
+MJPEGTOOLS_CONF_OPTS += --with-libsdl
+MJPEGTOOLS_DEPENDENCIES += sdl
+else
+MJPEGTOOLS_CONF_OPTS += --without-libsdl
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_GFX),y)
+MJPEGTOOLS_CONF_OPTS += --with-sdlgfx
+MJPEGTOOLS_DEPENDENCIES += sdl_gfx
+else
+MJPEGTOOLS_CONF_OPTS += --without-sdlgfx
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+MJPEGTOOLS_CONF_OPTS += --with-x
+MJPEGTOOLS_DEPENDENCIES += xlib_libX11
+else
+MJPEGTOOLS_CONF_OPTS += --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86DGA),y)
+MJPEGTOOLS_CONF_OPTS += --with-dga
+MJPEGTOOLS_DEPENDENCIES += xlib_libXxf86dga
+else
+MJPEGTOOLS_CONF_OPTS += --without-dga
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+MJPEGTOOLS_CONF_OPTS += --with-gtk
+MJPEGTOOLS_DEPENDENCIES += libgtk2
+else
+MJPEGTOOLS_CONF_OPTS += --without-gtk
+endif
+
 $(eval $(autotools-package))
