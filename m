From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:26:21 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: allow xserver without
	the systemd login daemon
Message-ID: <20150407202701.0094C819E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ee6d5aa6acb9a1c4ece36ac65a6b92a213d47da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ae68906..ce4069b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -64,6 +64,17 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+XSERVER_XORG_CONF_OPTS += \
+	--with-systemd-daemon \
+	--enable-systemd-logind
+XSERVER_XORG_SERVER_DEPENDENCIES += systemd
+else
+XSERVER_XORG_CONF_OPTS += \
+	--without-systemd-daemon \
+	--disable-systemd-logind
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
