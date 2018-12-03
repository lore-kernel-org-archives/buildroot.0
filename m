From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:55:44 +0100
Subject: [Buildroot] [git commit] package/sunxi-tools: support all tools
Message-ID: <20181203215831.BC866887CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f6d8564dab4ed8d4319795b712334e4d1a7813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows to select the installation of additional commands
which are part of the sunxi-tools. It's now possible to e.g. install
sunxi-fel on the target device. The corresponding options have been
added to Config.in and sunxi-tools.mk has been modified respectively.
The default setting is to only build sunxi-nand-part.

On the host building of the misc-tools target is added, which provides
sunxi-nand-image-builder and phoenix_info.

Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
[Thomas:
 - properly format Config.in
 - do not select BR2_PACKAGE_HOST_LIBUSB in Config.in.host, since this
   option doesn't exist
 - properly indent code in sunxi-tools.mk]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-tools/Config.in      | 68 +++++++++++++++++++++++++++++++++++---
 package/sunxi-tools/sunxi-tools.mk | 45 ++++++++++++++++++++-----
 2 files changed, 100 insertions(+), 13 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 02eba95612..80a7130a92 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -1,9 +1,69 @@
 config BR2_PACKAGE_SUNXI_TOOLS
-	bool "sunxi nand-part"
+	bool "sunxi-tools"
 	depends on BR2_arm
 	help
-	  nand-part is part of sunxi-tools for Allwinner A10 (aka
-	  sun4i) and A13 (aka sun5i) based devices. It is a tool to
-	  repartition the internal NAND on sunxi devices.
+	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
+	  based devices.
 
 	  http://linux-sunxi.org/Sunxi-tools
+
+if BR2_PACKAGE_SUNXI_TOOLS
+
+config BR2_PACKAGE_SUNXI_TOOLS_FEXC
+	bool "sunxi-fexc (fex2bin & bin2fex)"
+	help
+	  Convert between .fex board definition files and binary
+	  format. These tools are specific for the linux-sunxi kernel
+	  and do not apply to the mainline Linux kernel version.
+
+config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
+	bool "sunxi-bootinfo"
+	help
+	  Displays information about sunxi boot code.
+
+config BR2_PACKAGE_SUNXI_TOOLS_FEL
+	bool "sunxi-fel"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  The sunxi-fel command can interact with a sunxi device in
+	  fel mode. This allows do download code to memory and execute
+	  it.
+
+comment "sunxi-fel needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
+	bool "sunxi-nand-part"
+	default y
+	help
+	  The sunxi-nand-part command allows to repartition the internal
+	  NAND on sunxi devices.
+
+config BR2_PACKAGE_SUNXI_TOOLS_PIO
+	bool "sunxi-pio"
+	help
+	  GPIO manipulation tool for sunxi boards.
+
+config BR2_PACKAGE_SUNXI_TOOLS_MEMINFO
+	bool "sunxi-meminfo"
+	help
+	  Utility to retrieve DRAM information from registers on
+	  Allwinner SoCs. Specific for the linux-sunxi kernel - does
+	  not apply to the mainline Linux kernel version.
+
+config BR2_PACKAGE_SUNXI_TOOLS_PHOENIX_INFO
+	bool "phoenix_info"
+	help
+	  Display information about self-installing SD card images
+	  (created with Phoenix Card).
+
+	  https://linux-sunxi.org/PhoenixCard
+
+config BR2_PACKAGE_SUNXI_TOOLS_NAND_IMAGE_BUILDER
+	bool "sunxi-nand-image-builder"
+	help
+	  Creates a raw NAND image that can be read by the sunxi NAND
+	  controller.
+
+endif # BR2_PACKAGE_SUNXI_TOOLS
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 3a44cf6fdd..ee590fb95c 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -11,25 +11,52 @@ SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/bin/fex2bin
 
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_FEXC) += sunxi-fexc
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO) += sunxi-bootinfo
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_FEL) += sunxi-fel
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_NAND_PART) += sunxi-nand-part
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_PIO) += sunxi-pio
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_MEMINFO) += sunxi-meminfo
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_PHOENIX_INFO) += phoenix_info
+SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_NAND_IMAGE_BUILDER) += \
+	sunxi-nand-image-builder
+
+ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEXC),y)
+SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
+endif
+
+ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
+SUNXI_TOOLS_DEPENDENCIES += libusb host-pkgconf
+endif
+
 define HOST_SUNXI_TOOLS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) CC="$(HOSTCC)" PREFIX=$(HOST_DIR) \
-		EXTRA_CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		-C $(@D) tools
+	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
+		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) tools misc
 endef
 
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) PREFIX=$(HOST_DIR) \
-		-C $(@D) install-tools
+	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
+		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)"  -C $(@D) install-tools install-misc
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" PREFIX=/usr \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) sunxi-nand-part
+	$(foreach t,$(SUNXI_TOOLS_TARGETS_y), \
+		$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" \
+			CC="$(TARGET_CC)" PREFIX=/usr \
+			EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+			LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) $(t)
+	)
 endef
 
 define SUNXI_TOOLS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/sunxi-nand-part $(TARGET_DIR)/usr/bin/sunxi-nand-part
+	$(foreach t,$(SUNXI_TOOLS_TARGETS_y), \
+		$(INSTALL) -D -m 0755 $(@D)/$(t) $(TARGET_DIR)/usr/bin/$(t)
+	)
+	$(foreach t,$(SUNXI_TOOLS_FEXC_LINKS), \
+		ln -nfs sunxi-fexc $(TARGET_DIR)/usr/bin/$(t)
+	)
 endef
 
 $(eval $(generic-package))
