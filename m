From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:23 +0200
Subject: [Buildroot] [PATCH v6 8/9] Makefile: add alldefconfig target
In-Reply-To: <20170407111624.4629-1-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
Message-ID: <20170407111624.4629-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is used by Kconfig's merge_config.sh.

No alldefpackageconfig is added, since it's rather pointless: it would
only enable busybox.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v6: No changes
v5: First version
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 04a0785651..96864f2ec3 100644
--- a/Makefile
+++ b/Makefile
@@ -126,7 +126,7 @@ DATE := $(shell date +%Y%m%d)
 export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
+	defconfig %_defconfig allyesconfig allnoconfig alldefconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-html manual-split-html \
 	manual-pdf manual-text manual-epub
@@ -846,7 +846,7 @@ config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 # no values are set for the legacy options so a subsequent oldconfig
 # will query them. Therefore, run an additional olddefconfig.
 
-randconfig allyesconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --$@ $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
@@ -950,6 +950,7 @@ help:
 	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
+	@echo '  alldefconfig           - New config where all options are set to default'
 	@echo '  randpackageconfig      - New config with random answer to package options'
 	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
-- 
2.11.0
