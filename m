From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 21 Jun 2016 14:56:44 +1000
Subject: [Buildroot] [PATCH v2 4/5] Makefile: Add nested config dirs to
	list-defconfigs
In-Reply-To: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
References: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
Message-ID: <29b27f528463acf97a790a11d11d681a5f50a536.1466484997.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index fd07f8c..cd94f52 100644
--- a/Makefile
+++ b/Makefile
@@ -206,6 +206,10 @@ LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+BR2_DEFCONFIG_PATHS_LOCAL=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/)))
+BR2_DEFCONFIG_PATHS_USER=$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
+BR2_DEFCONFIG_PATHS=$(BR2_DEFCONFIG_PATHS_LOCAL) $(BR2_DEFCONFIG_PATHS_USER)
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -848,8 +852,6 @@ define CREATE_DEFCONFIG_RECIPES
 		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
 endef
 
-BR2_DEFCONFIG_PATHS=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/))) \
-		$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
 $(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
@@ -1009,12 +1011,12 @@ help:
 
 list-defconfigs:
 	@echo 'Built-in configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(wildcard $(path)/*_defconfig)))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(wildcard $(path)/*_defconfig)))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-- 
2.1.0
