From: Changming Huang <jerry.huang@nxp.com>
Date: Fri,  7 Feb 2020 16:38:53 +0800
Subject: [Buildroot] [PATCH v5 5/9] boot/arm-trusted-firmware: allow
 additional make dependencies
In-Reply-To: <20200207083857.28058-1-jerry.huang@nxp.com>
References: <20200207083857.28058-1-jerry.huang@nxp.com>
Message-ID: <20200207083857.28058-5-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow specifying additional build dependencies for ATF.

This might be more useful when using a custom git repository.

For example, when using with the ATF repository from NXP QorIQ,
the qoriq-rcw is used to build the pbl binary image.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
changes since v4:
1. remove the option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS.
2. modify the description.

changes since v3:
no changes.

changes since v2:
1. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS.
2. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES.
3. rewrite the makefile with these two options

changes since v1:
1. Use option BR2_PACKAGE_HOST_RCW_ATF as the condition for RCW used by ATF.
---
 boot/arm-trusted-firmware/Config.in               | 5 +++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 373591d497..c9b74064d7 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -142,6 +142,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
 	  E.G. When using the QorIQ custom ATF repository from NXP,
 	  the target 'pbl' can be used to build the pbl binary.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
+	string "Additional AFT dependencies"
+	help
+	  Additional dependencies for ATF build, E.G. "host-qoriq-rcw"
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index bf1ac46cf6..43be2fef99 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -92,6 +92,9 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += \
+	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
-- 
2.17.1
