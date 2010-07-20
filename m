From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 16:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] xserver: libpciaccess is not
	needed for tinyx
Message-ID: <20100720140845.1C40B82B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7be1fd6c68f20322bb12eed1bfe15a3a42a0bcd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpciaccess is only needed for the modular server, and as libpciaccess
needs largefile support and tinyx doesn't, this dependency could
cause a build failure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index d574675..8a8d10f 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ba9a3b8..b0bc48b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -16,7 +16,6 @@ XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install
 
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
-	xlib_libpciaccess		\
 	xlib_libXfont 			\
 	xlib_libX11 			\
 	xlib_libXau 			\
@@ -66,6 +65,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
-- 
1.7.1
