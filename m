From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Jan 2021 07:14:37 -0600
Subject: [Buildroot] [PATCH v2] package/uboot-tools: resolve host uboot
 env/script error
Message-ID: <20210126131437.9633-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>

The host build of uboot-tools can occur early in the build process and may
require the creation of BINARIES_DIR before generation of an enabled envimage
and/or boot script binary. So to resolve this in proper way, separated the
build and installation part of uboot env/script in their respective commands.

Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Thomas P
 - Split build and install operations out for script and env features.
   (Allows the install step to take care of the mkdir naturally)
---
 package/uboot-tools/uboot-tools.mk | 50 ++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 10cbd1cdd9..f2bd627e92 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -89,6 +89,8 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
 endef
 
+# host-uboot-tools
+
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
@@ -108,10 +110,6 @@ HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SI
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
 
-define HOST_UBOOT_TOOLS_BUILD_CMDS
-	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
-endef
-
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
 
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
@@ -124,16 +122,7 @@ define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
 		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
 endef
 HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
-endif
-
-define HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE
-	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
-	$(HOST_DIR)/bin/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
-		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
-		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
-		-o $(BINARIES_DIR)/uboot-env.bin \
-		$(UBOOT_TOOLS_GENERATE_ENV_FILE)
-endef
+endif #UBOOT_TOOLS_GENERATE_ENV_FILE:BR2_TARGET_UBOOT
 
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE)),)
@@ -148,6 +137,17 @@ endif
 endif #BR2_TARGET_UBOOT
 endif #BR_BUILDING
 
+define HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE
+	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
+	$(@D)/tools/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
+		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
+		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
+		-o $(@D)/tools/uboot-env.bin \
+		$(UBOOT_TOOLS_GENERATE_ENV_FILE)
+endef
+define HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE
+	$(INSTALL) -m 0755 -D $(@D)/tools/uboot-env.bin $(BINARIES_DIR)/uboot-env.bin
+endef
 endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT),y)
@@ -156,17 +156,29 @@ ifeq ($(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)),)
 $(error Please define a source file for U-Boot boot script (BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE setting))
 endif
 endif #BR_BUILDING
+
+define HOST_UBOOT_TOOLS_GENERATE_BOOT_SCRIPT
+	$(@D)/tools/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
+		-d $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)) \
+		$(@D)/tools/boot.scr)
+endef
+define HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT
+	$(INSTALL) -m 0755 -D $(@D)/tools/boot.scr $(BINARIES_DIR)/boot.scr
+endef
 endif #BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT
 
+define HOST_UBOOT_TOOLS_BUILD_CMDS
+	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
+	$(HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE)
+	$(HOST_UBOOT_TOOLS_GENERATE_BOOT_SCRIPT)
+endef
+
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
-	$(HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE)
-	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT),
-		$(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
-			-d $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE)) \
-			$(BINARIES_DIR)/boot.scr)
+	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
+	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
