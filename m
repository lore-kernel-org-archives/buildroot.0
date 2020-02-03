From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:55:57 +0100
Subject: [Buildroot] [git commit] package/rocksdb: new package
Message-ID: <20200203204746.7291788F50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5e7a62b4c64a1811e1c48f867223f4ebd728356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RocksDB library provides a persistent key value store. Keys and
values are arbitrary byte arrays. The keys are ordered within the key
value store according to a user-specified comparator function.

The library is maintained by the Facebook Database Engineering Team, and
is based on LevelDB, by Sanjay Ghemawat and Jeff Dean at Google.

http://rocksdb.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 package/rocksdb/0001-Check-for-sys-auxv.h.patch    |  85 +++++++
 ...uild-to-disable-building-shared-libraries.patch | 245 +++++++++++++++++++++
 package/rocksdb/Config.in                          |  26 +++
 package/rocksdb/rocksdb.hash                       |   8 +
 package/rocksdb/rocksdb.mk                         |  67 ++++++
 7 files changed, 433 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 172ebbf43a..a15133a953 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -884,6 +884,7 @@ F:	package/pcmanfm/
 F:	package/python-backcall/
 F:	package/python-jedi/
 F:	package/python-parso/
+F:	package/rocksdb/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/suricata/
diff --git a/package/Config.in b/package/Config.in
index e7cf60c533..a198ef6c33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1324,6 +1324,7 @@ menu "Database"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
+	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
 	source "package/unixodbc/Config.in"
