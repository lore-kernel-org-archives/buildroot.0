From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Sun, 29 Mar 2015 23:24:58 +0200
Subject: [Buildroot] [PATCH 1/1 v2] allow xserver without the systemd login
	daemon.
Message-ID: <1427664298-11629-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thanks to Noel Vellemans for the hint.
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
Patch v1->v2 :
	added else clause as suggested by Thomas.
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bb5381c..c290734 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -64,6 +64,16 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+XSERVER_XORG_CONF_OPTS += \
+	--with-systemd-daemon \
+	--enable-systemd-logind
+else
+XSERVER_XORG_CONF_OPTS += \
+	--without-systemd-daemon \
+	--disable-systemd-logind
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
-- 
2.3.3
