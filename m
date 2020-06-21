From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:06 +0200
Subject: [Buildroot] [PATCH 23/23] package/kodi-pvr-zattoo: fix dependencies
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-23-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package depends on rapidjson, not rapidxml:
https://github.com/rbuehlma/pvr.zattoo/blob/Leia/CMakeLists.txt#L10

The bug was previously not noticed because kodi depends on rapidjson
https://github.com/xbmc/xbmc/blob/Leia/CMakeLists.txt#L133
and kodi-platform depends on kodi
https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L8

The reverse dependency of rapidjson to BR2_INSTALL_LIBSTDCPP is not
added here because kodi is written in C++ and provides the dependency.

Also add kodi as explicit dependency:
https://github.com/rbuehlma/pvr.zattoo/blob/Leia/CMakeLists.txt#L7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-zattoo/Config.in          | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index ab7ff70034..5dfadcadd1 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBPLATFORM
-	select BR2_PACKAGE_RAPIDXML
+	select BR2_PACKAGE_RAPIDJSON
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR-Addon for Zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 14ac22db50..3644751034 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -8,6 +8,11 @@ KODI_PVR_ZATTOO_VERSION = 18.1.19-Leia
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = debian/copyright
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi-platform libplatform rapidxml tinyxml2
+KODI_PVR_ZATTOO_DEPENDENCIES = \
+	kodi \
+	kodi-platform \
+	libplatform \
+	rapidjson \
+	tinyxml2
 
 $(eval $(cmake-package))
-- 
2.26.2
