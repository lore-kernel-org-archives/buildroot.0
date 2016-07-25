From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Jul 2016 08:09:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: add
	libdrm-specific cflags
Message-ID: <1469426956-23383-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As described in
http://lists.busybox.net/pipermail/buildroot/2015-February/119410.html
xserver_xorg-server still uses PKG_CHECK_EXISTS to find libdrm but does
not add libdrm-specific CFLAGS to Makefile causing the build to fail.

Fixes
http://autobuild.buildroot.net/results/3b2/3b2b10314cde2ecacb7fd3949990a4cac2117f4c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 85d7e98..0d14654 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -99,6 +99,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_ENV += LIBDRM_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) --cflags libdrm`"
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-libdrm
-- 
2.8.1
