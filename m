From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:18 +0100
Subject: [Buildroot] [PATCH 06/28] xserver_xorg-server: option to build
	KDrive input drivers
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9b6d564efd282b2d5d7119ffc4a5e1842f1e72ff.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the Kdrive variant of the X server is selected, the drivers are
directly built into the X server. The X server therefore provides
options to enable or disable certain drivers, especially input
drivers.

This patch adds options to be able to enable or disable the evdev, kbd
and mouse drivers of Kdrive.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |   29 ++++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |   19 +++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4ac0ec7..2382786 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -87,6 +87,35 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
     help
         Enable/Use AIGLX extension.
 
+if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
+       bool "Enable KDrive/TinyX evdev input driver"
+       help
+         Enable evdev input driver in KDrive. This allows KDrive to
+         use input devices that are integrated in the Linux input
+         subsystem, i.e have a /dev/input/eventX device file. This is
+         most likely the input driver you want to use.
+
+	 This driver can then be enabled by running the X server
+         using:
+
+           Xfbdev -keybd evdev,,device=/dev/input/eventX -mouse evdev,,device=/dev/input/eventY.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD
+       bool "Enable KDrive/TinyX kbd input driver"
+       help
+         Enable kbd input driver in KDrive. It uses the console
+         keyboard as input device.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE
+       bool "Enable KDrive/TinyX mouse input driver"
+       help
+         Enable mouse input driver in KDrive. It supports PS/2 mice
+         and serial port mice.
+
+endif
+
 comment "Optional Servers"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 623b25d..552d8e8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -76,6 +76,25 @@ define XSERVER_CREATE_X_SYMLINK
  ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
 endef
 XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-evdev
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-evdev
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-kbd
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-kbd
+endif
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-mouse
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-mouse
+endif
+
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
-- 
1.7.9.5
