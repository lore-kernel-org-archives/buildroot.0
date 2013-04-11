From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:58:12 +0200
Subject: [Buildroot] [git commit] support/kconfig: add support for
	olddefconfig
Message-ID: <20130411081134.718968F2AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9db3b47ea1b37b1ac52561f94ca39fa9cf4ae74c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

olddefconfig is a new target available in kconfig that allows to take
an old .config file, and update it to the latest version of the code,
without being asked for questions: it automatically assumes the
default value for options whose value was not defined.

It for example allows to take a minimal defconfig, copy it as .config,
and do 'make olddefconfig' to get the full .config.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index c95bb1e..0a91658 100644
--- a/Makefile
+++ b/Makefile
@@ -58,7 +58,7 @@ export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setloca
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	%_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	source-check print-version
+	source-check print-version olddefconfig
 
 # Strip quotes and then whitespaces
 qstrip=$(strip $(subst ",,$(1)))
@@ -693,6 +693,10 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
+olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
+
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
@@ -758,6 +762,8 @@ help:
 	@echo '  xconfig                - interactive Qt-based configurator'
 	@echo '  gconfig                - interactive GTK-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
+	@echo '  silentoldconfig        - Same as oldconfig, but quietly, additionally update deps'
+	@echo '  olddefconfig           - Same as silentoldconfig but sets new symbols to their default value'
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
