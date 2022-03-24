Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02DDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C16C61028;
	Thu, 24 Mar 2022 20:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VSZMg5l1eXv; Thu, 24 Mar 2022 20:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD2B66101E;
	Thu, 24 Mar 2022 20:43:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5561C1162
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E03460BAD
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMFcCrl1aljo for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:43:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC79160B5E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:43:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AFA2D82AFE; Thu, 24 Mar 2022 20:34:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:10:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26a16ed9d84cbd934fbad4d6042dfd10dc8063b4
X-Git-Newrev: 2f3218567953185008ec862f814bebecb9d6ed82
X-Patchwork-Hint: ignore
Message-Id: <20220324203416.AFA2D82AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: bump version & switch to
 meson build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2408161509413376952=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2408161509413376952==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2f3218567953185008ec862f814bebecb9d6ed82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While upstream pistache has not yet released a stable 'tag'
a lot has changed since June 2020:

* project has moved to meson build system, cmake builds
  do not install headers.
* patches in buildroot are no longer required
* project-implemented Pistache::Optional was replaced by
  use of std::optional. This is only available in C++17
* dependency to rapidjson has been introduced

Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...s.txt-add-C-language-to-project-statement.patch | 70 ----------------
 ...-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch | 95 ----------------------
 ...include-pistache-typeid.h-include-cstddef.patch | 38 ---------
 package/pistache/Config.in                         |  9 +-
 package/pistache/pistache.hash                     |  2 +-
 package/pistache/pistache.mk                       | 10 ++-
 6 files changed, 12 insertions(+), 212 deletions(-)

