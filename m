From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 26 Jan 2011 22:18:42 +0100
Subject: [Buildroot] [PATCH v3 1/4] Makefile: generate CMake toolchain-file
	in $(O)
In-Reply-To: <1296076725-25194-1-git-send-email-bjorn.forsman@gmail.com>
References: <1296076725-25194-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1296076725-25194-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A CMake toolchain-file makes it easy to develop CMake-based packages
outside of Buildroot. Just give the toolchain-file to CMake via the
-DCMAKE_TOOLCHAIN_FILE=... option.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile            |   17 ++++++++++++++++-
 package/Makefile.in |    8 ++++++++
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index a5a37a1..04783f2 100644
--- a/Makefile
+++ b/Makefile
@@ -363,7 +363,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs
+$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
@@ -372,6 +372,21 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
+$(O)/toolchainfile.cmake:
+	@echo -en "\
+	set(CMAKE_SYSTEM_NAME Linux)\n\
+	set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
+	set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
+	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
+	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
diff --git a/package/Makefile.in b/package/Makefile.in
index 644eb1f..599f684 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -143,6 +143,14 @@ TARGET_CC  := $(CCACHE) $(TARGET_CC)
 TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
+# * CMake doesn't support having the --sysroot option directly in the
+#   compiler path, so move this option to CFLAGS/CXXFLAGS variables.
+# * Don't use ccache because then CMake will fail to detect compiler.
+CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
+CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX_NOCCACHE))
+CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC_NOCCACHE)) $(TARGET_CFLAGS)
+CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX_NOCCACHE)) $(TARGET_CXXFLAGS)
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
-- 
1.7.1
