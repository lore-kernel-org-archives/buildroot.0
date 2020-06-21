From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:52 +0200
Subject: [Buildroot] [PATCH 09/23] package/kodi-pvr-hdhomerun: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.hdhomerun/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hdhomerun/Config.in             | 1 +
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
index ed5b914cb3..9e3f59819b 100644
--- a/package/kodi-pvr-hdhomerun/Config.in
+++ b/package/kodi-pvr-hdhomerun/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KODI_PVR_HDHOMERUN
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBHDHOMERUN
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Kodi's HDHomeRun client addon
 
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index ae42f5c33d..31e48e5cdb 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -8,6 +8,11 @@ KODI_PVR_HDHOMERUN_VERSION = 3.5.0-Leia
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = debian/copyright
-KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+KODI_PVR_HDHOMERUN_DEPENDENCIES = \
+	jsoncpp \
+	kodi \
+	kodi-platform \
+	libhdhomerun \
+	libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