diff --git a/package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch b/package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch
deleted file mode 100644
index c393a48d0d..0000000000
--- a/package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a50fc9bde098e4e89584a5da9f94f620c11b6733 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 16 Aug 2020 12:31:46 +0200
-Subject: [PATCH] CMakeLists.txt: add C language to project statement
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This will fix the detection of atomic:
-
--- Performing Test HAVE_CXX_ATOMICS64_WITHOUT_LIB
--- Performing Test HAVE_CXX_ATOMICS64_WITHOUT_LIB - Failed
--- Looking for __atomic_load_8 in atomic
--- Looking for __atomic_load_8 in atomic - not found
-CMake Error at CMakeModules/CheckAtomic.cmake:76 (message):
-  Host compiler appears to require libatomic for 64-bit operations, but
-  cannot find it.
-Call Stack (most recent call first):
-  CMakeLists.txt:19 (include)
-
-Indeed if C language is not enabled, the test will be run with the C++
-compiler resulting in the following error:
-
-Building CXX object CMakeFiles/cmTC_fad22.dir/CheckFunctionExists.cxx.o
-/tmp/instance-0/output-1/host/bin/mipsel-linux-g++ --sysroot=/tmp/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -D_FORTIFY_SOURCE=1 -Wall -Wconversion -pedantic -Wextra -Wno-missing-field-initializers -DCHECK_FUNCTION_EXISTS=__atomic_load_8  -DNDEBUG   -o CMakeFiles/cmTC_fad22.dir/CheckFunctionExists.cxx.o -c /tmp/instance-0/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/CMakeFiles/CheckLibraryExists/CheckFunctionExists.cxx
-<command-line>: error: new declaration 'char __atomic_load_8()' ambiguates built-in declaration 'long long unsigned int __atomic_load_8(const volatile void*, int)' [-fpermissive]
-/tmp/instance-0/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/CMakeFiles/CheckLibraryExists/CheckFunctionExists.cxx:7:3: note: in expansion of macro 'CHECK_FUNCTION_EXISTS'
-   CHECK_FUNCTION_EXISTS(void);
-   ^~~~~~~~~~~~~~~~~~~~~
-/tmp/instance-0/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/CMakeFiles/CheckLibraryExists/CheckFunctionExists.cxx: In function 'int main(int, char**)':
-/tmp/instance-0/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/CMakeFiles/CheckLibraryExists/CheckFunctionExists.cxx:17:25: error: too few arguments to function 'long long unsigned int __atomic_load_8(const volatile void*, int)'
-   CHECK_FUNCTION_EXISTS();
-                         ^
-
-whereas with a C compiler, we'll get:
-
-Building C object CMakeFiles/cmTC_4b0f4.dir/CheckFunctionExists.c.o
-/home/fabrice/buildroot/output/host/bin/riscv32-linux-gcc --sysroot=/home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -DCHECK_FUNCTION_EXISTS=__atomic_load_8  -DNDEBUG   -o CMakeFiles/cmTC_4b0f4.dir/CheckFunctionExists.c.o   -c /usr/share/cmake-3.16/Modules/CheckFunctionExists.c
-<command-line>: warning: conflicting types for built-in function ‘__atomic_load_8’ [-Wbuiltin-declaration-mismatch]
-/usr/share/cmake-3.16/Modules/CheckFunctionExists.c:7:3: note: in expansion of macro ‘CHECK_FUNCTION_EXISTS’
-   CHECK_FUNCTION_EXISTS(void);
-   ^~~~~~~~~~~~~~~~~~~~~
-Linking C executable cmTC_4b0f4
-/usr/bin/cmake -E cmake_link_script CMakeFiles/cmTC_4b0f4.dir/link.txt --verbose=1
-/home/fabrice/buildroot/output/host/bin/riscv32-linux-gcc --sysroot=/home/fabrice/buildroot/output/host/riscv32-buildroot-linux-gnu/sysroot -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -DCHECK_FUNCTION_EXISTS=__atomic_load_8  -DNDEBUG    CMakeFiles/cmTC_4b0f4.dir/CheckFunctionExists.c.o  -o cmTC_4b0f4  -latomic
-
-Fixes:
- - http://autobuild.buildroot.org/results/2bf06c6a9e55b449ec5875cf9415a9e55b2065d6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index edc73c5..0286647 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -9,7 +9,7 @@ set(CMAKE_CXX_STANDARD_REQUIRED ON)
- set(CMAKE_CXX_EXTENSIONS OFF)
- 
- project (pistache
--    LANGUAGES CXX)
-+    LANGUAGES C CXX)
- 
- include(GNUInstallDirs)
- 
--- 
-2.27.0
-
diff --git a/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch b/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
deleted file mode 100644
index 09f59b11ec..0000000000
--- a/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 45824f58b10575d8d88d4bce934aedee821a6df0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 15 Oct 2020 22:26:55 +0200
-Subject: [PATCH] CMakeLists.txt: respect BUILD_SHARED_LIBS
-
-Don't build and install pistache_shared if the standard cmake
-BUILD_SHARED_LIBS is set to OFF
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Backport from upstream:
-  https://github.com/oktal/pistache/commit/c04166ca9e6420a8fbc93fef4055ee2eccdcebe4
-]
----
- src/CMakeLists.txt | 43 +++++++++++++++++++++++++------------------
- 1 file changed, 25 insertions(+), 18 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 6521b20..c5b049f 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -26,31 +26,36 @@ set(include_install_dir ${CMAKE_INSTALL_INCLUDEDIR})
- set(lib_install_dir ${CMAKE_INSTALL_LIBDIR})
- set(bin_install_dir ${CMAKE_INSTALL_BINDIR})
- 
--add_library(pistache_shared SHARED $<TARGET_OBJECTS:pistache>)
--add_library(pistache_static STATIC $<TARGET_OBJECTS:pistache>)
-+if (BUILD_SHARED_LIBS)
-+    add_library(pistache_shared SHARED $<TARGET_OBJECTS:pistache>)
-+    target_link_libraries(pistache_shared PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
-+    target_include_directories(pistache_shared INTERFACE ${PISTACHE_INCLUDE})
-+endif ()
- 
--target_link_libraries(pistache_shared PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
-+add_library(pistache_static STATIC $<TARGET_OBJECTS:pistache>)
- target_link_libraries(pistache_static PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
--
--target_include_directories(pistache_shared INTERFACE ${PISTACHE_INCLUDE})
- target_include_directories(pistache_static INTERFACE ${PISTACHE_INCLUDE})
- 
- if (PISTACHE_USE_SSL)
-     target_compile_definitions(pistache PUBLIC PISTACHE_USE_SSL)
--    target_compile_definitions(pistache_shared PUBLIC PISTACHE_USE_SSL)
-     target_compile_definitions(pistache_static PUBLIC PISTACHE_USE_SSL)
- 
-     target_include_directories(pistache PRIVATE ${OPENSSL_INCLUDE_DIR})
--    target_link_libraries(pistache_shared PUBLIC OpenSSL::SSL OpenSSL::Crypto)
-     target_link_libraries(pistache_static PUBLIC OpenSSL::SSL OpenSSL::Crypto)
-+    if (BUILD_SHARED_LIBS)
-+        target_compile_definitions(pistache_shared PUBLIC PISTACHE_USE_SSL)
-+        target_link_libraries(pistache_shared PUBLIC OpenSSL::SSL OpenSSL::Crypto)
-+    endif ()
- endif ()
- 
- set(Pistache_OUTPUT_NAME "pistache")
--set_target_properties(pistache_shared PROPERTIES
--    OUTPUT_NAME ${Pistache_OUTPUT_NAME}
--    VERSION ${version}
--    SOVERSION ${VERSION_MAJOR}
--)
-+if (BUILD_SHARED_LIBS)
-+    set_target_properties(pistache_shared PROPERTIES
-+        OUTPUT_NAME ${Pistache_OUTPUT_NAME}
-+        VERSION ${version}
-+        SOVERSION ${VERSION_MAJOR}
-+    )
-+endif ()
- 
- set_target_properties(pistache_static PROPERTIES 
-     OUTPUT_NAME ${Pistache_OUTPUT_NAME}
-@@ -60,13 +65,15 @@ if (PISTACHE_INSTALL)
-     set(Pistache_CONFIG_FILE "PistacheConfig.cmake")
-     set(Pistache_CONFIG_VERSION_FILE "PistacheConfigVersion.cmake")
- 
--    install(
--      TARGETS pistache_shared
--      EXPORT PistacheTargets
--      ARCHIVE DESTINATION ${lib_install_dir}
--      LIBRARY DESTINATION ${lib_install_dir}
--      RUNTIME DESTINATION ${bin_install_dir}
--      INCLUDES DESTINATION ${include_install_dir})
-+    if (BUILD_SHARED_LIBS)
-+        install(
-+          TARGETS pistache_shared
-+          EXPORT PistacheTargets
-+          ARCHIVE DESTINATION ${lib_install_dir}
-+          LIBRARY DESTINATION ${lib_install_dir}
-+          RUNTIME DESTINATION ${bin_install_dir}
-+          INCLUDES DESTINATION ${include_install_dir})
-+    endif()
- 
-     install(
-       DIRECTORY "${PROJECT_SOURCE_DIR}/include/pistache"
--- 
-2.28.0
-
diff --git a/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
deleted file mode 100644
index be06ca760a..0000000000
--- a/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 37291201ed948e9d65993a717c59bb14f4187e13 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 5 Aug 2021 19:02:56 +0200
-Subject: [PATCH] include/pistache/typeid.h: include cstddef
-
-Include cstddef to avoid the following build failure with gcc 11:
-
-In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
-                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
-                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
-/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
-   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
-      |            ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/pistacheio/pistache/pull/965]
----
- include/pistache/typeid.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/pistache/typeid.h b/include/pistache/typeid.h
-index 10353ca..893e7c1 100644
---- a/include/pistache/typeid.h
-+++ b/include/pistache/typeid.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstddef>
- #include <functional>
- 
- namespace Pistache
--- 
-2.30.2
-
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 96aed5210a..806c27077a 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -1,22 +1,23 @@
 config BR2_PACKAGE_PISTACHE
 	bool "pistache"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17, std::optional
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_RAPIDJSON
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
-	  for C++. It is entirely written in pure C++14 and provides
+	  for C++. It is entirely written in pure C++17 and provides
 	  a clear and pleasant API.
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar, not binutils bug 27597"
+comment "pistache needs a glibc toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   BR2_TOOLCHAIN_USES_UCLIBC || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
 		   !BR2_USE_WCHAR || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
index 5079387eb7..9a2cd1d1f9 100644
--- a/package/pistache/pistache.hash
+++ b/package/pistache/pistache.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  70aeef5f5a4603cb2ceb20a284e3239f5da520e68f39dcb572c9f21473ac0b6d  pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d.tar.gz
+sha256  f2b3e8b2581cfed5e036d1b97a9b97dc7022b3ddaab69c4691238faff3199bc1  pistache-3ec9d7c4f8b828fdd391550fff81b01e72dd6269.tar.gz
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index 4d6bd283ea..65d9b2412c 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -4,18 +4,20 @@
 #
 ################################################################################
 
-PISTACHE_VERSION = f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d
+PISTACHE_VERSION = 3ec9d7c4f8b828fdd391550fff81b01e72dd6269
 PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
 PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
+PISTACHE_DEPENDENCIES += rapidjson
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
-PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=true
+PISTACHE_CONF_OPTS += -DPISTACHE_ENABLE_NETWORK_TESTS=false
 else
-PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=false
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))

--===============2408161509413376952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2408161509413376952==--
