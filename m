From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:38:53 +0200
Subject: [Buildroot] [git commit] config: make it possible to specify which
	config file to use for 'make defconfig'
Message-ID: <20120505214003.24A7E96AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33f454bbef77638a29ec24807e30740323e15b3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
