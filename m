From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 25 Jun 2021 22:33:14 +0300
Subject: [Buildroot] [PATCH v3 1/5] boot/arm-trusted-firmware: enable stack
 protection level selection
In-Reply-To: <20210625193318.635449-1-geomatsi@gmail.com>
References: <20210625193318.635449-1-geomatsi@gmail.com>
Message-ID: <20210625193318.635449-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value based on
the toolchain BR2_SSP_* option. However it might not be always convenient
to automatically infer TF-A stack protection from the toolchian features.
For instance, secure memory constraints may become an issue and all the
extra TF-A features need to be tuned or disabled in order to shrink
TF-A firmware image.

Besides, for any values other than "none", TF-A platform specific hook
'plat_get_stack_protector_canary' should be implemented. However this
hook is not implemented by all the platforms supported by TF-A. For
instance, allwinner currently does not provide such a hook.

Add choice menu to TF-A Config.in to enable selection of the
appropriate stack protection level.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 boot/arm-trusted-firmware/Config.in           | 26 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   |  8 +++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a5a8c5bfc3..5cdb0c37fd 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -188,4 +188,30 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
 
+choice
+        prompt "TF-A GCC stack protection"
+        help
+          Select TF-A GCC stack protection. This feature requires
+          support from both toolchain and TF-A platform specific
+          layer. Namely, for all values other than 'none' the
+          plat_get_stack_protector_canary() platform hook needs
+          to be implemented.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_NONE
+        bool "none"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_DEFAULT
+        bool "default"
+        depends on BR2_SSP_REGULAR
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_STRONG
+        bool "strong"
+        depends on BR2_SSP_STRONG
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_ALL
+        bool "all"
+        depends on BR2_SSP_ALL
+
+endchoice
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 279658712b..9b00672aa6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -109,11 +109,13 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_NONE),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=none
+else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_DEFAULT),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
-else ifeq ($(BR2_SSP_STRONG),y)
+else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_STRONG),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
-else ifeq ($(BR2_SSP_ALL),y)
+else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_ALL),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
 endif
 
-- 
2.32.0
