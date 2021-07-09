From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri,  9 Jul 2021 11:49:25 +0200
Subject: [Buildroot] [PATCH 2/2] boot/arm-trusted-firmware: Add
 out-of-source ATF device tree support
In-Reply-To: <20210709094925.1605675-1-kory.maincent@bootlin.com>
References: <20210709094925.1605675-1-kory.maincent@bootlin.com>
Message-ID: <20210709094925.1605675-2-kory.maincent@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly to Uboot, this patch adds the ability to copy in and build
out-of-source device tree sources during an ATF build.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 9 +++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 80f6161597..7bd289137b 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -68,6 +68,15 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	help
 	  Target plaform to build for.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to fdts/ before starting the build.
+
+	  To use this device tree source file, the ATF configuration
+	  file must refer to it.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	bool "Build FIP image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9fc8b51a80..e902c1aca9 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -166,7 +166,12 @@ endif
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS))
 
+ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH))
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
+	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
+		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
+	)
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
 		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
-- 
2.25.1
