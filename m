From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  4 Feb 2015 23:29:39 +0100
Subject: [Buildroot] [PATCH v3 1/3] boot/uboot: pass TARGET_MAKE_ENV to make
	environment, remove TARGET_CONFIGURE_OPTS
Message-ID: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use TARGET_MAKE_ENV instead of TARGET_CONFIGURE_OPTS to set the make
environment. Remove TARGET_CONFIGURE_OPTS since the solely needed make
options are ARCH and CROSS_COMPILE which are set by UBOOT_MAKE_OPTS.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
--- 
Changes v2 -> v3: 
  - Rewrite commit log; clarify why? (Thomas Petazzoni)
Changes v1 -> v2: 
  - Rewrite of commit log
---
 boot/uboot/uboot.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9ba054..d18ad87 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -94,9 +94,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
-		$(UBOOT_BOARD_NAME)_config
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
 	@echo "/* Add a wrapper around the values Buildroot sets. */" >> $(@D)/include/config.h
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(@D)/include/config.h
@@ -113,9 +111,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) 	\
-		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
-		$(UBOOT_MAKE_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) $(UBOOT_MAKE_TARGET)
 endef
 
 define UBOOT_BUILD_OMAP_IFT
-- 
2.2.2
