From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Oct 2020 23:37:48 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_BOOT_SCRIPT from U-Boot pkg
Message-ID: <20201006212728.5B0A581898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db2b6841263c3062fa1661dcfda3110415779fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistancy and dependencies between uboot and uboot-tools,
this patch migrates the script creation over in a similar way as
the env image creation.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                   | 18 ++++++++++++++++++
 boot/uboot/Config.in               | 16 ----------------
 boot/uboot/uboot.mk                | 13 -------------
 package/uboot-tools/Config.in.host | 17 +++++++++++++++++
 package/uboot-tools/uboot-tools.mk | 12 ++++++++++++
 5 files changed, 47 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d39f50a800..95c2fb33b3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_TARGET_UBOOT_BOOT_SCRIPT
+	bool "u-boot script generation was moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
+	help
+	  Migrated U-Boot script generation to uboot-tools
+
+# Note: BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE is still referenced from
+# package/uboot-tools/Config.in
+config BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE
+	string "The uboot script source string has been renamed"
+	depends on BR2_TARGET_UBOOT_BOOT_SCRIPT
+	help
+	  Migrated U-Boot script generation to uboot-tools.
+	  New option is named
+	  BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE
+
 config BR2_TARGET_UBOOT_ENVIMAGE
 	bool "u-boot env generation was moved"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2bda0619a4..9e44daffab 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -533,22 +533,6 @@ config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	  In either case the resulting file will be given a .crc
 	  extension.
 
-config BR2_TARGET_UBOOT_BOOT_SCRIPT
-	bool "Generate a U-Boot boot script"
-	help
-	  Generate a U-Boot boot script, given a file listing U-Boot
-	  commands to be executed at boot time. The generated boot
-	  script will be called 'boot.scr'.
-
-if BR2_TARGET_UBOOT_BOOT_SCRIPT
-
-config BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE
-	string "U-Boot boot script source"
-	help
-	  Source file to generate the U-Boot boot script.
-
-endif
-
 if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 
 config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9dbd06b64b..f27abbd5ba 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -323,10 +323,6 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
 		)
 	)
-	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
-		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
-			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
-			$(BINARIES_DIR)/boot.scr)
 endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
@@ -427,15 +423,6 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
 endef
 
-ifeq ($(BR2_TARGET_UBOOT_BOOT_SCRIPT),y)
-ifeq ($(BR_BUILDING),y)
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)),)
-$(error Please define a source file for U-Boot boot script (BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE setting))
-endif
-endif
-UBOOT_DEPENDENCIES += host-uboot-tools
-endif
-
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
 
 #
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index a10835c589..431cc8631d 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -91,4 +91,21 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
 
 endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
+	bool "Generate a U-Boot boot script"
+	help
+	  Generate a U-Boot boot script, given a file listing U-Boot
+	  commands to be executed at boot time. The generated boot
+	  script will be called 'boot.scr'.
+
+if BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
+
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE
+	string "U-Boot boot script source"
+	default BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE if BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE != "" # legacy
+	help
+	  Source file to generate the U-Boot boot script.
+
+endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
+
 endif # BR2_PACKAGE_HOST_UBOOT_TOOLS
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f4480aa585..6aa7cba2dd 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -148,11 +148,23 @@ endif #BR_BUILDING
 
 endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT),y)
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)),)
+$(error Please define a source file for U-Boot boot script (BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE setting))
+endif
+endif #BR_BUILDING
+endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
+
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE)
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT),
+		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
+			-d $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)) \
+			$(BINARIES_DIR)/boot.scr)
 endef
 
 $(eval $(generic-package))
