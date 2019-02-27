From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Feb 2019 20:25:58 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] support/dependencies: require at least CMake 3.8
Message-ID: <20190227192558.19183-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gerbera package in version 1.3 unfortunately now requires CMake >= 3.8
for C++17 macros:
https://github.com/gerbera/gerbera/commit/b5fd39f30fb10385ec228b71377685206a609c3a

So we need to bump our requirement from 3.1 to 3.8. If the host doesn't
have a CMake >= 3.8, Buildroot will build its own host-cmake package.

Also drop patch that relax cmake requirement on json-for-modern-cpp

Fixes:
 - http://autobuild.buildroot.org/results/6405647b47b132ff5d0d211b92d407322d52d507

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Put back a slightly updated comment
 - Drop patch on json-for-modern-cpp

 ...system-relax-requirement-on-cmake-version.patch | 85 ----------------------
 support/dependencies/check-host-cmake.mk           | 11 +--
 2 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch

diff --git a/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch b/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch
deleted file mode 100644
index a5921527a0..0000000000
--- a/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e8b6b7adc138a66f8d47396a2e707366d3771028 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 31 Dec 2018 18:42:09 +0100
-Subject: [PATCH] buildsystem: relax requirement on cmake version
-
-Commit 73cc5089 (Using target_compile_features to specify C++ 11
-standard) bumped the required cmake version, from 3.0 to 3.8, so
-as to get the definition of target_compile_features().
-
-However, target_compile_features() was introduced in cmake-3.1:
-    https://cmake.org/cmake/help/v3.1/command/target_compile_features.html
-
-And using cmake-3.1 is indeed sufficient to properly build.
-
-As such, relax the minimum required version down to cmake-3.1,
-so we can build on oldish, entreprise-grade distributions that
-only have cmake-3.1 (or at least, don't have up to cmake-3.8).
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: MR pending
-https://github.com/nlohmann/json/pull/1409
----
- CMakeLists.txt                                     | 2 +-
- benchmarks/CMakeLists.txt                          | 2 +-
- test/cmake_add_subdirectory/project/CMakeLists.txt | 2 +-
- test/cmake_import/project/CMakeLists.txt           | 2 +-
- test/cmake_import_minver/project/CMakeLists.txt    | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 409f5bff..da6f08e7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.8)
-+cmake_minimum_required(VERSION 3.1)
- 
- ##
- ## PROJECT
-diff --git a/benchmarks/CMakeLists.txt b/benchmarks/CMakeLists.txt
-index a53812c1..dd3f3027 100644
---- a/benchmarks/CMakeLists.txt
-+++ b/benchmarks/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.8)
-+cmake_minimum_required(VERSION 3.1)
- project(JSON_Benchmarks LANGUAGES CXX)
- 
- # set compiler flags
-diff --git a/test/cmake_add_subdirectory/project/CMakeLists.txt b/test/cmake_add_subdirectory/project/CMakeLists.txt
-index 2c5be183..21357b68 100644
---- a/test/cmake_add_subdirectory/project/CMakeLists.txt
-+++ b/test/cmake_add_subdirectory/project/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.8)
-+cmake_minimum_required(VERSION 3.1)
- 
- project(DummyImport CXX)
- 
-diff --git a/test/cmake_import/project/CMakeLists.txt b/test/cmake_import/project/CMakeLists.txt
-index d268d72c..fe892fc1 100644
---- a/test/cmake_import/project/CMakeLists.txt
-+++ b/test/cmake_import/project/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.8)
-+cmake_minimum_required(VERSION 3.1)
- 
- project(DummyImport CXX)
- 
-diff --git a/test/cmake_import_minver/project/CMakeLists.txt b/test/cmake_import_minver/project/CMakeLists.txt
-index eeef3296..29056bdc 100644
---- a/test/cmake_import_minver/project/CMakeLists.txt
-+++ b/test/cmake_import_minver/project/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.8)
-+cmake_minimum_required(VERSION 3.1)
- 
- project(DummyImportMinVer CXX)
- 
--- 
-2.14.1
-
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 4300e6f600..5604713de6 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,14 +1,9 @@
-# Versions before 3.0 are affected by the bug described in
-# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
-# and fixed in upstream CMake in version 3.0:
-# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
-#
-# Set this to either 3.0 or higher, depending on the highest minimum
+# Set this to either 3.8 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
-# version, our cmake infra will catch it and whine.
+# version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.1
+BR2_CMAKE_VERSION_MIN = 3.8
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.14.1
