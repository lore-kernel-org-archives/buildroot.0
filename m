From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 21:59:58 +0100
Subject: [Buildroot] [git commit branch/next] imx-vpu: Use self-extractible
	helper
Message-ID: <20141127212615.496927FF18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f0e795d75de91bc0e6082eb99d50cf165bf3d3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: remove unneeded comment about seeing freescale-imx.mk.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.mk |   21 +++++----------------
 1 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index e0292ed..ab3634d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -6,8 +6,6 @@
 
 IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
-IMX_VPU_LICENSE = Freescale License
-IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
 IMX_VPU_INSTALL_STAGING = YES
@@ -21,21 +19,12 @@ IMX_VPU_MAKE_ENV = \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
 	INCLUDE="-idirafter $(LINUX_DIR)/include"
 
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (imx-vpu-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info
-# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
-#
+IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
+IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
+IMX_VPU_REDISTRIBUTE = NO
+
 define IMX_VPU_EXTRACT_CMDS
-	awk 'BEGIN      { start=0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start=1; }'\
-	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPU_SOURCE))
 endef
 
 define IMX_VPU_BUILD_CMDS
