From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 15:32:17 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: remove outdated
	.config.cmd handling
Message-ID: <20101124143327.399618DCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=610255e7e4361c786009dcc5c17be62286bea3e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not used anymore, and forcefully removes config if *config is aborted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   23 +++++------------------
 1 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 8669eef..b5498ca 100644
--- a/Makefile
+++ b/Makefile
@@ -75,7 +75,6 @@ EXTRAMAKEARGS = O=$(O)
 NEED_WRAPPER=y
 endif
 
-# $(shell find . -name *_defconfig |sed 's/.*\///')
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
@@ -289,9 +288,6 @@ include package/Makefile.in
 
 all: world
 
-# In this section, we need .config
--include $(CONFIG_DIR)/.config.cmd
-
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
@@ -489,28 +485,19 @@ COMMON_CONFIG_ENV = \
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
-		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
-	fi
+	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! $(COMMON_CONFIG_ENV) srctree=$(TOPDIR) \
-		$< $(CONFIG_CONFIG_IN); then \
-		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
-	fi
+	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
-		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
-	fi
+	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
-		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
-	fi
+	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -603,7 +590,7 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.config.cmd $(CONFIG_DIR)/.auto.deps
+	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
 flush:
 	rm -f $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
-- 
1.7.2.2
