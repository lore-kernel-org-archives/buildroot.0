From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 11 May 2012 22:01:24 +0200
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: toward a relocatable
	toolchain
Message-ID: <1336766484-6348-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all hard-coded pathes.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 371ab11..6b2d2dc 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -205,17 +205,19 @@ endef
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	@echo -en "\
+	get_filename_component(_THIS_DIR \$${CMAKE_CURRENT_LIST_FILE} PATH)\n\
+	set(_HOST_DIR \"\$${_THIS_DIR}/../../..\")\n\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_COMPILER \"\$${_HOST_DIR}/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc\")\n\
+	set(CMAKE_CXX_COMPILER \"\$${_HOST_DIR}/usr/bin/$(REAL_GNU_TARGET_NAME)-g++\")\n\
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_PROGRAM_PATH \"\$${_HOST_DIR}/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"\$${_HOST_DIR}/usr/$(REAL_GNU_TARGET_NAME)/sysroot\")\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"\$${_HOST_DIR}/usr/$(REAL_GNU_TARGET_NAME)/sysroot\")\n\
 	" > $@

--
1.7.10.1
