From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 17 Feb 2012 09:23:55 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: Fix location
In-Reply-To: <201202170010.53333.arnout@mind.be>
References: <201202170010.53333.arnout@mind.be>
Message-ID: <1329467035-2349-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pacth moves the toolchainfile.cmake in the host tree, as well
as making it generated after the toolchain generation or import and
checks (depending on the backend used).

This ensures the correctness and consistency between the actual
toolchain and the toolchainfile.cmake file describing it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile                  |   17 +++++++++++------
 package/Makefile.cmake.in |    2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 7d8dd2e..58db7bb 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # Makefile for buildroot2
 #
 # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2006-2011 by the Buildroot developers <buildroot@uclibc.org>
+# Copyright (C) 2006-2012 by the Buildroot developers <buildroot@uclibc.org>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -282,8 +282,12 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
+CMAKE_TOOLCHAIN_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)
+CMAKE_TOOLCHAIN_FILE=$(CMAKE_TOOLCHAIN_DIR)/toolchainfile.cmake
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
+BASE_TARGETS += $(CMAKE_TOOLCHAIN_FILE)
+
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
@@ -366,9 +370,9 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(CMAKE_TOOLCHAIN_DIR)
 
-$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
+$(BASE_TARGETS): dirs
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -377,7 +381,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
-$(O)/toolchainfile.cmake:
+$(CMAKE_TOOLCHAIN_FILE): $(CMAKE_TOOLCHAIN_DIR)
 	@echo -en "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
 	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
@@ -405,7 +409,7 @@ $(O)/toolchainfile.cmake:
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(CMAKE_TOOLCHAIN_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -626,7 +630,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(CMAKE_TOOLCHAIN_FILE)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 38e459b..8a81c3b 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -72,7 +72,7 @@ define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
-		-DCMAKE_TOOLCHAIN_FILE="$$(BASE_DIR)/toolchainfile.cmake" \
+		-DCMAKE_TOOLCHAIN_FILE="$$(CMAKE_TOOLCHAIN_FILE)" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		$$($$(PKG)_CONF_OPT) \
 	)
-- 
1.7.9.1
