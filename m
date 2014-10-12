From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Oct 2014 19:26:35 +0200
Subject: [Buildroot] [PATCH] randconfig: seed with BR2_RAND_PRESEED_CONFIG
In-Reply-To: <1405812304-7603-1-git-send-email-yann.morin.1998@free.fr>
References: <1405812304-7603-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1413134795-32050-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, randconfig is completely unusable. Instead, we use
randpackageconfig, with two use cases: in the autobuilders, and when
doing manual testing of the validity of depends/select chains. In both
cases, we actually want the possibility to explicitly select some
packages or to set a string value or to randomise between a choice or
to test bootloaders and kernels - all of this is currently impossible.

With this patch, we can use randconfig instead of randpackageconfig,
and provide it with a seed file specified with BR2_RAND_PRESEED_CONFIG.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c0dcec8..79b12c6 100644
--- a/Makefile
+++ b/Makefile
@@ -727,7 +727,16 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
+ifneq ($(BR2_RAND_PRESEED_CONFIG),)
+	@cp $(BR2_RAND_PRESEED_CONFIG) $(CONFIG_DIR)/.config.nopkg
+endif
+	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
+		while read config pkg; do \
+		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
+	@$(COMMON_CONFIG_ENV) \
+		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
+		$< --randconfig $(CONFIG_CONFIG_IN)
+	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -852,7 +861,8 @@ help:
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  silentoldconfig        - Same as oldconfig, but quietly, additionally update deps'
 	@echo '  olddefconfig           - Same as silentoldconfig but sets new symbols to their default value'
-	@echo '  randconfig             - New config with random answer to all options'
+	@echo '  randconfig             - New config with random answer to all options -'
+	@echo '                             options can be forced by setting BR2_RAND_PRESEED_CONFIG'
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
 	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
-- 
2.1.1
