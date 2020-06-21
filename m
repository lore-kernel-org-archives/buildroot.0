From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:01 +0200
Subject: [Buildroot] [PATCH 18/23] package/kodi-pvr-stalker: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.stalker/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-stalker/Config.in           | 1 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index d334d0c2cb..ed17aededb 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_LIBXML2
 	help
 	  A PVR Client that connects Kodi to Stalker Middleware
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 0ae41171a9..a701bd7068 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -8,6 +8,11 @@ KODI_PVR_STALKER_VERSION = 3.4.10-Leia
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = debian/copyright
-KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform libxml2
+KODI_PVR_STALKER_DEPENDENCIES = \
+	jsoncpp \
+	kodi \
+	kodi-platform \
+	libplatform \
+	libxml2
 
 $(eval $(cmake-package))
-- 
2.26.2
