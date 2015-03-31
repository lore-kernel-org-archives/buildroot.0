From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 12:50:30 -0300
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: add
	--enable-libdrm for udev
Message-ID: <1427817030-27888-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the libdrm package is enabled, the system is built with an udev
provider and MESA3D_DRI_DRIVER is disabled this adds a --disable-libdrm
to configure options, but udev still requires libdrm and results in a
build failure since libdrm include paths aren't filled in (missing drm.h
include error).
So add --enable-libdrm for the udev scenario to counteract the previous
--disable-libdrm.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bb5381c..d9f36fc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -130,7 +130,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
-- 
2.0.5
