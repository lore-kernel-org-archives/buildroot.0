From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Oct 2013 10:24:26 -0500
Subject: [Buildroot] [RFC 2/2] uboot: introduce u-boot.pbl format
In-Reply-To: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1382628266-22635-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces support for the u-boot.pbl image format. The
u-boot.pbl is a special U-Boot image that supports booting directly
from eSPI FLASH, SD/MMC and NAND, etc for Freescale's CoreNet SoC's.
These SoCs use PBL (Pre-Boot Loader) to load RCW (Reset Configuration
Word) and/or pre-initialization instructions (PBI). For more details
refer section 5 Pre-boot loader specifications of reference manual
P2040RM/P3041RM/P4080RM/P5020RM at link:

http://www.freescale.com/webapp/search/Serp.jsp?Reference+Manuals

In details, this commit:

 * Introduces the BR2_TARGET_UBOOT_FORMAT_PBL menuconfig option which
   will generate a u-boot.pbl image.

 * Allows customization of the PBL through the use of menuconfig
   options - BR2_TARGET_UBOOT_PBL_CUSTOM and it sub-options. The two
   file formats that are support for customizing these files are the
   '.cfg' format which is specified by docs/README.pblimage in the
   u-boot source - BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE and
   BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE -  and a 'Hex String' file
   which has been exported from  Freescales's Processor Expert tool
   (PE Tool) - BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE.

 * Allows for the generatation of an RCW.bin file that can be used
   with a u-boot.bin file for NOR based booting configuration. A
   custom PBL configuration must be specified via
   BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 boot/uboot/Config.in |   94 +++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  114 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a20d06..cc4ba64 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -108,6 +108,18 @@ config BR2_TARGET_UBOOT_FORMAT_SB
 	depends on BR2_arm
 	bool "u-boot.sb"
 
