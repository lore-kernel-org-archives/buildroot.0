From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Jul 2016 08:09:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: libdrm
	needs dri2
In-Reply-To: <1469426956-23383-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469426956-23383-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1469426956-23383-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While fixing
http://autobuild.buildroot.net/results/3b2/3b2b10314cde2ecacb7fd3949990a4cac2117f4c/
the build throws an error in the modesettings driver after libdrm CFLAGS
were fixed by the previous patch:

In file included from dri2.c:43:0:
./../../dri2/dri2.h:36:39: fatal error: X11/extensions/dri2tokens.h: No such file or directory
 #include <X11/extensions/dri2tokens.h>

According to configure.ac the modesettings driver is enabled if libdrm was
found:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?id=bc4b234d6f4b7b211f7a9750a97524e9652d0e6e

This patch adds the necessary dri2 dependency.

Fixes additional build error in
http://autobuild.buildroot.net/results/3b2/3b2b10314cde2ecacb7fd3949990a4cac2117f4c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0d14654..13f9087 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -97,7 +97,7 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_XPROTO_DRI2PROTO),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
 XSERVER_XORG_SERVER_CONF_ENV += LIBDRM_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) --cflags libdrm`"
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
-- 
2.8.1
