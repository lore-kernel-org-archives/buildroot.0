From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu,  1 May 2014 14:32:10 -0500
Subject: [Buildroot] [PATCH 2/3] uboot: separate out OMAP options and
	definitions
In-Reply-To: <1398972731-20680-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1398972731-20680-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1398972731-20680-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In preparation for the introduction of Freescale PowerPC specific
U-Boot handling which is quite large, it makes sense to extract from
the main uboot.mk and the main U-Boot Config.in the highly
platform-specific options and definitions, and put them in separate
files.

Therefore, this commit starts to do so for the OMAP-specific bits. The
solution chosen for this split is:

   boot/uboot/Config.in.<platform>
   boot/uboot/uboot.mk.<platform>

The justifications for this choice are:

 * Naming the files as Config.<platform>.in and uboot-<platform>.mk
   and placing them directly in boot/uboot/ doesn't work, because
   boot/common.mk is including all boot/*/*.mk, but we want
   boot/uboot/uboot.mk to itself handle *when* its uboot-<platform>.mk
   files are included, as they need to be included before the
   $(generic-package) call.

 * Placing the platform specific bits in a subdirectory as
   boot/uboot/<platform>/uboot-<platform>.mk does not work because the
   rule generation for uboot will not work when the call to
   $(eval $(generic-package)) is made. This is because the rules names
   are based on the _last_ Makefile that was parsed. The _last_ Makefile
   parse will then be one of the last platform subdirectories. The rules
   for uboot then become <platform> which is not what we want. For more
   detailed information please see this email from the mailing list:

   http://lists.busybox.net/pipermail/buildroot/2014-April/095476.html

 * We need to have a different file extension than just .mk otherwise
   the first point comes into effect and the easiest way around this is
   to add the platform at the end for the extension.

[ryan: fixed the issues with including of the platform makefiles]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
CC: Yann E. MORIN <yann.morin.1998@free.fr>

---

Please offer different suggestions for the naming of the platform
specific files. One other option that I thought of is to name the files
as uboot-<platform>.mak but I guess I preferred my name convention.
Regardless the best way to work around the problems I outlined below is
to have a different extentions than just .mk for moving the rules outside
of the main uboot.mk file.
---
 boot/uboot/Config.in          | 32 +-------------------------------
 boot/uboot/Config.in.arm-omap | 31 +++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk           | 26 ++------------------------
 boot/uboot/uboot.mk.arm-omap  | 29 +++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 55 deletions(-)
 create mode 100644 boot/uboot/Config.in.arm-omap
 create mode 100644 boot/uboot/uboot.mk.arm-omap

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 90437b5..757ba8d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -135,37 +135,7 @@ config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
 	  U-Boot, if it is not one of the default names. For example:
 	  u-boot_magic.bin
 
-config BR2_TARGET_UBOOT_OMAP_IFT
-	depends on BR2_TARGET_UBOOT_FORMAT_BIN
-	depends on BR2_arm || BR2_armeb
-	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
-	bool "produce a .ift signed image (OMAP)"
-	help
-	  Use gpsign to produce an image of u-boot.bin signed with
-	  a Configuration Header for booting on OMAP processors.
-	  This allows U-Boot to boot without the need for an
-	  intermediate bootloader (e.g. x-loader) if it is written
-	  on the first sector of the boot medium.
-	  This only works for some media, such as NAND. Check your
-	  chip documentation for details. You might also want to
-	  read the documentation of gpsign, the tool that generates
-	  the .ift image, at:
-	  https://github.com/nmenon/omap-u-boot-utils/blob/master/README
-
-if BR2_TARGET_UBOOT_OMAP_IFT
-
-config BR2_TARGET_UBOOT_OMAP_IFT_CONFIG
-	string "gpsign Configuration Header config file"
-	help
-	  The Configuration Header (CH) config file defines the
-	  desired content of the CH for the signed image.
-	  It usually contains external RAM settings and
-	  possibly other external devices initialization.
-	  The omap-u-boot-utils software contains example
-	  configuration files for some boards:
-	  https://github.com/nmenon/omap-u-boot-utils/tree/master/configs
-
-endif
+source "boot/uboot/Config.in.arm-omap"
 
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Custom Network Settings"
diff --git a/boot/uboot/Config.in.arm-omap b/boot/uboot/Config.in.arm-omap
new file mode 100644
index 0000000..71bd514
--- /dev/null
+++ b/boot/uboot/Config.in.arm-omap
@@ -0,0 +1,31 @@
+config BR2_TARGET_UBOOT_OMAP_IFT
+	depends on BR2_TARGET_UBOOT_FORMAT_BIN
+	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
+	bool "produce a .ift signed image (OMAP)"
+	help
+	  Use gpsign to produce an image of u-boot.bin signed with
+	  a Configuration Header for booting on OMAP processors.
+	  This allows U-Boot to boot without the need for an
+	  intermediate bootloader (e.g. x-loader) if it is written
+	  on the first sector of the boot medium.
+	  This only works for some media, such as NAND. Check your
+	  chip documentation for details. You might also want to
+	  read the documentation of gpsign, the tool that generates
+	  the .ift image, at:
+	  https://github.com/nmenon/omap-u-boot-utils/blob/master/README
+
+if BR2_TARGET_UBOOT_OMAP_IFT
+
+config BR2_TARGET_UBOOT_OMAP_IFT_CONFIG
+	string "gpsign Configuration Header config file"
+	help
+	  The Configuration Header (CH) config file defines the
+	  desired content of the CH for the signed image.
+	  It usually contains external RAM settings and
+	  possibly other external devices initialization.
+	  The omap-u-boot-utils software contains example
+	  configuration files for some boards:
+	  https://github.com/nmenon/omap-u-boot-utils/tree/master/configs
+
+endif
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index da67706..49c9638 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -119,11 +119,6 @@ define UBOOT_BUILD_CMDS
 		$(UBOOT_MAKE_TARGET)
 endef
 
-define UBOOT_BUILD_OMAP_IFT
-	$(HOST_DIR)/usr/bin/gpsign -f $(@D)/u-boot.bin \
-		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
-endef
-
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_SPL),
@@ -134,25 +129,6 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
 
-define UBOOT_INSTALL_OMAP_IFT_IMAGE
-	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
-endef
-
-ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
-# we NEED a config file unless we're at make source
-ifeq ($(filter source,$(MAKECMDGOALS)),)
-ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG)),)
-$(error No gpsign config file. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
-endif
-ifeq ($(wildcard $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))),)
-$(error gpsign config file $(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG) not found. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
-endif
-endif
-UBOOT_DEPENDENCIES += host-omap-u-boot-utils
-UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
-UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 # we NEED a environment settings unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
@@ -166,6 +142,8 @@ endif
 UBOOT_DEPENDENCIES += host-uboot-tools
 endif
 
+include $(sort $(wildcard boot/uboot/uboot.mk.*))
+
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
diff --git a/boot/uboot/uboot.mk.arm-omap b/boot/uboot/uboot.mk.arm-omap
new file mode 100644
index 0000000..7f0fb57
--- /dev/null
+++ b/boot/uboot/uboot.mk.arm-omap
@@ -0,0 +1,29 @@
+################################################################################
+#
+# uboot-arm-omap
+#
+################################################################################
+
+define UBOOT_BUILD_OMAP_IFT
+	$(HOST_DIR)/usr/bin/gpsign -f $(@D)/u-boot.bin \
+		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
+endef
+
+define UBOOT_INSTALL_OMAP_IFT_IMAGE
+	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
+endef
+
+ifeq ($(BR2_TARGET_UBOOT_OMAP_IFT),y)
+# we NEED a config file unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG)),)
+$(error No gpsign config file. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
+endif
+ifeq ($(wildcard $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))),)
+$(error gpsign config file $(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG) not found. Check your BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting)
+endif
+endif
+UBOOT_DEPENDENCIES += host-omap-u-boot-utils
+UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
+endif
-- 
1.9.0
