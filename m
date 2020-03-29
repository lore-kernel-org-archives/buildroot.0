From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:08:23 +0200
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add optional
 host-arm-gnu-a-toolchain dependency
Message-ID: <20200329125649.01591888EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbed118ed20f2701425720f510b02b3ad1345a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some ATF configurations, require a pre-built bare metal toolchain to
build some platforms which host cortex-m series core, for instance
rockchip rk3399 has a cortex-m0 core. Without a pre-built bare metal
toolchain, the build fails:

make[3]: arm-none-eabi-gcc: Command not found

To solve this, this commit implements a
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
option. Platforms which have such requirement should enable this
config option.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 8 ++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 737dc587e5..b1ca5d7ea1 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -167,4 +167,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 	  Select this option if your ATF board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
+	bool "Needs arm-none-eabi toolchain"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64"
+	help
+	  Select this option if your ATF board configuration requires
+	  an ARM32 bare metal toolchain to be available.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 27f63a87fe..2e8a7c1a23 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -33,6 +33,10 @@ ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-a-toolchain
+endif
+
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
