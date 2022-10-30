Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7013DECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 026C380E7E;
	Sun, 30 Oct 2022 14:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026C380E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJkH7PRaMevW; Sun, 30 Oct 2022 14:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26A1812D4;
	Sun, 30 Oct 2022 14:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26A1812D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE1121BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA2DA80F2C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA2DA80F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvczJinUcnWU for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA35480E7E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA35480E7E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B89B6874AD; Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:02:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd317f701b60ddbf546504bf3f8aca6b960e05af
X-Git-Newrev: c4db8416ff2c9ace3c79a71ccfa3d942daadd093
X-Patchwork-Hint: ignore
Message-Id: <20221030140306.B89B6874AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: fix build with kernel
 >= 5.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4064485152592779471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4064485152592779471==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c4db8416ff2c9ace3c79a71ccfa3d942daadd093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 5.18 raised since bump to
version 3.2.0 in commit 6cbfed0dbf43c5e04e3cc543b642e3c996bfed97:

/home/autobuild/autobuild/instance-0/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wct4xxp/base.c: In function ‘t4_allocate_buffers’:
/home/autobuild/autobuild/instance-0/output-1/build/dahdi-linux-3.2.0/drivers/dahdi/wct4xxp/base.c:3864:17: error: implicit declaration of function ‘pci_alloc_consistent’ [-Werror=implicit-function-declaration]
 3864 |         alloc = pci_alloc_consistent(wc->dev, numbufs * T4_BASE_SIZE(wc) * 2,
      |                 ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ddacd807dddeb1649e957264ac57bba27d9bb463

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...compilation-issues-on-linux-kernel-5-18-0.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch b/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch
new file mode 100644
index 0000000000..a896def375
--- /dev/null
+++ b/package/dahdi-linux/0003-Fixed-compilation-issues-on-linux-kernel-5-18-0.patch
@@ -0,0 +1,58 @@
+From dbb43101c2a9205b67223b006bf75c29ebadced9 Mon Sep 17 00:00:00 2001
+From: Pushkar Singh <psingh@sangoma.com>
+Date: Tue, 2 Aug 2022 19:40:00 +0530
+Subject: [PATCH] Fixed compilation issues on linux kernel >= 5.18.0
+
+With kernel 5.18 and higher
+PCI: Remove the deprecated "pci-dma-compat.h" API
+
+The commit will make sure to impplement pci dma related api's
+[Retrieved from:
+https://github.com/asterisk/dahdi-linux/commit/dbb43101c2a9205b67223b006bf75c29ebadced9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/dahdi/kernel.h | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index ed81e9e3..35e93bc4 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -58,6 +58,37 @@
+ 
+ #include <linux/poll.h>
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
++#include <linux/pci.h>
++#include <linux/dma-mapping.h>
++
++static inline void *pci_alloc_consistent(struct pci_dev *hwdev, size_t size, dma_addr_t *dma_handle)
++{
++    return dma_alloc_coherent(hwdev == NULL ? NULL : &hwdev->dev, size, dma_handle, GFP_ATOMIC);
++}
++
++static inline void pci_free_consistent(struct pci_dev *hwdev, size_t size, void *vaddr, dma_addr_t dma_handle)
++{
++    dma_free_coherent(hwdev == NULL ? NULL : &hwdev->dev, size, vaddr, dma_handle);
++}
++
++static inline dma_addr_t pci_map_single(struct pci_dev *hwdev, void *ptr, size_t size, int direction)
++{
++    return dma_map_single(&hwdev->dev, ptr, size, (enum dma_data_direction)direction);
++}
++
++static inline void pci_unmap_single(struct pci_dev *hwdev, dma_addr_t dma_addr, size_t size, int direction)
++{
++    dma_unmap_single(&hwdev->dev, dma_addr, size, (enum dma_data_direction)direction);
++}
++
++static inline int pci_set_dma_mask(struct pci_dev *dev, u64 mask)
++{
++    return dma_set_mask(&dev->dev, mask);
++}
++
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 29)
+ #define HAVE_NET_DEVICE_OPS
+ #endif

--===============4064485152592779471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4064485152592779471==--
