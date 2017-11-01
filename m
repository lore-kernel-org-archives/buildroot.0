From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed,  1 Nov 2017 19:05:44 +0100
Subject: [Buildroot] [PATCH v5 02/11] uboot: Add U-Boot-bundles-ATF support
In-Reply-To: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1509559553-26544-3-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For building U-Boot proper in Allwinner A64/H5, ATF need
to build first and ATF binary need to be exported.

U-Boot-bundles-ATF support export ATF binary and disable
U-Boot dependency in ATF becuase except U-Boot dependent
boards(like juno) ideally ATF will build prior to U-Boot.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  2 ++
 boot/uboot/Config.in                              | 10 ++++++++++
 boot/uboot/uboot.mk                               |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 5b4e3b0..c0af8e8 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -8,7 +8,9 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
 ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF),)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
+endif
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
 # Handle custom ATF tarballs as specified by the configuration
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8215912..4751593 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -158,6 +158,16 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	  typically the case when the board configuration has
 	  CONFIG_FIT_SIGNATURE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_ATF
+	bool "U-Boot needs ATF"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	help
+	  For building U-Boot proper in Allwinner A64/H5, ATF need
+	  to build first and ATF binary need to be exported.
+	  This config typically export ATF binary and disable
+	  U-Boot dependency in ATF becuase except U-Boot dependent
+	  boards(like juno) ideally ATF will build prior to U-Boot.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fdacf16..cbd2225 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -134,6 +134,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF),y)
+UBOOT_MAKE_OPTS += \
+	BL31=${BUILD_DIR}/arm-trusted-firmware-${BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION}/build/${BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM}/release/${BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES}.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
1.9.1
