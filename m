From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Dec 2017 22:48:07 +0100
Subject: [Buildroot] [PATCH 4/8] uboot: add support for bundling ATF BL31
 into U-Boot
In-Reply-To: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagannadh.teki@gmail.com>

Some ARM64 platforms (such as Allwinner A64/H5) have a boot process
where U-Boot encapsulates the BL31 part of the ARM trusted
firmware. For such platforms, we need to build ATF before U-Boot, and
pass a BL31 variable pointing to ATF bl31.bin to the U-Boot build
process.

This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31 variable to
achieve this.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[Thomas:
 - Rename option to BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 - Drop changes to arm-trusted-firmware.mk, they are taken care of by
   previous commits.
 - Improve Config.in help text
 - Add missing dependency on arm-trusted-firmware when
   BR2_TARGET_UBOOT_NEEDS_ATF_BL31 is enabled.
 - Use bl31.bin from $(BINARIES_DIR) instead of taking it from ATF's
   build dir.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0e109d0977..8fa189f410 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -158,6 +158,16 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	  typically the case when the board configuration has
 	  CONFIG_FIT_SIGNATURE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
+	bool "U-Boot needs ATF BL31"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
+	help
+	  Some specific platforms (such as Allwinner A64/H5)
+	  encapsulate the BL31 part of ATF inside U-Boot. This option
+	  makes sure ATF gets built prior to U-Boot, and that the BL31
+	  variable pointing to ATF's BL31 binary, is passed during the
+	  Buildroot build.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a1fac7dcae..39175999ec 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -134,6 +134,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
+UBOOT_DEPENDENCIES += arm-trusted-firmware
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
2.13.6
