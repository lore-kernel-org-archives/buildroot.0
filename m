From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:25 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake fails in detecting the compiler when ccache is used. Add a wrapper
script to make it happy.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile             |    2 +-
 package/pkg-cmake.mk |   31 +++++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 1300725..f6d8494 100644
--- a/Makefile
+++ b/Makefile
@@ -387,7 +387,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+$(BASE_TARGETS): dirs $(CMAKE_PKG_DEPENDENCIES)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 626a0b0..0a44cfe 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -183,6 +183,26 @@ cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(ca
 host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 ################################################################################
+# Generate wrappers for the compiler.
+# If CMAKE_C_COMPILER were set to $(TARGET_CC), which may contanin a ccache
+# prefix, CMake would fail to detect the compiler. Generate two simple wrappers
+# that make it believe it is calling the compiler directly.
+################################################################################
+
+CMAKE_CC_WRAPPER  = $(HOST_DIR)/usr/bin/cmake-cc-wrapper
+CMAKE_CXX_WRAPPER = $(HOST_DIR)/usr/bin/cmake-cxx-wrapper
+
+$(CMAKE_CC_WRAPPER):
+	echo "#!/bin/sh" >$@
+	echo "$(TARGET_CC)" '$$@' >>$@
+	chmod a+x $@
+
+$(CMAKE_CXX_WRAPPER):
+	echo "#!/bin/sh" >$@
+	echo "$(TARGET_CXX)" '$$@' >>$@
+	chmod a+x $@
+
+################################################################################
 # Generation of the CMake toolchain file
 ################################################################################
 
@@ -190,8 +210,8 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
 	@echo -en "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_COMPILER $(CMAKE_CC_WRAPPER))\n\
+	set(CMAKE_CXX_COMPILER $(CMAKE_CXX_WRAPPER))\n\
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
@@ -203,3 +223,10 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
 	" > $@
 
+################################################################################
+# dependencies for the top-level Makefile
+################################################################################
+
+CMAKE_PKG_DEPENDENCIES = \
+	$(CMAKE_CC_WRAPPER) $(CMAKE_CXX_WRAPPER) \
+	$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
1.7.10.4
