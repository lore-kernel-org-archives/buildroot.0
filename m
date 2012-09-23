From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 23 Sep 2012 12:32:04 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: fix dbus/udev configure
	problem
Message-ID: <1348399924-22924-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

If both the dbus and udev packages are selected, then the configure step
for the xserver_xorg-server package fails as follows.

  configure: error: Hotplugging through both libudev and dbus/hal not allowed

The configure script no longer allows both the --enable-config-dbus
and --enable-config-udev options to be specified.

This patch changes the xserver_xorg-server makefile to use dbus in preference
to udev, when both are available.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a19122d..90ac8a0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -107,13 +107,11 @@ endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
-endif
-
+else
 ifeq ($(BR2_PACKAGE_UDEV),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
-else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-- 
1.7.9.5
