From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:11:43 +0100
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: relax
 dependency on cmake version
Message-ID: <20190101100754.3CD0F882E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a4d5f21d904b6c3216ac9ce807b5b7006aef8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, json-for-modern-cpp requires cmake to be at least cmake-3.8,
but our dependencies only check for cmake-3.1.

It turns out that json-for-modern-cpp is over strict, and could very
well do with just cmake-3.1

Fixes:
    http://autobuild.buildroot.org/results/1f8/1f893d8bc7df3bfefd31df69aba918e2121cfaf7/

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...system-relax-requirement-on-cmake-version.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch b/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch
new file mode 100644
index 0000000000..a5921527a0
--- /dev/null
+++ b/package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch
@@ -0,0 +1,85 @@
+From e8b6b7adc138a66f8d47396a2e707366d3771028 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 31 Dec 2018 18:42:09 +0100
+Subject: [PATCH] buildsystem: relax requirement on cmake version
+
+Commit 73cc5089 (Using target_compile_features to specify C++ 11
+standard) bumped the required cmake version, from 3.0 to 3.8, so
+as to get the definition of target_compile_features().
+
+However, target_compile_features() was introduced in cmake-3.1:
+    https://cmake.org/cmake/help/v3.1/command/target_compile_features.html
+
+And using cmake-3.1 is indeed sufficient to properly build.
+
+As such, relax the minimum required version down to cmake-3.1,
+so we can build on oldish, entreprise-grade distributions that
+only have cmake-3.1 (or at least, don't have up to cmake-3.8).
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: MR pending
+https://github.com/nlohmann/json/pull/1409
+---
+ CMakeLists.txt                                     | 2 +-
+ benchmarks/CMakeLists.txt                          | 2 +-
+ test/cmake_add_subdirectory/project/CMakeLists.txt | 2 +-
+ test/cmake_import/project/CMakeLists.txt           | 2 +-
+ test/cmake_import_minver/project/CMakeLists.txt    | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 409f5bff..da6f08e7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.8)
++cmake_minimum_required(VERSION 3.1)
+ 
+ ##
+ ## PROJECT
+diff --git a/benchmarks/CMakeLists.txt b/benchmarks/CMakeLists.txt
+index a53812c1..dd3f3027 100644
+--- a/benchmarks/CMakeLists.txt
++++ b/benchmarks/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.8)
++cmake_minimum_required(VERSION 3.1)
+ project(JSON_Benchmarks LANGUAGES CXX)
+ 
+ # set compiler flags
+diff --git a/test/cmake_add_subdirectory/project/CMakeLists.txt b/test/cmake_add_subdirectory/project/CMakeLists.txt
+index 2c5be183..21357b68 100644
+--- a/test/cmake_add_subdirectory/project/CMakeLists.txt
++++ b/test/cmake_add_subdirectory/project/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.8)
++cmake_minimum_required(VERSION 3.1)
+ 
+ project(DummyImport CXX)
+ 
+diff --git a/test/cmake_import/project/CMakeLists.txt b/test/cmake_import/project/CMakeLists.txt
+index d268d72c..fe892fc1 100644
+--- a/test/cmake_import/project/CMakeLists.txt
++++ b/test/cmake_import/project/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.8)
++cmake_minimum_required(VERSION 3.1)
+ 
+ project(DummyImport CXX)
+ 
+diff --git a/test/cmake_import_minver/project/CMakeLists.txt b/test/cmake_import_minver/project/CMakeLists.txt
+index eeef3296..29056bdc 100644
+--- a/test/cmake_import_minver/project/CMakeLists.txt
++++ b/test/cmake_import_minver/project/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.8)
++cmake_minimum_required(VERSION 3.1)
+ 
+ project(DummyImportMinVer CXX)
+ 
+-- 
+2.14.1
+
