From: Alistair Francis <alistair.francis@wdc.com>
Date: Tue,  9 Jul 2019 13:04:17 -0700
Subject: [Buildroot] [PATCH 2/2] boot/opensbi: Implement a choice for the
 OpenSBI Platform
In-Reply-To: <20190709200417.8120-1-alistair.francis@wdc.com>
References: <20190709200417.8120-1-alistair.francis@wdc.com>
Message-ID: <20190709200417.8120-2-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of requiring users to look at the OpenSBI source code and
determine the platform string let's use a choice option to allow them to
specify the platform they would like to target. We still allow them to
specify a custom string if they want to.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 boot/opensbi/Config.in              | 25 ++++++++++++++++++++++---
 boot/opensbi/opensbi.mk             | 11 ++++++++++-
 configs/qemu_riscv32_virt_defconfig |  2 +-
 configs/qemu_riscv64_virt_defconfig |  2 +-
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5f3cc13312..997c79f9b0 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -13,13 +13,32 @@ config BR2_TARGET_OPENSBI
 	  https://github.com/riscv/opensbi.git
 
 if BR2_TARGET_OPENSBI
-config BR2_TARGET_OPENSBI_PLAT
-	string "OpenSBI Platform"
-	default ""
+
+choice
+	prompt "OpenSBI Platform"
 	help
 	  Specifies the OpenSBI platform to build. If no platform is
 	  specified only the OpenSBI platform independent static
 	  library libsbi.a is built. If a platform is specified then
 	  the platform specific static library libplatsbi.a and firmware
 	  examples are built.
+
+config BR2_TARGET_OPENSBI_LIBRARY_ONLY
+	bool "Library Only"
+
+config BR2_TARGET_OPENSBI_QEMU_VIRT
+	bool "QEMU Virt"
+
+config BR2_TARGET_OPENSBI_QEMU_SIFIVE_U
+	bool "QEMU SiFive U"
+
+config BR2_TARGET_OPENSBI_CUSTOM_PLATFORM
+	bool "Custom Platform"
+
+endchoice
+
+config BR2_TARGET_OPENSBI_CUSTOM_PLATFORM_VALUE
+	string "OpenSBI Platform String"
+	depends on BR2_TARGET_OPENSBI_CUSTOM_PLATFORM
+
 endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 0008155dea..bf00bdf618 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -14,7 +14,16 @@ OPENSBI_INSTALL_STAGING = YES
 OPENSBI_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS)
 
-OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
+ifeq ($(BR2_TARGET_OPENSBI_LIBRARY_ONLY),y)
+OPENSBI_PLAT = ""
+else ifeq ($(BR2_TARGET_OPENSBI_QEMU_VIRT),y)
+OPENSBI_PLAT = "qemu/virt"
+else ifeq ($(BR2_TARGET_OPENSBI_QEMU_SIFIVE_U),y)
+OPENSBI_PLAT = "qemu/sifive_u"
+else ifeq ($(BR2_TARGET_OPENSBI_CUSTOM_PLATFORM),y)
+OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_PLATFORM_VALUE))
+endif
+
 ifneq ($(OPENSBI_PLAT),)
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
 endif
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index a1a8c5fd20..ebe3e72135 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -24,4 +24,4 @@ BR2_LINUX_KERNEL_IMAGE=y
 # Bootloader
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_USE_PLAT=y
-BR2_TARGET_OPENSBI_PLAT="qemu/virt"
+BR2_TARGET_OPENSBI_QEMU_VIRT=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index c0b1a43925..16e0e332f7 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -23,4 +23,4 @@ BR2_LINUX_KERNEL_IMAGE=y
 # Bootloader
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_USE_PLAT=y
-BR2_TARGET_OPENSBI_PLAT="qemu/virt"
+BR2_TARGET_OPENSBI_QEMU_VIRT=y
-- 
2.22.0
