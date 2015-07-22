From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:48 +0200
Subject: [Buildroot] [PATCH 26/47] package/kodi-pvr-vbox: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                       |    1 +
 package/kodi-pvr-vbox/Config.in        |    7 +++++++
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk |   17 +++++++++++++++++
 package/kodi/Config.in                 |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-vbox/Config.in
 create mode 100644 package/kodi-pvr-vbox/kodi-pvr-vbox.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0684c97..75cb0d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -122,6 +122,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_NJOY
 	select BR2_PACKAGE_KODI_PVR_PCTV
 	select BR2_PACKAGE_KODI_PVR_STALKER
+	select BR2_PACKAGE_KODI_PVR_VBOX
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
new file mode 100644
index 0000000..3a5f8c4
--- /dev/null
+++ b/package/kodi-pvr-vbox/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VBOX
+	bool "kodi-pvr-vbox"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon for interfacing with VBox Communications XTi TV Gateway
+
+	  https://github.com/kodi-pvr/pvr.vbox
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
new file mode 100644
index 0000000..5fc8eb4
--- /dev/null
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vbox
+#
+################################################################################
+
+KODI_PVR_VBOX_VERSION = 874eb8812db1dd1b2626ed6c9f8391790f0e6818
+KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
+KODI_PVR_VBOX_LICENSE = GPLv2+
+KODI_PVR_VBOX_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VBOX_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3cbc9aa..7b497fc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -265,6 +265,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
+	source "package/kodi-pvr-vbox/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
