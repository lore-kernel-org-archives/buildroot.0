From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 12:27:36 +0100
Subject: [Buildroot] [git commit] arm-trusted-firmware: allow to generate
 the BL31 image
Message-ID: <20171208123728.B85AD815FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=968445911362642d4e353a4c5cdb8bc6fdaf6b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some platforms (e.g Allwinner ARM64) don't build a FIP image out of
ATF, but only a BL31 image, which is then encapsulated in U-Boot. This
commit adds an ATF option to build such an image.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b8b9269..7aef87c 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -64,6 +64,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
+	bool "Build BL31 image"
+	help
+	  This option enables building the BL31 image. This is
+	  typically used on platforms where another bootloader (e.g
+	  U-Boot) encapsulates ATF BL31.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 3731829..0aa7c9b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -47,6 +47,10 @@ ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
