From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 15 Jan 2011 21:53:25 +0100
Subject: [Buildroot] [PATCH v2 1/4] Makefile: generate CMake toolchain-file
	in $(O)
In-Reply-To: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1295124808-5649-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A CMake toolchain-file makes it easy to develop CMake-based packages
outside of Buildroot. Just give the toolchain-file to CMake via the
-DCMAKE_TOOLCHAIN_FILE=... option.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile            |   16 +++++++++++++++-
 package/Makefile.in |    7 +++++++
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 7e08cf3..1b68060 100644
--- a/Makefile
+++ b/Makefile
@@ -363,7 +363,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs
+$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
@@ -372,6 +372,20 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
+$(O)/toolchainfile.cmake:
+	@echo -en "\
+	set(CMAKE_SYSTEM_NAME Linux)\n\
+	set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
+	set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
+	set(CMAKE_C_FLAGS \"${CMAKE_C_FLAGS} $(CMAKE_TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} $(CMAKE_TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
+	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
+	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
+	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
diff --git a/package/Makefile.in b/package/Makefile.in
index a1e290f..0761aa1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -147,6 +147,13 @@ TARGET_CC  := $(CCACHE) $(TARGET_CC)
 TARGET_CXX := $(CCACHE) $(TARGET_CXX)
 endif
 
+# CMake doesn't support having the --sysroot option directly in the
+# compiler path, so move this option to CFLAGS/CXXFLAGS variables.
+CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
+CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
+CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
+CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
-- 
1.7.1
