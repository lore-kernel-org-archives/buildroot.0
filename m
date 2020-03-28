From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sat, 28 Mar 2020 10:34:30 +0530
Subject: [Buildroot] [PATCH v5 2/3] boot/arm-trusted-firmware: add optional
 host-arm-gnu-a-toolchain dependency
In-Reply-To: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
References: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1585371871-29406-3-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

Some ATF configurations, require a pre-built bare metal toolchain to build
some platforms which host cortex-m series core, for instance rockchip rk3399
has a cortex-m0 core. Without a pre-built bare metal toolchain, the build fails:

make[3]: arm-none-eabi-gcc: Command not found

To solve this, this commit implements a
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN option. Platforms which
    have such requirement should enable this config option.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v5:
- As suggested by Thomas Pettazoni, introduced BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
  option. Changed the title and description of the patch.

Changes for v4:
- no change

Changes for v3:
- no change

Changes for v2:
- no changes
---
 boot/arm-trusted-firmware/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 737dc58..15d689a 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -167,4 +167,10 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 	  Select this option if your ATF board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
+	bool "Needs arm32 bare metal toolchain"
+	select BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN
+        help
+          Select this option if your ATF board configuration
+          requires ARM32-A bare metal toolchain to be available.
 endif
-- 
2.7.4
