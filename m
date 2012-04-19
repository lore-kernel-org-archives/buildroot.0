From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Apr 2012 00:01:03 +0200
Subject: [Buildroot] [git commit] cmake: move creation of toolchain file to
	package/pkg-cmaketargets.mk
Message-ID: <20120419220218.2B43896B20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=486253db302d4b277db1d2bff0e175e5950e0d1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also requires moving a few include directives below the "all:"
target in the main Makefile, otherwise the new target to create the
toolchain file in pkg-cmaketargets.mk gets used as the default make
target instead of "all:".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                    |   22 ++--------------------
 package/pkg-cmaketargets.mk |   22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index bc6670b..eafb654 100644
--- a/Makefile
+++ b/Makefile
@@ -256,9 +256,6 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
-include toolchain/Makefile.in
-include package/Makefile.in
-
 #############################################################
 #
 # You should probably leave this stuff alone unless you know
@@ -268,6 +265,8 @@ include package/Makefile.in
 
 all: world
 
+include toolchain/Makefile.in
+include package/Makefile.in
 include support/dependencies/dependencies.mk
 
 # We also need the various per-package makefiles, which also add
@@ -340,23 +339,6 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
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
