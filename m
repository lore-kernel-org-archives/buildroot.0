From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:54 -0700
Subject: [Buildroot] [PATCH v2 11/11] imx-vpu: fix IOGetVirtMem return value
	checks
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-12-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buffer address can be < 0 when using a 3G/1G split. Fix the test by
checking against -1 instead.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 ...-lib-fix-IOGetVirtMem-return-value-checks.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch

diff --git a/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch b/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
new file mode 100644
index 0000000..306524f
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch
@@ -0,0 +1,51 @@
+[PATCH] vpu-lib: fix IOGetVirtMem return value checks
+
+buffer address can be < 0 when using a 3G/1G split. Fix the test by
+checking against -1 instead.
+
+Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
+---
+ vpu/vpu_lib.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/vpu/vpu_lib.c b/vpu/vpu_lib.c
+index 1fb731b..7a7f42d 100644
+--- a/vpu/vpu_lib.c
++++ b/vpu/vpu_lib.c
+@@ -1764,7 +1764,7 @@ RetCode vpu_EncStartOneFrame(EncHandle handle, EncParam * param)
+ 				err_msg("Unable to obtain physical mem\n");
+ 				return RETCODE_FAILURE;
+ 			}
+-			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) <= 0) {
++			if (IOGetVirtMem(&pEncInfo->picParaBaseMem) == -1) {
+ 				IOFreePhyMem(&pEncInfo->picParaBaseMem);
+ 				pEncInfo->picParaBaseMem.phy_addr = 0;
+ 				err_msg("Unable to obtain virtual mem\n");
+@@ -2982,7 +2982,7 @@ RetCode vpu_DecGetInitialInfo(DecHandle handle, DecInitialInfo * info)
+ 			UnlockVpu(vpu_semap);
+ 			return RETCODE_FAILURE;
+ 		}
+-		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
++		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
+ 			IOFreePhyMem(&pDecInfo->userDataBufMem);
+ 			pDecInfo->userDataBufMem.phy_addr = 0;
+ 			err_msg("Unable to obtain virtual mem\n");
+@@ -4017,7 +4017,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
+ 				UnlockVpu(vpu_semap);
+ 				return RETCODE_FAILURE;
+ 			}
+-			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) <= 0) {
++			if (IOGetVirtMem(&pDecInfo->picParaBaseMem) == -1) {
+ 				IOFreePhyMem(&pDecInfo->picParaBaseMem);
+ 				pDecInfo->picParaBaseMem.phy_addr = 0;
+ 				err_msg("Unable to obtain virtual mem\n");
+@@ -4057,7 +4057,7 @@ RetCode vpu_DecStartOneFrame(DecHandle handle, DecParam * param)
+ 			UnlockVpu(vpu_semap);
+ 			return RETCODE_FAILURE;
+ 		}
+-		if (IOGetVirtMem(&pDecInfo->userDataBufMem) <= 0) {
++		if (IOGetVirtMem(&pDecInfo->userDataBufMem) == -1) {
+ 			IOFreePhyMem(&pDecInfo->userDataBufMem);
+ 			pDecInfo->userDataBufMem.phy_addr = 0;
+ 			err_msg("Unable to obtain virtual mem\n");
+
-- 
2.0.0
