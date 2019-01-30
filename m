From: De Schampheleire, Thomas (Nokia - BE/Antwerp) <thomas.de_schampheleire@nokia.com>
Date: Wed, 30 Jan 2019 10:16:21 +0000
Subject: [Buildroot] [PATCH] package/opentracing-cpp: bump version to v1.5.1
Message-ID: <20190130101610.19049-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Patch is removed because it has been upstreamed.

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
[ThomasDS: Additional bump from v1.3.0 to v1.5.1]
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...d-static-target-a-configurable-optio.patch | 74 -------------------
 package/opentracing-cpp/opentracing-cpp.hash  |  2 +-
 package/opentracing-cpp/opentracing-cpp.mk    |  2 +-
 3 files changed, 2 insertions(+), 76 deletions(-)
 delete mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch

diff --git a/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
deleted file mode 100644
index 90a945bb27..0000000000
--- a/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 9462847f23a25524fdc2112cbc8de3f2c02a1669 Mon Sep 17 00:00:00 2001
-From: Jan Heylen <jan.heylen@nokia.com>
-Date: Fri, 22 Dec 2017 22:04:29 +0100
-Subject: [PATCH] CMake: make shared/static target a configurable option
-
-Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
----
- CMakeLists.txt | 40 ++++++++++++++++++++++++++++------------
- 1 file changed, 28 insertions(+), 12 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index aadf2f9..d03bd00 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,18 +70,36 @@ endif()
- include_directories(include)
- include_directories(SYSTEM 3rd_party/include)
- 
-+option(BUILD_SHARED_LIBS "Build as a shared library" ON)
-+option(BUILD_STATIC_LIBS "Build as a static library" ON)
-+
-+if (NOT BUILD_SHARED_LIBS AND NOT BUILD_STATIC_LIBS)
-+    message(FATAL_ERROR "One or both of BUILD_SHARED_LIBS or BUILD_STATIC_LIBS must be set to ON to build")
-+endif()
-+
- set(SRCS src/propagation.cpp src/noop.cpp src/tracer.cpp)
--add_library(opentracing SHARED ${SRCS})
--target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
--set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
-+
-+if (BUILD_SHARED_LIBS)
-+  add_library(opentracing SHARED ${SRCS})
-+  target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
-+  set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
-                                              SOVERSION ${OPENTRACING_VERSION_MAJOR})
--add_library(opentracing-static STATIC ${SRCS})
--set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
--target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
--if (CLANG_TIDY_EXE)
--  set_target_properties(opentracing PROPERTIES
-+  install(TARGETS opentracing EXPORT OpenTracingTargets
-+          LIBRARY DESTINATION lib
-+          ARCHIVE DESTINATION lib)
-+  if (CLANG_TIDY_EXE)
-+    set_target_properties(opentracing PROPERTIES
-                                     CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
--endif()
-+  endif()
-+endif(BUILD_SHARED_LIBS)
-+
-+if (BUILD_STATIC_LIBS)
-+  add_library(opentracing-static STATIC ${SRCS})
-+  set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
-+  target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
-+  install(TARGETS opentracing-static EXPORT OpenTracingTargets
-+          ARCHIVE DESTINATION lib)
-+endif(BUILD_STATIC_LIBS)
- 
- 
- install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
-@@ -89,9 +107,7 @@ install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
-                            PATTERN "*.h")
- install(DIRECTORY include/opentracing DESTINATION include
-             FILES_MATCHING PATTERN "*.h")
--install(TARGETS opentracing opentracing-static EXPORT OpenTracingTargets
--        LIBRARY DESTINATION lib
--        ARCHIVE DESTINATION lib)
-+
- 
- # ==============================================================================
- # Package configuration setup
--- 
-2.7.4
-
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
index d25dbafeea..3394563bc7 100644
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c77041cb2f147ac81b2b0702abfced5565a9cebc318d045c060a4c3e074009ee opentracing-cpp-v1.2.0.tar.gz
+sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-v1.5.1.tar.gz
 sha256 b80bffcfee825a69645f7ca97ddba48714031ea5c845198d184714d5490798b6 COPYING
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
index 4e296fc9fb..cfe4df70ed 100644
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENTRACING_CPP_VERSION = v1.2.0
+OPENTRACING_CPP_VERSION = v1.5.1
 OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
 OPENTRACING_CPP_LICENSE = MIT
 OPENTRACING_CPP_LICENSE_FILES = COPYING
-- 
2.19.2
