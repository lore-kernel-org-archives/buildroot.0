From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed,  7 Mar 2018 19:52:15 +0100
Subject: [Buildroot] [PATCH v5 1/4] imx-mkimage: new package
In-Reply-To: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1520448738-5794-2-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package add support for imx-mkimage for iMX8M.
Currently the only hardware it's tested for.

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
v5: Build with HDMI support
    Add patch to use host mkimage instead of ./mkimage_uboot in soc.mk
    Add host dependencies to dtc package
    Add host configuration options in build
    Add patch to make use of LDFLAGS in soc.mk (fixes build error with libz)
v4: No changes
v3: Use BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME in U-Boot so we don't
    need to copy u-boot.bin to u-boot-nodtb.bin (suggested by Baruch)
    Update license to GPL-2.0+ (suggested by Marcus F.)
v2: Moved package from package/freescale-imx to package (suggested by Thomas P.)
    Add upstread URL in Config.in (suggested by Thomas P.)
    Fix install syntax in imx-mkimage.mk (suggested by Thomas P.)
    Use Makefile in imx-mkimage to build imx-boot-imx8mqevk-sd.bin instead of doing that in the post-script.sh (suggested Baruch)
---
 package/Config.in.host                             |  1 +
 .../imx-mkimage/0001-remove-git-build-info.patch   | 29 +++++++++++++++++
 .../0002-add-ldflags-to-link-step.patch            | 26 ++++++++++++++++
 .../0003-remove-use-of-mkimage_uboot.patch         | 26 ++++++++++++++++
 package/imx-mkimage/Config.in.host                 | 12 ++++++++
 package/imx-mkimage/imx-mkimage.hash               |  3 ++
 package/imx-mkimage/imx-mkimage.mk                 | 36 ++++++++++++++++++++++
 7 files changed, 133 insertions(+)
 create mode 100644 package/imx-mkimage/0001-remove-git-build-info.patch
 create mode 100644 package/imx-mkimage/0002-add-ldflags-to-link-step.patch
 create mode 100644 package/imx-mkimage/0003-remove-use-of-mkimage_uboot.patch
 create mode 100644 package/imx-mkimage/Config.in.host
 create mode 100644 package/imx-mkimage/imx-mkimage.hash
 create mode 100644 package/imx-mkimage/imx-mkimage.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9..06ef5cb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,6 +24,7 @@ menu "Host utilities"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
