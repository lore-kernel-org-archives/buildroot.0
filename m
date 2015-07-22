From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:36 +0200
Subject: [Buildroot] [PATCH 14/47] package/kodi-pvr-argustv: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-argustv/Config.in           |    7 +++++++
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-argustv/Config.in
 create mode 100644 package/kodi-pvr-argustv/kodi-pvr-argustv.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2459b9d..95d74c4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -110,6 +110,7 @@ comment "Legacy options removed in 2015.08"
 config BR2_PACKAGE_KODI_PVR_ADDONS
 	bool "Kodi PVR addon was split"
 	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_PVR_ARGUSTV
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
new file mode 100644
index 0000000..698ff46
--- /dev/null
+++ b/package/kodi-pvr-argustv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_ARGUSTV
+	bool "kodi-pvr-argustv"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's ARGUS TV client addon
+
+	  https://github.com/kodi-pvr/pvr.argustv
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
new file mode 100644
index 0000000..0e318e6
--- /dev/null
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-argustv
+#
+################################################################################
+
+KODI_PVR_ARGUSTV_VERSION = 96c80267935d8edc4f6f92d16b540ef77cdcb1db
+KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
+KODI_PVR_ARGUSTV_LICENSE = GPLv2+
+KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
+
+KODI_PVR_ARGUSTV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 454f839..bb9e3fc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 
 menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
+	source "package/kodi-pvr-argustv/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
