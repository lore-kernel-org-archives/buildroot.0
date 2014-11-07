From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 17:03:27 +0100
Subject: [Buildroot] [PATCH 7/7] gpu-amd-bin-mx51: Use self-extractible
	helper
In-Reply-To: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
References: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415376207-23292-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           | 27 ++++++++--------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index c4ff917..aa33c2a 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -3,36 +3,27 @@
 # gpu-amd-bin-mx51
 #
 #############################################################
-GPU_AMD_BIN_MX51_VERSION = 11.09.01
 GPU_AMD_BIN_MX51_SITE = $(FREESCALE_IMX_SITE)
+GPU_AMD_BIN_MX51_BASE_VERSION = 11.09.01
 ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),y)
-GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
+GPU_AMD_BIN_MX51_VERSION = $(GPU_AMD_BIN_MX51_BASE_VERSION)-fb
+GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
 else
-GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
+GPU_AMD_BIN_MX51_VERSION = $(GPU_AMD_BIN_MX51_BASE_VERSION)-x11
+GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
 GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
 	xlib_libXrender xlib_libXau xlib_libXdmcp
 endif
 GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
-GPU_AMD_BIN_MX51_LICENSE = Freescale Semiconductor Software License Agreement
 GPU_AMD_BIN_MX51_INSTALL_STAGING = YES
 
-# No license file is included in the archive; we could extract it from
-# the self-extractor, but that's just too much effort.
-# This is a legal minefield: the EULA specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
+# See freescale-imx.mk
+GPU_AMD_BIN_MX51_LICENSE = Freescale Semiconductor Software License Agreement
+GPU_AMD_BIN_MX51_LICENSE_FILES = EULA
 GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
 
-# The archive is a shell-self-extractor of a bzipped tar. Output directory 
-# depends of version of source.
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
 define GPU_AMD_BIN_MX51_EXTRACT_CMDS
-	(cd $(@D); \
-		sh $(DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE) --force --auto-accept)
-	mv $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)/* $(@D)
-	rmdir $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(GPU_AMD_BIN_MX51_SOURCE))
 endef
 
 define GPU_AMD_BIN_MX51_BUILD_CMDS
-- 
1.9.1
