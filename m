Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6D1D743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADF760E4D;
	Wed, 20 Nov 2024 21:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHl-XcNC7pDR; Wed, 20 Nov 2024 21:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E069E6109A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E069E6109A;
	Wed, 20 Nov 2024 21:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AEFB970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89C4C85115
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X3Skk_pa57F for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8D585133
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE8D585133
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB0C680FCA; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 22:00:42 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 8e382f90706741e2d6704789de2e901f21ea449b
X-Git-Newrev: 6239e449d15e6f714714353bf10f100e0397d3fa
X-Patchwork-Hint: ignore
Message-Id: <20241120210257.BB0C680FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] configs/pc: fix grub root
 device in help
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6239e449d15e6f714714353bf10f100e0397d3fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The rootfs partition is the first partition, not the second one: the
Grub configuration file already contains root=/dev/sda1 by default,
and it should be changed to root=/dev/vda1 if Qemu emulation is used.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e3d572ff532df945fbc282fed22d10098e5718b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 41aec50d36..99e8f442ea 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -42,8 +42,8 @@ Emulation in qemu (BIOS)
 1. Edit grub-bios.cfg
 
   Since the driver will show up in the virtual machine as /dev/vda,
-  change board/pc/grub-bios.cfg to use root=/dev/vda2 instead of
-  root=/dev/sda2. Then rebuild grub2 and the image.
+  change board/pc/grub-bios.cfg to use root=/dev/vda1 instead of
+  root=/dev/sda1. Then rebuild grub2 and the image.
 
 2. Run the emulation with:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
