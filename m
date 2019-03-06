From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed,  6 Mar 2019 11:11:37 +0100
Subject: [Buildroot] [PATCH 3/6] boot/arm-trusted-firmware: support debug
 mode
In-Reply-To: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
References: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
Message-ID: <c71f0c20c25f8803680697e73eb37f0ff3e7439f.1551866509.git.etienne.carriere@linaro.org>
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
index 0f67d10..89d9db3 100644
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
