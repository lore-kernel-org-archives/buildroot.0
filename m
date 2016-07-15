From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:52:26 +0200
Subject: [Buildroot] [git commit] Revert "cmake: bump version to 3.6.0"
Message-ID: <20160715075258.D5E3982231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8428dbd88e1531abf0628f3308c234bcf28e9921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b6ff742ca0d8b2901036d3ad03fe60c6b2a7725f.

This bump causes numerous build failures, so Vicente and Yann proposed
to revert it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/0001-rename_cmake_rootfile.patch | 27 +++++++++++---------------
 package/cmake/cmake.hash                       |  4 ++--
 package/cmake/cmake.mk                         |  4 ++--
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake/0001-rename_cmake_rootfile.patch
index 3169f16..915b7e3 100644
--- a/package/cmake/0001-rename_cmake_rootfile.patch
+++ b/package/cmake/0001-rename_cmake_rootfile.patch
@@ -6,23 +6,18 @@ This buildroot-specific patch makes sure ctest looks also for
 "Modules/CMake.cmake.ctest" before complaining
 
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
-[Vincent: tweak patch for 3.6.0]
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-diff -rup a/Source/cmake.cxx b/Source/cmake.cxx
---- a/Source/cmake.cxx	2016-07-07 15:47:27.000000000 +0100
-+++ b/Source/cmake.cxx	2016-07-14 10:14:59.914265515 +0100
-@@ -771,7 +771,12 @@ int cmake::AddCMakePaths()
-                       "Path to cpack program executable.", cmState::INTERNAL);
+--- cmake-3.0.2/Source/cmake.cxx~	2014-09-11 15:24:01.000000000 +0200
++++ cmake-3.0.2/Source/cmake.cxx	2014-11-25 15:48:04.461033690 +0100
+@@ -957,7 +957,10 @@
+      "Path to cpack program executable.", cmCacheManager::INTERNAL);
  #endif
-   if (!cmSystemTools::FileExists(
--        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str())) {
-+        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str()) &&
-+	!cmSystemTools::FileExists(
-+	  (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str()
-+        )
+   if(!cmSystemTools::FileExists(
+-       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()))
++       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()) &&
++     !cmSystemTools::FileExists(
++       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str())
 +     )
-+  {
+     {
      // couldn't find modules
-     cmSystemTools::Error(
-       "Could not find CMAKE_ROOT !!!\n"
+     cmSystemTools::Error("Could not find CMAKE_ROOT !!!\n"
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 7cd1133..e40d4ea 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.6/cmake-3.6.0-SHA-256.txt
-sha256 fd05ed40cc40ef9ef99fac7b0ece2e0b871858a82feade48546f5d2940147670  cmake-3.6.0.tar.gz
+# From http://www.cmake.org/files/v3.5/cmake-3.5.2-SHA-256.txt
+sha256	92d8410d3d981bb881dfff2aed466da55a58d34c7390d50449aa59b32bb5e62a	cmake-3.5.2.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 25eafe8..7a80c1b 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.6
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION_MAJOR = 3.5
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
