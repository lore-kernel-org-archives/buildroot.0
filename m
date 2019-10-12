From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2019 09:26:42 -0600
Subject: [Buildroot] [PATCH v4 1/2] cmake: add version 3.15.3
Message-ID: <20191012152643.67744-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retain cmake 3.8.2 for compatibility with toolchains without c++11 support.

Remove FindLibUV patch which is now upstream.

Resync/reformat rename cmake rootfile patch for 3.15.3 with git format-patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v3 -> v4:
  - retain support for version 3.8.2 for older toolchains

Changes v2 -> v3:
  - split minimum cmake off from cmake version bump

Changes v1 -> v2:
  - Set cmake version min to 3.10.
---
 .../3.15.3/0001-rename-cmake-rootfile.patch   | 43 +++++++++++++++++++
 .../0001-rename_cmake_rootfile.patch          |  0
 ...k-uv-version-h-for-version-detection.patch |  0
 package/cmake/cmake.hash                      |  4 +-
 package/cmake/cmake.mk                        |  5 +++
 5 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 package/cmake/3.15.3/0001-rename-cmake-rootfile.patch
 rename package/cmake/{ => 3.8.2}/0001-rename_cmake_rootfile.patch (100%)
 rename package/cmake/{ => 3.8.2}/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch (100%)

diff --git a/package/cmake/3.15.3/0001-rename-cmake-rootfile.patch b/package/cmake/3.15.3/0001-rename-cmake-rootfile.patch
new file mode 100644
index 0000000000..29d7df2d29
--- /dev/null
+++ b/package/cmake/3.15.3/0001-rename-cmake-rootfile.patch
@@ -0,0 +1,43 @@
+From f7291b1decd24a4e9530f98d7723fb55f38223ea Mon Sep 17 00:00:00 2001
+From: Davide Viti <zinosat@tiscali.it>
+Date: Thu, 14 Jul 2016 10:14:59 +0100
+Subject: [PATCH] rename cmake rootfile
+
+ctest fails on the target, because it cannot find CMake.cmake inside
+CMAKE_DATA_DIR (typically set to "/usr/share/cmake-3.0"): all *.cmake
+files are removed at build time via the target-finalize rule.
+
+This buildroot-specific patch makes sure ctest looks also for
+"Modules/CMake.cmake.ctest" before complaining
+
+[Vincent: tweak patch for 3.6.3]
+[James: tweak patch for 3.15.3]
+
+Signed-off-by: Davide Viti <zinosat@tiscali.it>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ Source/cmake.cxx | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/Source/cmake.cxx b/Source/cmake.cxx
+index 3772f09985..c317e4af38 100644
+--- a/Source/cmake.cxx
++++ b/Source/cmake.cxx
+@@ -1009,7 +1009,12 @@ int cmake::AddCMakePaths()
+     "Path to cpack program executable.", cmStateEnums::INTERNAL);
+ #endif
+   if (!cmSystemTools::FileExists(
+-        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake"))) {
++        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake")) &&
++        !cmSystemTools::FileExists(
++          (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest")
++        )
++     )
++  {
+     // couldn't find modules
+     cmSystemTools::Error(
+       "Could not find CMAKE_ROOT !!!\n"
+-- 
+2.20.1
+
diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake/3.8.2/0001-rename_cmake_rootfile.patch
similarity index 100%
rename from package/cmake/0001-rename_cmake_rootfile.patch
rename to package/cmake/3.8.2/0001-rename_cmake_rootfile.patch
diff --git a/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch b/package/cmake/3.8.2/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
similarity index 100%
rename from package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
rename to package/cmake/3.8.2/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 9e0159a3c8..1c6f72cfe5 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,7 @@
-# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
+# From https://cmake.org/files/v3.15/cmake-3.15.3-SHA-256.txt
 sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
+sha256 13958243a01365b05652fa01b21d40fa834f70a9e30efa69c02604e64f58b8f5  cmake-3.15.3.tar.gz
 
 # Locally calculated
 sha256 af3030e1bf1af2f534430fdfe3cfc5a617966648a2a7f0c06a631adc92be1e5f  Copyright.txt
+sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a00691a128..81b8d3bf6e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,13 @@
 #
 ################################################################################
 
+ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
+CMAKE_VERSION_MAJOR = 3.15
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+else
 CMAKE_VERSION_MAJOR = 3.8
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+endif
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.20.1
