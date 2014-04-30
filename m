From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Apr 2014 06:44:22 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix DRI detection
Message-ID: <1398833062-11406-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b8a/b8a905b864b01aa09940668130a62d9d90ef5f9a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |   12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ba6c503..4f2eff2 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -99,11 +99,11 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-dri
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dri
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dri --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR),y)
@@ -179,12 +179,6 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-glx
-else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libcrypto
 XSERVER_XORG_SERVER_DEPENDENCIES += openssl
-- 
1.7.10.4
