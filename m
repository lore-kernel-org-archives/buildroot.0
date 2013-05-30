From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 30 May 2013 15:57:40 +0200
Subject: [Buildroot] [PATCH] Makefile: defconfig: use BR2_DEFCONFIG only
	when the file exists
Message-ID: <1369922260-8237-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is to be able to use "make defconfig" even when BR2_DEFCONFIG has
a filename that does not exist or use the default value that
does not exists.

Example on a clean installation, without a "./defconfig":
   make defconfig
   make defconfig

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e8647d1..57bf8b3 100644
--- a/Makefile
+++ b/Makefile
@@ -698,7 +698,7 @@ olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(wildcard $(DEFCONFIG)),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.8.1.4
