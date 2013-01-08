From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:13:29 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: rename server-style
	configuration options
Message-ID: <20130108232311.969039A6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73a84a6972a062f1b3212e92d91d4b186460c784
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_XSERVER_xorg and BR2_PACKAGE_XSERVER_tinyx options
used to select the style of X.org server to use are not named
consistently with the rest of the Buildroot options (in capital
letters and prefixed with the package name).

Therefore, we rename those options, and we take care to add the old
option names in the BR2_LEGACY infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |   16 ++++++++++++++++
 package/efl/libevas/Config.in                      |    8 ++++----
 package/x11r7/Config.in                            |    2 +-
 package/x11r7/mesa3d/Config.in                     |    2 +-
 package/x11r7/xserver_xorg-server/Config.in        |   10 +++++-----
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 +++---
 6 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4770c94..906c038 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -78,4 +78,20 @@ config BR2_PACKAGE_PTHREAD_STUBS
 	  For consistency reason, the pthread-stubs package has been
 	  renamed to xlib_libpthread-stubs.
 
+config BR2_PACKAGE_XSERVER_xorg
+	bool "X.org modular server"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR.
+
+config BR2_PACKAGE_XSERVER_tinyx
+	bool "KDrive / TinyX server"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	help
+	  The option has been renamed
+	  BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE.
+
 endif
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index bd845c1..f73376b 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -79,13 +79,13 @@ config BR2_PACKAGE_LIBEVAS_SDL
 config BR2_PACKAGE_LIBEVAS_SDL_GL
 	bool "libevas SDL OpenGL backend"
 	depends on BR2_PACKAGE_SDL_X11
-	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
 	help
 	  This is the SDL OpenGL engine that uses SDL library
 	  and OpenGL to render. This may be hardware accelerated.
 
 comment "SDL OpenGL backend needs modular X.org and X11 support in SDL"
-	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_xorg)
+	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
 
 config BR2_PACKAGE_LIBEVAS_X11
 	bool "libevas X11 backend"
@@ -99,7 +99,7 @@ config BR2_PACKAGE_LIBEVAS_X11
 
 config BR2_PACKAGE_LIBEVAS_X11_GLX
 	bool "libevas X11 GLX backend"
-	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXEXT
@@ -121,7 +121,7 @@ config BR2_PACKAGE_LIBEVAS_XCB
 
 config BR2_PACKAGE_LIBEVAS_XCB_GLX
 	bool "libevas XCB GLX backend"
-	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XCB_PROTO
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 60c022f..6940725 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -149,7 +149,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xwininfo/Config.in
 		source package/x11r7/xapp_xwud/Config.in
 	endmenu
-	if BR2_PACKAGE_XSERVER_xorg
+	if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	menu "X11R7 Drivers"
 		source package/x11r7/xdriver_xf86-input-evdev/Config.in
 		source package/x11r7/xdriver_xf86-input-joystick/Config.in
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index e5b426e..080f56a 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
-	depends on BR2_PACKAGE_XSERVER_xorg
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index e19d356..4ac0ec7 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
-	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_xorg
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_MCOOKIE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_PACKAGE_XSERVER_xorg
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
@@ -61,18 +61,18 @@ if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 choice
 	prompt "X Window System server type"
-	default BR2_PACKAGE_XSERVER_tinyx
+	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Select the X Window System server to use
 
-config BR2_PACKAGE_XSERVER_xorg
+config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
 	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
 
 comment "X.org requires largefile and C++ support"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 
-config BR2_PACKAGE_XSERVER_tinyx
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	bool "KDrive / TinyX"
 
 endchoice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ed5b904..623b25d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -62,14 +62,14 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var \
 		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
-ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_tinyx),y)
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev \
 		--disable-glx --disable-dri --disable-xsdl
 define XSERVER_CREATE_X_SYMLINK
@@ -133,7 +133,7 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-composite
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
