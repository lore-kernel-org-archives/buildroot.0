Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F0C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 19:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F5661055;
	Mon,  6 Jun 2022 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpnNC8fjgppH; Mon,  6 Jun 2022 19:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F87460C0C;
	Mon,  6 Jun 2022 19:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 021311BF2B8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5CDB81D5A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQof_5_I4p8U for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 19:46:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94D6481C20
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 19:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B800086DC6; Mon,  6 Jun 2022 19:34:25 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 21:45:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d301c6413074ba88be2625305631524476f417
X-Git-Newrev: 6008e96cbb34d28d35077dddde8cd8951d0893d0
X-Patchwork-Hint: ignore
Message-Id: <20220606193425.B800086DC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91dataflashboot: disable on armeb
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6008e96cbb34d28d35077dddde8cd8951d0893d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

at91dataflashboot fails to build on armeb:

/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld: objs/cstartup_ram.o: compiled for a big endian system and target is little endian

Fixes:
 - http://autobuild.buildroot.org/results/e44c042abc1dfb97b4f8a17389d27f842e9dd311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/at91dataflashboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 4055f96410..8b37d84409 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
 	bool "AT91 DataFlashBoot"
-	depends on BR2_arm926t
+	depends on BR2_arm && BR2_arm926t
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
