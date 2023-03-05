Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD68BC61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F7640E47;
	Sun,  5 Mar 2023 17:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F7640E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEo6jYROGnDq; Sun,  5 Mar 2023 17:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A10A410DC;
	Sun,  5 Mar 2023 17:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A10A410DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E09F1BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E5C7817B0
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5C7817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI_C3DPn3XCu for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF93D817B3
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF93D817B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADBA886328; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:21:45 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 882dd58772411e6503b87e593441cdf4a1a893e5
X-Git-Newrev: 0e2cab4bdb4e7f410ad45fa739779225858ad99f
X-Patchwork-Hint: ignore
Message-Id: <20230305173947.ADBA886328@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] boot/at91dataflashboot:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e2cab4bdb4e7f410ad45fa739779225858ad99f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
