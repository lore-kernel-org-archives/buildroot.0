From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:54:59 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/kodi-pvr-stalker:
 needs libxml2
Message-ID: <20171227095711.14D93836C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ad89ba554d73cce2656985d3e92928e7b69f65f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Since
https://git.buildroot.net/buildroot/commit/package/kodi?id=bf9bfd065ba3fab328fd041ca040f2bf134fecf2
kodi itself does not depend on libxml2 anymore which previously
provided libxml2 still needed by kodi-pvr-stalker:
https://github.com/kodi-pvr/pvr.stalker/blob/Krypton/CMakeLists.txt#L12

Fixes a build error not caught by autobuilders because they do not have
host jdk installed:
CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
  Could NOT find LibXml2 (missing: LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIR)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7be5653b865938af3fdbcbd1553145a8e90426a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-stalker/Config.in           | 1 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index 3ec530c..d334d0c 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBXML2
 	help
 	  A PVR Client that connects Kodi to Stalker Middleware
 
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index ee61171..32ac2ca 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -10,6 +10,6 @@ KODI_PVR_STALKER_VERSION = 2.8.6-Krypton
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
-KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform libxml2
 
 $(eval $(cmake-package))
