From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:50 +0200
Subject: [Buildroot] [PATCH 07/23] package/kodi-pvr-dvbviewer: add explicit
 dependencies to libplatform, kodi and tinyxml
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already, tinyxml is a hard-dependency of kodi. For the case that kodi or
kodi-platform drop one of these dependencies we need to make sure that
this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.dvbviewer/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvbviewer/Config.in             | 2 ++
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-dvbviewer/Config.in b/package/kodi-pvr-dvbviewer/Config.in
index e7dd7b3eb6..7e601f6e69 100644
--- a/package/kodi-pvr-dvbviewer/Config.in
+++ b/package/kodi-pvr-dvbviewer/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	bool "kodi-pvr-dvbviewer"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi's DVBViewer client addon
 
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index b88d3d86cd..ce7fda279c 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -8,6 +8,6 @@ KODI_PVR_DVBVIEWER_VERSION = 3.7.11-Leia
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = debian/copyright
-KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
+KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi kodi-platform libplatform tinyxml
 
 $(eval $(cmake-package))
-- 
2.26.2