+config BR2_TARGET_UBOOT_FORMAT_PBL
+	depends on BR2_powerpc_e500mc
+	bool "u-boot.pbl"
+	help
+	  PBL (Pre-Boot Loader) is the first stage bootloader for
+	  Freescale QorIQ processors. The u-boot.pbl (RCW+PBI+UBOOT)
+	  gives the ability for the PBL to boot from a non-NOR flash
+	  configuration.
+
+	  Refer to doc/README.pblimage in the u-boot source for
+	  more details.
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
@@ -221,6 +233,88 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  u-boot build. For most platform it is u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
+config BR2_TARGET_UBOOT_RCW_BIN
+	bool "Generate Freescale RCW Binary"
+	depends on BR2_TARGET_UBOOT_FORMAT_BIN
+	depends on BR2_powerpc_e500mc
+	# Must specify the custom config files to generate a RCW.bin
+	select BR2_TARGET_UBOOT_PBL_CUSTOM
+	help
+	  Generate a Reset Configuration Word (RCW) binary file
+	  for Freescale's QorIQ series of processors. Check your
+	  chips documentation for details.
+
+	  The RCW and the Pre-Boot Loader instructions will be
+	  generated as a stand-alone binary file - RCW.bin. This
+	  format is used for NOR flash booting.
+
+	  See the buildroot manual for more information on
+	  Freescale's PBL support in buildroot.
+
+menuconfig BR2_TARGET_UBOOT_PBL_CUSTOM
+	bool "Freescale PBL Custom Configuration"
+	depends on BR2_TARGET_UBOOT_FORMAT_PBL || BR2_TARGET_UBOOT_RCW_BIN
+	help
+	  Use custom configuration files to produce an image of
+	  u-boot.pbl or PBL.bin for Freescale's QorIQ series of
+	  processors that contains the RCW and the Pre-Boot Loader
+	  instructions.
+
+	  See the buildroot manual for more information on
+	  Freescale's PBL support in buildroot.
+
+if BR2_TARGET_UBOOT_PBL_CUSTOM
+
+choice
+	prompt "Custom PBL Config Input Type"
+	default BR2_TARGET_UBOOT_PBL_CUST_FORMAT_PETOOL
+
+config BR2_TARGET_UBOOT_PBL_CUST_FORMAT_PETOOL
+	bool "Use Freescale PE Tool File Format"
+	help
+	  Freescale PBL configuration from an exported file from
+	  Freescale's Processor Expert Tool in the 'Hex String'
+	  format.
+
+config BR2_TARGET_UBOOT_PBL_CUST_FORMAT_UBOOT
+	bool "Use U-Boot PBL Config Format"
+	depends on BR2_TARGET_UBOOT_FORMAT_PBL
+	help
+	  Freescale PBL configuration done using a rcw.cfg and
+	  pbi.cfg files. The format of these files is explained
+	  by docs/README.pblimage in the U-Boot source.
+
+endchoice
+
+config BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE
+	string "Custom PE Tool Hex String File"
+	depends on BR2_TARGET_UBOOT_PBL_CUST_FORMAT_PETOOL
+	help
+	  Specify a custom Freescale Processor Expert exported
+	  hex string file. Please see the buildroot manual and
+	  Freescale's QorIQ Configuration Suite documentation
+	  for more information on how to export this file type.
+
+config BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE
+	string "Custom RCW.cfg File"
+	depends on BR2_TARGET_UBOOT_PBL_CUST_FORMAT_UBOOT
+	help
+	  The Reset Configuration Word config file - rcw.cfg
+
+	  See docs/README.pblimage for more informatin on the
+	  format of this file.
+
+config BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE
+	string "Custom PBI.cfg File"
+	depends on BR2_TARGET_UBOOT_PBL_CUST_FORMAT_UBOOT
+	help
+	  The Pre-Boot Loader Instructions config file - pbi.cfg
+
+	  See docs/README.pblimage for more informatin on the
+	  format of this file.
+
+endif # BR2_TARGET_UBOOT_PBL_CUSTOM
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dc8e26f..f4a4001 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -46,6 +46,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
 UBOOT_BIN          = u-boot.sb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 UBOOT_DEPENDENCIES += host-elftosb
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_PBL),y)
+UBOOT_BIN          = u-boot.pbl
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
@@ -139,6 +142,117 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
+# Handling for the customization of the PBL file format.
+ifeq ($(BR2_TARGET_UBOOT_PBL_CUSTOM),y)
+# qstrip versions of menuconfig options
+UBOOT_CUST_RCW_FILE    = $(call qstrip,$(BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE))
+UBOOT_CUST_PBI_FILE    = $(call qstrip,$(BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE))
+UBOOT_CUST_PETOOL_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE))
+
+# Temporary location of the PBL configuration files
+UBOOT_PBLRCW_FILE = $(@D)/rcw.cfg
+UBOOT_PBLPBI_FILE = $(@D)/pbi.cfg
+UBOOT_RCWBIN_FILE = $(@D)/RCW.bin
+
+# Handle custom u-boot pbl config files
+ifeq ($(BR2_TARGET_UBOOT_PBL_CUST_FORMAT_UBOOT),y)
+
+# we NEED config files unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(UBOOT_CUST_RCW_FILE),)
+$(error No rcw.cfg config file. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE setting)
+endif
+ifeq ($(wildcard $(UBOOT_CUST_RCW_FILE)),)
+$(error rcw.cfg config file $(BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE) not found. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_RCW_FILE setting)
+endif
+ifeq ($(UBOOT_CUST_PBI_FILE),)
+$(error No pbi.cfg config file. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE setting)
+endif
+ifeq ($(wildcard $(UBOOT_CUST_PBI_FILE)),)
+$(error pbi.cfg config file $(BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE) not found. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_PBI_FILE setting)
+endif
+endif # MAKECMDGOALS
+
+# Copy the specified configuration files to holding location
+define UBOOT_CONFIGURE_COPY_CUST_FILES
+	@$(call MESSAGE,"Pre-Configure Hook: Copy Custom PBL Configs")
+	cp -dpf "$(UBOOT_CUST_RCW_FILE)" "$(UBOOT_PBLRCW_FILE)"
+	cp -dpf "$(UBOOT_CUST_PBI_FILE)" "$(UBOOT_PBLPBI_FILE)"
+endef
+UBOOT_PRE_CONFIGURE_HOOKS += UBOOT_CONFIGURE_COPY_CUST_FILES
+endif # BR2_TARGET_UBOOT_PBL_CUST_FORMAT_UBOOT
+
+# Handle custom PBL config file from PE Tool
+ifeq ($(BR2_TARGET_UBOOT_PBL_CUST_FORMAT_PETOOL),y)
+
+# we NEED config file unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(UBOOT_CUST_PETOOL_FILE),)
+$(error No PE Tool config file. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE setting)
+endif
+ifeq ($(wildcard $(UBOOT_CUST_PETOOL_FILE)),)
+$(error PE Tool config file $(BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE) not found. Check your BR2_TARGET_UBOOT_PBL_CUSTOM_PE_TOOL_FILE setting)
+endif
+endif # MAKECMDGOALS
+
+# Generate U-Boot PBL config file format from PE Tool Config
+define UBOOT_CONFIGURE_GEN_UBOOT_PBL_CONFIG
+	@$(call MESSAGE,"Pre-Configure Hook: Generate U-Boot PBL Config from PE Tool")
+	@# Extracting the first 144 bytes as they are the RCW
+	cat "$(UBOOT_CUST_PETOOL_FILE)" | sed '/^$$/d' | cut -c 1-144 | \
+		sed 's/\(.\{8\}\)/\1 /g' > $(UBOOT_PBLRCW_FILE)
+	@# The next bytes are the Pre-Boot Initialization commands which
+	@# start at the after byte 144. However, the HEX string contains
+	@# a checksum at the end (16 characters) + 1 line feed char, remove
+	@# them and what is left are the PBI commands.
+	pbi=$$(cat "$(UBOOT_CUST_PETOOL_FILE)" | sed '/^$$/d' | cut -c 145- | \
+		sed 's/.\{17\}$$//' | sed 's/\(.\{8\}\)/\1 /g'); \
+	if [ ! -z "$$pbi" ]; then \
+		echo $$pbi > $(UBOOT_PBLPBI_FILE); \
+	else \
+		rm -f $(UBOOT_PBLPBI_FILE); \
+		touch $(UBOOT_PBLPBI_FILE); \
+	fi
+endef # UBOOT_CONFIGURE_GEN_UBOOT_PBL_CONFIG
+UBOOT_PRE_CONFIGURE_HOOKS += UBOOT_CONFIGURE_GEN_UBOOT_PBL_CONFIG
+
+endif # BR2_TARGET_UBOOT_PBL_CUST_FORMAT_PETOOL
+
+# Insert custom config files to to config.h since u-boot.pbl is used
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_PBL),y)
+# We need to have u-boot use our custom PBL config files
+define UBOOT_CONFIGURE_PBL_CUST_FILE
+	@$(call MESSAGE,"Post-Configure Hook: Add new PBL config files")
+	$(call insert_define,CONFIG_PBLPBI_CONFIG,$(UBOOT_PBLPBI_FILE))
+	$(call insert_define,CONFIG_PBLRCW_CONFIG,$(UBOOT_PBLRCW_FILE))
+endef
+UBOOT_POST_CONFIGURE_HOOKS += UBOOT_CONFIGURE_PBL_CUST_FILE
+endif # BR2_TARGET_UBOOT_FORMAT_PBL
+
+# Handling the building of the RCW.bin (seperate from u-boot)
+ifeq ($(BR2_TARGET_UBOOT_RCW_BIN),y)
+
+# Build RCW.bin
+# The assumption can be made that the configuraiton file type
+# will be in the PE Tool format since menuconfig restricts this
+define UBOOT_BUILD_RCW_BIN
+	@$(call MESSAGE, "Post-Build Hook: Generate RCW.bin")
+	cat "$(UBOOT_CUST_PETOOL_FILE)" | \
+		 $(HOST_DIR)/usr/bin/xxd -r -p > $(UBOOT_RCWBIN_FILE)
+endef
+UBOOT_DEPENDENCIES += host-xxd
+UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_RCW_BIN
+
+# Install the RCW.bin to binaries dir
+define UBOOT_INSTALL_PBL_BIN
+	$(INSTALL) -D -m 0644 $(UBOOT_RCWBIN_FILE) $(BINARIES_DIR)/RCW.bin
+endef
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_PBL_BIN
+
+endif # BR2_TARGET_UBOOT_RCW_BIN
+
+endif # BR2_TARGET_UBOOT_PBL_CUSTOM
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 # we NEED a environment settings unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-- 
1.7.1
