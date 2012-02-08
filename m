From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 14:30:06 +0100
Subject: [Buildroot] [git commit] libevas: fix SDL GL backend build
Message-ID: <20120208133907.70EE190391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a9b75fe04296e0533bc085e05b357e8e7ea2324
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libeet is needed by all backends building the generic OpenGL support,
and the configure script forgets to check / expand libeet CFLAGS/libs
when the SDL GL backend is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in  |    6 +++---
 package/efl/libevas/libevas.mk |    6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index b5fb50e..fa25485 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -99,7 +99,6 @@ config BR2_PACKAGE_LIBEVAS_X11_GLX
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	select BR2_PACKAGE_LIBEET
 	help
 	  This enables the OpenGL X11 rendering engine that renders
 	  using GLX which may be hardware accelerated.
@@ -132,8 +131,9 @@ choice
 	default BR2_PACKAGE_LIBEVAS_GL
 
 config BR2_PACKAGE_LIBEVAS_GL
-       select BR2_PACKAGE_MESA3D
-       bool "generic OpenGL"
+	bool "generic OpenGL"
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_LIBEET
 
 config BR2_PACKAGE_LIBEVAS_GLES_SGX
        bool "OpenGL-ES SGX"
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 9f1cf79..e716cea 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -96,10 +96,14 @@ endif
 ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
 LIBEVAS_CONF_OPT += --enable-gl-sdl
 LIBEVAS_DEPENDENCIES += sdl
+# configure script forgets to check for eet / fill this out
+LIBEVAS_CONF_ENV += \
+	GL_EET_CFLAGS='-I$(STAGING_DIR)/usr/include/eet-1' \
+	GL_EET_LIBS='-leet'
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
-LIBEVAS_DEPENDENCIES += mesa3d
+LIBEVAS_DEPENDENCIES += mesa3d libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
