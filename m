From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:15:43 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: do not hardcode absolute
	path in toolchainfile.cmake
Message-ID: <20140601202128.30D059CAB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9033d90118689a50b13b3764a927ec1b202624bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch allows sharing or moving the toolchains.

This is a step toward making the toolchain/sdk relocatable.

Closes #6818

[Peter: reword comment as suggested by Thomas]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Uwe Strempel <u.strempel@googlemail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk                |   11 +++++++----
 support/misc/toolchainfile.cmake.in |   17 ++++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index ca56b48..a84aa0b 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -158,14 +158,17 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 # Generation of the CMake toolchain file
 ################################################################################
 
+# In order to allow the toolchain to be relocated, we calculate the HOST_DIR
+# based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
+# In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
+# so we have to strip "$(HOST_DIR)/" from the paths that contain it.
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	sed \
-		-e 's:@@HOST_DIR@@:$(call qstrip,$(HOST_DIR)):' \
-		-e 's:@@STAGING_DIR@@:$(call qstrip,$(STAGING_DIR)):' \
+		-e 's:@@STAGING_SUBDIR@@:$(call qstrip,$(STAGING_SUBDIR)):' \
 		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
 		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
-		-e 's:@@TARGET_CC_NOCCACHE@@:$(call qstrip,$(TARGET_CC_NOCCACHE)):' \
-		-e 's:@@TARGET_CXX_NOCCACHE@@:$(call qstrip,$(TARGET_CXX_NOCCACHE)):' \
+		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
+		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
 		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
 		> $@
diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index e8cc378..27a0af1 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -3,18 +3,25 @@
 # CMake toolchain file for Buildroot
 #
 
+# In order to allow the toolchain to be relocated, we calculate the
+# HOST_DIR based on this file's location: $(HOST_DIR)/usr/share/buildroot
+# and store it in RELOCATED_HOST_DIR.
+# All the other variables that need to refer to HOST_DIR will use the
+# RELOCATED_HOST_DIR variable.
+string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR})
+
 set(CMAKE_SYSTEM_NAME Linux)
 
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS" FORCE)
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS" FORCE)
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
-set(CMAKE_PROGRAM_PATH "@@HOST_DIR@@/usr/bin")
-set(CMAKE_FIND_ROOT_PATH "@@STAGING_DIR@@")
+set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
+set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-set(ENV{PKG_CONFIG_SYSROOT_DIR} "@@STAGING_DIR@@")
+set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
-set(CMAKE_C_COMPILER "@@TARGET_CC_NOCCACHE@@")
-set(CMAKE_CXX_COMPILER "@@TARGET_CXX_NOCCACHE@@")
+set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC_NOCCACHE@@")
+set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX_NOCCACHE@@")
