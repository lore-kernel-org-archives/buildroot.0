From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:16 +0800
Subject: [Buildroot] [PATCH v3 5/9] boot/arm-trusted-firmware: introduce two
 new options
In-Reply-To: <20191127071720.15623-1-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
Message-ID: <20191127071720.15623-5-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

two new options for arm-trusted-firmware:
1. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
	- for additional targets, E.G. "pbl".
2. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
	- for additional dependencies, E.G. "host-qoriq-rcw"

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
changes since v2:
1. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS.
2. introduce option BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES.
3. rewrite the makefile with these two options

changes since v1:
1. Use option BR2_PACKAGE_HOST_RCW_ATF as the condition for RCW used by ATF.
---
 boot/arm-trusted-firmware/Config.in               | 11 +++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 96861c3f4d..635bda2e86 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -153,4 +153,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
 	  Names of generated image files that are installed in the
 	  output images/ directory.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
+	string "Additional ATF targets options"
+	help
+	  Additional target options for ATF build
+	  E.G. 'pbl'
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
+	string "Additional AFT dependencies"
+	help
+	  Additional dependencies for ATF build, E.G. "host-qoriq-rcw"
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2133d39e6d..2c22d49de5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -92,6 +92,12 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
+	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
+
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += \
+	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
-- 
2.17.1
