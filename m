From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:27 +0100
Subject: [Buildroot] [git commit] imx-gpu-viv: bump version to 5.0.11 p7.1
Message-ID: <20160201224713.96DBB7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db97c0ce65368b205ea17c88293fa7a38fd4135
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrade to 5.0.11 P7.1 for i.MX6 with GPU

i.MX6QP qualified graphics driver(5.0.11P7.1).
Includes many of the bug fixes and stability improvements.
For more information refer to release notes from
http://www.freescale.com/imx6qp

libGAL_egl is no longer provided in p7.1.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/b3ef125

This package has been tested with both X11 and Framebuffer backends:
 # cd /usr/share/examples/viv_samples/vdk/
 # apitrace trace --api egl ./tutorial7
 # gmem_info
 ... display memory use per PID ...
 #??apitrace replay tutorial7.trace
 #??eglretrace tutorial7.trace

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 11 +----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index aa1bdee..149afc2 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256	b5b9c8e216b2bc4281c2443e07eab90547de0abd705614756ed68c7ad2fcf97a  imx-gpu-viv-5.0.11.p4.5-sfp.bin
-sha256	0591b495cd1c2547ae007d405b90729e2fb90603a5728b39d1a99cb4e1cf1eb4  imx-gpu-viv-5.0.11.p4.5-hfp.bin
+sha256	43fea6ebbb1222e0f594fff3b48147f4bb6173b85f2caa9fa6bf04a1c85ee93a  imx-gpu-viv-5.0.11.p7.1-sfp.bin
+sha256	e49ca1d31ca83bb50f6672325db37ae3754eb9073ad98a37790ab1209ea5cba8  imx-gpu-viv-5.0.11.p7.1-hfp.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a66c82e..133632b 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_BASE_VERSION = 5.0.11.p4.5
+IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.1
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
 else
@@ -26,13 +26,6 @@ define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
 
-# For some reason libGAL_egl for x11 is called libGAL_egl.dri.so
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
-define IMX_GPU_VIV_FIXUP_SYMLINKS
-	ln -sf libGAL_egl.dri.so $(@D)/gpu-core/usr/lib/libGAL_egl.so
-endef
-endif
-
 # Instead of building, we fix up the inconsistencies that exist
 # in the upstream archive here.
 # Make sure these commands are idempotent.
@@ -49,8 +42,6 @@ define IMX_GPU_VIV_BUILD_CMDS
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
 	ln -sf libVIVANTE-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
 	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
-	ln -sf libGAL_egl.$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL_egl.so
-	$(IMX_GPU_VIV_FIXUP_SYMLINKS)
 endef
 
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
