Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07566C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2BB60C0A;
	Sun, 12 Mar 2023 09:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2BB60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmFEihFcxXfJ; Sun, 12 Mar 2023 09:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32BD60709;
	Sun, 12 Mar 2023 09:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32BD60709
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B09111BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EE0160C0A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE0160C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8jfozRMKfHf for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2DD1606B0
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2DD1606B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE99486E56; Sun, 12 Mar 2023 09:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:08:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b07c7eb6f48004753e0959b304f8489132ff7b39
X-Git-Newrev: d1b87a346a0c0b775ee44ec7090bee03ba8be7ba
X-Patchwork-Hint: ignore
Message-Id: <20230312090853.DE99486E56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/qemu/aarch64-sbsa: use
 PARTLABEL to specify root
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1b87a346a0c0b775ee44ec7090bee03ba8be7ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Specifying /dev/sda2 is ambigious, and when booting my arm64 machine
this tries to mount the second partition of my ATA drive, instead of
the second partition of the USB-stick, simply because the ATA driver
is probed earlier than the USB controller driver.

To solve this problem, use PARTLABEL=root to specify the root filesystem.
This is similar to how it is currently done for board/aarch64-efi/grub.cfg
and board/qemu/aarch64-ebbr/grub.cfg.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-sbsa/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
index cd486caf4c..39b7842f8f 100644
--- a/board/qemu/aarch64-sbsa/grub.cfg
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=/dev/sda2 rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait console=ttyAMA0
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
