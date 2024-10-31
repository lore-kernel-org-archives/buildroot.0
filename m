Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B252D767F1
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF17140CEF;
	Thu, 31 Oct 2024 17:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAcASsBFngpM; Thu, 31 Oct 2024 17:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF19C40CF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF19C40CF3;
	Thu, 31 Oct 2024 17:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6040B5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41F2760B1F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5gXC4kn4mSn for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6AF60B1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E6AF60B1D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:41:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01BE684F2F; Thu, 31 Oct 2024 17:41:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 18:40:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e82217622ea4778148de82a4b77972940b5e9a9e
X-Git-Newrev: 9e3d572ff532df945fbc282fed22d10098e5718b
X-Patchwork-Hint: ignore
Message-Id: <20241031174105.01BE684F2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pc: fix grub root device in help
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e3d572ff532df945fbc282fed22d10098e5718b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rootfs partition is the first partition, not the second one: the
Grub configuration file already contains root=/dev/sda1 by default,
and it should be changed to root=/dev/vda1 is Qemu emulation is used.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
