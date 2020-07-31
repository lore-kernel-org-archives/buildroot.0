From: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Date: Fri, 31 Jul 2020 14:13:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/imx-m4-demos: new
 package
Message-ID: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New package to download and install i.MX Cortex-M4 demos
for following SoCs:
* i.MX7D
* i.MX7ULP
* i.MX8M
* i.MX8MM
* i.MX8MN
* i.MX8QM
* i.MX8QXP

Yocto recipes from where the demos location has been extracted:
https://source.codeaurora.org/external/imx/meta-imx/tree/meta-sdk/recipes-fsl/m4-demos?h=zeus-5.4.24-2.1.0

Signed-off-by: Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
---
 DEVELOPERS                                    |  1 +
 board/freescale/common/imx/post-image.sh      | 14 ++++-
 package/freescale-imx/Config.in               | 10 ++++
 .../freescale-imx/imx-mcore-demos/Config.in   | 11 ++++
 .../imx-mcore-demos/imx-mcore-demos.hash      | 10 ++++
 .../imx-mcore-demos/imx-mcore-demos.mk        | 54 +++++++++++++++++++
 6 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-mcore-demos/Config.in
 create mode 100644 package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash
 create mode 100644 package/freescale-imx/imx-mcore-demos/imx-mcore-demos.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..387eb61c06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -908,6 +908,7 @@ F:	package/whois/
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
 F:	configs/freescale_imx6ullevk_defconfig
+F:	package/freescale-imx/imx-mcore-demos/
 
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 06ccaac3a4..dc651ac584 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -30,6 +30,18 @@ linux_image()
 	fi
 }
 
+#
+# mcore_image prints all available MCORE demo file names for the genimage
+# configuration file
+#
+mcore_image()
+{
+	if grep -Eq "^BR2_PACKAGE_IMX_MCORE_DEMOS=y$" ${BR2_CONFIG}; then
+		echo -n ", "
+		for f in $(ls ${BINARIES_DIR}/mcore_*); do echo -n "$(basename $f), "; done
+	fi
+}
+
 genimage_type()
 {
 	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
@@ -79,7 +91,7 @@ uboot_image()
 
 main()
 {
-	local FILES="$(dtb_list) $(linux_image)"
+	local FILES="$(dtb_list) $(linux_image) $(mcore_image)"
 	local IMXOFFSET="$(imx_offset)"
 	local UBOOTBIN="$(uboot_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8436..75c213a1d7 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -96,10 +96,20 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-mcore-demos/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
diff --git a/package/freescale-imx/imx-mcore-demos/Config.in b/package/freescale-imx/imx-mcore-demos/Config.in
new file mode 100644
index 0000000000..705a6c4557
--- /dev/null
+++ b/package/freescale-imx/imx-mcore-demos/Config.in
@@ -0,0 +1,11 @@
+comment "imx-mcore-demos needs an i.MX platform with Cortex-Mx"
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE
+
+config BR2_PACKAGE_IMX_MCORE_DEMOS
+	bool "imx-mcore-demos"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE
+	help
+	  Cortex-Mx demo blobs for the Freescale i.MX SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash
new file mode 100644
index 0000000000..13f3092c88
--- /dev/null
+++ b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash
@@ -0,0 +1,10 @@
+# locally computed
+sha256  cc00d3b936d49b2794a2a99e10129437e70caba3fd26b8379b8c50dd22f73254  imx7d-sabresd-m4-freertos-1.0.1.bin
+sha256  a8fbe1180b3d20e933a410cd76e60baac7a9f54e8b2bae8b6b8a3e1af550eca6  imx7ulp-m4-demo-2.8.0.bin
+sha256  2dbfab7fbbe89e89a2881d77c84a6c257699dc73ee6462a813bdd5ad09836b04  imx8mm-m4-demo-2.8.0.bin
+sha256  e877c7462b6ea87c498563842f42352d204eb28a65f35f7dc1fec643f84abb66  imx8mn-m7-demo-2.8.0.bin
+sha256  ac88568f63a794530339775a6e49e7928d3d09bcf4ba5edacea1841989e674b0  imx8mq-m4-demo-2.8.0.bin
+sha256  d06a636b84cd559483091cbdb07b5ce9e15a534bca31d4cb756b33b696c2160b  imx8qm-m4-demo-2.8.0.bin
+sha256  7800cdbebe07f426cdac50b0e295d64215164a767e79ca58bd917445c50e345f  imx8qx-m4-demo-2.8.0.bin
+
+# no hash for license file as it is different for each package listed above
diff --git a/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.mk b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.mk
new file mode 100644
index 0000000000..9e1e9bf7f0
--- /dev/null
+++ b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# imx-mcore-demos
+#
+################################################################################
+
+IMX_MCORE_DEMOS_SITE = $(FREESCALE_IMX_SITE)
+
+IMX_MCORE_DEMOS_LICENSE = NXP Semiconductor Software License Agreement
+IMX_MCORE_DEMOS_LICENSE_FILES = COPYING
+IMX_MCORE_DEMOS_REDISTRIBUTE = NO
+IMX_MCORE_DEMOS_INSTALL_IMAGES = YES
+
+define IMX_MCORE_DEMOS_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_MCORE_DEMOS_DL_DIR)/$(IMX_MCORE_DEMOS_SOURCE))
+endef
+
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
+IMX_MCORE_DEMOS_VERSION = 1.0.1
+IMX_MCORE_DEMOS_SOURCE = imx7d-sabresd-m4-freertos-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx7ulp-m4-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = img
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx8qm-m4-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx8mq-m4-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx8mm-m4-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx8mn-m7-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
+IMX_MCORE_DEMOS_VERSION = 2.8.0
+IMX_MCORE_DEMOS_SOURCE = imx8qx-m4-demo-$(IMX_MCORE_DEMOS_VERSION).bin
+EXT = bin
+endif
+
+# Note: firmware names are copied to binaries directory with an "mcore_" prefix, for easier post image scripting
+
+define IMX_MCORE_DEMOS_INSTALL_IMAGES_CMDS
+	for f in $(@D)/*.$(EXT); do cp "$$f" $(BINARIES_DIR)/mcore_$$(basename "$$f"); done
+endef
+
+$(eval $(generic-package))
-- 
2.27.0
