From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 22:30:51 +0200
Subject: [Buildroot] [PATCH 29/47] package/kodi-pvr-wmc: new package
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437597069-6448-30-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                     |    1 +
 package/kodi-pvr-wmc/Config.in       |    7 +++++++
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk |   17 +++++++++++++++++
 package/kodi/Config.in               |    1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-wmc/Config.in
 create mode 100644 package/kodi-pvr-wmc/kodi-pvr-wmc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 37ff81f..707fa66 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -125,6 +125,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_VBOX
 	select BR2_PACKAGE_KODI_PVR_VDR_VNSI
 	select BR2_PACKAGE_KODI_PVR_VUPLUS
+	select BR2_PACKAGE_KODI_PVR_WMC
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-wmc/Config.in b/package/kodi-pvr-wmc/Config.in
new file mode 100644
index 0000000..2672c83
--- /dev/null
+++ b/package/kodi-pvr-wmc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_WMC
+	bool "kodi-pvr-wmc"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's Windows Media Center client addon
+
+	  https://github.com/kodi-pvr/pvr.wmc
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
new file mode 100644
index 0000000..4d6d839
--- /dev/null
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-wmc
+#
+################################################################################
+
+KODI_PVR_WMC_VERSION = e19c3e99c87e81d406bac0bc4e8edeb47df66dcc
+KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
+KODI_PVR_WMC_LICENSE = GPLv2+
+KODI_PVR_WMC_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+
+KODI_PVR_WMC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f184db0..e3a9393 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -268,6 +268,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
 	source "package/kodi-pvr-vuplus/Config.in"
+	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
