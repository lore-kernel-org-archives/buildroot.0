From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:01:21 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/supertux: fix
 build on powerpc64le
Message-ID: <20190327215821.1B7398160F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45e5cdcf2f955c052b7c099acf72880909fe628a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/c484079b2736eb3c21adff257f3e3ab1acc67f9a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8867e95a21e91f7a4b02ba6d5c1e8c688eb1a38f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertux/0001-Fix-build-on-PowerPC.patch | 81 ++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/package/supertux/0001-Fix-build-on-PowerPC.patch b/package/supertux/0001-Fix-build-on-PowerPC.patch
new file mode 100644
index 0000000000..e40abac6b0
--- /dev/null
+++ b/package/supertux/0001-Fix-build-on-PowerPC.patch
@@ -0,0 +1,81 @@
+From cfcd478fe69ca1b3923f388a349a4f67ac2c03aa Mon Sep 17 00:00:00 2001
+From: Shawn Anastasio <shawn@anastas.io>
+Date: Sun, 3 Feb 2019 13:22:57 -0600
+Subject: [PATCH] Fix build on PowerPC
+
+On PowerPC-based architectures, SDL includes the altivec.h header
+for SIMD intrinsics. Unfortunately, altivec.h defines some types which
+conflict with C++ types like bool and std::vector. This commit adds
+a wrapper for altivec.h which resolves these conflicts and allows
+supertux to build and run.
+
+Tested on a ppc64le workstation.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/SuperTux/supertux/pull/1056/commits/cfcd478fe69ca1b3923f388a349a4f67ac2c03aa]
+---
+ CMakeLists.txt    | 15 ++++++++++++++-
+ src/ppc/altivec.h |  6 ++++++
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+ create mode 100644 src/ppc/altivec.h
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 70b9673b50..b9b6ea3ea6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -376,6 +376,11 @@ endif()
+ 
+ include(ConfigureChecks)
+ 
++# Include altivec wrapper on ppc
++if(CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc.*")
++  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/ppc)
++endif()
++
+ 
+ ## Also build external/squirrel
+ 
+@@ -420,6 +425,13 @@ if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/external/tinygettext/CMakeLists.txt)
+   message(FATAL_ERROR "tinygettext submodule is not checked out or ${CMAKE_CURRENT_SOURCE_DIR}/external/tinygettext/CMakeLists.txt is missing")
+ endif()
+ 
++# Include altivec wrapper on ppc
++if(CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc.*")
++  set(TINYGETTEXT_CXX_FLAGS "-isystem ${CMAKE_CURRENT_SOURCE_DIR}/src/ppc ${CMAKE_CXX_FLAGS}")
++else()
++  set(TINYGETTEXT_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
++endif()
++
+ set(TINYGETTEXT_PREFIX ${CMAKE_BINARY_DIR}/tinygettext/)
+ ExternalProject_Add(tinygettext
+   SOURCE_DIR "${CMAKE_SOURCE_DIR}/external/tinygettext/"
+@@ -428,7 +440,7 @@ ExternalProject_Add(tinygettext
+   -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+   -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
+   -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+-  -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
++  -DCMAKE_CXX_FLAGS=${TINYGETTEXT_CXX_FLAGS}
+   -DBUILD_SHARED_LIBS=OFF
+   -DHAVE_SDL=ON
+   -DVCPKG_BUILD=${VCPKG_BUILD}
+@@ -443,6 +455,7 @@ set_target_properties(tinygettext_lib PROPERTIES IMPORTED_LOCATION "${TINYGETTEX
+ 
+ include_directories(SYSTEM ${TINYGETTEXT_PREFIX}/include)
+ 
++
+ ## external/SDL_ttf with patches
+ find_package(Freetype REQUIRED)
+ find_package(RAQM)
+diff --git a/src/ppc/altivec.h b/src/ppc/altivec.h
+new file mode 100644
+index 0000000000..7ede8246ed
+--- /dev/null
++++ b/src/ppc/altivec.h
+@@ -0,0 +1,6 @@
++#include_next <altivec.h>
++
++// The altivec headers redefine vector and bool which conflict
++// with C++'s bool type and std::vector. Undefine them here.
++#undef vector
++#undef bool
