From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:32:15 +0200
Subject: [Buildroot] [git commit] libfslvpuwrap: fix tests of return value
	from IOGetVirtMem
Message-ID: <20140726073240.B8BCD9D2FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b29dfc70a727846148642940a883b63959cced8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Same as similar patches for imx-vpu, the returned value from
IOGetVirtMem was not properly checked.

[Thomas: add upstream reference to the patch, suggested by Yann
E. Morin.]

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-fix-tests-of-return-value-from-IOGetVirt.patch |   44 ++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
new file mode 100644
index 0000000..3927430
--- /dev/null
+++ b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
@@ -0,0 +1,44 @@
+From 7ca66c10c05168c7d342df7c7a70d4a1ae0629f7 Mon Sep 17 00:00:00 2001
+From: Eric Nelson <eric.nelson@boundarydevices.com>
+Date: Sat, 28 Jun 2014 09:45:09 -0700
+Subject: [PATCH] vpu_wrapper: fix tests of return value from IOGetVirtMem
+
+IOGetVirtMem() returns a pointer or specifically -1 (MAP_FAILED)
+in the case of failure.
+
+This problem is being discussed upstream at
+https://lists.yoctoproject.org/pipermail/meta-freescale/2014-June/008993.html.
+
+Upstream-Status: Pending
+
+Signed-off-by: Laci Tele <laci@boundarydevices.com>
+Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
+---
+ vpu_wrapper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/vpu_wrapper.c b/vpu_wrapper.c
+index 9249174..148c5df 100755
+--- a/vpu_wrapper.c
++++ b/vpu_wrapper.c
+@@ -6653,7 +6653,7 @@ VpuDecRetCode VPU_DecGetMem(VpuMemDesc* pInOutMem)
+ 		return VPU_DEC_RET_FAILURE;
+ 	}
+ 	ret=IOGetVirtMem(&buff);
+-	if(ret==0) //if(ret!=RETCODE_SUCCESS)
++	if(ret == -1) //if(ret==MAP_FAILED)
+ 	{
+ 		VPU_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,ret);
+ 		return VPU_DEC_RET_FAILURE;
+@@ -8277,7 +8277,7 @@ VpuEncRetCode VPU_EncGetMem(VpuMemDesc* pInOutMem)
+ 		return VPU_ENC_RET_FAILURE;
+ 	}
+ 	ret=IOGetVirtMem(&buff);
+-	if(ret==0) //if(ret!=RETCODE_SUCCESS)
++	if(ret == -1) //if(ret==MAP_FAILED)
+ 	{
+ 		VPU_ENC_ERROR("%s: get virtual memory failure: size=%d, ret=%d \r\n",__FUNCTION__,buff.size,(UINT32)ret);
+ 		return VPU_ENC_RET_FAILURE;
+-- 
+1.9.1
+
