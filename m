From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:54:00 +0100
Subject: [Buildroot] [git commit] package/rocksdb: switch to generic-package
Message-ID: <20200213215311.159D88DFDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95bf830e2ae6b5548c17fd3ce6ac1a8d2aa0c8b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from cmake-package to generic-package to allow rocksdb to run the
./build_tools/build_detect_platform script and detect compiler options
such as C++17 support for -faligned-new

First patch needs to be updated and second patch can be dropped

Fixes:
 - http://autobuild.buildroot.org/results/22c9909c0d20e3871775f3874f7723910d7e5a41
 - http://autobuild.buildroot.org/results/ab7b2bc9e9653a7093d8b27d4445c28993572ca4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rocksdb/0001-Check-for-sys-auxv.h.patch    |  36 ++-
 ...uild-to-disable-building-shared-libraries.patch | 245 ---------------------
 package/rocksdb/rocksdb.mk                         |  58 +++--
 3 files changed, 68 insertions(+), 271 deletions(-)

diff --git a/package/rocksdb/0001-Check-for-sys-auxv.h.patch b/package/rocksdb/0001-Check-for-sys-auxv.h.patch
index 2eaabf7c06..eccd27919c 100644
--- a/package/rocksdb/0001-Check-for-sys-auxv.h.patch
+++ b/package/rocksdb/0001-Check-for-sys-auxv.h.patch
@@ -1,4 +1,4 @@
-From 763fee1544c5e5f7dffcee678c98804f80c67249 Mon Sep 17 00:00:00 2001
+From ad4cb0403c58430bf34a15e72f2edcf0f4317977 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 1 Feb 2020 23:38:11 +0100
 Subject: [PATCH] Check for sys/auxv.h
@@ -9,10 +9,11 @@ always available (for example on uclibc)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://github.com/facebook/rocksdb/pull/6359]
 ---
- CMakeLists.txt       | 5 +++++
- util/crc32c.cc       | 4 +++-
- util/crc32c_arm64.cc | 6 ++++++
- 3 files changed, 14 insertions(+), 1 deletion(-)
+ CMakeLists.txt                    |  5 +++++
+ build_tools/build_detect_platform | 14 ++++++++++++++
+ util/crc32c.cc                    |  4 +++-
+ util/crc32c_arm64.cc              |  6 ++++++
+ 4 files changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 017fe8675..32fc5cb30 100644
@@ -30,6 +31,31 @@ index 017fe8675..32fc5cb30 100644
  include_directories(${PROJECT_SOURCE_DIR})
  include_directories(${PROJECT_SOURCE_DIR}/include)
  include_directories(SYSTEM ${PROJECT_SOURCE_DIR}/third-party/gtest-1.8.1/fused-src)
+diff --git a/build_tools/build_detect_platform b/build_tools/build_detect_platform
+index 36a013f6f..2535d8124 100755
+--- a/build_tools/build_detect_platform
++++ b/build_tools/build_detect_platform
+@@ -506,6 +506,20 @@ EOF
+         fi
+     fi
+ 
++    if ! test $ROCKSDB_DISABLE_AUXV_GETAUXVAL; then
++        # Test whether getauxval is supported
++        $CXX $CFLAGS -x c++ - -o /dev/null 2>/dev/null  <<EOF
++          #include <sys/auxv.h>
++          int main() {
++            uint64_t auxv = getauxval(AT_HWCAP);
++            (void)auxv;
++          }
++EOF
++        if [ "$?" = 0 ]; then
++            COMMON_FLAGS="$COMMON_FLAGS -DROCKSDB_AUXV_GETAUXVAL_PRESENT"
++        fi
++    fi
++
+     if ! test $ROCKSDB_DISABLE_ALIGNED_NEW; then
+         # Test whether c++17 aligned-new is supported
+         $CXX $PLATFORM_CXXFLAGS -faligned-new -x c++ - -o /dev/null 2>/dev/null <<EOF
 diff --git a/util/crc32c.cc b/util/crc32c.cc
 index 9e838b830..3063884db 100644
 --- a/util/crc32c.cc
