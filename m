From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:09:03 +0200
Subject: [Buildroot] [git commit] package/kodi-peripheral-joystick: new
	package
Message-ID: <20170716141659.BEE8880DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cdb958e42286c5b73447bc47cb127f1afe6bbc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-peripheral-joystick/Config.in                | 11 +++++++++++
 .../kodi-peripheral-joystick.hash                         |  2 ++
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.mk  | 15 +++++++++++++++
 package/kodi/Config.in                                    |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/package/kodi-peripheral-joystick/Config.in b/package/kodi-peripheral-joystick/Config.in
new file mode 100644
index 0000000..f257710
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
+comment "kodi-peripheral-joystick needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
new file mode 100644
index 0000000..ca2bdc3
--- /dev/null
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c2025c4ec280b44b5d8bb1c34185a94cc105f66f0b762087804bb7d2d633d999  kodi-peripheral-joystick-v1.3.2.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
new file mode 100644
index 0000000..f0cad13
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
index 6586701..efb613a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -293,6 +293,10 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Peripheral addons"
+	source "package/kodi-peripheral-joystick/Config.in"
+endmenu
+
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
