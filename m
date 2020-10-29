From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:43:37 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/pistache: fix
 static build
Message-ID: <20201029153517.3809D86437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c478edd53bc75a4bf68227b82d4a36564b8f5280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Don't build shared library with BR2_SHARED_LIBS=OFF to avoid the
following build failure:

[100%] Linking CXX shared library libpistache.so
make[3]: Leaving directory `/home/buildroot/autobuild/run/instance-1/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d'
[100%] Built target pistache_static
/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object

Fixes:
 - http://autobuild.buildroot.org/results/6cc/6cc76b3e76defa9b8154568a6ebcd6bf4cadd334/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: update upstream status now they merged it]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 30e7f999af3aab9b0299836449cbfa9d3212daae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch b/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
new file mode 100644
index 0000000000..09f59b11ec
--- /dev/null
+++ b/package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
@@ -0,0 +1,95 @@
+From 45824f58b10575d8d88d4bce934aedee821a6df0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Oct 2020 22:26:55 +0200
+Subject: [PATCH] CMakeLists.txt: respect BUILD_SHARED_LIBS
+
+Don't build and install pistache_shared if the standard cmake
+BUILD_SHARED_LIBS is set to OFF
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Backport from upstream:
+  https://github.com/oktal/pistache/commit/c04166ca9e6420a8fbc93fef4055ee2eccdcebe4
+]
+---
+ src/CMakeLists.txt | 43 +++++++++++++++++++++++++------------------
+ 1 file changed, 25 insertions(+), 18 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 6521b20..c5b049f 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -26,31 +26,36 @@ set(include_install_dir ${CMAKE_INSTALL_INCLUDEDIR})
+ set(lib_install_dir ${CMAKE_INSTALL_LIBDIR})
+ set(bin_install_dir ${CMAKE_INSTALL_BINDIR})
+ 
+-add_library(pistache_shared SHARED $<TARGET_OBJECTS:pistache>)
+-add_library(pistache_static STATIC $<TARGET_OBJECTS:pistache>)
++if (BUILD_SHARED_LIBS)
++    add_library(pistache_shared SHARED $<TARGET_OBJECTS:pistache>)
++    target_link_libraries(pistache_shared PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
++    target_include_directories(pistache_shared INTERFACE ${PISTACHE_INCLUDE})
++endif ()
+ 
+-target_link_libraries(pistache_shared PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
++add_library(pistache_static STATIC $<TARGET_OBJECTS:pistache>)
+ target_link_libraries(pistache_static PRIVATE Threads::Threads ${CMAKE_REQUIRED_LIBRARIES})
+-
+-target_include_directories(pistache_shared INTERFACE ${PISTACHE_INCLUDE})
+ target_include_directories(pistache_static INTERFACE ${PISTACHE_INCLUDE})
+ 
+ if (PISTACHE_USE_SSL)
+     target_compile_definitions(pistache PUBLIC PISTACHE_USE_SSL)
+-    target_compile_definitions(pistache_shared PUBLIC PISTACHE_USE_SSL)
+     target_compile_definitions(pistache_static PUBLIC PISTACHE_USE_SSL)
+ 
+     target_include_directories(pistache PRIVATE ${OPENSSL_INCLUDE_DIR})
+-    target_link_libraries(pistache_shared PUBLIC OpenSSL::SSL OpenSSL::Crypto)
+     target_link_libraries(pistache_static PUBLIC OpenSSL::SSL OpenSSL::Crypto)
++    if (BUILD_SHARED_LIBS)
++        target_compile_definitions(pistache_shared PUBLIC PISTACHE_USE_SSL)
++        target_link_libraries(pistache_shared PUBLIC OpenSSL::SSL OpenSSL::Crypto)
++    endif ()
+ endif ()
+ 
+ set(Pistache_OUTPUT_NAME "pistache")
+-set_target_properties(pistache_shared PROPERTIES
+-    OUTPUT_NAME ${Pistache_OUTPUT_NAME}
+-    VERSION ${version}
+-    SOVERSION ${VERSION_MAJOR}
+-)
++if (BUILD_SHARED_LIBS)
++    set_target_properties(pistache_shared PROPERTIES
++        OUTPUT_NAME ${Pistache_OUTPUT_NAME}
++        VERSION ${version}
++        SOVERSION ${VERSION_MAJOR}
++    )
++endif ()
+ 
+ set_target_properties(pistache_static PROPERTIES 
+     OUTPUT_NAME ${Pistache_OUTPUT_NAME}
+@@ -60,13 +65,15 @@ if (PISTACHE_INSTALL)
+     set(Pistache_CONFIG_FILE "PistacheConfig.cmake")
+     set(Pistache_CONFIG_VERSION_FILE "PistacheConfigVersion.cmake")
+ 
+-    install(
+-      TARGETS pistache_shared
+-      EXPORT PistacheTargets
+-      ARCHIVE DESTINATION ${lib_install_dir}
+-      LIBRARY DESTINATION ${lib_install_dir}
+-      RUNTIME DESTINATION ${bin_install_dir}
+-      INCLUDES DESTINATION ${include_install_dir})
++    if (BUILD_SHARED_LIBS)
++        install(
++          TARGETS pistache_shared
++          EXPORT PistacheTargets
++          ARCHIVE DESTINATION ${lib_install_dir}
++          LIBRARY DESTINATION ${lib_install_dir}
++          RUNTIME DESTINATION ${bin_install_dir}
++          INCLUDES DESTINATION ${include_install_dir})
++    endif()
+ 
+     install(
+       DIRECTORY "${PROJECT_SOURCE_DIR}/include/pistache"
+-- 
+2.28.0
+
