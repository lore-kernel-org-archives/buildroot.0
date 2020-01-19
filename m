From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Date: Sun, 19 Jan 2020 01:28:05 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for bundling TEE in
 ELF format into U-Boot
Message-ID: <20200119002805.2103-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some U-Boot platforms (e.g. rockchip) can bundle OPTEE's tee.elf
into the U-Boot image. This patch brings the necessary changes to
enable this feature.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
---
 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ffc441d670..1c1ab3907a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -202,6 +202,16 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 
 endchoice
 
+config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
+	bool "U-Boot needs OPTEE TEE"
+	depends on BR2_TARGET_OPTEE_OS_CORE
+	help
+	  Some platforms (such as Rockchip) encapsulate the TEE
+	  inside U-Boot. This option makes sure optee-os gets
+	  built prior to U-Boot, and that the TEE variable
+	  pointing to OPTEE's tee.elf, is passed during the
+	  Buildroot build.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a4879bb8b2..8dc932def6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -150,6 +150,11 @@ UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
+UBOOT_DEPENDENCIES += optee-os
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
2.11.0
