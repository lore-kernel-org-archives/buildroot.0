From: Drew Fustini <drew@beagleboard.org>
Date: Tue, 15 Jun 2021 22:03:41 -0700
Subject: [Buildroot] [PATCH v2 2/4] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_FW_FDT_PATH
In-Reply-To: <20210616050341.510702-1-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
Message-ID: <20210616050341.510702-3-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If U-Boot CONFIG_OF_SEPARATE is defined [1], then the device tree will
be built and placed in a u-boot.dtb file alongside u-boot.bin.

When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
u-boot.dtb to $(BINARIES_DIR).

This is useful for RISC-V platforms that want to build OpenSBI with an
external DTB by using FW_FDT_PATH [2].

[1] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control
[2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/opensbi/Config.in  | 10 ++++++++++
 boot/opensbi/opensbi.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 632eeec88d77..bd4bd5ee6175 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -109,4 +109,14 @@ config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 	help
 	  Build OpenSBI with the U-Boot as a Payload.
 
+config BR2_TARGET_OPENSBI_FW_FDT_PATH
+	bool "Include U-Boot DTB in OpenSBI Payload"
+	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on BR2_TARGET_UBOOT
+	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
+	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
+	help
+	  Build OpenSBI with FW_FDT_PATH set to $(BINARIES_DIR)/u-boot.dtb
+	  Note that CONFIG_OF_SEPARATE must be set in the u-boot kconfig.
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index a525b8aea348..8e055633a82d 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -46,6 +46,9 @@ endif
 ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
+ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
+OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
+endif
 endif
 
 define OPENSBI_BUILD_CMDS
-- 
2.27.0
