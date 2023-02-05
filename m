Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC03EC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB0F403B8;
	Sun,  5 Feb 2023 12:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FB0F403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EFHjpRpeumR; Sun,  5 Feb 2023 12:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5661C408C9;
	Sun,  5 Feb 2023 12:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5661C408C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A87A1BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6AC417E2
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6AC417E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BCT7cttACBH for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:21:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22E24146F
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22E24146F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF1208377C; Sun,  5 Feb 2023 12:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:20:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c8cda8c94e00dc4571a6ad1b3f9c1c617a63873
X-Git-Newrev: 70477e5fee6e92b1d783257a8b3e57a78007438e
X-Patchwork-Hint: ignore
Message-Id: <20230205122112.DF1208377C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/post-image.sh: Don't insist
 on a xilinx/ prefix for .dts files.
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

commit: https://git.buildroot.net/buildroot/commit/?id=70477e5fee6e92b1d783257a8b3e57a78007438e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
buildroot into the linux tree, these .dts files are copied to
arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
them in arch/arm64/boot/xilinx.

This patch does not require the xilinx/ prefix to be present when
symlinking the device-tree to system.dtb where u-boot expects to find
it.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index ed6dbe188c..c5de2db820 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
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
