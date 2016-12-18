From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:25:39 +0100
Subject: [Buildroot] [git commit] xorg-server: add dependency on dri2proto
	when systemd is built
Message-ID: <20161218132602.D49B181831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd4af31dd86c475482770f9ce9ccb583485c6449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When systemd is selected, xorg-server must have config-udev-kms
enabled in order to build correctly, but it won't be the case if
BR2_PACKAGE_XPROTO_DRI2PROTO is not part of the build.

Add BR2_PACKAGE_XPROTO_DRI2PROTO as a dependency of xorg-xserver
only when systemd is part of the build.

Fixes bug #9486.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in              | 1 +
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1d4a1fb..b7f2b3e 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_SYSTEMD
 	help
 	  X.Org X server
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6519af3..6444a20 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -72,7 +72,9 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--with-systemd-daemon \
 	--enable-systemd-logind
-XSERVER_XORG_SERVER_DEPENDENCIES += systemd
+XSERVER_XORG_SERVER_DEPENDENCIES += \
+	systemd \
+	xproto_dri2proto
 else
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--without-systemd-daemon \
