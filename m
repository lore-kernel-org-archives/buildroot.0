From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  9 Jun 2021 22:59:36 +0300
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option to
 disable stack protection
In-Reply-To: <20210609200003.2866122-1-geomatsi@gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
Message-ID: <20210609200003.2866122-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default value for ATF build flag  ENABLE_STACK_PROTECTOR is "none".
Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value
based on the enabled BR2_SSP_* options. For any values other than
"none", ATF platform specific hook 'plat_get_stack_protector_canary'
should be implemented. However this hook is not implemented by all
the platforms supported by ATF. For instance, allwinner does not
provide such a hook.

Add new option BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP to disable
GCC stack protecton when selected ATF platform does not provide
support for this feature.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a5a8c5bfc3..ba371986d8 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -188,4 +188,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
+	bool "Disable stack protection"
+	help
+	  Select this option to explicitly disable stack protection checks in GCC.
+	  Such checks need to be disabled if ATF platform port does not implement
+	  plat_get_stack_protector_canary() hook.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 279658712b..00d20aac94 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -109,6 +109,9 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=none
+else
 ifeq ($(BR2_SSP_REGULAR),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
 else ifeq ($(BR2_SSP_STRONG),y)
@@ -116,6 +119,7 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
 else ifeq ($(BR2_SSP_ALL),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
 endif
+endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
-- 
2.31.1
