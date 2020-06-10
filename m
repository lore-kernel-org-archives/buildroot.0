From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:32:14 +0200
Subject: [Buildroot] [git commit] package/c-periphery: disable tests
Message-ID: <20200610213141.C1AE782964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e044b77cf9cc74a971fe431a05dfb2ff754b85a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable tests, it should be noted that -DBUILD_TESTS=OFF
is already passed by cmake-infrastructure

Fixes:
 - http://autobuild.buildroot.org/results/6bbc4de3f857dcb7ff5e6f9fa1441ba4e0af1338

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-CMakeLists.txt-add-BUILD_TESTS-option.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch b/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch
new file mode 100644
index 0000000000..f932ec6366
--- /dev/null
+++ b/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch
@@ -0,0 +1,61 @@
+From 7b3f137af40f4355404c146af7d9764c961a2fc7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Jun 2020 09:46:10 +0200
+Subject: [PATCH] CMakeLists.txt: add BUILD_TESTS option
+
+Add an option to enable or disable tests. This will allow the user to
+build c-periphery without threads and will avoid the following build
+failure:
+
+[ 68%] Building C object CMakeFiles/test_serial.dir/tests/test_serial.c.o
+/data/buildroot/buildroot-test/instance-0/output/build/c-periphery-2.2.1/tests/test_gpio_sysfs.c:13:10: fatal error: pthread.h: No such file or directory
+ #include <pthread.h>
+          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6bbc4de3f857dcb7ff5e6f9fa1441ba4e0af1338
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/vsergeev/c-periphery/pull/26]
+---
+ CMakeLists.txt | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f442bce..6565557 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,8 @@
+ cmake_minimum_required(VERSION 2.6)
+ project(periphery C)
+ 
++option(BUILD_TESTS "Build tests" ON)
++
+ # Check for Linux kernel headers
+ include(CheckIncludeFiles)
+ CHECK_INCLUDE_FILES(linux/gpio.h HAVE_LINUX_HEADERS)
+@@ -44,11 +46,13 @@ install(TARGETS periphery DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(FILES ${periphery_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
+ install(FILES ${CMAKE_BINARY_DIR}/libperiphery.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+-# Declare tests targets
+-foreach(TEST_SOURCE ${periphery_TESTS})
+-    get_filename_component(TEST_PROGRAM ${TEST_SOURCE} NAME_WE)
+-    add_executable(${TEST_PROGRAM} ${TEST_SOURCE})
+-    target_link_libraries(${TEST_PROGRAM} periphery pthread)
+-    set(TEST_PROGRAMS ${TEST_PROGRAMS} ${TEST_PROGRAM})
+-endforeach()
+-add_custom_target(tests DEPENDS periphery ${TEST_PROGRAMS})
++if(BUILD_TESTS)
++    # Declare tests targets
++    foreach(TEST_SOURCE ${periphery_TESTS})
++        get_filename_component(TEST_PROGRAM ${TEST_SOURCE} NAME_WE)
++        add_executable(${TEST_PROGRAM} ${TEST_SOURCE})
++        target_link_libraries(${TEST_PROGRAM} periphery pthread)
++        set(TEST_PROGRAMS ${TEST_PROGRAMS} ${TEST_PROGRAM})
++    endforeach()
++    add_custom_target(tests DEPENDS periphery ${TEST_PROGRAMS})
++endif()
+-- 
+2.26.2
+
