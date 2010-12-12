From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 12 Dec 2010 20:29:14 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file in
	$(O)
In-Reply-To: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A CMake toolchain file makes it easy to develop CMake-based packages
outside of Buildroot. Just give the toolchain file path to CMake via the
-DCMAKE_TOOLCHAIN_FILE=... option.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 7d6e4af..0cf49d4 100644
--- a/Makefile
+++ b/Makefile
@@ -358,7 +358,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs
+$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
@@ -367,6 +367,16 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
+$(O)/toolchainfile.cmake:
+	@echo -en "\
+	set(CMAKE_SYSTEM_NAME Linux)\n\
+	set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
+	set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
+	set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
+	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
+	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-- 
1.7.1
