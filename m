From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 15:53:43 +0100
Subject: [Buildroot] [RFC/PATCH v5 10/13] package/kodi-audioencoder-flac:
	New package
In-Reply-To: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1415458426-23645-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/Config.in           |    9 ++++++++
 .../kodi-audioencoder-flac-xbmc-rebrand.patch      |   24 ++++++++++++++++++++
 .../kodi-audioencoder-flac.mk                      |   17 ++++++++++++++
 package/kodi/Config.in                             |   10 +++++++-
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 package/kodi-audioencoder-flac/Config.in
 create mode 100644 package/kodi-audioencoder-flac/kodi-audioencoder-flac-xbmc-rebrand.patch
 create mode 100644 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk

diff --git a/package/kodi-audioencoder-flac/Config.in b/package/kodi-audioencoder-flac/Config.in
new file mode 100644
index 0000000..ec8cb96
--- /dev/null
+++ b/package/kodi-audioencoder-flac/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_AUDIOENCODER_FLAC
+	bool "kodi-audioencoder-flac"
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_LIBOGG
+	depends on BR2_PACKAGE_KODI_OPTICALDRIVE
+	help
+	  An audioencoder addon for Kodi
+
+	  https://github.com/xbmc/audioencoder.flac
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac-xbmc-rebrand.patch b/package/kodi-audioencoder-flac/kodi-audioencoder-flac-xbmc-rebrand.patch
new file mode 100644
index 0000000..77e19e4
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac-xbmc-rebrand.patch
@@ -0,0 +1,24 @@
+diff -Naur xbmc-audioencoder-flac-7aee9d0/CMakeLists.txt xbmc-audioencoder-flac-7aee9d0.patch/CMakeLists.txt
+--- xbmc-audioencoder-flac-7aee9d0/CMakeLists.txt	2014-07-18 23:48:22.000000000 +0200
++++ xbmc-audioencoder-flac-7aee9d0.patch/CMakeLists.txt	2014-10-20 13:03:49.565070141 +0200
+@@ -6,7 +6,7 @@
+ 
+ enable_language(CXX)
+ 
+-find_package(xbmc REQUIRED)
++find_package(kodi REQUIRED)
+ find_package(FLAC REQUIRED)
+ find_package(Ogg REQUIRED)
+ 
+diff -Naur xbmc-audioencoder-flac-7aee9d0/src/EncoderFlac.cpp xbmc-audioencoder-flac-7aee9d0.patch/src/EncoderFlac.cpp
+--- xbmc-audioencoder-flac-7aee9d0/src/EncoderFlac.cpp	2014-07-18 23:48:22.000000000 +0200
++++ xbmc-audioencoder-flac-7aee9d0.patch/src/EncoderFlac.cpp	2014-10-20 02:13:58.806998666 +0200
+@@ -20,7 +20,7 @@
+ 
+ #include <FLAC/stream_encoder.h>
+ #include <FLAC/metadata.h>
+-#include "xbmc/xbmc_audioenc_dll.h"
++#include "kodi/xbmc_audioenc_dll.h"
+ #include <string.h>
+ 
+ extern "C" {
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
new file mode 100644
index 0000000..6ef94a4
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audioencoder-flac
+#
+################################################################################
+
+KODI_AUDIOENCODER_FLAC_VERSION = 84bdf32418df4611aac8b2f48ca205153ded239f
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
+KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg
+KODI_AUDIOENCODER_FLAC_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi \
+	-DFLAC_INCLUDE_DIRS=$(STAGING_DIR)/usr/include \
+	-DOGG_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ececca4..9c37765 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -240,7 +240,15 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 	help
 	  Enable support for optical drives
 
-comment "Kodi addons"
+if BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi audioencoder addons"
+
+source "package/kodi-audioencoder-flac/Config.in"
+
+endif # BR2_PACKAGE_KODI_OPTICALDRIVE
+
+comment "Kodi PVR addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
 source "package/xbmc-pvr-addons/Config.in"
-- 
1.7.10.4
