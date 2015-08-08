From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Aug 2015 13:59:05 +0200
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xserver_xorg-server: Fix
	libdrm dependency handling
In-Reply-To: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439035146-26080-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/2e1/2e12f1a91812f027d89fcceeb41d6c88ef7b9d32/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 566d93a..c88614b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -86,6 +86,12 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-libdrm
+endif
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
@@ -125,10 +131,10 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-libdrm --disable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
@@ -148,8 +154,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm and dri2
 ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
-- 
2.1.4
