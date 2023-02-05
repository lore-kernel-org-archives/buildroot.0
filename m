Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC5C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4AC60701;
	Sun,  5 Feb 2023 12:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4AC60701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMV03KFbl1-e; Sun,  5 Feb 2023 12:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 936CB60648;
	Sun,  5 Feb 2023 12:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 936CB60648
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B47601BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B10C8137B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B10C8137B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVCKV0hRhcj3 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:24:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5CE981359
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CE981359
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABFA383782; Sun,  5 Feb 2023 12:24:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:24:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70477e5fee6e92b1d783257a8b3e57a78007438e
X-Git-Newrev: 122c85985f199f48f02c5fbd411111629023fc37
X-Patchwork-Hint: ignore
Message-Id: <20230205122418.ABFA383782@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal/post-image.sh: do not require
 xilinx/ prefix for .dts files
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

commit: https://git.buildroot.net/buildroot/commit/?id=122c85985f199f48f02c5fbd411111629023fc37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
buildroot into the linux tree, these .dts files are copied to
arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
them in arch/arm64/boot/xilinx.

This patch does not require the xilinx/ prefix to be present when
symlinking the device-tree to system.dtb where u-boot expects to find
it.

It is effectively applying the below patch for zynqmp to versal as well:
https://patchwork.ozlabs.org/project/buildroot/patch/20230201195956.1758827-1-gsmecher@threespeedlogic.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/versal/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index f45f29a155..92e65ed3b7 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -5,7 +5,7 @@
 # devicetree listed in the config.
 
 FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
                ${BR2_CONFIG})
 
 [ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
