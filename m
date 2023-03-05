Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56560C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF418401D1;
	Sun,  5 Mar 2023 17:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF418401D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_qeik7tXm-o; Sun,  5 Mar 2023 17:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF107403AC;
	Sun,  5 Mar 2023 17:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF107403AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319521BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF0F400F3
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF0F400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9VBVVP7opQE for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1369C401D8
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1369C401D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0304D864FF; Sun,  5 Mar 2023 17:40:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:21:52 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 05e97cdf8520ff0b9d3a81f0426b388c683790a9
X-Git-Newrev: 9f019825b801223d654c814cc8e987ef803291f8
X-Patchwork-Hint: ignore
Message-Id: <20230305174058.0304D864FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/at91dataflashboot:
 disable stack-protector
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f019825b801223d654c814cc8e987ef803291f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable stack-protector to avoid the following build failure:

/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: objs/main.o: in function `main':
main.c:(.text.startup+0x834): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/502c54be4978e628724d72ee2a75d4c5e0a6ace8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d868d09d3a0c0db2c5112964139e5ecae8b1da51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 0ad8b6fc44..c66f27e343 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -12,7 +12,8 @@ AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
 
 define AT91DATAFLASHBOOT_BUILD_CMDS
-	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS)
+	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
 endef
 
 define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
