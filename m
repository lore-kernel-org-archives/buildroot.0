From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 17:10:25 +0200
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add SSP option
Message-ID: <20210626144011.82B4C8113D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf176128ec4ad60c29c8828cab1887f69edb9473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value based
on the toolchain global BR2_SSP_* options, and all packages are built
with that setting.

However it might not be always convenient to automatically infer TF-A
stack protection from the toolchain features. For instance, secure
memory constraints may become an issue and all the extra TF-A features
need to be tuned or disabled in order to shrink TF-A firmware image.

Besides, for any value other than "none", TF-A platform specific hook
'plat_get_stack_protector_canary' must be implemented. However this hook
is not implemented by all the platforms supported by TF-A. For instance,
Allwinner currently does not provide such a hook.

Add an new option that a user can toggle to enable or disable SSP in
their ATF build. If enabled, the SSP level is automatically inherited
from the global setting.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998 at free.fr: simplify logic with a single boolean]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/Config.in               | 21 +++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 11 ++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a5a8c5bfc3..981873fce5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -188,4 +188,25 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
+	bool "Build with SSP"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on !BR2_SSP_NONE
+	default y
+	help
+	  Say 'y' here if you want to build ATF with SSP.
+
+	  Your board must have SSP support in ATF: it must have an
+	  implementation for plat_get_stack_protector_canary().
+
+	  If you say 'y', the SSP level will be the level selected
+	  by the global SSP setting.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL
+	string
+	default "none"    if !BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
+	default "default" if BR2_SSP_REGULAR
+	default "strong"  if BR2_SSP_STRONG
+	default "all"     if BR2_SSP_ALL
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 279658712b..1f08f5dabb 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -51,7 +51,8 @@ endif
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
@@ -109,14 +110,6 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
-else ifeq ($(BR2_SSP_STRONG),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
-else ifeq ($(BR2_SSP_ALL),y)
-ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
-endif
-
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
