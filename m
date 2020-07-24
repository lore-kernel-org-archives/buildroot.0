From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 24 Jul 2020 06:56:04 -0500
Subject: [Buildroot] [PATCH] package/c-periphery: bump to v2.2.2
Message-ID: <20200724115604.7741-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

c-periphery now supports building on older kernels before 4.8 as there
are now checks for the new kernel cdev gpio interface.

Also updated hash file to two space format.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 ...MakeLists.txt-add-BUILD_TESTS-option.patch | 61 -------------------
 package/c-periphery/Config.in                 |  4 --
 package/c-periphery/c-periphery.hash          |  4 +-
 package/c-periphery/c-periphery.mk            |  2 +-
 4 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch

diff --git a/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch b/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch
deleted file mode 100644
index f932ec6366..0000000000
--- a/package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 7b3f137af40f4355404c146af7d9764c961a2fc7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Jun 2020 09:46:10 +0200
-Subject: [PATCH] CMakeLists.txt: add BUILD_TESTS option
-
-Add an option to enable or disable tests. This will allow the user to
-build c-periphery without threads and will avoid the following build
-failure:
-
-[ 68%] Building C object CMakeFiles/test_serial.dir/tests/test_serial.c.o
-/data/buildroot/buildroot-test/instance-0/output/build/c-periphery-2.2.1/tests/test_gpio_sysfs.c:13:10: fatal error: pthread.h: No such file or directory
- #include <pthread.h>
-          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/6bbc4de3f857dcb7ff5e6f9fa1441ba4e0af1338
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/vsergeev/c-periphery/pull/26]
----
- CMakeLists.txt | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f442bce..6565557 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,8 @@
- cmake_minimum_required(VERSION 2.6)
- project(periphery C)
- 
-+option(BUILD_TESTS "Build tests" ON)
-+
- # Check for Linux kernel headers
- include(CheckIncludeFiles)
- CHECK_INCLUDE_FILES(linux/gpio.h HAVE_LINUX_HEADERS)
-@@ -44,11 +46,13 @@ install(TARGETS periphery DESTINATION ${CMAKE_INSTALL_LIBDIR})
- install(FILES ${periphery_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
- install(FILES ${CMAKE_BINARY_DIR}/libperiphery.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
--# Declare tests targets
--foreach(TEST_SOURCE ${periphery_TESTS})
--    get_filename_component(TEST_PROGRAM ${TEST_SOURCE} NAME_WE)
--    add_executable(${TEST_PROGRAM} ${TEST_SOURCE})
--    target_link_libraries(${TEST_PROGRAM} periphery pthread)
--    set(TEST_PROGRAMS ${TEST_PROGRAMS} ${TEST_PROGRAM})
--endforeach()
--add_custom_target(tests DEPENDS periphery ${TEST_PROGRAMS})
-+if(BUILD_TESTS)
-+    # Declare tests targets
-+    foreach(TEST_SOURCE ${periphery_TESTS})
-+        get_filename_component(TEST_PROGRAM ${TEST_SOURCE} NAME_WE)
-+        add_executable(${TEST_PROGRAM} ${TEST_SOURCE})
-+        target_link_libraries(${TEST_PROGRAM} periphery pthread)
-+        set(TEST_PROGRAMS ${TEST_PROGRAMS} ${TEST_PROGRAM})
-+    endforeach()
-+    add_custom_target(tests DEPENDS periphery ${TEST_PROGRAMS})
-+endif()
--- 
-2.26.2
-
diff --git a/package/c-periphery/Config.in b/package/c-periphery/Config.in
index cf8675801e..0bfb4b1f11 100644
--- a/package/c-periphery/Config.in
+++ b/package/c-periphery/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_C_PERIPHERY
 	bool "c-periphery"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	help
 	  c-periphery is a set of C wrapper functions for GPIO, SPI,
 	  I2C, MMIO, and Serial peripheral I/O interface access in
@@ -15,6 +14,3 @@ config BR2_PACKAGE_C_PERIPHERY
 	  integration with other projects, and is MIT licensed.
 
 	  https://github.com/vsergeev/c-periphery
-
-comment "c-periphery needs a toolchain w/ kernel headers >= 4.8"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index a1842612b9..26f9a73f81 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7afa2a18e0bf0ccb09b832017c61a411a94cff648a9a57f9f9068bcf14a5d972  c-periphery-2.2.1.tar.gz
-sha256 7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
+sha256  e1ad855dfe8595d0aff306a23eee1d4c4a140212d3cbdc7a6bef5e4d39dc70cc  c-periphery-2.2.2.tar.gz
+sha256  7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 3869fc1111..e602e76a94 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.2.1
+C_PERIPHERY_VERSION = 2.2.2
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
-- 
2.17.1
