From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Apr 2021 08:52:44 +0200
Subject: [Buildroot] [PATCH 3/5] package/x11r7/xserver_xorg-server: remove
 evdev input drivers for kdrive
In-Reply-To: <20210415065246.276882-1-bernd.kuhls@t-online.de>
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
Message-ID: <20210415065246.276882-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the evdev driver for kdrive:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=27819950e4158326e0f83a30f2e8968b932625ef

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                               |  6 ++++++
 package/x11r7/xserver_xorg-server/Config.in    | 18 ------------------
 .../xserver_xorg-server/xserver_xorg-server.mk |  6 ------
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d22dca9a53..c2b0645eaf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
+	bool "KDrive/TinyX evdev input driver removed"
+	select BR2_LEGACY
+	help
+	  The evdev input driver in KDrive was removed.
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD
 	bool "KDrive/TinyX kbd input driver removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1b9adadb5c..fcd3d0ae00 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -74,24 +74,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 
 endchoice
 
-if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
-	bool "Enable KDrive/TinyX evdev input driver"
-	help
-	  Enable evdev input driver in KDrive. This allows KDrive to
-	  use input devices that are integrated in the Linux input
-	  subsystem, i.e have a /dev/input/eventX device file. This is
-	  most likely the input driver you want to use.
-
-	  This driver can then be enabled by running the X server
-	  using:
-
-	  Xfbdev -keybd evdev,,device=/dev/input/eventX
-	         -mouse evdev,,device=/dev/input/eventY
-
-endif
-
 comment "Optional Servers"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index aaf3584772..8bd92b7ab6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -94,12 +94,6 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-dri \
 	--disable-xsdl
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-evdev
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-evdev
-endif
-
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
 endif
-- 
2.29.2