diff --git a/package/imx-mkimage/0001-remove-git-build-info.patch b/package/imx-mkimage/0001-remove-git-build-info.patch
new file mode 100644
index 0000000..9f8da02
--- /dev/null
+++ b/package/imx-mkimage/0001-remove-git-build-info.patch
@@ -0,0 +1,29 @@
+From d1bb893300b1bd80eaac27fcc8eb4347f56f83b4 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Thu, 22 Feb 2018 09:56:53 +0100
+Subject: [PATCH] Remove buildinformation step.
+
+Signed-off-by: Erik Larsson <erik.larsson@combitech.se>
+Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
+---
+ Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4b449ad..4042a39 100644
+--- a/Makefile
++++ b/Makefile
+@@ -33,9 +33,7 @@ $(MKIMG): buildinfo $(SRCS)
+ bin: $(MKIMG)
+ 
+ buildinfo:
+-	@echo -n '#define MKIMAGE_COMMIT 0x' > src/build_info.h
+-	@git rev-parse --short=8 HEAD >> src/build_info.h
+-	@echo '' >> src/build_info.h
++	@echo "#define MKIMAGE_COMMIT 0x0000" > src/build_info.h
+ 
+ help:
+ 	@echo $(CURR_DIR)
+-- 
+2.7.4
+
diff --git a/package/imx-mkimage/0002-add-ldflags-to-link-step.patch b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
new file mode 100644
index 0000000..22c6a7d
--- /dev/null
+++ b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
@@ -0,0 +1,26 @@
+From a73f20fbe921c7ecff3efda23bc506fdd935ee4d Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Tue, 6 Mar 2018 12:28:39 +0100
+Subject: [PATCH 1/2] Add LDFLAGS to link step
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+---
+ iMX8M/soc.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
+index 8346769..38a14bb 100644
+--- a/iMX8M/soc.mak
++++ b/iMX8M/soc.mak
+@@ -15,7 +15,7 @@ FW_DIR = imx-boot/imx-boot-tools/imx8mq
+ 
+ $(MKIMG): mkimage_imx8.c
+ 	@echo "Compiling mkimage_imx8"
+-	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
++	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
+ 
+ $(DCD_CFG): $(DCD_CFG_SRC)
+ 	@echo "Converting iMX8M DCD file" 
+-- 
+2.7.4
+
diff --git a/package/imx-mkimage/0003-remove-use-of-mkimage_uboot.patch b/package/imx-mkimage/0003-remove-use-of-mkimage_uboot.patch
new file mode 100644
index 0000000..86da7dc
--- /dev/null
+++ b/package/imx-mkimage/0003-remove-use-of-mkimage_uboot.patch
@@ -0,0 +1,26 @@
+From fe1e495ca9766277db9505ff0a1736293569a694 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Tue, 6 Mar 2018 12:29:15 +0100
+Subject: [PATCH 2/2] Remove use of ./mkimage_uboot and use mkimage instead
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+---
+ iMX8M/soc.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
+index 38a14bb..b61dc85 100644
+--- a/iMX8M/soc.mak
++++ b/iMX8M/soc.mak
+@@ -46,7 +46,7 @@ clean:
+ dtbs = fsl-imx8mq-evk.dtb
+ u-boot.itb: $(dtbs)
+ 	./mkimage_fit_atf.sh $(dtbs) > u-boot.its
+-	./mkimage_uboot -E -p 0x3000 -f u-boot.its u-boot.itb
++	mkimage -E -p 0x3000 -f u-boot.its u-boot.itb
+ 	@rm -f u-boot.its
+ 
+ flash_hdmi_spl_uboot: $(MKIMG) signed_hdmi_imx8m.bin u-boot-spl-ddr.bin u-boot.itb
+-- 
+2.7.4
+
diff --git a/package/imx-mkimage/Config.in.host b/package/imx-mkimage/Config.in.host
new file mode 100644
index 0000000..490b514
--- /dev/null
+++ b/package/imx-mkimage/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_IMX_MKIMAGE
+	bool "host imx-mkimage"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
+	select BR2_PACKAGE_HOST_DTC
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TARGET_UBOOT
+	help
+	  imx-mkimage is used to combine input images and generate
+	  final boot image with appropriate IVT set.
+
+	  https://source.codeaurora.org/external/imx/imx-mkimage
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
new file mode 100644
index 0000000..08d31ce
--- /dev/null
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 4ddb144520001c33baa24493f68ef2ea9434ac36bf3ae223f78d7ec581aa484c  imx-mkimage-imx_4.9.51_imx8m_beta.tar.gz
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
new file mode 100644
index 0000000..7272f7f
--- /dev/null
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# imx-mkimage
+#
+################################################################################
+
+IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
+IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
+IMX_MKIMAGE_SITE_METHOD = git
+IMX_MKIMAGE_LICENSE = GPL-2.0+
+IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+HOST_IMX_MKIMAGE_DEPENDENCIES = uboot linux firmware-imx arm-trusted-firmware host-dtc
+
+define HOST_IMX_MKIMAGE_BUILD_CMDS
+	# These files are generated by firmware-imx, uboot and arm-trusted-firmware
+	# Copy the files into the iMX8M folder to make building of this package simple
+	# The NXP engineers has constructed to buildprocess with a bunch of hardcoded
+	# file names and pathes.
+
+	# Currently this only supports iMX8M. When more hardware is available
+	# this needs to be selectable based on iMX8-version (iMX8M,iMXQ etc).
+	cp $(BINARIES_DIR)/u-boot-spl.bin $(@D)/iMX8M
+	cp $(BINARIES_DIR)/lpddr4_pmu_train* $(@D)/iMX8M
+	cp $(BINARIES_DIR)/fsl-imx8mq-evk.dtb $(@D)/iMX8M
+	cp $(BINARIES_DIR)/signed_hdmi_imx8m.bin $(@D)/iMX8M
+	cp $(BINARIES_DIR)/bl31.bin $(@D)/iMX8M
+	cp ${BINARIES_DIR}/u-boot-nodtb.bin $(@D)/iMX8M
+
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) SOC=iMX8M flash_hdmi_spl_uboot
+endef
+
+define HOST_IMX_MKIMAGE_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/iMX8M/flash.bin $(BINARIES_DIR)/imx-boot-imx8mqevk-sd.bin
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
