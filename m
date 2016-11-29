From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 29 Nov 2016 15:36:58 +0100
Subject: [Buildroot] [PATCH] xorg-server: add dependency on dri2proto when
	systemd is built
Message-ID: <20161129143658.20619-1-fparent@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When systemd is selected, xorg-server must have config-udev-kms
enabled in order to build correctly, but it won't be the case if
BR2_PACKAGE_XPROTO_DRI2PROTO is not part of the build.

Add BR2_PACKAGE_XPROTO_DRI2PROTO as a dependency of xorg-xserver
only when systemd is part of the build.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 package/x11r7/xserver_xorg-server/Config.in              | 1 +
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index df3801c..9e1ee6f 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_SYSTEMD
 	help
 	  X.Org X server
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 51c3efc..adad2a7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -73,7 +73,8 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--with-systemd-daemon \
 	--enable-systemd-logind
-XSERVER_XORG_SERVER_DEPENDENCIES += systemd
+XSERVER_XORG_SERVER_DEPENDENCIES += systemd		\
+				    xproto_dri2proto
 else
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--without-systemd-daemon \
-- 
2.10.2
