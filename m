From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 26 Oct 2017 20:58:21 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: Add support for U-Boot TPL
Message-ID: <1509044302-31218-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TPL is first stage bootloader, On rk3288 vyasa board due to size
limitation on SPL.

Since the size of SPL can't be exceeded 0x8000 bytes in RK3288,
it is not possible add new SPL features like Falcon mode or etc.

So add TPL stage so-that adding new features to SPL is possible.
- TPL: DRAM init, clocks
- SPL: MMC, falcon, etc

u-boot-tpl.bin is the file name.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/uboot/Config.in | 25 +++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8215912..43e4947 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -342,6 +342,31 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  u-boot build. For most platform it is spl/u-boot-spl.bin but
 	  not always. It is MLO on OMAP and SPL on i.MX6 for example.
 
+config BR2_TARGET_UBOOT_TPL
+	bool "Install U-Boot TPL binary image"
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  Install the U-Boot TPL binary image to the images
+	  directory.
+	  TPL is first stage bootloader, On rk3288 vyasa board due to size
+	  limitation on SPL.
+
+	  Since the size of SPL can't be exceeded 0x8000 bytes in RK3288,
+	  it is not possible add new SPL features like Falcon mode or etc.
+
+	  So add TPL stage so-that adding new features to SPL is possible.
+	  - TPL: DRAM init, clocks
+	  - SPL: MMC, falcon, etc
+
+config BR2_TARGET_UBOOT_TPL_NAME
+	string "U-Boot TPL binary image name"
+	default "tpl/u-boot-tpl.bin"
+	depends on BR2_TARGET_UBOOT_TPL
+	help
+	  A space-separated list of TPL binaries, generated during
+	  u-boot build. For most platform it is spl/u-boot-tpl.bin but
+	  not always.
+
 config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	bool "Generate image for Xilinx Zynq"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fdacf16..5702ca6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -242,6 +242,11 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
 		)
 	)
+	$(if $(BR2_TARGET_UBOOT_TPL),
+		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_TPL_NAME)), \
+			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
+		)
+	)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
 			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-- 
1.9.1
