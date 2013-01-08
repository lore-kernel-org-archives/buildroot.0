From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:20:38 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: option to build
	KDrive input drivers
Message-ID: <20130108232311.CA2469A6E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=924f36de1ac7b193c62b0740ed75ba8bc51d9153
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the Kdrive variant of the X server is selected, the drivers are
directly built into the X server. The X server therefore provides
options to enable or disable certain drivers, especially input
drivers.

This patch adds options to be able to enable or disable the evdev, kbd
and mouse drivers of Kdrive.

[Peter: fix Config.in indentation as pointed out by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |   29 ++++++++++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |   19 +++++++++++++
 2 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4ac0ec7..053dd81 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -87,6 +87,35 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
     help
         Enable/Use AIGLX extension.
 
+if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
+	bool "Enable KDrive/TinyX evdev input driver"
+	help
+	  Enable evdev input driver in KDrive. This allows KDrive to
+	  use input devices that are integrated in the Linux input
+	  subsystem, i.e have a /dev/input/eventX device file. This is
+	  most likely the input driver you want to use.
+
+	  This driver can then be enabled by running the X server
+	  using:
+
+	  Xfbdev -keybd evdev,,device=/dev/input/eventX -mouse evdev,,device=/dev/input/eventY.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD
+	bool "Enable KDrive/TinyX kbd input driver"
+	help
+	  Enable kbd input driver in KDrive. It uses the console
+	  keyboard as input device.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE
+	bool "Enable KDrive/TinyX mouse input driver"
+	help
+	  Enable mouse input driver in KDrive. It supports PS/2 mice
+	  and serial port mice.
+
+endif
+
 comment "Optional Servers"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 623b25d..92aa4b3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -76,7 +76,26 @@ define XSERVER_CREATE_X_SYMLINK
  ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
 endef
 XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
+
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-evdev
 else
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
+else # modular
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
 
