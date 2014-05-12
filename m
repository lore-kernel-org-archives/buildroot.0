From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Mon, 12 May 2014 16:22:07 +0200
Subject: [Buildroot] [PATCH v3] u-boot: allow to pass a custom configuration
	file
Message-ID: <1399904527-8159-1-git-send-email-eric.jarrige@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE that makes it possible
to override the configuration options in the board header file. This
avoids the need for manipulating the board header file with sed hacks
like is currently done for the BR2_TARGET_UBOOT_NETWORK settings.

Note that this option does not make it possible to add a new board to
U-Boot. That still has to be done by patching the source.

Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
---

Changes v2 -> v3:
 - refactoring based on uClibc/BusyBox model (suggested by Thomas and Arnoult)
 - add missing help text (suggested by Arnoult)
 - copy custom configuration file to legal info (suggested by Yann)
Changes v1 -> v2:
 - Fix typo

 boot/uboot/Config.in |    8 ++++++++
 boot/uboot/uboot.mk  |   18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1c77f6a..299d50f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -79,6 +79,14 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	help
+	  Path to the modified configuration header file. It will be
+	  copied to include/configs/<boardname>.h in the U-Boot sources.
+	  Note that this doesn't allow you to create a custom board,
+	  only to modify some of configuration variables.
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index da67706..1fa3fb9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -94,7 +94,25 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
+UBOOT_CUSTOM_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
+
+ifneq ($(UBOOT_CUSTOM_CONFIG),)
+
+define UBOOT_COPY_CUSTOM_CONFIG_FILE
+	$(INSTALL) -m 0644 $(UBOOT_CUSTOM_CONFIG) \
+		$(@D)/include/configs/$(UBOOT_BOARD_NAME).h;
+endef
+
+define UBOOT_COPY_CUSTOM_CONFIG_FILE_TO_LEGAL_INFO
+	$(INSTALL) -m 0644 $(UBOOT_CUSTOM_CONFIG) \
+		$(REDIST_SOURCES_DIR_TARGET)/$(UBOOT_BOARD_NAME).h;
+endef
+
+UBOOT_POST_LEGAL_INFO_HOOKS += UBOOT_COPY_CUSTOM_CONFIG_FILE_TO_LEGAL_INFO
+endif
+
 define UBOOT_CONFIGURE_CMDS
+	$(UBOOT_COPY_CUSTOM_CONFIG_FILE)
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		$(UBOOT_BOARD_NAME)_config
-- 
1.7.9.5
