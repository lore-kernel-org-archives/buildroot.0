From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@theobroma-systems.com>
Date: Fri, 20 Nov 2020 22:29:12 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: Forward stack
 protection configuration
Message-ID: <20201120212912.2993985-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TF-A supports stack smashing protection (-fstack-protector-*).
Since we already forward the required compiler flag, let's
also tell TF-A that we actually want the required symbols
(e.g. __stack_chk_guard) to be available.

Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a3553e36cf..f5be39100e 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -100,6 +100,18 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_SSP_REGULAR),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
+endif
+
+ifeq ($(BR2_SSP_STRONG),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
+endif
+
+ifeq ($(BR2_SSP_ALL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.28.0
