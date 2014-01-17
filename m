From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2014 19:12:56 +0100
Subject: [Buildroot] [PATCH] Revert "prevent recursion in %_defconfig rules"
Message-ID: <1389982376-18064-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This reverts commit 94dd02f5d0ce89549a82a99c56602e1c4a73bae7.

The change breaks defconfigs from BR2_EXTERNAL, both for in-tree and
out-of-tree builds.

Besides, the problem reported in 94dd02f could not be reproduced.

I can read French, and I suspect a relative path was used for either
BR2_EXTERNAL or O.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9adc0ec..9dfb1e0 100644
--- a/Makefile
+++ b/Makefile
@@ -762,14 +762,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
-$(TOPDIR)/configs/%_defconfig:;
-
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
-$(BR2_EXTERNAL)/configs/%_defconfig:;
-
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< \
-- 
1.8.1.2
