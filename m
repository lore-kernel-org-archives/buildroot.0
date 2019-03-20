From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:57:12 +0100
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: support debug
 mode
Message-ID: <20190320215407.0196382B3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afd6ee3fb19c37c72d69b615d1bc342af4fc433a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the trusted firmware is built with debug support (DEBUG defined),
the generated images are located in a different path compared to a
build without debug support. The non debug images are located in
generated directory build/<platform>/release/ while the debug images
are located in generated directory build/<platform>/debug/.

This change introduces the boolean option
BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG to define whether the release or
debug configuration is used to build trusted firmware.

Note that enabling trusted firmware debug support using
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="... DEBUG=1 ..."
would not work since Buildroot will try to copy the generated files
from the wrong path.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 5 +++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 92cd6e5642..beb95fbf06 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -130,4 +130,9 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	  Additional parameters for the ATF build
 	  E.G. 'DEBUG=1 LOG_LEVEL=20'
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
+	bool "Build in debug mode"
+	help
+	  Enable this option to build ATF with DEBUG=1.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index f35e91eefe..9a23e3d336 100644
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
