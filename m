From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed,  6 May 2020 15:38:44 +0530
Subject: [Buildroot] [PATCH 1/2] uboot: add support for bundling OpenSBI
 FW_DYNAMIC into U-Boot
Message-ID: <20200506100845.4356-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some RISC-V platforms (such as SiFive FU540) have a boot process
where U-Boot encapsulates the FW_DYNAMIC part of the ARM trusted
firmware. For such platforms, we need to build OpenSBI before U-Boot,
and pass a OPENSBI variable pointing to OpenSBI bl31.bin to the
U-Boot build process.

This commit introduces a BR2_TARGET_UBOOT_NEEDS_OPENSBI_FW_DYNAMIC
variable to achieve this.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/uboot/Config.in | 15 +++++++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ffc441d670..670df42c4e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -202,6 +202,21 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 
 endchoice
 
+config BR2_TARGET_UBOOT_NEEDS_OPENSBI_FW_DYNAMIC
+	bool "U-Boot needs OpenSBI fw_dynamic"
+	depends on BR2_TARGET_OPENSBI
+	help
+	  A fw_dynamic firmware is particularly useful when the
+	  booting stage executed prior to OpenSBI firmware is
+	  capable of loading both the OpenSBI firmware and the
+	  booting stage binary to follow OpenSBI firmware.
+
+	  Some RISC-V platforms (such as SiFive FU540) encapsulate
+	  the fw_dynamic part of OpenSBI inside U-Boot. This option
+	  makes sure OpenSBI gets built prior to U-Boot, and that
+	  the OPENSBI variable pointing to OpenSBI's fw_dynamic
+	  binary, is passed during the Buildroot build.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2bfa50779b..f339186b65 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -155,6 +155,11 @@ UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI_FW_DYNAMIC),y)
+UBOOT_DEPENDENCIES += opensbi
+UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
2.17.1
