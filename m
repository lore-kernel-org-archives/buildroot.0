From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 11:05:50 +0200
Subject: [Buildroot] [PATCH 04/15 v4] core: introduce intermediate
 BASE_TARGET_DIR variable
In-Reply-To: <cover.1522487149.git.yann.morin.1998@free.fr>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <0b3d90c6c6fc42bf69538ecc56ddb278f93e0d8d.1522487149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new BASE_TARGET_DIR variable is set in stone to point to the real
location where packages will be installed. Its name is modelled after
its definition: it is located in $(BASE_DIR), and it is named 'target/',
hence BASE_TARGET_DIR.

The already-existing TARGET_DIR variable now simply points to the same
location, except that it is recursively expanded, so that we can later
change it depending on the context.

All locations that really need to reference the existing target/
directory, are changed to use BASE_TARGET_DIR; surprinsigly enough, they
all seem to be located in the main Makefile. :-) The rest is left with
using good-old TARGET_DIR.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9e2402d7d9..41624b859e 100644
--- a/Makefile
+++ b/Makefile
@@ -215,7 +215,8 @@ BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
-TARGET_DIR := $(BASE_DIR)/target
+BASE_TARGET_DIR := $(BASE_DIR)/target
+TARGET_DIR = $(BASE_TARGET_DIR)
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
@@ -237,7 +238,7 @@ LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 BR2_CONFIG = $(CONFIG_DIR)/.config
@@ -459,7 +460,7 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+TARGET_DIR_WARNING_FILE = $(BASE_TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE := $(HOST_DIR)/bin/ccache
@@ -556,7 +557,7 @@ $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
 endif
 
 .PHONY: dirs
-dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(BASE_TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
@@ -972,7 +973,7 @@ printvars:
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
-- 
2.14.1
