From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 11 Mar 2012 12:14:42 +0100
Subject: [Buildroot] [PATCH v2] config: make it possible to specify which
	config file to use for 'make defconfig'
Message-ID: <1331464482-5827-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So that this works:

 % make defconfig BR2_DEFCONFIG=~/buildroot-defconfig

Right now we have to do:

 % cp ~/buildroot-defconfig configs/buildroot_defconfig
 % make buildroot_defconfig

That would dirty the buildroot tree and requires it to be writable.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v2:
* Use $(if...) instead of $(patsubst...)
* Add help text
* Fix commit message

 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d508888..4637d7e 100644
--- a/Makefile
+++ b/Makefile
@@ -602,7 +602,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -663,6 +663,7 @@ help:
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
+	@echo '                             BR2_DEFCONFIG, if set, is used as input'
 	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
-- 
tg: (dca6e03..) t/defconfig (depends on: master)
