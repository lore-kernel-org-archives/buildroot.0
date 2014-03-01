From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  1 Mar 2014 18:16:02 +0100
Subject: [Buildroot] [PATCH] pkg-cmaketargets.mk: do not hardcode absolute
	path in toolchainfile.cmake
Message-ID: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch allows sharing or moving the toolchains.

This is a step toward making the toolchain/sdk relocatable.

Closes #6818

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Uwe Strempel <u.strempel@googlemail.com>
---
 package/pkg-cmake.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f7e454b..4effb15 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -159,16 +159,18 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	@echo -en "\
+	get_filename_component(_HOST_DIR \$${CMAKE_CURRENT_LIST_FILE} PATH)\n\
+	set(_HOST_DIR \"\$${_HOST_DIR}/../../..\")\n\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))gcc\")\n\
+	set(CMAKE_CXX_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))g++\")\n\
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_PROGRAM_PATH \"\$${_HOST_DIR}/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"\$${_HOST_DIR}/$(STAGING_SUBDIR)\")\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"\$${_HOST_DIR}/$(STAGING_SUBDIR)\")\n\
 	" > $@
-- 
1.9.0