diff --git a/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch b/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch
deleted file mode 100644
index 472b4b02f8..0000000000
--- a/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 2bb5fc1280244255f0a6e8acbcf40d2a87ca739d Mon Sep 17 00:00:00 2001
-From: Adam Simpkins <simpkins@fb.com>
-Date: Tue, 10 Dec 2019 15:19:24 -0800
-Subject: [PATCH] Add an option to the CMake build to disable building shared
- libraries (#6122)
-
-Summary:
-Add an option to explicitly disable building shared versions of the
-RocksDB libraries.  The shared libraries cannot be built in cases where
-some dependencies are only available as static libraries.  This allows
-still building RocksDB in these situations.
-Pull Request resolved: https://github.com/facebook/rocksdb/pull/6122
-
-Differential Revision: D18920740
-
-fbshipit-source-id: d24f66d93c68a1e65635e6e0b663bae62c903bca
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/facebook/rocksdb/commit/2bb5fc1280244255f0a6e8acbcf40d2a87ca739d]
----
- CMakeLists.txt                | 123 ++++++++++++++++++++--------------
- db_stress_tool/CMakeLists.txt |   2 +-
- java/CMakeLists.txt           |   4 +-
- tools/CMakeLists.txt          |   2 +-
- 4 files changed, 75 insertions(+), 56 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 633fe834e9..ce63304470 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -766,7 +766,8 @@ endif()
- 
- set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT_SUFFIX})
- set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
--set(ROCKSDB_IMPORT_LIB ${ROCKSDB_SHARED_LIB})
-+
-+option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libraries" ON)
- 
- option(WITH_LIBRADOS "Build with librados" OFF)
- if(WITH_LIBRADOS)
-@@ -777,40 +778,44 @@ endif()
- 
- if(WIN32)
-   set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
--  set(LIBS ${ROCKSDB_STATIC_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
- else()
-   set(SYSTEM_LIBS ${CMAKE_THREAD_LIBS_INIT})
--  set(LIBS ${ROCKSDB_SHARED_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
--
--  add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
--  target_link_libraries(${ROCKSDB_SHARED_LIB}
--    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
--  set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
--                        LINKER_LANGUAGE CXX
--                        VERSION ${rocksdb_VERSION}
--                        SOVERSION ${rocksdb_VERSION_MAJOR}
--                        CXX_STANDARD 11
--                        OUTPUT_NAME "rocksdb")
- endif()
- 
- add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
- target_link_libraries(${ROCKSDB_STATIC_LIB}
-   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
- 
--if(WIN32)
--  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
--  target_link_libraries(${ROCKSDB_IMPORT_LIB}
-+if(ROCKSDB_BUILD_SHARED)
-+  add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
-+  target_link_libraries(${ROCKSDB_SHARED_LIB}
-     ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
--  set_target_properties(${ROCKSDB_IMPORT_LIB} PROPERTIES
--    COMPILE_DEFINITIONS "ROCKSDB_DLL;ROCKSDB_LIBRARY_EXPORTS")
--  if(MSVC)
--    set_target_properties(${ROCKSDB_STATIC_LIB} PROPERTIES
--      COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_STATIC_LIB}.pdb")
--    set_target_properties(${ROCKSDB_IMPORT_LIB} PROPERTIES
--      COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_IMPORT_LIB}.pdb")
-+
-+  if(WIN32)
-+    set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
-+      COMPILE_DEFINITIONS "ROCKSDB_DLL;ROCKSDB_LIBRARY_EXPORTS")
-+    if(MSVC)
-+      set_target_properties(${ROCKSDB_STATIC_LIB} PROPERTIES
-+        COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_STATIC_LIB}.pdb")
-+      set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
-+        COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_SHARED_LIB}.pdb")
-+    endif()
-+  else()
-+    set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
-+                          LINKER_LANGUAGE CXX
-+                          VERSION ${rocksdb_VERSION}
-+                          SOVERSION ${rocksdb_VERSION_MAJOR}
-+                          CXX_STANDARD 11
-+                          OUTPUT_NAME "rocksdb")
-   endif()
- endif()
- 
-+if(ROCKSDB_BUILD_SHARED AND NOT WIN32)
-+  set(ROCKSDB_LIB ${ROCKSDB_SHARED_LIB})
-+else()
-+  set(ROCKSDB_LIB ${ROCKSDB_STATIC_LIB})
-+endif()
-+
- option(WITH_JNI "build with JNI" OFF)
- if(WITH_JNI OR JNI)
-   message(STATUS "JNI library is enabled")
-@@ -857,15 +862,17 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
-     INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
-   )
- 
--  install(
--    TARGETS ${ROCKSDB_SHARED_LIB}
--    EXPORT RocksDBTargets
--    COMPONENT runtime
--    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
--    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
--    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
--    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
--  )
-+  if(ROCKSDB_BUILD_SHARED)
-+    install(
-+      TARGETS ${ROCKSDB_SHARED_LIB}
-+      EXPORT RocksDBTargets
-+      COMPONENT runtime
-+      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-+      RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
-+      LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-+      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
-+    )
-+  endif()
- 
-   install(
-     EXPORT RocksDBTargets
-@@ -1052,7 +1059,7 @@ if(WITH_TESTS AND CMAKE_BUILD_TYPE STREQUAL "Debug")
-   add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND})
-   set(TESTUTILLIB testutillib${ARTIFACT_SUFFIX})
-   add_library(${TESTUTILLIB} STATIC ${TESTUTIL_SOURCE})
--  target_link_libraries(${TESTUTILLIB} ${LIBS})
-+  target_link_libraries(${TESTUTILLIB} ${ROCKSDB_LIB})
-   if(MSVC)
-     set_target_properties(${TESTUTILLIB} PROPERTIES COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/testutillib${ARTIFACT_SUFFIX}.pdb")
-   endif()
-@@ -1073,30 +1080,42 @@ if(WITH_TESTS AND CMAKE_BUILD_TYPE STREQUAL "Debug")
-         EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
-         OUTPUT_NAME ${exename}${ARTIFACT_SUFFIX}
-         )
--      target_link_libraries(${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} gtest ${LIBS})
-+      target_link_libraries(${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} gtest ${ROCKSDB_LIB})
-       if(NOT "${exename}" MATCHES "db_sanity_test")
-         add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
-         add_dependencies(check ${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX})
-       endif()
-   endforeach(sourcefile ${TEST_EXES})
- 
--  # C executables must link to a shared object
--  set(C_TESTS db/c_test.c)
--  set(C_TEST_EXES ${C_TESTS})
-+  if(WIN32)
-+    # C executables must link to a shared object
-+    if(ROCKSDB_BUILD_SHARED)
-+      set(ROCKSDB_LIB_FOR_C ${ROCKSDB_SHARED_LIB})
-+    else()
-+      set(ROCKSDB_LIB_FOR_C OFF)
-+    endif()
-+  else()
-+    set(ROCKSDB_LIB_FOR_C ${ROCKSDB_LIB})
-+  endif()
- 
--  foreach(sourcefile ${C_TEST_EXES})
--      string(REPLACE ".c" "" exename ${sourcefile})
--      string(REGEX REPLACE "^((.+)/)+" "" exename ${exename})
--      add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile})
--      set_target_properties(${exename}${ARTIFACT_SUFFIX}
--        PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD_RELEASE 1
--        EXCLUDE_FROM_DEFAULT_BUILD_MINRELEASE 1
--        EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
--        )
--      target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_IMPORT_LIB} testutillib${ARTIFACT_SUFFIX})
--      add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
--      add_dependencies(check ${exename}${ARTIFACT_SUFFIX})
--  endforeach(sourcefile ${C_TEST_EXES})
-+  if(ROCKSDB_LIB_FOR_C)
-+    set(C_TESTS db/c_test.c)
-+    set(C_TEST_EXES ${C_TESTS})
-+
-+    foreach(sourcefile ${C_TEST_EXES})
-+        string(REPLACE ".c" "" exename ${sourcefile})
-+        string(REGEX REPLACE "^((.+)/)+" "" exename ${exename})
-+        add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile})
-+        set_target_properties(${exename}${ARTIFACT_SUFFIX}
-+          PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD_RELEASE 1
-+          EXCLUDE_FROM_DEFAULT_BUILD_MINRELEASE 1
-+          EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
-+          )
-+        target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_LIB_FOR_C} testutillib${ARTIFACT_SUFFIX})
-+        add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
-+        add_dependencies(check ${exename}${ARTIFACT_SUFFIX})
-+    endforeach(sourcefile ${C_TEST_EXES})
-+  endif()
- endif()
- 
- option(WITH_BENCHMARK_TOOLS "build with benchmarks" ON)
-@@ -1117,7 +1136,7 @@ if(WITH_BENCHMARK_TOOLS)
-     get_filename_component(exename ${sourcefile} NAME_WE)
-     add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile}
-       $<TARGET_OBJECTS:testharness>)
--    target_link_libraries(${exename}${ARTIFACT_SUFFIX} gtest ${LIBS})
-+    target_link_libraries(${exename}${ARTIFACT_SUFFIX} gtest ${ROCKSDB_LIB})
-   endforeach(sourcefile ${BENCHMARKS})
- 
- option(WITH_TOOLS "build with tools" ON)
-diff --git a/db_stress_tool/CMakeLists.txt b/db_stress_tool/CMakeLists.txt
-index b1f706c161..ac46611ca4 100644
---- a/java/CMakeLists.txt
-+++ b/java/CMakeLists.txt
-@@ -484,13 +484,13 @@ endif()
- set(ROCKSDBJNI_STATIC_LIB rocksdbjni${ARTIFACT_SUFFIX})
- add_library(${ROCKSDBJNI_STATIC_LIB} ${JNI_NATIVE_SOURCES})
- add_dependencies(${ROCKSDBJNI_STATIC_LIB} rocksdbjni_headers)
--target_link_libraries(${ROCKSDBJNI_STATIC_LIB} ${ROCKSDB_STATIC_LIB} ${LIBS})
-+target_link_libraries(${ROCKSDBJNI_STATIC_LIB} ${ROCKSDB_STATIC_LIB} ${ROCKSDB_LIB})
- 
- if(NOT MINGW)
-   set(ROCKSDBJNI_SHARED_LIB rocksdbjni-shared${ARTIFACT_SUFFIX})
-   add_library(${ROCKSDBJNI_SHARED_LIB} SHARED ${JNI_NATIVE_SOURCES})
-   add_dependencies(${ROCKSDBJNI_SHARED_LIB} rocksdbjni_headers)
--  target_link_libraries(${ROCKSDBJNI_SHARED_LIB} ${ROCKSDB_STATIC_LIB} ${LIBS})
-+  target_link_libraries(${ROCKSDBJNI_SHARED_LIB} ${ROCKSDB_STATIC_LIB} ${ROCKSDB_LIB})
- 
-   set_target_properties(
-     ${ROCKSDBJNI_SHARED_LIB}
-diff --git a/tools/CMakeLists.txt b/tools/CMakeLists.txt
-index 1037a716ce..50ee3b1b6e 100644
---- a/tools/CMakeLists.txt
-+++ b/tools/CMakeLists.txt
-@@ -10,7 +10,7 @@ foreach(src ${TOOLS})
-   get_filename_component(exename ${src} NAME_WE)
-   add_executable(${exename}${ARTIFACT_SUFFIX}
-     ${src})
--  target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${LIBS})
-+  target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_LIB})
-   list(APPEND tool_deps ${exename})
- endforeach()
- 
diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index 105e648e3c..e2a72b4dbe 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -10,58 +10,74 @@ ROCKSDB_LICENSE = GPL-2.0 or Apache-2.0
 ROCKSDB_LICENSE_FILES = COPYING LICENSE.Apache LICENSE.leveldb README.md
 ROCKSDB_INSTALL_STAGING = YES
 
