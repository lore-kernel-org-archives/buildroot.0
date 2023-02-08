Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D50DC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46F4E40C1F;
	Wed,  8 Feb 2023 15:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F4E40C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3E9uiHSLezEN; Wed,  8 Feb 2023 15:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80C8440C22;
	Wed,  8 Feb 2023 15:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C8440C22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BED7E1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A638D40BAA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A638D40BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXfOLRzvQHVn for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:55:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C277140465
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C277140465
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0DA584714; Wed,  8 Feb 2023 15:55:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 16:54:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a571acddd0badaf9636649d98fd095757878348
X-Git-Newrev: c33a133704166d602090b0b0d394aa9428e6acd4
X-Patchwork-Hint: ignore
Message-Id: <20230208155557.B0DA584714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/afboot-stm32: disable stack-protector
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

commit: https://git.buildroot.net/buildroot/commit/?id=c33a133704166d602090b0b0d394aa9428e6acd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable stack-protector to avoid the following build failure:

/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T stm32f429.lds --gc-sections -o stm32f469i-disco.elf stm32f469i-disco.o gpio.o mpu.o qspi.o start_kernel.o usart-f4.o
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.o: in function `main':
stm32f469i-disco.c:(.text.startup.main+0x3b0): undefined reference to `__stack_chk_guard'
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4c0): undefined reference to `__stack_chk_fail'
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4ec): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/fa6ffab24c3998f21034ab24e8d2852cacde08c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Makefile-disable-stack-protector.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch b/boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch
new file mode 100644
index 0000000000..27a81b45d5
--- /dev/null
+++ b/boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch
@@ -0,0 +1,36 @@
+From d65b07d6fe438e760fdbc33a8e42650a27d5b417 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Dec 2022 11:09:38 +0100
+Subject: [PATCH] Makefile: disable stack-protector
+
+Disable stack-protector to avoid the following build failure:
+
+/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T stm32f429.lds --gc-sections -o stm32f469i-disco.elf stm32f469i-disco.o gpio.o mpu.o qspi.o start_kernel.o usart-f4.o
+/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.o: in function `main':
+stm32f469i-disco.c:(.text.startup.main+0x3b0): undefined reference to `__stack_chk_guard'
+/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4c0): undefined reference to `__stack_chk_fail'
+/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4ec): undefined reference to `__stack_chk_guard'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fa6ffab24c3998f21034ab24e8d2852cacde08c1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 8f42be1..8da7a25 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,6 +14,7 @@ CFLAGS := -mthumb -mcpu=cortex-m4
+ CFLAGS += -ffunction-sections -fdata-sections
+ CFLAGS += -Os -std=gnu99 -Wall
+ CFLAGS += -fno-builtin
++CFLAGS += -fno-stack-protector
+ LINKERFLAGS := --gc-sections
+ 
+ obj-y += gpio.o mpu.o qspi.o start_kernel.o
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
