From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Apr 2020 18:01:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libspatialindex: bump to version
 1.9.3
Message-ID: <20200422160104.470956-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation in hash file (two spaces)
- Add upstream to allow building static library

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on-t-force-the-build-of-a-shared-lib.patch | 35 -------------------
 .../0001-allow-building-static-libs.patch     | 32 +++++++++++++++++
 package/libspatialindex/libspatialindex.hash  |  6 ++--
 package/libspatialindex/libspatialindex.mk    |  2 +-
 4 files changed, 36 insertions(+), 39 deletions(-)
 delete mode 100644 package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
 create mode 100644 package/libspatialindex/0001-allow-building-static-libs.patch

diff --git a/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch b/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
deleted file mode 100644
index 3316a3825d..0000000000
--- a/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2333cd804e33e67567b656b847094cd9a8c8fbbf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 22 Sep 2019 20:58:19 +0200
-Subject: [PATCH] CMakeLists.txt: don't force the build of a shared library
-
-Building a shared library doesn't work on all platforms, so instead,
-let CMake rely on the standard BUILD_SHARED_LIBS variable to decide
-whether a static or shared library should be built.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/libspatialindex/libspatialindex/pull/158]
----
- src/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e6b733b..f8a4980 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -194,9 +194,9 @@ if (NOT WITH_STATIC_LASZIP)
- endif()
- endif()
- 
--add_library(${SIDX_LIB_NAME} SHARED ${SIDX_SOURCES})
-+add_library(${SIDX_LIB_NAME} ${SIDX_SOURCES})
- 
--add_library(${SIDX_C_LIB_NAME} SHARED ${SIDX_CAPI_CPP})
-+add_library(${SIDX_C_LIB_NAME} ${SIDX_CAPI_CPP})
- 
- target_link_libraries(${SIDX_C_LIB_NAME}
-   ${SIDX_LIB_NAME}
--- 
-2.23.0
-
diff --git a/package/libspatialindex/0001-allow-building-static-libs.patch b/package/libspatialindex/0001-allow-building-static-libs.patch
new file mode 100644
index 0000000000..09435cc1f8
--- /dev/null
+++ b/package/libspatialindex/0001-allow-building-static-libs.patch
@@ -0,0 +1,32 @@
+From caee28d84685071da3ff3a4ea57ff0b6ae64fc87 Mon Sep 17 00:00:00 2001
+From: SpaceIm <30052553+SpaceIm@users.noreply.github.com>
+Date: Sat, 28 Mar 2020 19:08:40 +0100
+Subject: [PATCH] allow building static libs (#183)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/libspatialindex/libspatialindex/commit/caee28d84685071da3ff3a4ea57ff0b6ae64fc87]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c34ee8d..3bfac51 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -43,7 +43,6 @@ SET(SIDX_VERSION_MINOR "9")
+ SET(SIDX_VERSION_PATCH "3")
+ SET(SIDX_LIB_VERSION "6.1.1")
+ SET(SIDX_LIB_SOVERSION "6")
+-SET(BUILD_SHARED_LIBS ON)
+ 
+ 
+ set(SIDX_VERSION_STRING "${SIDX_VERSION_MAJOR}.${SIDX_VERSION_MINOR}.${SIDX_VERSION_PATCH}")
+@@ -52,6 +51,7 @@ set(SIDX_VERSION_STRING "${SIDX_VERSION_MAJOR}.${SIDX_VERSION_MINOR}.${SIDX_VERS
+ # libspatialindex general cmake options
+ #------------------------------------------------------------------------------
+ 
++option(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ option(SIDX_BUILD_TESTS "Enables integrated test suites" OFF)
+ 
+ 
diff --git a/package/libspatialindex/libspatialindex.hash b/package/libspatialindex/libspatialindex.hash
index 4eda28237d..ca679db968 100644
--- a/package/libspatialindex/libspatialindex.hash
+++ b/package/libspatialindex/libspatialindex.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libspatialindex/libspatialindex/releases/download/1.9.0/spatialindex-src-1.9.0.tar.bz2.sha512sum
-sha512 dbf9601c878f245899d7336347674e96e8eeb715ec33a36ade44f3cc821c1dca7995cb09197a382bfd97da75c38f37b04f4d8f81ffbf38fef65fff82c5d1d2f3 spatialindex-src-1.9.0.tar.bz2
+# From https://github.com/libspatialindex/libspatialindex/releases/download/1.9.3/spatialindex-src-1.9.3.tar.bz2.sha512sum
+sha512  7922807a2f7026542a014d3d7943da5410429b291cf469267ffea5b8075eab2a94e68b6c013425615d221b930fd319c403f3bf43404c9b1d2c92d0e2baae3066  spatialindex-src-1.9.3.tar.bz2
 
 # Hash for license file
-sha256 b63ebfaca9d7ce582580f3e11acabc9d2e37c46ce234533f7fa8a6c7278898a0 COPYING
+sha256  b63ebfaca9d7ce582580f3e11acabc9d2e37c46ce234533f7fa8a6c7278898a0  COPYING
diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
index 57088a2e12..0ff313d817 100644
--- a/package/libspatialindex/libspatialindex.mk
+++ b/package/libspatialindex/libspatialindex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPATIALINDEX_VERSION = 1.9.0
+LIBSPATIALINDEX_VERSION = 1.9.3
 LIBSPATIALINDEX_SITE = \
 	https://github.com/libspatialindex/libspatialindex/releases/download/$(LIBSPATIALINDEX_VERSION)
 LIBSPATIALINDEX_SOURCE = spatialindex-src-$(LIBSPATIALINDEX_VERSION).tar.bz2
-- 
2.25.1