-ROCKSDB_CONF_OPTS = \
-	-DPORTABLE=ON \
-	-DWITH_BENCHMARK_TOOLS=OFF \
-	-DWITH_TESTS=OFF \
-	-DWITH_TOOLS=OFF
+ROCKSDB_MAKE_OPTS = PORTABLE=1
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ROCKSDB_DEPENDENCIES += bzip2
-ROCKSDB_CONF_OPTS += -DWITH_BZ2=ON
+ROCKSDB_CONF_OPTS += ROCKSDB_DISABLE_BZ2=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_BZ2=OFF
+ROCKSDB_CONF_OPTS += ROCKSDB_DISABLE_BZ2=1
 endif
 
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 ROCKSDB_DEPENDENCIES += jemalloc
-ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=ON
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_JEMALLOC=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=OFF
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_JEMALLOC=1
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 ROCKSDB_DEPENDENCIES += lz4
-ROCKSDB_CONF_OPTS += -DWITH_LZ4=ON
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_LZ4=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_LZ4=OFF
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_LZ4=1
 endif
 
 ifeq ($(BR2_PACKAGE_SNAPPY),y)
 ROCKSDB_DEPENDENCIES += snappy
-ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=ON
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_SNAPPY=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=OFF
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_SNAPPY=1
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ROCKSDB_DEPENDENCIES += zlib
-ROCKSDB_CONF_OPTS += -DWITH_ZLIB=ON
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZLIB=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_ZLIB=OFF
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZLIB=1
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 ROCKSDB_DEPENDENCIES += zstd
-ROCKSDB_CONF_OPTS += -DWITH_ZSTD=ON
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=0
 else
