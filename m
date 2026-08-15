Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9286DC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF504086C;
	Sat, 15 Aug 2026 14:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5evie09TMjx; Sat, 15 Aug 2026 14:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722C740877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786802677;
	bh=J/kkmLJJfEjFNjkP2bkM9bn0SkSJTY7K7e87mUHfOEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=odlBW+Jo49sfgsKAnnfyjzuxEeyFoYChaNJawbsek/rtrz1AOCBB/WgzWl5B6vN8k
	 VufOkLeq0og+zrmPO5TgvGM9KADAFUm+EcFkb0chNFSbaCl9xTx1QbkTGFT8uoV1uV
	 YCnMGHmaAm4LsRutlKB3jcsbydvGrzrXoGEunG5U633Dul0VofEoEX81f0knig8gEm
	 Qotf2yOC5Mstx/mGfE4pxM/Mrao3JgmTUx2AgqMKK8Bgo3w7kSvBnXWEiDTT/TNUrb
	 VDcZBdnqq8N8B0bTOCVOOGlEVNfl1HUK80f6AvMYvYXoeHuR8+em/wGND0rT3kus5W
	 vy0okVYhd20QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722C740877;
	Sat, 15 Aug 2026 14:04:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D42A62BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABF84004D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dXyYZ_fyi8O for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106B740026
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 106B740026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:04:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A8118878E; Sat, 15 Aug 2026 14:03:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 16:02:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc224761b04ac447ef708838a298f09ccaca1595
X-Git-Newrev: 76b47472af9c78a36891a2ab3f3c0ee954534013
X-Patchwork-Hint: ignore
Message-Id: <20260815140344.7A8118878E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76b47472af9c78a36891a2ab3f3c0ee954534013
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With qemu version 11.0.0, support for microblazeel has been folded into the
microblaze target. This means that the run command for microblazeel-mmu needs
to be changed to reflect this.

See the notes in the qemu bump commit to 11.0.0 for more details:
https://gitlab.com/buildroot.org/buildroot/-/commit/9a5369effd22011b52b82c91f702bacde690c41a

See also qemu removed feature documentation:
https://gitlab.com/qemu-project/qemu/-/blob/v11.0.0/docs/about/removed-features.rst#qemu-system-microblazeel-removed-in-11-0

Run command for qemu versions prior to 11.0.0:
qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

New run command since qemu version 11.0.0:
qemu-system-microblaze -M petalogix-s3adsp1800,endianness=little -kernel output/images/linux.bin -serial stdio

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>
[Julien:
 - fix new command line in commit log
 - add link to qemu removed feature documentation in commit log
 - change link to buildroot commit from github to gitlab
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/microblazeel-mmu/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 20fa0072ed..4d1e660650 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
+ qemu-system-microblaze -M petalogix-s3adsp1800,endianness=little -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
