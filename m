From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 21:03:52 +0200
Subject: [Buildroot] [PATCHv2 3/4] core: allow external defconfigs to be used
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1379185433-8770-4-git-send-email-thomas.petazzoni@free-electrons.com>
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
 Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bea5ad5..799c529 100644
--- a/Makefile
+++ b/Makefile
@@ -729,6 +729,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
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
@@ -840,7 +846,7 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
-	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig $(if $(BR2_EXTERNAL_USED),$(BR2_EXTERNAL)/configs/*_defconfig)))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 	@echo
 	@echo 'See docs/README, or generate the Buildroot manual for further details'
-- 
1.8.1.2
