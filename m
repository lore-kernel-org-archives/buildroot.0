From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 00:21:04 +0100
Subject: [Buildroot] [PATCH v2 3/8] boot/arm-trusted-firmware: support debug
 mode
In-Reply-To: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1552951269-16967-3-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the trusted firmware is built with debug support (DEBUG defined),
the generated images are located at a specific path. The non debug
images are located in generated directory build/<platform>/release/
while the debug images are located in generated directory
build/<platform>/debug/.

This change introduces boolean BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
to define whether the release or debug configuration is used to build
trusted firmware. Note that enabling trusted firmware debug support, i.e
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="... DEBUG=1 ..."
without enabling BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG will fail since
Buildroot will get generated files from the wrong path.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
 - No change

---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a1a0c54..9a152b9 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -136,4 +136,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	  Additional parameters for the ATF build
 	  E.G. 'DEBUG=1 LOG_LEVEL=20'
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
+	bool "Debug mode of the trusted firmware"
+	default n
+	help
+	  Enable this directive if trusted firmware is built in debug
+	  mode.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 0ea4c0e..68be00d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -28,7 +28,13 @@ endif
 ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
+
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DEBUG=1
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/debug
+else
 ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
+endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
1.9.1
