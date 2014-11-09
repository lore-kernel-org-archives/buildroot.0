From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 10 Nov 2014 00:38:04 +0100
Subject: [Buildroot] [PATCH 1/1] grantlee: version bump and allow building
	with qt5
Message-ID: <1415576284-18846-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/grantlee/Config.in                         | 14 ++++----
 .../grantlee-0.2.0-fix-lphread-link-error.patch    | 42 ----------------------
 package/grantlee/grantlee.mk                       | 15 ++++++--
 3 files changed, 20 insertions(+), 51 deletions(-)
 delete mode 100644 package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index ce1342c..8f763f7 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
-	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
-	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_STL
-	select BR2_PACKAGE_QT_SCRIPT
-	select BR2_PACKAGE_QT_GUI_MODULE
+	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT && BR2_PACKAGE_QT) || BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
 	help
-	  Qt implemantation of the Django template framework
+	  Qt implementation of the Django template framework
 
 	  http://www.grantlee.org
+
diff --git a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
deleted file mode 100644
index 7964fd0..0000000
--- a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d46475b6bb9d99a4c5c95489be6c14d0d219d5f8 Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Thu, 15 Nov 2012 17:00:39 +0100
-Subject: [PATCH] fix -lpthread build error
-
-Fixing linking time error with certain toolchains. The issue caused by a missing explicit linking to
-libpthread. The failed buildlog:
-Linking CXX executable testgenerictypes_exec
-/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQtCore.so: undefined reference to symbol 'pthread_cancel'
-/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: note: 'pthread_cancel' is defined in DSO /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
-/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read symbols: Invalid operation
-collect2: ld returned 1 exit status
-make[3]: *** [templates/tests/testgenerictypes_exec] Error 1
-make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
-make[2]: *** [templates/tests/CMakeFiles/testgenerictypes_exec.dir/all] Error 2
-make[2]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
-make[1]: *** [all] Error 2
-make[1]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
-make: *** [/home/buildroot12git/output/build/grantlee-0.2.0/.stamp_built] Error
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- templates/tests/CMakeLists.txt |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/templates/tests/CMakeLists.txt b/templates/tests/CMakeLists.txt
-index caab003..f400622 100644
---- a/templates/tests/CMakeLists.txt
-+++ b/templates/tests/CMakeLists.txt
-@@ -68,7 +68,8 @@ macro(GRANTLEE_TEMPLATES_UNIT_TESTS)
-                   ${_testresource_rcc_src}
-     )
-     add_test(${_testname} ${_testname}_exec )
--    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} grantlee_core )
-+    find_package (Threads)
-+    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} ${CMAKE_THREAD_LIBS_INIT}  grantlee_core )
- 
-     set_property(GLOBAL APPEND PROPERTY TEST_COVERAGE "${CMAKE_CURRENT_BINARY_DIR}/${_testname}_exec" )
-   endforeach(_testname)
--- 
-1.7.9.5
-
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 539578b..a300106 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -3,12 +3,21 @@
 # grantlee
 #
 ################################################################################
-
-GRANTLEE_VERSION = 0.2.0
+# qt4 support dropped after 0.5.1, so we use the older version for qt4
+ifeq ($(BR2_PACKAGE_QT),y)
+GRANTLEE_VERSION = 0.5.1
+else ifeq ($(BR2_PACKAGE_QT5),y)
+GRANTLEE_VERSION = 5.0.0
+endif
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
-GRANTLEE_DEPENDENCIES = qt
 GRANTLEE_LICENSE = LGPLv2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_QT),y)
+GRANTLEE_DEPENDENCIES = qt
+else ifeq ($(BR2_PACKAGE_QT5),y)
+GRANTLEE_DEPENDENCIES += qt5base qt5script
+endif
+
 $(eval $(cmake-package))
-- 
2.1.0
