From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:25:31 +0100
Subject: [Buildroot] [git commit] linux: add fbtft kernel extension
Message-ID: <20150110142609.B08B7801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b2bbe3422d1e96eaf1e7f09743c325b48023ac2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with RaspberryPi B+ and PiTFT Mini Kit - 320x240 2.8" TFT
(see [1] and [2]) and the following target configuration changes:
- cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'
- add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
- add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device name=adafruit28 rotate=90 gpios=dc:25'

[1] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9893.jpg
[2] http://h65951.serverkompetenz.net/PeterSeiderer/upload/PiTFT_2_8_ct/Image9897.jpg

[Thomas:
  - Rename prompt of the Linux extension to "FB TFT drivers"
  - Remove the full name of the kernel config options in the help
    text. Giving their CONFIG_<foo> name is enough.
  - Remove the mention of CONFIG_SPI_BCM2708, since this makes the
    description RaspberryPi specific, while these drivers can work
    with any SPI controller.
  - Refactor the code in linux-ext-fbtft.mk to avoid duplication
    between the < 3.15 and >= 3.15 cases.
  - Make the fbtft package a promptless package, since there is no
    point in selecting only this package, without the kernel
    extension.
  - Change the license to GPLv2, since it's kernel code.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in      |   18 ++++++++++++++++++
 linux/linux-ext-fbtft.mk |   28 ++++++++++++++++++++++++++++
 package/Config.in        |    1 +
 package/fbtft/Config.in  |   13 +++++++++++++
 package/fbtft/fbtft.mk   |   11 +++++++++++
 5 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 40c4684..8f15687 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -42,4 +42,22 @@ config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	help
 	  Optionally, explicitly specify the RTAI patch to use.
 
+# fbtft
+config BR2_LINUX_KERNEL_EXT_FBTFT
+	bool "FB TFT drivers"
+	select BR2_PACKAGE_FBTFT
+	help
+	  Linux Framebuffer drivers for small TFT LCD display modules,
+	  e.g. Adafruit PiTFT displays for Raspberry Pi.
+
+	  To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
+	  following kernel configurations:
+	  - CONFIG_SPI
+	  - CONFIG_GPIOLIB
+	  - CONFIG_FB
+	  - CONFIG_FB_TFT
+	  - CONFIG_FB_TFT_ILI9341
+
+	  https://github.com/notro/fbtft
+
 endmenu
diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
new file mode 100644
index 0000000..36f4fd2
--- /dev/null
+++ b/linux/linux-ext-fbtft.mk
@@ -0,0 +1,28 @@
+################################################################################
+# Linux fbtft extensions
+#
+# Patch the linux kernel with fbtft extension
+################################################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_FBTFT),y)
+# Add dependency to fbtft package (download helper for the fbtft source)
+LINUX_DEPENDENCIES += fbtft
+
+# for linux >= 3.15 install to drivers/video/fbdev/fbtft
+# for linux < 3.15 install to drivers/video/fbtft
+define FBTFT_PREPARE_KERNEL
+	if [ -e $(LINUX_DIR)/drivers/video/fbdev ]; then \
+		dest=$(LINUX_DIR)/drivers/video/fbdev ; \
+	else \
+		dest=$(LINUX_DIR)/drivers/video/ ; \
+	fi ; \
+	mkdir -p $${dest}/fbtft; \
+	cp -dpfr $(FBTFT_DIR)/* $${dest}/fbtft/ ; \
+	echo 'source "drivers/video/fbdev/fbtft/Kconfig"' \
+		>> $${dest}/Kconfig ; \
+	echo 'obj-y += fbtft/' >> $${dest}/Makefile
+endef
+
+LINUX_PRE_PATCH_HOOKS += FBTFT_PREPARE_KERNEL
+
+endif #BR2_LINUX_KERNEL_EXT_FBTFT
diff --git a/package/Config.in b/package/Config.in
index 08fa31d..878aa72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ endif
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fan-ctrl/Config.in"
+	source "package/fbtft/Config.in"
 	source "package/fconfig/Config.in"
 	source "package/fis/Config.in"
 	source "package/flashrom/Config.in"
diff --git a/package/fbtft/Config.in b/package/fbtft/Config.in
new file mode 100644
index 0000000..0a4de19
--- /dev/null
+++ b/package/fbtft/Config.in
@@ -0,0 +1,13 @@
+# Prompt-less option, because this package is not doing anything
+# except downloading the FB TFT sources. The real work is done by a
+# Linux extension.
+config BR2_PACKAGE_FBTFT
+	bool
+	depends on BR2_LINUX_KERNEL
+	help
+	  Linux Framebuffer drivers for small TFT LCD display modules,
+	  e.g. Adafruit PiTFT displays for Raspberry Pi.
+
+	  This is only the download helper for the kernel patch.
+
+	  https://github.com/notro/fbtft
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
new file mode 100644
index 0000000..913627d
--- /dev/null
+++ b/package/fbtft/fbtft.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# fbtft
+#
+################################################################################
+
+FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
+FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
+FBTFT_LICENSE = GPLv2
+
+$(eval $(generic-package))
