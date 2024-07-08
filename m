Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51ADC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A47B60A48;
	Mon,  8 Jul 2024 20:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNlq8eOMPm60; Mon,  8 Jul 2024 20:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E5E60B3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E5E60B3B;
	Mon,  8 Jul 2024 20:25:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 319601BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28549404D4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_mH96Vk1KCy for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1980D404D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1980D404D1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 135B584008; Mon,  8 Jul 2024 20:25:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:24:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1da5466bab46b20a4ebbc28cfdbba9135775ae6d
X-Git-Newrev: 34cc250ff55552f719ef8fdf4a6f945d189c5785
X-Patchwork-Hint: ignore
Message-Id: <20240708202547.135B584008@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro: fix
 patch fuzz
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34cc250ff55552f719ef8fdf4a6f945d189c5785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, imx-vpu-hantro fails to build with output:

    Applying 0001-Fix-ion.h-header-inclusion-to-be-standard.patch using patch:
    patching file Makefile_G1G2
    patching file Makefile_H1
    patching file decoder_sw/software/linux/dwl/dwl_linux.c
    Hunk #1 FAILED at 50.
    1 out of 1 hunk FAILED -- saving rejects to file decoder_sw/software/linux/dwl/dwl_linux.c.rej
    patching file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
    Hunk #1 FAILED at 52.
    1 out of 1 hunk FAILED -- saving rejects to file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-ion.h-header-inclusion-to-be-standard.patch       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
index 7a89dd99e0..cdde7d9ff3 100644
--- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -9,6 +9,8 @@ https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile_G1G2                                             | 4 ++--
  Makefile_H1                                               | 4 ++--
@@ -51,20 +53,20 @@ index 7d5e33b..c0e5727 100755
 --- a/decoder_sw/software/linux/dwl/dwl_linux.c
 +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
 @@ -50,7 +50,7 @@
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0) || defined(ENABLE_DMABUF_HEAP)
  #include <linux/dma-heap.h>
  #else
 -#include <linux/ion.h>
 +#include <ion.h>
  #endif
  #ifdef ANDROID
- #include <linux/mxc_ion.h>
+ #if !defined(ENABLE_DMABUF_HEAP)
 diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 index 312e4cc..70630c3 100755
 --- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
 +++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
-@@ -52,7 +52,7 @@
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
+@@ -51,7 +51,7 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0) || defined(ENABLE_DMABUF_HEAP)
  #include <linux/dma-heap.h>
  #else
 -#include <linux/ion.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
