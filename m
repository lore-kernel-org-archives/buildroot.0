From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 23:29:42 +0200
Subject: [Buildroot] [git commit master 1/1] xserver: libdrm is not needed
	for tinyx
Message-ID: <20100720213021.2734F82B8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fd5b0dc8fe3bb3f53e23553e0710baa64f6ae107
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdrm is only needed for the modular server, and as libdrm
needs largefile support and tinyx doesn't, this dependency could
cause a build failure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 8a8d10f..2d725e4 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
-	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_MCOOKIE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index b0bc48b..e32215f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -53,7 +53,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xf86rushproto 		\
 	xproto_xf86vidmodeproto 	\
 	xproto_xproto 			\
-	libdrm 				\
 	pixman 				\
 	openssl 			\
 	mcookie
@@ -65,7 +64,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
-- 
1.7.1
