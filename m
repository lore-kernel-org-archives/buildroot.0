From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:04 -0000
Subject: [Buildroot] [git commit branch/next] boot/uboot: Generate BOOT.BIN
	file when building for Xilinx Zynq
Message-ID: <20150808105637.AE01280414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aabe23f8615f065d7bf62801d38efd17125e78d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit integrates generation of a bootable image
for Xilinx Zynq. The generation is independent on Xilinx
flow and utilizes the host-zynq-boot-bin package. The only
required step is to generate a proper U-Boot SPL (instead
of the FSBL).

The SPL generation might work when providing the working
ps7_init.c file to U-Boot. However, from U-Boot 2015.07
a set of generic ps7_init.c files is included and used to
build the U-Boot SPL for various boards. The ps7_init.c file
has been released under GNU/GPL license for this purpose.
For details, see

http://lists.denx.de/pipermail/u-boot/2015-April/210664.html

The SPL searchs for u-boot-dtb.img when booting so we
enforce using of the BR2_TARGET_UBOOT_FORMAT_DTB_IMG format.

[Thomas: remove select of BR2_PACKAGE_HOST_ZYNQ_BOOT_BIN, since this
option no longer exists.]

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |   12 ++++++++++++
 boot/uboot/uboot.mk  |   10 ++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f0c0094..6d8fa6a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -272,6 +272,18 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  u-boot build. For most platform it is spl/u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
+config BR2_TARGET_UBOOT_ZYNQ_IMAGE
+	bool "Generate image for Xilinx Zynq"
+	depends on BR2_arm
+	depends on BR2_TARGET_UBOOT_SPL
+	depends on BR2_TARGET_UBOOT_FORMAT_DTB_IMG
+	help
+	 Generate the BOOT.BIN file from U-Boot's SPL. The image
+	 boots the Xilinx Zynq chip without any FPGA bitstream.
+	 A bitstream can be loaded by the U-Boot. The SPL searchs
+	 for u-boot-dtb.img file so this U-Boot format is required
+	 to be set.
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8053678..042e066 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -182,6 +182,16 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
+define UBOOT_GENERATE_ZYNQ_IMAGE
+	$(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
+		-u $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))     \
+		-o $(BINARIES_DIR)/BOOT.BIN
+endef
+UBOOT_DEPENDENCIES += host-zynq-boot-bin
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
