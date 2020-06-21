From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:04 +0200
Subject: [Buildroot] [PATCH 21/23] package/kodi-pvr-vuplus: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.vuplus/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/Config.in          | 1 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index b6a03e843f..428c84deda 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_PVR_VUPLUS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_TINYXML
 	help
 	  VuPlus PVR client addon for Kodi
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index bf1de1178d..d1bda24bed 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -8,6 +8,11 @@ KODI_PVR_VUPLUS_VERSION = 3.28.9-Leia
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = debian/copyright
-KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
+KODI_PVR_VUPLUS_DEPENDENCIES = \
+	json-for-modern-cpp \
+	kodi \
+	kodi-platform \
+	libplatform \
+	tinyxml
 
 $(eval $(cmake-package))
-- 
2.26.2
