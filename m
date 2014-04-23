From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:22 +0200
Subject: [Buildroot] [PATCH 03/14] pkg-cmake.mk: rework toolchainfile.cmake
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
changes v1 -> v2:
- new patch
---
 package/pkg-cmake.mk | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 963a423..af8ecf5 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -158,19 +158,21 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 # Generation of the CMake toolchain file
 ################################################################################
 
+define TOOLCHAINFILE_CMAKE
+set(CMAKE_SYSTEM_NAME Linux)
+set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))
+set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))
+set(CMAKE_C_FLAGS "$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)" CACHE STRING "Buildroot CFLAGS" FORCE)
+set(CMAKE_CXX_FLAGS "$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)" CACHE STRING "Buildroot CXXFLAGS" FORCE)
+set(CMAKE_INSTALL_SO_NO_EXE 0)
+set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)
+set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))
+set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
+set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))
+endef
+
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
-	@printf "\
-	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
-	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
-	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
-	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
-	set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))\n\
-	" > $@
+	@printf '$(subst $(sep),\n,$(TOOLCHAINFILE_CMAKE))' > $@
-- 
1.9.2
