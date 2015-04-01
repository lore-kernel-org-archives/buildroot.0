From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:58 +0200
Subject: [Buildroot] [PATCH/RFC 05/27] package/kodi-platform: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is used by the PVR addon packages and has no use
by itself, therefore is does not show up in menuconfig.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-platform/Config.in        |    6 ++++++
 package/kodi-platform/kodi-platform.mk |   17 +++++++++++++++++
 package/kodi/Config.in                 |    2 ++
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-platform/Config.in
 create mode 100644 package/kodi-platform/kodi-platform.mk

diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
new file mode 100644
index 0000000..5a50714
--- /dev/null
+++ b/package/kodi-platform/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_PLATFORM
+	bool
+	help
+	  Kodi add-on platform support library
+
+	  https://github.com/xbmc/kodi-platform
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
new file mode 100644
index 0000000..f27fcc4
--- /dev/null
+++ b/package/kodi-platform/kodi-platform.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-platform
+#
+################################################################################
+
+KODI_PLATFORM_VERSION = 48bdd985b843353eec5804e4dbab2dc8f2b4b13e
+KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
+KODI_PLATFORM_LICENSE = GPLv3+
+KODI_PLATFORM_LICENSE_FILES = COPYING
+KODI_PLATFORM_INSTALL_STAGING = YES
+KODI_PLATFORM_DEPENDENCIES = kodi
+
+KODI_PLATFORM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 80bba83..eee6d81 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -101,6 +101,8 @@ menuconfig BR2_PACKAGE_KODI
 
 if BR2_PACKAGE_KODI
 
+source "package/kodi-platform/Config.in"
+
 config BR2_PACKAGE_KODI_ALSA_LIB
 	bool "alsa"
 	select BR2_PACKAGE_ALSA_LIB
-- 
1.7.10.4
