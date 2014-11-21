From: Davide Viti <zinosat@tiscali.it>
Date: Fri, 21 Nov 2014 23:49:39 +0100
Subject: [Buildroot] [PATCH v2] cmake: make ctest a target package too
Message-ID: <1416610179-15443-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useful for packages shipped with a testsuite which makes use of ctest

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
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

 package/Config.in       |  1 +
 package/cmake/Config.in | 10 ++++++++++
 package/cmake/cmake.mk  | 21 +++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/cmake/Config.in

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
index e09fddf..d7ee974 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,6 +11,15 @@ CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
 HOST_CMAKE_DEPENDENCIES = host-pkgconf
+CMAKE_DEPENDENCIES = zlib libcurl libarchive expat bzip2
+
+CMAKE_CONF_OPTS = \
+		-DKWSYS_LFS_WORKS=$(if $(BR2_LARGEFILE),TRUE,FALSE) \
+		-DKWSYS_CHAR_IS_SIGNED=TRUE \
+		-DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+		-DCTEST_USE_XMLRPC=OFF \
+		-DBUILD_CursesDialog=OFF \
+		-DCMAKE_INSTALL_PREFIX="$(TARGET_DIR)/usr"
 
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
@@ -33,4 +42,16 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+define CMAKE_REMOVE_EXTRA_DATA
+	rm $(TARGET_DIR)/usr/bin/{cmake,cpack}
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0
+endef
+
+CMAKE_POST_INSTALL_TARGET_HOOKS += CMAKE_REMOVE_EXTRA_DATA
+
+define CMAKE_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) cmake -P cmake_install.cmake)
+endef
+
+$(eval $(cmake-package))
 $(eval $(host-generic-package))
-- 
2.1.3
