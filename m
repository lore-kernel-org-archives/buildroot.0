From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 19:14:50 +0200
Subject: [Buildroot] [PATCH v3 resend] config: make it possible to specify
	which config file to use for 'make defconfig'
Message-ID: <1335633290-8734-1-git-send-email-arnout@mind.be>
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
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v3:
* Acked by ThomasP

v2:
* Use $(if...) instead of $(patsubst...)
* Add help text
* Fix commit message

 Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cc8124a..a7625ba 100644
--- a/Makefile
+++ b/Makefile
@@ -540,7 +540,7 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -603,6 +603,7 @@ help:
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
+	@echo '                             BR2_DEFCONFIG, if set, is used as input'
 	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
-- 
tg: (524a8ab..) t/defconfig (depends on: master)
