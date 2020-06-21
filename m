From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:55 +0200
Subject: [Buildroot] [PATCH 12/23] package/kodi-pvr-mediaportal-tvserver:
 add explicit dependencies to libplatform, kodi and tinyxml
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already, tinyxml is a hard-dependency of kodi. For the case that kodi or
kodi-platform drop one of these dependencies we need to make sure that
this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.mediaportal.tvserver/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mediaportal-tvserver/Config.in                 | 2 ++
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
index 733ca8859e..231a698de8 100644
--- a/package/kodi-pvr-mediaportal-tvserver/Config.in
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	bool "kodi-pvr-mediaportal-tvserver"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  MediaPortal TVServer PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index a00711c662..ee2a3cdd38 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -8,6 +8,6 @@ KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 3.5.18-Leia
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = debian/copyright
-KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
+KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi kodi-platform libplatform tinyxml
 
 $(eval $(cmake-package))
-- 
2.26.2
