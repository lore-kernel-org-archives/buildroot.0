From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 20:53:30 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: fix dbus/udev
	configure problem
Message-ID: <20120923193051.02A6599649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a5f16edb8d28da0df19d82f0655e2b49e2abaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If both the dbus and udev packages are selected, then the configure step
for the xserver_xorg-server package fails as follows.

  configure: error: Hotplugging through both libudev and dbus/hal not allowed

The configure script no longer allows both the --enable-config-dbus
and --enable-config-udev options to be specified.

This patch changes the xserver_xorg-server makefile to use udev in preference
to dbus, when both are available.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a19122d..8018a89 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -104,16 +104,14 @@ XSERVER_XORG_SERVER_DEPENDENCIES += tslib
 XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
 endif
 
+ifeq ($(BR2_PACKAGE_UDEV),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += udev
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+else
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
 endif
-
-ifeq ($(BR2_PACKAGE_UDEV),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
-XSERVER_XORG_SERVER_DEPENDENCIES += udev
-else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
