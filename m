From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 27 Jul 2016 15:53:31 +0200
Subject: [Buildroot] [PATCH 2/5] imx-codec: add missing configure options
In-Reply-To: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1469627614-29709-3-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable VPU and hard float support when the configuration contains:
BR2_ARM_EABIHF=y
BR2_PACKAGE_IMX_VPU=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-codec/imx-codec.inc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

Thanks to those options:
- lib_jpeg_dec_arm11_elinux_novpu.so isn't copied
- lib_peq_arm11_elinux.so.1.fhw is copied instead of the fsw version

Regards,
Gary

---
 package/freescale-imx/imx-codec/imx-codec.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 266f47f..c5c5626 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -13,6 +13,14 @@ IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3c (flac,
 IMX_CODEC_LICENSE_FILES = EULA COPYING
 IMX_CODEC_REDISTRIBUTE = NO
 
+ifeq ($(BR2_ARM_EABIHF),y)
+IMX_CODEC_CONF_OPTS += --enable-fhw
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_VPU),y)
+IMX_CODEC_CONF_OPTS += --enable-vpu
+endif
+
 define IMX_CODEC_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_CODEC_SOURCE))
 endef
-- 
2.8.1
