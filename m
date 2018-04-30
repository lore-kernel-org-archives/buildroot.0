From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:25:55 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/flann: fix build
 with cmake >= 3.11
Message-ID: <20180501073418.235D4890BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a39b3e2ba42b72d19bfcef30db1b8da9ead51a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

CMake < 3.11 doesn't support add_library() without any source file
(i.e add_library(foo SHARED)). But flann CMake use a trick that use
an empty string "" as source list (i.e add_library(foo SHARED "")).
This look like a bug in CMake < 3.11.

With CMake >= 3.11, the new behaviour of add_library() break the
existing flann CMake code.

From CMake Changelog [1]:
"add_library() and add_executable() commands can now be called without
 any sources and will not complain as long as sources are added later
 via the target_sources() command."

Note: flann CMake code doesn't use target_sources() since no source file
are provided intentionally since the flann shared library is created by
linking with the flann_cpp_s static library with this line:

target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)

If you try to use "add_library(flann_cpp SHARED ${CPP_SOURCES})" (as it should
be normally done), the link fail due to already defined symbol.

They are building the shared version using the static library "to speedup the
build time" [3]

This issue is already reported upstream [2] with a proposed solution.

Fixes:
http://autobuild.buildroot.net/results/b2f/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454

[1] https://cmake.org/cmake/help/v3.11/release/3.11.html
[2] https://github.com/mariusmuja/flann/issues/369
[3] https://github.com/mariusmuja/flann/commit/0fd62b43be2fbb0b8d791ee36290791224dc030c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Davide Viti <zinosat@tiscali.it>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0c469478f64d0ddaf72c0622a1830d855306d51c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../flann/0001-src-cpp-fix-cmake-3.11-build.patch  | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch b/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
new file mode 100644
index 0000000000..b37bedcf6d
--- /dev/null
+++ b/package/flann/0001-src-cpp-fix-cmake-3.11-build.patch
@@ -0,0 +1,80 @@
+From fa5ec96a94646492a3f908e12905b3e48a8e800b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 18 Apr 2018 20:24:13 +0200
+Subject: [PATCH] src/cpp: fix cmake >= 3.11 build
+
+CMake < 3.11 doesn't support add_library() without any source file
+(i.e add_library(foo SHARED)). But flann CMake use a trick that use
+an empty string "" as source list (i.e add_library(foo SHARED "")).
+This look like a bug in CMake < 3.11.
+
+With CMake >= 3.11, the new behaviour of add_library() break the
+existing flann CMake code.
+
+From CMake Changelog [1]:
+"add_library() and add_executable() commands can now be called without
+ any sources and will not complain as long as sources are added later
+ via the target_sources() command."
+
+Note: flann CMake code doesn't use target_sources() since no source file
+are provided intentionally since the flann shared library is created by
+linking with the flann_cpp_s static library with this line:
+
+target_link_libraries(flann_cpp -Wl,-whole-archive flann_cpp_s -Wl,-no-whole-archive)
+
+If you try to use "add_library(flann_cpp SHARED ${CPP_SOURCES})" (as it should
+be normally done), the link fail due to already defined symbol.
+
+They are building the shared version using the static library "to speedup the
+build time" [3]
+
+This issue is already reported upstream [2] with a proposed solution.
+
+Upstream status: Pending
+
+Fixes:
+http://autobuild.buildroot.net/results/b2f/b2febfaf8c44ce477b3e4a5b9b976fd25e8d7454
+
+[1] https://cmake.org/cmake/help/v3.11/release/3.11.html
+[2] https://github.com/mariusmuja/flann/issues/369
+[3] https://github.com/mariusmuja/flann/commit/0fd62b43be2fbb0b8d791ee36290791224dc030c
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
