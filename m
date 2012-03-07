From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:24 +0100
Subject: [Buildroot] [PATCH 11/13] cmake: move creation of toolchain file to
	package/pkg-cmaketargets.mk
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e165f3e7d58343c33b295e78c7ec60b0f6bbb839.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                    |   17 -----------------
 package/pkg-cmaketargets.mk |   22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 1986e33..ab91b10 100644
--- a/Makefile
+++ b/Makefile
@@ -339,23 +339,6 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
-$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
-	mkdir -p $(@D)
-	@echo -en "\
-	set(CMAKE_SYSTEM_NAME Linux)\n\
-	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
-	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
-	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
-	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
-	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
-	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
-	" > $@
-
 .PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 1cd65e4..371ab11 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -197,3 +197,25 @@ else
 $(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
 endif
 endef
+
+################################################################################
+# Generation of the CMake toolchain file
+################################################################################
+
+$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
+	@mkdir -p $(@D)
+	@echo -en "\
+	set(CMAKE_SYSTEM_NAME Linux)\n\
+	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
+	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
+	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
+	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	" > $@
+
-- 
1.7.4.1
