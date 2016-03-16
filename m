From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:28:11 +0100
Subject: [Buildroot] [PATCH v3 2/4] libfslcodec: add missing configure
	options
In-Reply-To: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458138493-12172-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458138493-12172-3-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable VPU and hard float support when the proper configuration is setup.
BR2_ARM_EABIHF=y
BR2_PACKAGE_IMX_VPU=y

See Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
multimedia/libfslcodec/libfslcodec.inc

Tested with the Linaro ARM 2015.11 toolchain.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---

Thanks to those options:
- lib_jpeg_dec_arm11_elinux_novpu.so isn't copied
- lib_peq_arm11_elinux.so.1.fhw is copied instead of the fsw version

Regards,
Gary

---
 package/libfslcodec/libfslcodec.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 89d058c..f702ce6 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -13,6 +13,14 @@ LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c
 LIBFSLCODEC_LICENSE_FILES = EULA COPYING
 LIBFSLCODEC_REDISTRIBUTE = NO
 
+ifeq ($(BR2_ARM_EABIHF),y)
+LIBFSLCODEC_CONF_OPTS += --enable-fhw
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_VPU),y)
+LIBFSLCODEC_CONF_OPTS += --enable-vpu
+endif
+
 define LIBFSLCODEC_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLCODEC_SOURCE))
 endef
-- 
2.7.0
