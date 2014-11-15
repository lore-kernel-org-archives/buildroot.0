From: Davide Viti <zinosat@tiscali.it>
Date: Sat, 15 Nov 2014 12:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] cmake: make it a target package too
Message-ID: <1416050111-4629-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages are shipped with a testsuite which makes use of
ctest.
cmake/ctest/cpack can now be included in target images

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/Config.in       |    1 +
 package/cmake/Config.in |   24 ++++++++++++++++++++++++
 package/cmake/cmake.mk  |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
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
index 0000000..8cf0c38
--- /dev/null
+++ b/package/cmake/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_CMAKE
+	bool "cmake"
+	help
+	  Cross-platform, open-source build system. CMake is a family
+	  of tools designed to build, test and package software. CMake
+	  is used to control the software compilation process using
+	  simple platform and compiler independent configuration
+	  files. CMake generates native makefiles and workspaces that
+	  can be used in the compiler environment of your choice.
+
+	  http://www.cmake.org/
+
+if BR2_PACKAGE_CMAKE
+
+config BR2_PACKAGE_CMAKE_CMAKE
+	bool "cmake"
+
+config BR2_PACKAGE_CMAKE_CTEST
+	bool "ctest"
+
+config BR2_PACKAGE_CMAKE_CPACK
+	bool "cpack"
+
+endif
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e09fddf..d50c308 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -25,6 +25,24 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	)
 endef
 
+define CMAKE_CONFIGURE_CMDS
+	(cd $(@D); \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./bootstrap --prefix=$(TARGET_DIR)/usr \
+			--parallel=$(PARALLEL_JOBS) -- \
+			-DCMAKE_C_FLAGS="$(TARGET_CFLAGS)" \
+			-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS)" \
+			-DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)" \
+			-DCMAKE_C_COMPILER="$(TARGET_CC)" \
+			-DCMAKE_CXX_COMPILER="$(TARGET_CXX)" \
+			-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
+			-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
+			-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
+			-DBUILD_CursesDialog=OFF \
+	)
+endef
+
 define HOST_CMAKE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
@@ -33,4 +51,33 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifneq ($(BR2_PACKAGE_CMAKE_CMAKE),y)
+define CMAKE_UNINSTALL_CMAKE_CMDS
+	rm $(TARGET_DIR)/usr/bin/cmake
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_CMAKE_CTEST),y)
+define CMAKE_UNINSTALL_CTEST_CMDS
+	rm $(TARGET_DIR)/usr/bin/ctest
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_CMAKE_CPACK),y)
+define CMAKE_UNINSTALL_CPACK_CMDS
+	rm $(TARGET_DIR)/usr/bin/cpack
+endef
+endif
+
+define CMAKE_INSTALL_TARGET_CMDS
+	(cd $(@D); cmake -P cmake_install.cmake)
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0/{completions,editors,Help}
+	rm -fr $(TARGET_DIR)/usr/share/cmake-3.0/{include,Templates}
+	$(CMAKE_UNINSTALL_CMAKE_CMDS)
+	$(CMAKE_UNINSTALL_CTEST_CMDS)
+	$(CMAKE_UNINSTALL_CPACK_CMDS)
+endef
+
+$(eval $(cmake-package))
 $(eval $(host-generic-package))
-- 
1.7.10.4
