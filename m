From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:57 +0200
Subject: [Buildroot] [PATCH 14/23] package/kodi-pvr-nextpvr: add explicit
 dependencies to libplatform, kodi and tinyxml
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already, tinyxml is a hard-dependency of kodi. For the case that kodi or
kodi-platform drop one of these dependencies we need to make sure that
this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.nextpvr/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/Config.in           | 2 ++
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-nextpvr/Config.in b/package/kodi-pvr-nextpvr/Config.in
index e520426796..e1567c7c98 100644
--- a/package/kodi-pvr-nextpvr/Config.in
+++ b/package/kodi-pvr-nextpvr/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_NEXTPVR
 	bool "kodi-pvr-nextpvr"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi's NextPVR client addon
 
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 59fc274583..cbcef90114 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -8,6 +8,6 @@ KODI_PVR_NEXTPVR_VERSION = 3.3.20-Leia
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
-KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+KODI_PVR_NEXTPVR_DEPENDENCIES = kodi kodi-platform libplatform tinyxml
 
 $(eval $(cmake-package))
-- 
2.26.2
