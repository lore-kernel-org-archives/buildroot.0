From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:23 +0200
Subject: [Buildroot] [PATCH 04/14] pkg-cmake.mk: do not hardcode absolute
	path in toolchainfile.cmake
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-5-git-send-email-s.martin49@gmail.com>
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
Cc: Arnout Vandecappelle <arnout@mind.be>

---
changes v1 -> v2:
- rebase
- use CMAKE_CURRENT_LIST_DIR instead of get_filename_component()
- rewrite subst call in a more natural way (Arnout)
---
 package/pkg-cmake.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index af8ecf5..b2ac2df 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -159,18 +159,19 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 ################################################################################
 
 define TOOLCHAINFILE_CMAKE
+string(REPLACE /usr/share/buildroot "" _HOST_DIR $${CMAKE_CURRENT_LIST_DIR})
 set(CMAKE_SYSTEM_NAME Linux)
-set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))
-set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))
+set(CMAKE_C_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))gcc)
+set(CMAKE_CXX_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
 set(CMAKE_C_FLAGS "$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)" CACHE STRING "Buildroot CFLAGS" FORCE)
 set(CMAKE_CXX_FLAGS "$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)" CACHE STRING "Buildroot CXXFLAGS" FORCE)
 set(CMAKE_INSTALL_SO_NO_EXE 0)
-set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)
-set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))
+set(CMAKE_PROGRAM_PATH $${_HOST_DIR}/usr/bin)
+set(CMAKE_FIND_ROOT_PATH $${_HOST_DIR}/$(STAGING_SUBDIR))
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))
+set(ENV{PKG_CONFIG_SYSROOT_DIR} $${_HOST_DIR}/$(STAGING_SUBDIR))
 endef
 
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
-- 
1.9.2
