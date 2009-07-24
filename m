From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:10 +0200
Subject: [Buildroot] [PATCH 09/13] xorg server: remove dependencies
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ae8bbdf891c8343313cd2d3be2df079214576a4a.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the X.org server selection always trigger the compilation
and installation of libXt (the X toolkit) and libXaw (Athena Widget
toolkits), which is are legacy toolkits not used by modern toolkits
(Gtk, Qt, etc.). They are only used by old X11 applications that are
typically not used on embedded systems.

Not compiling them save compilation time, and more importantly, space
on the target.

We also remove the compilation on xlib_libxkbui, libxmu and libxpm,
because they all depend on libXt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    4 ----
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ----
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 58bd8d2..105c790 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_XLIB_LIBXKBUI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XPROTO_COMPOSITEPROTO
 	select BR2_PACKAGE_XPROTO_DAMAGEPROTO
@@ -15,13 +14,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
-	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXMU
-	select BR2_PACKAGE_XLIB_LIBXPM
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXRES
 	select BR2_PACKAGE_XLIB_LIBXXF86MISC
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0c70441..e2af324 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -15,17 +15,13 @@ XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
 	xlib_libXfont 			\
-	xlib_libxkbui 			\
 	xlib_libX11 			\
 	xlib_libXau 			\
-	xlib_libXaw 			\
 	xlib_libXdmcp 			\
 	xlib_libXScrnSaver 		\
 	xlib_libXext 			\
 	xlib_libXfixes 			\
 	xlib_libXi 			\
-	xlib_libXmu 			\
-	xlib_libXpm 			\
 	xlib_libXrender 		\
 	xlib_libXres 			\
 	xlib_libXft 			\
-- 
1.6.0.4
