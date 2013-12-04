From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Dec 2013 19:56:11 +0100
Subject: [Buildroot] [PATCHv5 3/5] core: allow external defconfigs to be used
In-Reply-To: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386183373-17611-4-git-send-email-thomas.petazzoni@free-electrons.com>
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
 Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index 4f20bd5..3365a50 100644
--- a/Makefile
+++ b/Makefile
@@ -742,6 +742,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
@@ -850,8 +854,15 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo
+	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
+	@echo
+	@echo 'User-provided configs:'
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
+endif
 	@echo
 	@echo 'See docs/README, or generate the Buildroot manual for further details'
 	@echo
-- 
1.8.1.2