diff --git a/package/rocksdb/0001-Check-for-sys-auxv.h.patch b/package/rocksdb/0001-Check-for-sys-auxv.h.patch
new file mode 100644
index 0000000000..2eaabf7c06
--- /dev/null
+++ b/package/rocksdb/0001-Check-for-sys-auxv.h.patch
@@ -0,0 +1,85 @@
+From 763fee1544c5e5f7dffcee678c98804f80c67249 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Feb 2020 23:38:11 +0100
+Subject: [PATCH] Check for sys/auxv.h
+
+Check for sys/auxv.h and getauxval before using them as they are not
+always available (for example on uclibc)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/facebook/rocksdb/pull/6359]
+---
+ CMakeLists.txt       | 5 +++++
+ util/crc32c.cc       | 4 +++-
+ util/crc32c_arm64.cc | 6 ++++++
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 017fe8675..32fc5cb30 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -481,6 +481,11 @@ if(HAVE_SCHED_GETCPU)
+   add_definitions(-DROCKSDB_SCHED_GETCPU_PRESENT)
+ endif()
+ 
++check_cxx_symbol_exists(getauxval auvx.h HAVE_AUXV_GETAUXVAL)
++if(HAVE_AUXV_GETAUXVAL)
++  add_definitions(-DROCKSDB_AUXV_GETAUXVAL_PRESENT)
++endif()
++
+ include_directories(${PROJECT_SOURCE_DIR})
+ include_directories(${PROJECT_SOURCE_DIR}/include)
+ include_directories(SYSTEM ${PROJECT_SOURCE_DIR}/third-party/gtest-1.8.1/fused-src)
+diff --git a/util/crc32c.cc b/util/crc32c.cc
+index 9e838b830..3063884db 100644
+--- a/util/crc32c.cc
++++ b/util/crc32c.cc
+@@ -25,7 +25,9 @@
+ #include "util/crc32c_ppc_constants.h"
+ 
+ #if __linux__
++#ifdef ROCKSDB_AUXV_GETAUXVAL_PRESENT
+ #include <sys/auxv.h>
++#endif
+ 
+ #ifndef PPC_FEATURE2_VEC_CRYPTO
+ #define PPC_FEATURE2_VEC_CRYPTO 0x02000000
+@@ -451,7 +453,7 @@ uint32_t ExtendPPCImpl(uint32_t crc, const char *buf, size_t size) {
+ static int arch_ppc_probe(void) {
+   arch_ppc_crc32 = 0;
+ 
+-#if defined(__powerpc64__)
++#if defined(__powerpc64__) && defined(ROCKSDB_AUXV_GETAUXVAL_PRESENT)
+   if (getauxval(AT_HWCAP2) & PPC_FEATURE2_VEC_CRYPTO) arch_ppc_crc32 = 1;
+ #endif /* __powerpc64__ */
+ 
+diff --git a/util/crc32c_arm64.cc b/util/crc32c_arm64.cc
+index 591c623a5..61b2ccaba 100644
+--- a/util/crc32c_arm64.cc
++++ b/util/crc32c_arm64.cc
+@@ -8,7 +8,9 @@
+ #if defined(__linux__) && defined(HAVE_ARM64_CRC)
+ 
+ #include <asm/hwcap.h>
++#ifdef ROCKSDB_AUXV_GETAUXVAL_PRESENT
+ #include <sys/auxv.h>
++#endif
+ #ifndef HWCAP_CRC32
+ #define HWCAP_CRC32 (1 << 7)
+ #endif
+@@ -34,8 +36,12 @@
+ #endif
+ 
+ uint32_t crc32c_runtime_check(void) {
++#ifdef ROCKSDB_AUXV_GETAUXVAL_PRESENT
+   uint64_t auxv = getauxval(AT_HWCAP);
+   return (auxv & HWCAP_CRC32) != 0;
++#else
++  return 0;
++#endif
+ }
+ 
+ uint32_t crc32c_arm64(uint32_t crc, unsigned char const *data,
+-- 
+2.24.1
+
diff --git a/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch b/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch
new file mode 100644
index 0000000000..472b4b02f8
--- /dev/null
+++ b/package/rocksdb/0002-Add-an-option-to-the-CMake-build-to-disable-building-shared-libraries.patch
@@ -0,0 +1,245 @@
+From 2bb5fc1280244255f0a6e8acbcf40d2a87ca739d Mon Sep 17 00:00:00 2001
+From: Adam Simpkins <simpkins@fb.com>
+Date: Tue, 10 Dec 2019 15:19:24 -0800
+Subject: [PATCH] Add an option to the CMake build to disable building shared
+ libraries (#6122)
+
+Summary:
+Add an option to explicitly disable building shared versions of the
+RocksDB libraries.  The shared libraries cannot be built in cases where
+some dependencies are only available as static libraries.  This allows
+still building RocksDB in these situations.
+Pull Request resolved: https://github.com/facebook/rocksdb/pull/6122
+
+Differential Revision: D18920740
+
+fbshipit-source-id: d24f66d93c68a1e65635e6e0b663bae62c903bca
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/facebook/rocksdb/commit/2bb5fc1280244255f0a6e8acbcf40d2a87ca739d]
+---
+ CMakeLists.txt                | 123 ++++++++++++++++++++--------------
+ db_stress_tool/CMakeLists.txt |   2 +-
+ java/CMakeLists.txt           |   4 +-
+ tools/CMakeLists.txt          |   2 +-
+ 4 files changed, 75 insertions(+), 56 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 633fe834e9..ce63304470 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -766,7 +766,8 @@ endif()
+ 
+ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT_SUFFIX})
+ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
+-set(ROCKSDB_IMPORT_LIB ${ROCKSDB_SHARED_LIB})
++
++option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libraries" ON)
+ 
+ option(WITH_LIBRADOS "Build with librados" OFF)
+ if(WITH_LIBRADOS)
+@@ -777,40 +778,44 @@ endif()
+ 
+ if(WIN32)
+   set(SYSTEM_LIBS ${SYSTEM_LIBS} shlwapi.lib rpcrt4.lib)
+-  set(LIBS ${ROCKSDB_STATIC_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+ else()
+   set(SYSTEM_LIBS ${CMAKE_THREAD_LIBS_INIT})
+-  set(LIBS ${ROCKSDB_SHARED_LIB} ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+-
+-  add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
+-  target_link_libraries(${ROCKSDB_SHARED_LIB}
+-    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+-  set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
+-                        LINKER_LANGUAGE CXX
+-                        VERSION ${rocksdb_VERSION}
+-                        SOVERSION ${rocksdb_VERSION_MAJOR}
+-                        CXX_STANDARD 11
+-                        OUTPUT_NAME "rocksdb")
+ endif()
+ 
+ add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
+ target_link_libraries(${ROCKSDB_STATIC_LIB}
+   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+ 
+-if(WIN32)
+-  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
+-  target_link_libraries(${ROCKSDB_IMPORT_LIB}
++if(ROCKSDB_BUILD_SHARED)
++  add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES})
++  target_link_libraries(${ROCKSDB_SHARED_LIB}
+     ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
+-  set_target_properties(${ROCKSDB_IMPORT_LIB} PROPERTIES
+-    COMPILE_DEFINITIONS "ROCKSDB_DLL;ROCKSDB_LIBRARY_EXPORTS")
+-  if(MSVC)
+-    set_target_properties(${ROCKSDB_STATIC_LIB} PROPERTIES
+-      COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_STATIC_LIB}.pdb")
+-    set_target_properties(${ROCKSDB_IMPORT_LIB} PROPERTIES
+-      COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_IMPORT_LIB}.pdb")
++
++  if(WIN32)
++    set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
++      COMPILE_DEFINITIONS "ROCKSDB_DLL;ROCKSDB_LIBRARY_EXPORTS")
++    if(MSVC)
++      set_target_properties(${ROCKSDB_STATIC_LIB} PROPERTIES
++        COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_STATIC_LIB}.pdb")
++      set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
++        COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/${ROCKSDB_SHARED_LIB}.pdb")
++    endif()
++  else()
++    set_target_properties(${ROCKSDB_SHARED_LIB} PROPERTIES
++                          LINKER_LANGUAGE CXX
++                          VERSION ${rocksdb_VERSION}
++                          SOVERSION ${rocksdb_VERSION_MAJOR}
++                          CXX_STANDARD 11
++                          OUTPUT_NAME "rocksdb")
+   endif()
+ endif()
+ 
++if(ROCKSDB_BUILD_SHARED AND NOT WIN32)
++  set(ROCKSDB_LIB ${ROCKSDB_SHARED_LIB})
++else()
++  set(ROCKSDB_LIB ${ROCKSDB_STATIC_LIB})
++endif()
++
+ option(WITH_JNI "build with JNI" OFF)
+ if(WITH_JNI OR JNI)
+   message(STATUS "JNI library is enabled")
+@@ -857,15 +862,17 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
+     INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+   )
+ 
+-  install(
+-    TARGETS ${ROCKSDB_SHARED_LIB}
+-    EXPORT RocksDBTargets
+-    COMPONENT runtime
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+-    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
+-    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+-  )
++  if(ROCKSDB_BUILD_SHARED)
++    install(
++      TARGETS ${ROCKSDB_SHARED_LIB}
++      EXPORT RocksDBTargets
++      COMPONENT runtime
++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++      RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++      LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
++    )
++  endif()
+ 
+   install(
+     EXPORT RocksDBTargets
+@@ -1052,7 +1059,7 @@ if(WITH_TESTS AND CMAKE_BUILD_TYPE STREQUAL "Debug")
+   add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND})
+   set(TESTUTILLIB testutillib${ARTIFACT_SUFFIX})
+   add_library(${TESTUTILLIB} STATIC ${TESTUTIL_SOURCE})
+-  target_link_libraries(${TESTUTILLIB} ${LIBS})
++  target_link_libraries(${TESTUTILLIB} ${ROCKSDB_LIB})
+   if(MSVC)
+     set_target_properties(${TESTUTILLIB} PROPERTIES COMPILE_FLAGS "/Fd${CMAKE_CFG_INTDIR}/testutillib${ARTIFACT_SUFFIX}.pdb")
+   endif()
+@@ -1073,30 +1080,42 @@ if(WITH_TESTS AND CMAKE_BUILD_TYPE STREQUAL "Debug")
+         EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
+         OUTPUT_NAME ${exename}${ARTIFACT_SUFFIX}
+         )
+-      target_link_libraries(${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} gtest ${LIBS})
++      target_link_libraries(${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} gtest ${ROCKSDB_LIB})
+       if(NOT "${exename}" MATCHES "db_sanity_test")
+         add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
+         add_dependencies(check ${CMAKE_PROJECT_NAME}_${exename}${ARTIFACT_SUFFIX})
+       endif()
+   endforeach(sourcefile ${TEST_EXES})
+ 
+-  # C executables must link to a shared object
+-  set(C_TESTS db/c_test.c)
+-  set(C_TEST_EXES ${C_TESTS})
++  if(WIN32)
++    # C executables must link to a shared object
++    if(ROCKSDB_BUILD_SHARED)
++      set(ROCKSDB_LIB_FOR_C ${ROCKSDB_SHARED_LIB})
++    else()
++      set(ROCKSDB_LIB_FOR_C OFF)
++    endif()
++  else()
++    set(ROCKSDB_LIB_FOR_C ${ROCKSDB_LIB})
++  endif()
+ 
+-  foreach(sourcefile ${C_TEST_EXES})
+-      string(REPLACE ".c" "" exename ${sourcefile})
+-      string(REGEX REPLACE "^((.+)/)+" "" exename ${exename})
+-      add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile})
+-      set_target_properties(${exename}${ARTIFACT_SUFFIX}
+-        PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD_RELEASE 1
+-        EXCLUDE_FROM_DEFAULT_BUILD_MINRELEASE 1
+-        EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
+-        )
+-      target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_IMPORT_LIB} testutillib${ARTIFACT_SUFFIX})
+-      add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
+-      add_dependencies(check ${exename}${ARTIFACT_SUFFIX})
+-  endforeach(sourcefile ${C_TEST_EXES})
++  if(ROCKSDB_LIB_FOR_C)
++    set(C_TESTS db/c_test.c)
++    set(C_TEST_EXES ${C_TESTS})
++
++    foreach(sourcefile ${C_TEST_EXES})
++        string(REPLACE ".c" "" exename ${sourcefile})
++        string(REGEX REPLACE "^((.+)/)+" "" exename ${exename})
++        add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile})
++        set_target_properties(${exename}${ARTIFACT_SUFFIX}
++          PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD_RELEASE 1
++          EXCLUDE_FROM_DEFAULT_BUILD_MINRELEASE 1
++          EXCLUDE_FROM_DEFAULT_BUILD_RELWITHDEBINFO 1
++          )
++        target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_LIB_FOR_C} testutillib${ARTIFACT_SUFFIX})
++        add_test(NAME ${exename} COMMAND ${exename}${ARTIFACT_SUFFIX})
++        add_dependencies(check ${exename}${ARTIFACT_SUFFIX})
++    endforeach(sourcefile ${C_TEST_EXES})
++  endif()
+ endif()
+ 
+ option(WITH_BENCHMARK_TOOLS "build with benchmarks" ON)
+@@ -1117,7 +1136,7 @@ if(WITH_BENCHMARK_TOOLS)
+     get_filename_component(exename ${sourcefile} NAME_WE)
+     add_executable(${exename}${ARTIFACT_SUFFIX} ${sourcefile}
+       $<TARGET_OBJECTS:testharness>)
+-    target_link_libraries(${exename}${ARTIFACT_SUFFIX} gtest ${LIBS})
++    target_link_libraries(${exename}${ARTIFACT_SUFFIX} gtest ${ROCKSDB_LIB})
+   endforeach(sourcefile ${BENCHMARKS})
+ 
+ option(WITH_TOOLS "build with tools" ON)
+diff --git a/db_stress_tool/CMakeLists.txt b/db_stress_tool/CMakeLists.txt
+index b1f706c161..ac46611ca4 100644
+--- a/java/CMakeLists.txt
++++ b/java/CMakeLists.txt
+@@ -484,13 +484,13 @@ endif()
+ set(ROCKSDBJNI_STATIC_LIB rocksdbjni${ARTIFACT_SUFFIX})
+ add_library(${ROCKSDBJNI_STATIC_LIB} ${JNI_NATIVE_SOURCES})
+ add_dependencies(${ROCKSDBJNI_STATIC_LIB} rocksdbjni_headers)
+-target_link_libraries(${ROCKSDBJNI_STATIC_LIB} ${ROCKSDB_STATIC_LIB} ${LIBS})
++target_link_libraries(${ROCKSDBJNI_STATIC_LIB} ${ROCKSDB_STATIC_LIB} ${ROCKSDB_LIB})
+ 
+ if(NOT MINGW)
+   set(ROCKSDBJNI_SHARED_LIB rocksdbjni-shared${ARTIFACT_SUFFIX})
+   add_library(${ROCKSDBJNI_SHARED_LIB} SHARED ${JNI_NATIVE_SOURCES})
+   add_dependencies(${ROCKSDBJNI_SHARED_LIB} rocksdbjni_headers)
+-  target_link_libraries(${ROCKSDBJNI_SHARED_LIB} ${ROCKSDB_STATIC_LIB} ${LIBS})
++  target_link_libraries(${ROCKSDBJNI_SHARED_LIB} ${ROCKSDB_STATIC_LIB} ${ROCKSDB_LIB})
+ 
+   set_target_properties(
+     ${ROCKSDBJNI_SHARED_LIB}
+diff --git a/tools/CMakeLists.txt b/tools/CMakeLists.txt
+index 1037a716ce..50ee3b1b6e 100644
+--- a/tools/CMakeLists.txt
++++ b/tools/CMakeLists.txt
+@@ -10,7 +10,7 @@ foreach(src ${TOOLS})
+   get_filename_component(exename ${src} NAME_WE)
+   add_executable(${exename}${ARTIFACT_SUFFIX}
+     ${src})
+-  target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${LIBS})
++  target_link_libraries(${exename}${ARTIFACT_SUFFIX} ${ROCKSDB_LIB})
+   list(APPEND tool_deps ${exename})
+ endforeach()
+ 
diff --git a/package/rocksdb/Config.in b/package/rocksdb/Config.in
new file mode 100644
index 0000000000..c55170c1d2
--- /dev/null
+++ b/package/rocksdb/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_ROCKSDB
+	bool "rocksdb"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	help
+	  The RocksDB library provides a persistent key value store.
+	  Keys and values are arbitrary byte arrays. The keys are
+	  ordered within the key value store according to a
+	  user-specified comparator function.
+
+	  The library is maintained by the Facebook Database Engineering
+	  Team, and is based on LevelDB, by Sanjay Ghemawat and Jeff
+	  Dean at Google.
+
+	  http://rocksdb.org
+
+comment "rocksdb needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "rocksdb needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/rocksdb/rocksdb.hash b/package/rocksdb/rocksdb.hash
new file mode 100644
index 0000000000..2e4071298e
--- /dev/null
+++ b/package/rocksdb/rocksdb.hash
@@ -0,0 +1,8 @@
+# Locally computed:
+sha256	feab859ee355fbe7beffd7085904b63f560417f450f83cc34310e6dadff936f6	rocksdb-6.6.4.tar.gz
+
+# Hash for license files:
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE.Apache
+sha256	b568f1f37a5a1d37a3e981e7c8b7fc4856ca33b2ca0a45bc8e847aaaf7afe485	LICENSE.leveldb
+sha256	112d88749baec5ddecba47057216465e91e22352aac7677c50bd237a27614083	README.md
diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
new file mode 100644
index 0000000000..105e648e3c
--- /dev/null
+++ b/package/rocksdb/rocksdb.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# rocksdb
+#
+################################################################################
+
+ROCKSDB_VERSION = 6.6.4
+ROCKSDB_SITE = $(call github,facebook,rocksdb,v$(ROCKSDB_VERSION))
+ROCKSDB_LICENSE = GPL-2.0 or Apache-2.0
+ROCKSDB_LICENSE_FILES = COPYING LICENSE.Apache LICENSE.leveldb README.md
+ROCKSDB_INSTALL_STAGING = YES
+
+ROCKSDB_CONF_OPTS = \
+	-DPORTABLE=ON \
+	-DWITH_BENCHMARK_TOOLS=OFF \
+	-DWITH_TESTS=OFF \
+	-DWITH_TOOLS=OFF
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+ROCKSDB_DEPENDENCIES += bzip2
+ROCKSDB_CONF_OPTS += -DWITH_BZ2=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_BZ2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+ROCKSDB_DEPENDENCIES += jemalloc
+ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_JEMALLOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+ROCKSDB_DEPENDENCIES += lz4
+ROCKSDB_CONF_OPTS += -DWITH_LZ4=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_LZ4=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SNAPPY),y)
+ROCKSDB_DEPENDENCIES += snappy
+ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_SNAPPY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ROCKSDB_DEPENDENCIES += zlib
+ROCKSDB_CONF_OPTS += -DWITH_ZLIB=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_ZLIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+ROCKSDB_DEPENDENCIES += zstd
+ROCKSDB_CONF_OPTS += -DWITH_ZSTD=ON
+else
+ROCKSDB_CONF_OPTS += -DWITH_ZSTD=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+ROCKSDB_CONF_OPTS += -DROCKSDB_BUILD_SHARED=OFF
+else
+ROCKSDB_CONF_OPTS += -DROCKSDB_BUILD_SHARED=ON
+endif
+
+$(eval $(cmake-package))
