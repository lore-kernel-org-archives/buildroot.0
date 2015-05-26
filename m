From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:30 +0200
Subject: [Buildroot] [PATCH v2 01/13] libfslvpuwrap: bump version to 1.0.57
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432628382-16799-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New feature for 1.0.57 version:
* Add workaround for rmvb decode timeout issue when no enough frame buffer.
* Re-enable the detection of resolution change due to the latest firmware.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/b1edff7ec98fec1c969f6f2736a79d38aee75580

The previous patch applied can now be removed since it has been integrated
in ver 1.0.51 (see Changelog).

This package has been implicitely tested through gstreamer as the plugins
rely on it for vpu decoding:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
  matroskademux ! imxvpudec ! imxipuvideosink

Regards,
Gary
---
 ...-fix-tests-of-return-value-from-IOGetVirt.patch | 44 ----------------------
 package/libfslvpuwrap/libfslvpuwrap.mk             |  2 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch

diff --git a/package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch b/package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
deleted file mode 100644
index 3927430..0000000
--- a/package/libfslvpuwrap/0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7ca66c10c05168c7d342df7c7a70d4a1ae0629f7 Mon Sep 17 00:00:00 2001
-From: Eric Nelson <eric.nelson@boundarydevices.com>
-Date: Sat, 28 Jun 2014 09:45:09 -0700
-Subject: [PATCH] vpu_wrapper: fix tests of return value from IOGetVirtMem
-
-IOGetVirtMem() returns a pointer or specifically -1 (MAP_FAILED)
-in the case of failure.
-
-This problem is being discussed upstream at
-https://lists.yoctoproject.org/pipermail/meta-freescale/2014-June/008993.html.
-
-Upstream-Status: Pending
-
-Signed-off-by: Laci Tele <laci@boundarydevices.com>
-Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
----
- vpu_wrapper.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/vpu_wrapper.c b/vpu_wrapper.c
-index 9249174..148c5df 100755
---- a/vpu_wrapper.c
-+++ b/vpu_wrapper.c
-@@ -6653,7 +6653,7 @@ VpuDecRetCode VPU_DecGetMem(VpuMemDesc* pInOutMem)
- 		return VPU_DEC_RET_FAILURE;
- 	}
- 	ret=IOGetVirtMem(&buff);
--	if(ret==0) //if(ret!=RETCODE_SUCCESS)
-+	if(ret == -1) //if(ret==MAP_FAILED)
- 	{
- 		VPU_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,ret);
- 		return VPU_DEC_RET_FAILURE;
-@@ -8277,7 +8277,7 @@ VpuEncRetCode VPU_EncGetMem(VpuMemDesc* pInOutMem)
- 		return VPU_ENC_RET_FAILURE;
- 	}
- 	ret=IOGetVirtMem(&buff);
--	if(ret==0) //if(ret!=RETCODE_SUCCESS)
-+	if(ret == -1) //if(ret==MAP_FAILED)
- 	{
- 		VPU_ENC_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,(UINT32)ret);
- 		return VPU_ENC_RET_FAILURE;
--- 
-1.9.1
-
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 01b2999..625f586 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 1.0.46
+LIBFSLVPUWRAP_VERSION = 1.0.57
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
-- 
2.1.4
