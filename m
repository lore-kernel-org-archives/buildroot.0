From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:20 +0100
Subject: [Buildroot] [PATCH v2 1/8] boot/uboot: Remove obsolete
	CONFIG_NOSOFTFLOAT flag
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag seems to be obsolete. There is no piece of code in the U-Boot source
tree referencing CONFIG_NOSOFTFLOAT.

Unfortunatly the use of this flag is not documented here. Maybe it's about this
old workaround:
http://lists.denx.de/pipermail/u-boot/2007-March/020282.html

However, this patch has been declined:
http://www.denx.de/wiki/view/U-Boot/PatchStatus?rev=1.27
  
Since no other configure options are used, remove also UBOOT_CONFIGURE_OPTS.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - Add commit log entry about removing UBOOT_CONFIGURE_OPTS
---
 boot/uboot/uboot.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8ce2fc2..a9ba054 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -58,7 +58,6 @@ endif
 
 UBOOT_ARCH = $(KERNEL_ARCH)
 
-UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
@@ -95,7 +94,7 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		$(UBOOT_BOARD_NAME)_config
 	@echo >> $(@D)/include/config.h
@@ -114,7 +113,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
+	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
-- 
2.2.1
