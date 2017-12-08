From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 13:37:49 +0100
Subject: [Buildroot] [git commit] uboot: add support for bundling ATF BL31
 into U-Boot
Message-ID: <20171208123728.C733481455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c4809e6088660dc71de9de8cee0bba312aafbe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Peter: depend on toplevel atf option and select bl31 option.  Ensure it
	cannot be enabled together with ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
	as that would cause circular dependencies]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 12 ++++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0e109d0..6331bcd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -158,6 +158,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPENSSL
 	  typically the case when the board configuration has
 	  CONFIG_FIT_SIGNATURE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
+	bool "U-Boot needs ATF BL31"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
+	depend on !BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
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
index a1fac7d..3917599 100644
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
