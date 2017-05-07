From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 May 2017 13:32:03 +0200
Subject: [Buildroot] [PATCH 1/3] package/kodi-peripheral-joystick: new
	package
Message-ID: <20170507113205.1861-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-joystick/Config.in                | 11 +++++++++++
 .../kodi-peripheral-joystick.hash                         |  2 ++
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.mk  | 15 +++++++++++++++
 package/kodi/Config.in                                    |  4 ++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/kodi-peripheral-joystick/Config.in
 create mode 100644 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
 create mode 100644 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk

diff --git a/package/kodi-peripheral-joystick/Config.in b/package/kodi-peripheral-joystick/Config.in
new file mode 100644
index 0000000000..4175676182
--- /dev/null
+++ b/package/kodi-peripheral-joystick/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_PERIPHERAL_JOYSTICK
+	bool "kodi-peripheral-joystick"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi joystick support (drivers and button maps)
+
+	  https://github.com/xbmc/peripheral.joystick
+
+comment "joystick support needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
new file mode 100644
index 0000000000..ca2bdc378c
--- /dev/null
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c2025c4ec280b44b5d8bb1c34185a94cc105f66f0b762087804bb7d2d633d999  kodi-peripheral-joystick-v1.3.2.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
new file mode 100644
index 0000000000..f0cad13a27
--- /dev/null
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-peripheral-joystick
+#
+################################################################################
+
+# This cset is on the branch 'Krypton'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PERIPHERAL_JOYSTICK_VERSION = v1.3.2
+KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
+KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
+KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi-platform udev
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index aef2aaf3e7..3f0cac684d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -299,6 +299,10 @@ menu "Inputstream addons"
 	source "package/kodi-inputstream-rtmp/Config.in"
 endmenu
 
+menu "Peripheral addons"
+	source "package/kodi-peripheral-joystick/Config.in"
+endmenu
+
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
-- 
2.11.0
