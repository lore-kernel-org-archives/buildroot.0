From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:36:16 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 xlib_libXfont2 dependency
Message-ID: <20200906122819.8FBD8828B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9add4da3233c86c8d1705c9d11f2b5786e11508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency to xlib_libXfont2 was mistakenly removed in
https://git.buildroot.net/buildroot/commit/?id=e6dc4f1857eed27a19abd57fae7428bea38b69e5

Add it back again to fix build errors detected by the autobuilders and
remove handling of xlib_libXfont as well because only older versions of
xserver_xorg-server needed it.

Fixes:
http://autobuild.buildroot.net/results/f72/f72cc9b30e55e2c665de7a00482a1c3ba702118c/
http://autobuild.buildroot.net/results/9dd/9dd99e633dee8f11e7b2b973d4a72e51a2812ec9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xserver_xorg-server/Config.in              | 1 +
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 9 +--------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index d53083ef90..3bf5af89be 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 53b05f0ffa..de97467745 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -20,6 +20,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xlib_libXdmcp \
 	xlib_libXext \
 	xlib_libXfixes \
+	xlib_libXfont2 \
 	xlib_libXi \
 	xlib_libXrender \
 	xlib_libXres \
@@ -160,14 +161,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT2),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont2
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont
-endif
-
 ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xvmc
 endif
