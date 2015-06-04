From: Herve Codina <Herve.CODINA@celad.com>
Date: Thu, 4 Jun 2015 10:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] savedefconfig: Remove BR2_DEFCONFIG from
	saved defconfig file
Message-ID: <1433405793-26785-1-git-send-email-Herve.CODINA@celad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_DEFCONFIG should not be present in saved defconfig file.

The use case is:
make qemu_arm_versatile
make savedefconfig BR2_DEFCONFIG=my_custom_defconfig

BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
to qemu_arm_versatile (value present in .config) and set in
my_custom_defconfig as it is different from default mentionned in
config.in (default is BR2_DEFCONFIG from environnement).

On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file

Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 43b5ba5..3c9e6fb 100644
--- a/Makefile
+++ b/Makefile
@@ -777,6 +777,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
+	@sed -i '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
 .PHONY: defconfig savedefconfig
 
-- 
1.7.9.5
