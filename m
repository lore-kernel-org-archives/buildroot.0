From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Apr 2021 23:34:32 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: remove
 non-evdev input drivers for kdrive
Message-ID: <20210415211733.8A88183B61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eea0da855bb146cca1ed85da03115953cd0219f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed support for non-evdev input drivers for kdrive:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=e7b8b7b131d8283c96ed0aff4593ab41441b5d3b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                         | 12 ++++++++++++
 package/x11r7/xserver_xorg-server/Config.in              | 12 ------------
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 12 ------------
 3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f62348f9b..d22dca9a53 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD
+	bool "KDrive/TinyX kbd input driver removed"
+	select BR2_LEGACY
+	help
+	  The kbd input driver in KDrive was removed.
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE
+	bool "KDrive/TinyX mouse input driver removed"
+	select BR2_LEGACY
+	help
+	  The mouse input driver in KDrive was removed.
+
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	bool "mesa OSMesa (classic) option removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 3bf5af89be..1b9adadb5c 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -90,18 +90,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
 	  Xfbdev -keybd evdev,,device=/dev/input/eventX
 	         -mouse evdev,,device=/dev/input/eventY
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD
-	bool "Enable KDrive/TinyX kbd input driver"
-	help
-	  Enable kbd input driver in KDrive. It uses the console
-	  keyboard as input device.
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE
-	bool "Enable KDrive/TinyX mouse input driver"
-	help
-	  Enable mouse input driver in KDrive. It supports PS/2 mice
-	  and serial port mice.
-
 endif
 
 comment "Optional Servers"
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 3fa77cd4f0..03f36f1b28 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -105,18 +105,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-evdev
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-kbd
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-kbd
-endif
-
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-mouse
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-mouse
-endif
-
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
