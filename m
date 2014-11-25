From: Davide Viti <zinosat@tiscali.it>
Date: Wed, 26 Nov 2014 00:33:54 +0100
Subject: [Buildroot] [PATCH v4] cmake: make ctest a target package too
Message-ID: <1416958434-21658-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useful for packages shipped with a testsuite which makes use of ctest

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
This version of the patch was mainly reworked to fix the following
error seen on the taget:

CMake Error: Could not find CMAKE_ROOT !!!
CMake has most likely not been installed correctly.
Modules directory not found in
/usr/share/cmake-3.0
CMake Error: Could not find CMAKE_ROOT !!!
CMake has most likely not been installed correctly.
Modules directory not found in
/usr/share/cmake-3.0

caused by "target-finalize" target in the toplevel Buildroot Makefile
which removes Modules/CMake.cmake file from the target filesystem.
The following solutions were evaluated:

 1. add special exceptions to the main Makefile
 2. specify CMAKE_DATA_DIR at configure time, so that "Modules" and
 "Templates" folders don't get cleaned up by "target-finalize" rule
 3. instruct ctest to look for CMake.cmake.ctest instead of CMake.cmake

the last option (3) was implemented and now ctest looks for
CMake.cmake first and then tries to open Modules/CMake.cmake.ctest
If both files are not found ctest issues the above error.

v3->v4:
 - fix CMAKE_REMOVE_EXTRA_DATA target
 
v2->v3:
 - specify DESTDIR when installing (Samuel Martin)
 - rename Modules/CMake.cmake Modules/CMake.cmake.ctest
 - add patch to make ctest look for Modules/CMake.cmake{.ctest}

v1->v2:
     - rebase
     - use CMAKE_CONF_OPTS in place of bootstrap (Samuel Martin)
     - use system libraries to speed up compilation [1] (Samuel Martin)
     - install only ctest on the target (Samuel Martin)
     - system curl and expat rely on disabled libxmlrpc (Samuel Martin)
     - usa CMAKE_POST_INSTALL_TARGET_HOOKS
     - specify host tools path during install [2]

[1] Using system libraries speeds up compilation of around 20%
[2] the install rule has to be overridden because of http://public.kitware.com/Bug/view.php?id=15248
    http://www.cmake.org/gitweb?p=stage/cmake.git;a=patch;h=15f55cca does not work for me on BR

 package/Config.in                         |  1 +
 package/cmake/Config.in                   | 10 ++++++++++
 package/cmake/cmake.mk                    | 30 ++++++++++++++++++++++++++++++
 package/cmake/rename_cmake_rootfile.patch | 21 +++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/cmake/Config.in
 create mode 100644 package/cmake/rename_cmake_rootfile.patch

diff --git a/package/Config.in b/package/Config.in
index 28cf703..bbd454d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -101,6 +101,7 @@ menu "Development tools"
 	source "package/bison/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
+	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
new file mode 100644
index 0000000..120efc8
--- /dev/null
+++ b/package/cmake/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CMAKE
+	bool "ctest"
+	help
+	  CTest is a testing tool distributed as a part of CMake. It
+	  can be used to automate updating (using CVS for example),
+	  configuring, building, testing, performing memory checking,
+	  performing coverage, and submitting results to a CDash or
+	  Dart dashboard system.
+
+	  http://www.cmake.org/
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e09fddf..4d4638c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,6 +11,14 @@ CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
 HOST_CMAKE_DEPENDENCIES = host-pkgconf
+CMAKE_DEPENDENCIES = zlib libcurl libarchive expat bzip2
+
+CMAKE_CONF_OPTS = \
+		-DKWSYS_LFS_WORKS=$(if $(BR2_LARGEFILE),TRUE,FALSE) \
+		-DKWSYS_CHAR_IS_SIGNED=TRUE \
+		-DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+		-DCTEST_USE_XMLRPC=OFF \
+		-DBUILD_CursesDialog=OFF
 
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
@@ -33,4 +41,26 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+define CMAKE_REMOVE_EXTRA_DATA
+	rm $(TARGET_DIR)/usr/bin/{cmake,cpack}
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0/{completions,editors}
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0/{Help,include}
+endef
+
+define CMAKE_INSTALL_CTEST_CFG_FILE
+	cp $(@D)/Modules/CMake.cmake \
+		$(TARGET_DIR)/usr/share/cmake-3.0/Modules/CMake.cmake.ctest
+endef
+
+CMAKE_POST_INSTALL_TARGET_HOOKS += CMAKE_REMOVE_EXTRA_DATA
+CMAKE_POST_INSTALL_TARGET_HOOKS += CMAKE_INSTALL_CTEST_CFG_FILE
+
+define CMAKE_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(HOST_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		cmake -P cmake_install.cmake \
+	)
+endef
+
+$(eval $(cmake-package))
 $(eval $(host-generic-package))
diff --git a/package/cmake/rename_cmake_rootfile.patch b/package/cmake/rename_cmake_rootfile.patch
new file mode 100644
index 0000000..d9e757b
--- /dev/null
+++ b/package/cmake/rename_cmake_rootfile.patch
@@ -0,0 +1,21 @@
+ctest fails on the target, because it cannot find CMake.cmake inside
+CMAKE_DATA_DIR (typically set to "/usr/share/cmake-3.0"): all *.cmake
+files are removed at build time via the target-finalize rule.
+
+This buildroot-specific patch makes sure ctest looks also for
+"Modules/CMake.cmake.ctest" before complaining
+
+--- cmake-3.0.2/Source/cmake.cxx~	2014-09-11 15:24:01.000000000 +0200
++++ cmake-3.0.2/Source/cmake.cxx	2014-11-25 15:48:04.461033690 +0100
+@@ -957,7 +957,10 @@
+      "Path to cpack program executable.", cmCacheManager::INTERNAL);
+ #endif
+   if(!cmSystemTools::FileExists(
+-       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()))
++       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()) &&
++     !cmSystemTools::FileExists(
++       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str())
++     )
+     {
+     // couldn't find modules
+     cmSystemTools::Error("Could not find CMAKE_ROOT !!!\n"
-- 
2.1.3
