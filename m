From: Xavier Roumegue <xroumegue@gmail.com>
Date: Wed, 25 Nov 2020 19:30:13 +0100
Subject: [Buildroot] [PATCH v4 4/8] boot/uboot/imx8: Add new target needed
 for mainline u-boot
In-Reply-To: <20201109142309.1135596-2-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
Message-ID: <20201125183017.15585-5-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mainline u-boot support for the iMX8M based boards is no longer
using the external imx-mkimage command and instead building
the fit image directly inside U-Boot.

This fit image usually embeds ddr/hdmi firmware for iMX8M target.

Inspired from
https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 boot/uboot/Config.in | 5 +++++
 boot/uboot/uboot.mk  | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f2faff826b..2e1d836cf8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -281,6 +281,11 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
 config BR2_TARGET_UBOOT_FORMAT_ITB
 	bool "u-boot.itb"
 
+config BR2_TARGET_UBOOT_FORMAT_IMX_FIT
+	bool "flash.bin"
+	select BR2_PACKAGE_FIRMWARE_IMX
+	select BR2_TARGET_UBOOT_NEEDS_FW
+
 config BR2_TARGET_UBOOT_FORMAT_KWB
 	bool "u-boot.kwb (Marvell)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 44fefe2843..30a073a200 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -101,6 +101,12 @@ UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX_FIT),y)
+UBOOT_BINS = flash.bin
+UBOOT_MAKE_TARGET += flash.bin
+UBOOT_DEPENDENCIES += firmware-imx
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
 UBOOT_BINS += u-boot.sb
 UBOOT_MAKE_TARGET += u-boot.sb
-- 
2.29.2
