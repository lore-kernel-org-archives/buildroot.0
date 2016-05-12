From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 11 May 2016 21:12:43 -0500
Subject: [Buildroot] [PATCH] Support nested config directories
In-Reply-To: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463019163-27543-1-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Elizabeth Liner <eliner@us.ibm.com>

Adds an additional recipe to search configs/*/ for defconfig files.
Recipe added for both $(TOPDIR) and $(BR2_EXTERNAL) to allow nested
directories for both locations.

Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 32bbfc4..81a9c6d 100644
--- a/Makefile
+++ b/Makefile
@@ -850,6 +850,14 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
 		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(wildcard $(TOPDIR)/configs/*/%_defconfig) outputmakefile
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(wildcard $(TOPDIR)/configs/*/$@) \
+		$< --defconfig=$(wildcard $(TOPDIR)/configs/*/$@) $(CONFIG_CONFIG_IN)
+
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(wildcard $(BR2_EXTERNAL)/configs/*/%_defconfig) outputmakefile
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(wildcard $(BR2_EXTERNAL)/configs/*/$@) \
+		$< --defconfig=$(wildcard $(BR2_EXTERNAL)/configs/*/$@) $(CONFIG_CONFIG_IN)
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
-- 
2.6.3
