From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:23 +0200
Subject: [Buildroot] [PATCH 11/22] cmake: move creation of toolchain file to
	package/pkg-cmaketargets.mk
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ce2f3da881c44f0e66adbb628307413f8bba8058.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also requires moving a few include directives below the "all:"
target in the main Makefile, otherwise the new target to create the
toolchain file in pkg-cmaketargets.mk gets used as the default make
target instead of "all:".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                    |   22 ++--------------------
 package/pkg-cmaketargets.mk |   22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 3e7fa22..4f29cba 100644
--- a/Makefile
+++ b/Makefile
@@ -255,9 +255,6 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
-include toolchain/Makefile.in
-include package/Makefile.in
-
 #############################################################
 #
 # You should probably leave this stuff alone unless you know
@@ -267,6 +264,8 @@ include package/Makefile.in
 
 all: world
 
+include toolchain/Makefile.in
+include package/Makefile.in
 include support/dependencies/dependencies.mk
 
 # We also need the various per-package makefiles, which also add
@@ -339,23 +338,6 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
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
