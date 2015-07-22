From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:37 +0200
Subject: [Buildroot] [PATCH 15/47] package/kodi-pvr-dvblink: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-dvblink/Config.in           |    8 ++++++++
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 27 insertions(+)
 create mode 100644 package/kodi-pvr-dvblink/Config.in
 create mode 100644 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 95d74c4..5c545f2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -111,6 +111,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	bool "Kodi PVR addon was split"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_PVR_ARGUSTV
+	select BR2_PACKAGE_KODI_PVR_DVBLINK
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-dvblink/Config.in b/package/kodi-pvr-dvblink/Config.in
new file mode 100644
index 0000000..57f1127
--- /dev/null
+++ b/package/kodi-pvr-dvblink/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_DVBLINK
+	bool "kodi-pvr-dvblink"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML2
+	help
+	  Kodi's DVBLink client addon
+
+	  https://github.com/kodi-pvr/pvr.dvblink
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
new file mode 100644
index 0000000..745f3cd
--- /dev/null
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-dvblink
+#
+################################################################################
+
+KODI_PVR_DVBLINK_VERSION = cf756e9241c58d98c3b56dfcae89da9f35e4555f
+KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
+KODI_PVR_DVBLINK_LICENSE = GPLv2+
+KODI_PVR_DVBLINK_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+
+KODI_PVR_DVBLINK_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bb9e3fc..b21530b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -254,6 +254,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
 	source "package/kodi-pvr-argustv/Config.in"
+	source "package/kodi-pvr-dvblink/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
