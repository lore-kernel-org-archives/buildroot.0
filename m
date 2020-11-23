From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@theobroma-systems.com>
Date: Mon, 23 Nov 2020 10:57:12 +0100
Subject: [Buildroot] [PATCH v3 1/1] boot/arm-trusted-firmware: Forward stack
 protection configuration
Message-ID: <20201123095712.3447912-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TF-A supports stack smashing protection (-fstack-protector-*).
However, it currenlty silently disables that feature with
-fno-stack-protector in case ENABLE_STACK_PROTECTOR is not
set during build time.

As documented in the TF-A user guide, the flag ENABLE_STACK_PROTECTOR
is required to enable stack protection support. When enabled the symbols
for the stack protector (e.g. __stack_chk_guard) are built.

So in case we see that BR2_SSP_* is enabled, let's enable
the corresponding build flag for TF-A as documented in
the TF-A user guide.

Tested on a Rockchip PX30 based system (TF-A v2.2 and upstream/master).

Signed-off-by: Christoph M?llner <christoph.muellner@theobroma-systems.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a3553e36cf..0597cecf71 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -100,6 +100,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_SSP_REGULAR),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
+else ifeq ($(BR2_SSP_STRONG),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
+else ifeq ($(BR2_SSP_ALL),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.28.0
