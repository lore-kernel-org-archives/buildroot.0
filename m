From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:54 +0200
Subject: [Buildroot] [PATCH 11/23] package/kodi-pvr-iptvsimple: add explicit
 dependencies to libplatform, kodi and zlib
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already, zlib is built as hard-dependency of kodi. For the case that
kodi-platform or kodi drop one of these dependencies we need to make
sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.iptvsimple/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/Config.in              | 2 ++
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
index 94fc1f0602..31dd3d0e09 100644
--- a/package/kodi-pvr-iptvsimple/Config.in
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	bool "kodi-pvr-iptvsimple"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_RAPIDXML
+	select BR2_PACKAGE_ZLIB
 	help
 	  IPTV Live TV and Radio PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index f1a087100c..110101d4a5 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -8,6 +8,11 @@ KODI_PVR_IPTVSIMPLE_VERSION = 3.9.8-Leia
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = debian/copyright
-KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform rapidxml
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = \
+	kodi \
+	kodi-platform \
+	libplatform \
+	rapidxml \
+	zlib
 
 $(eval $(cmake-package))
-- 
2.26.2
