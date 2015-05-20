From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 20 May 2015 12:12:16 +0200
Subject: [Buildroot] [PATCH 05/13] imx-vpu: bump version to 5.4.27
In-Reply-To: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432116744-25760-6-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- imx-vpu version changed to internal version
- VPU share memory file open fixes
- Upgrade ion usage
- Remove obey-variables patch -now included in release

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/db343da3e4eb2afa6a72f7526751bb8d8ba287e1

The IOGetVirtMem return value patch has now been included into the upstream
package.

This package has been implicitely tested through gstreamer as the plugins
rely on it for vpu decoding:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
  matroskademux ! imxvpudec ! imxipuvideosink

Regards,
Gary
---
 .../0001-vpu-io-fix-IOSystemInit-failure.patch     | 32 ------------
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch | 59 ----------------------
 package/freescale-imx/imx-vpu/imx-vpu.mk           |  2 +-
 3 files changed, 1 insertion(+), 92 deletions(-)
 delete mode 100644 package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
 delete mode 100644 package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch

diff --git a/package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch b/package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
deleted file mode 100644
index ed93193..0000000
--- a/package/freescale-imx/imx-vpu/0001-vpu-io-fix-IOSystemInit-failure.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] vpu-io: fix IOSystemInit failure
-
-When using a kernel where user/kernel split is 3G/1G, the address
-returned by IOGetVirtMem() can appear to be a negative int.
-
-IOSystemInit() incorrectly checks the return value of IOGetVirtMem().
-IOGetVirtMem() returns -1 on error (and not MAP_FAILED, nor any other
-negative value.)
-
-Fix that by correctly checking against -1 (and not MAP_FAILED!)
-
-Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
-[yann.morin.1998 at free.fr: expand the commit log]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- vpu/vpu_io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vpu/vpu_io.c b/vpu/vpu_io.c
-index 8cbb571..14759da 100644
---- a/vpu/vpu_io.c
-+++ b/vpu/vpu_io.c
-@@ -265,7 +265,7 @@ int IOSystemInit(void *callback)
- 		goto err;
- 	}
- 
--	if (IOGetVirtMem(&bit_work_addr) <= 0)
-+	if (IOGetVirtMem(&bit_work_addr) == -1)
- 		goto err;
- #endif
- 	UnlockVpu(vpu_semap);
-
diff --git a/package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch b/package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
deleted file mode 100644
index 583a508..0000000
--- a/package/freescale-imx/imx-vpu/0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-[PATCH] vpu-lib: fix IOGetVirtMem return value checks
-
-When using a kernel where user/kernel split is 3G/1G, the address
-returned by IOGetVirtMem() can appear to be a negative int.
-
-IOSystemInit() incorrectly checks the return value of IOGetVirtMem().
-IOGetVirtMem() returns -1 on error (and not MAP_FAILED, nor any other
-negative value.)
-
-Fix that by correctly checking against -1 (and not MAP_FAILED!)
-
-Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
-[yann.morin.1998 at free.fr: expand the commit log]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- vpu/vpu_lib.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/vpu/vpu_lib.c b/vpu/vpu_lib.c
-index 1fb731b..7a7f42d 100644
---- a/vpu/vpu_lib.c
-+++ b/vpu/vpu_lib.c
-@@ -1764,7 +1764,7 @@ RetCode vpu_EncStartOneFrame(EncHandle handle, EncParam * param)
- 				err_msg("Unable to obtain physical mem\n");
- 				return RETCODE_FAILURE;
- 			}
--			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) <= 0) {
-+			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) == -1) {
- 				IOFreePhyMem(&pEncInfo->picParaBaseMem);
- 				pEncInfo->picParaBaseMem.phy_addr = 0;
- 				err_msg("Unable to obtain virtual mem\n");
-@@ -2982,7 +2982,7 @@ RetCode vpu_DecGetInitialInfo(DecHandle handle, DecInitialInfo * info)
- 			UnlockVpu(vpu_semap);
- 			return RETCODE_FAILURE;
- 		}
--		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
-+		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
- 			IOFreePhyMem(&pDecInfo->userDataBufMem);
- 			pDecInfo->userDataBufMem.phy_addr = 0;
- 			err_msg("Unable to obtain virtual mem\n");
-@@ -4017,7 +4017,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
- 				UnlockVpu(vpu_semap);
- 				return RETCODE_FAILURE;
- 			}
--			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) <= 0) {
-+			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) == -1) {
- 				IOFreePhyMem(&pDecInfo->picParaBaseMem);
- 				pDecInfo->picParaBaseMem.phy_addr = 0;
- 				err_msg("Unable to obtain virtual mem\n");
-@@ -4057,7 +4057,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
- 			UnlockVpu(vpu_semap);
- 			return RETCODE_FAILURE;
- 		}
--		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
-+		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
- 			IOFreePhyMem(&pDecInfo->userDataBufMem);
- 			pDecInfo->userDataBufMem.phy_addr = 0;
- 			err_msg("Unable to obtain virtual mem\n");
-
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index ab3634d..4c4a031 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_VPU_VERSION = 5.4.27
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
-- 
2.1.4
