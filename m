From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Apr 2018 21:19:12 +0200
Subject: [Buildroot] [PATCH] package/flann: fix build with cmake >= 3.11
Message-ID: <20180418191912.25410-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake 3.11 changed the behaviour of add_library() that break the existing
flann CMake code.

From [1]:
"add_library() and add_executable() commands can now be called without
 any sources and will not complain as long as sources are added later
 via the target_sources() command."

This issue is already reported upstream [2] with a proposed solution.

Fixes:
http://autobuild.buildroot.net/results/b2f/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454

[1] https://cmake.org/cmake/help/v3.11/release/3.11.html
[2] https://github.com/mariusmuja/flann/issues/369

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Davide Viti <zinosat@tiscali.it>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../flann/0001-src-cpp-fix-cmake-3.11-build.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/flann/0001-src-cpp-fix-cmake-3.11-build.patch

diff --git a/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch b/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
new file mode 100644
index 0000000000..5542c3cfc8
--- /dev/null
+++ b/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
@@ -0,0 +1,48 @@
+From fa5ec96a94646492a3f908e12905b3e48a8e800b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 18 Apr 2018 20:24:13 +0200
+Subject: [PATCH] src/cpp: fix cmake >= 3.11 build
+
+Upstream status: Pending
+
+https://github.com/mariusmuja/flann/issues/369
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/cpp/CMakeLists.txt | 4 ++--
+ src/cpp/empty.cpp      | 1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+ create mode 100644 src/cpp/empty.cpp
+
+diff --git a/src/cpp/CMakeLists.txt b/src/cpp/CMakeLists.txt
+index b44a735..a816863 100644
+--- a/src/cpp/CMakeLists.txt
++++ b/src/cpp/CMakeLists.txt
+@@ -29,7 +29,7 @@ if (BUILD_CUDA_LIB)
+ endif()
+ 
+ if(CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_COMPILER_IS_GNUCC)
+-    add_library(flann_cpp SHARED "")
++    add_library(flann_cpp SHARED "empty.cpp")
+     set_target_properties(flann_cpp PROPERTIES LINKER_LANGUAGE CXX)
+     target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)
+ 
+@@ -85,7 +85,7 @@ if (BUILD_C_BINDINGS)
+     set_property(TARGET flann_s PROPERTY COMPILE_DEFINITIONS FLANN_STATIC)
+ 
+     if(CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_COMPILER_IS_GNUCC)
+-        add_library(flann SHARED "")
++        add_library(flann SHARED "empty.cpp")
+         set_target_properties(flann PROPERTIES LINKER_LANGUAGE CXX)
+         target_link_libraries(flann -Wl,-whole-archive flann_s -Wl,-no-whole-archive)
+     else()
+diff --git a/src/cpp/empty.cpp b/src/cpp/empty.cpp
+new file mode 100644
+index 0000000..40a8c17
+--- /dev/null
++++ b/src/cpp/empty.cpp
+@@ -0,0 +1 @@
++/* empty */
+-- 
+2.14.3
+
-- 
2.14.3
