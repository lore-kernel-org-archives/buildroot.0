From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:41:19 +0100
Subject: [Buildroot] [git commit] boot/uboot: introduce
 BR2_TARGET_UBOOT_NEEDS_OPENSBI
Message-ID: <20210116212227.38B558360B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fccb15705d55a12e7a20cb0612049a3251ea1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some RISC-V platforms (such as SiFive HiFive Unleashed) encapsulate
the OpenSBI firmware image inside U-Boot.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e4a0f48deb..b18216ab71 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -229,6 +229,16 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
 
 endchoice
 
+config BR2_TARGET_UBOOT_NEEDS_OPENSBI
+	bool "U-Boot needs OpenSBI"
+	depends on BR2_TARGET_OPENSBI
+	help
+	  Some RISC-V platforms (such as SiFive HiFive Unleashed)
+	  encapsulate the OpenSBI firmware image inside U-Boot.
+	  This option makes sure OpenSBI gets built prior to U-Boot,
+	  and that the OpenSBI variable pointing to OpenSBI binary,
+	  is passed during the Buildroot build.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a29d71ffa2..d92000f053 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -163,6 +163,11 @@ UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
+UBOOT_DEPENDENCIES += opensbi
+UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
