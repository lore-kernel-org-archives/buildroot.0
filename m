From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:21 +0100
Subject: [Buildroot] [PATCH v2 2/8] boot/uboot: Replace
	TARGET_CONFIGURE_OPTS with TARGET_MAKE_ENV
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use TARGET_MAKE_ENV instead of TARGET_CONFIGURE_OPTS for building the U-Boot
target with 'make <board>_(def)config' and 'make'.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - Rewrite commit log
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
2.2.1