-ROCKSDB_CONF_OPTS += -DWITH_ZSTD=OFF
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_ZSTD=1
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-ROCKSDB_CONF_OPTS += -DROCKSDB_BUILD_SHARED=OFF
-else
-ROCKSDB_CONF_OPTS += -DROCKSDB_BUILD_SHARED=ON
+ROCKSDB_BUILD_TARGETS += static_lib
+ROCKSDB_INSTALL_TARGETS += install-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+ROCKSDB_BUILD_TARGETS += shared_lib
+ROCKSDB_INSTALL_TARGETS += install-shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ROCKSDB_BUILD_TARGETS += shared_lib static_lib
+ROCKSDB_INSTALL_TARGETS += install-shared install-static
 endif
 
-$(eval $(cmake-package))
+define ROCKSDB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
+		$(ROCKSDB_BUILD_TARGETS)
+endef
+
+define ROCKSDB_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
+		INSTALL_PATH=$(STAGING_DIR) $(ROCKSDB_INSTALL_TARGETS)
+endef
+
+define ROCKSDB_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(ROCKSDB_MAKE_OPTS) -C $(@D) \
+		INSTALL_PATH=$(TARGET_DIR) $(ROCKSDB_INSTALL_TARGETS)
+endef
+
+$(eval $(generic-package))
