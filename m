Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D4C3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 10:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE5E60AF1;
	Sat, 31 Dec 2022 10:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE5E60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRqWy4UfFvlA; Sat, 31 Dec 2022 10:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A65B660ADD;
	Sat, 31 Dec 2022 10:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65B660ADD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C71841BF83C
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 10:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EDB560ADD
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 10:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDB560ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9oLzz-PXoei for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 10:15:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921CE60ACA
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 921CE60ACA
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 10:15:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h16so22049530wrz.12
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 02:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRP/B81mwfWVSKnFIDEzxiUiWHxSLqXW/Pk7YszWUIk=;
 b=omRTmbPSb6Ywz3BPE9LDOal7t6/BHS81nmqpJ1PMJCyFELnfDsfLgFQ5tynbIYUvmM
 8ArcBme/plpcoh46R4KxpQm1w965x/0CjqBot5qsWuIDP+AeTXjpvgdPA+Ls7pq1J7AX
 nsDw9tLS4WWtIV4Bz6EUEoDxIDxDYP+MFLZIGs6wrQ2g81vLwGRJrLj3nrZGxQQSen36
 Bj+zxXxOpm0fot8HZ1mSvSCLrkIK3dDSupUWj1IYjIvztXiXbwDuQaXlrEFV4ZIFoIUo
 BNJmHCz4SzCkDWB+gJj01EPFlS6pHFaP04FD46yipN44s2hXEabm8odIxWStGFBVnYcX
 rfMg==
X-Gm-Message-State: AFqh2koblDidyh6j0+5TdquS9rdG5eWannb/c7R3FmVy7Z7ICqfS+p/F
 4PR3FX6A8fT77HlegDSEOsL/7wtdW1s=
X-Google-Smtp-Source: AMrXdXua3Uie2W6R1JMVEhFwCNvjZnPlmSB7r48TWQskRcXgXlzMv1j15bR7xMWMkSeUtqUyqWgDKA==
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id
 cc7-20020a5d5c07000000b00242335326f5mr21187809wrb.9.1672481715303; 
 Sat, 31 Dec 2022 02:15:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffd91000000b002882600e8a0sm8694606wrr.12.2022.12.31.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 02:15:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 11:14:51 +0100
Message-Id: <20221231101451.521367-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xRP/B81mwfWVSKnFIDEzxiUiWHxSLqXW/Pk7YszWUIk=;
 b=GzdCX5xzOzkLZqj+ZbShr4a7kJ1ciLJaXpkKgGCR5wBvv58ddFSF53Ykocv6rDr8mE
 NPAvnjzunbh216s9+W6AYstGATumel0kg3faiFNz6x9Fa654zSKcZC8/Btg3zzXR7b0l
 vOKH7UO0YkKBfNb0EU5xyf82wV6MQqoeixu8uOzkYlVsNVwq1WFbdRAMffQo2HwLs4KQ
 mazWEudmx7UBHZv36bqQH+Mdry4ZYpBg0RENtMEUqkZ3Yti1Drwpb3vUD5/hpVYXtLFz
 k6cDYpL8Nn3IGLeIeylPAVz3mIwErNmp6WkrZf6zeATGSfC48BZlIQQ3cfFxZ8QUYYW2
 pmVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GzdCX5xz
Subject: [Buildroot] [PATCH 1/1] boot/afboot-stm32: disable stack-protector
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
Cc: Lee Jones <lee.jones@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable stack-protector to avoid the following build failure:

/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld -T stm32f429.lds --gc-sections -o stm32f469i-disco.elf stm32f469i-disco.o gpio.o mpu.o qspi.o start_kernel.o usart-f4.o
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.o: in function `main':
stm32f469i-disco.c:(.text.startup.main+0x3b0): undefined reference to `__stack_chk_guard'
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4c0): undefined reference to `__stack_chk_fail'
/home/autobuild/autobuild/instance-14/output-1/host/bin/arm-buildroot-linux-gnueabi-ld: stm32f469i-disco.c:(.text.startup.main+0x4ec): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/fa6ffab24c3998f21034ab24e8d2852cacde08c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...003-Makefile-disable-stack-protector.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
