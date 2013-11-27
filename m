From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 23:31:46 +0100
Subject: [Buildroot] [PATCHv3 3/5] core: allow external defconfigs to be used
In-Reply-To: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1385591508-4174-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit allows the user to store defconfigs in
$BR2_EXTERNAL/configs/. To achieve this:

 * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
   the corresponding defconfig file.

 * Updates the help target to also list external defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 013b646..3d73cf2 100644
--- a/Makefile
+++ b/Makefile
@@ -747,6 +747,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
+ifeq ($(BR2_EXTERNAL_USED),y)
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+endif
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
@@ -855,8 +861,17 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
+	@echo 'Built-in configs'
+	@echo
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+ifeq ($(BR2_EXTERNAL_USED),y)
+	@echo
+	@echo 'User-provided configs'
+	@echo
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+endif
 	@echo
 	@echo 'See docs/README, or generate the Buildroot manual for further details'
 	@echo
-- 
1.8.1.2
