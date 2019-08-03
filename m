From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Aug 2019 11:22:31 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/domoticz: bump to version
 0f411f781ae4fb4a82f592d38a3f40578c149533
Message-ID: <20190803092231.2308-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Replace first patch to fix build when using a development version
- Fix build with openzwave 1.6 through:
  https://github.com/domoticz/domoticz/commit/56d3fa099d9c98222d6cf5043891c6ba2f1df6bf
- Add patch to revert cmake 3.14 dependency as buildroot currently
  requires only 3.8

Fixes:
 - http://autobuild.buildroot.org/results/3dbb6612205020cc156d245a75c76a7886f7d529

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add information about cmake's patch

 ...story.txt-use-10717-instead-of-xxxxx.patch | 33 +++++++++++++
 ...ersion.default-bump-version-to-10717.patch | 23 ---------
 ...CMake-configuration-file-to-use-vers.patch | 47 +++++++++++++++++++
 package/domoticz/domoticz.hash                |  2 +-
 package/domoticz/domoticz.mk                  |  2 +-
 5 files changed, 82 insertions(+), 25 deletions(-)
 create mode 100644 package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
 delete mode 100644 package/domoticz/0001-appversion.default-bump-version-to-10717.patch
 create mode 100644 package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch

diff --git a/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch b/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
new file mode 100644
index 0000000000..c2b9cb0d25
--- /dev/null
+++ b/package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
@@ -0,0 +1,33 @@
+From bc34ba549d4366092a39a4d7bc4414f8cbd8bc6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 3 Aug 2019 09:13:54 +0200
+Subject: [PATCH] History.txt: use 10717 instead of xxxxx
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Set current development version to 4.10717 instead of 4.xxxxx to avoid
+the following build failure when git is unavailable:
+
+/home/fabrice/buildroot/output/build/domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533/main/domoticz.cpp: In function ?void GetAppVersion()?:
+/home/fabrice/buildroot/output/build/domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533/main/../appversion.h:1:20: error: ?xxxxx? was not declared in this scope
+ #define APPVERSION xxxxx
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ History.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/History.txt b/History.txt
+index 4dc45e6b5..ad67976f3 100644
+--- a/History.txt
++++ b/History.txt
+@@ -1,4 +1,4 @@
+-Version 4.xxxxx (xxx 2019)
++Version 4.10717 (xxx 2019)
+ - Implemented: DarkSky CloudCover sensor
+ - Implemented: EventSystem, option in Settings to enable/disable URL call logging containing full URL path
+ - Implemented: GUI, OpenZWave added Refresh Node Information button, styling
+-- 
+2.20.1
+
diff --git a/package/domoticz/0001-appversion.default-bump-version-to-10717.patch b/package/domoticz/0001-appversion.default-bump-version-to-10717.patch
deleted file mode 100644
index df0f1b339a..0000000000
--- a/package/domoticz/0001-appversion.default-bump-version-to-10717.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4d8bbaf4bdffe4fa77a060cd7fa848f3001d46a8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 21 May 2019 21:08:13 +0200
-Subject: [PATCH] appversion.default: bump version to 10717
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/domoticz/domoticz/pull/3251]
----
- appversion.default | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/appversion.default b/appversion.default
-index 7d3530590..6fc5766c2 100644
---- a/appversion.default
-+++ b/appversion.default
-@@ -1,3 +1,3 @@
--#define APPVERSION 9700
-+#define APPVERSION 10717
- #define APPHASH "b97777b"
- #define APPDATE 1478691222
--- 
-2.20.1
-
diff --git a/package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch b/package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch
new file mode 100644
index 0000000000..8640b83544
--- /dev/null
+++ b/package/domoticz/0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch
@@ -0,0 +1,47 @@
+From 2cd95289939b4a7c2576176c7f6268028aa093b2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 May 2019 21:50:16 +0200
+Subject: [PATCH] Revert "Updating CMake configuration file to use
+ version 3.14 as minimum and added boost dependency targets"
+
+This reverts commit 4e4ee999c4b323514c0ba81ab1ff3afb10d2f1cd to avoid
+bumping host-cmake requirement version from 3.8 to 3.14 in buildroot.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c5b7832ff..a21f5b87b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+-#set to minimum version that supports clean build
+-cmake_minimum_required(VERSION 3.14.0)
++#set to minimum version that supports clean build on cygwin
++cmake_minimum_required(VERSION 2.8.4)
+ 
+ project(domoticz)
+ 
+@@ -583,6 +583,7 @@ set(Boost_USE_STATIC_LIBS ${USE_STATIC_BOOST})
+ set(Boost_USE_MULTITHREADED ON)
+ unset(Boost_INCLUDE_DIR CACHE)
+ unset(Boost_LIBRARY_DIRS CACHE)
++find_package(Boost REQUIRED COMPONENTS thread system)
+ 
+ if(USE_STATIC_BOOST)
+    message(STATUS "Linking against boost static libraries")
+@@ -590,9 +591,6 @@ else(USE_STATIC_BOOST)
+    message(STATUS "Linking against boost dynamic libraries")
+ endif(USE_STATIC_BOOST)
+ 
+-find_package(Boost REQUIRED COMPONENTS thread system)
+-target_link_libraries(domoticz Boost::thread Boost::system)
+-
+ # compare found vs required libBoost version
+ if(Boost_VERSION VERSION_LESS DOMO_MIN_LIBBOOST_VERSION)
+    message(FATAL_ERROR "Found libBoost version ${Boost_VERSION}, ${DOMO_MIN_LIBBOOST_VERSION} or newer required")
+-- 
+2.20.1
+
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 3d974b3f8d..320028ac53 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c053a2161942529f56b748945ec297dcd67f449e68029fc886893a528891ad86	domoticz-4.10717.tar.gz
+sha256	1903b830ed53aada66ae261d4f29a73d10c03cb5f117e4c6e7e1275620b11f4e	domoticz-0f411f781ae4fb4a82f592d38a3f40578c149533.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 9636e208d0..c0568c61c6 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 4.10717
+DOMOTICZ_VERSION = 0f411f781ae4fb4a82f592d38a3f40578c149533
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
-- 
2.20.1
