Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C281C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637C9611A2;
	Sat, 17 Dec 2022 05:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 637C9611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpvsfZBTqiJO; Sat, 17 Dec 2022 05:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874A060C08;
	Sat, 17 Dec 2022 05:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874A060C08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9563D1BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DCCB821C4
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCCB821C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDIm0c7ylIlE for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:13:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0426A81F47
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0426A81F47
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:13:40 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id x11so4347488qtv.13
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 21:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yRmyT5iSVJA5cwszEM0aOgXga5YUfmagc5bvaGwM/E=;
 b=fOj5wsWlVeuC9O9M7GxijRuY2Ah8j+03jkgYDf5iSVSF9IrfqFWLxfqCO43lDJZGd6
 Mcu9q4YF7fXhwEMj2HF0p1stnaHQdcBV+ilzyEZTfcZ1cY9Fqpx3JnDIiWu3zbuyPLPM
 /lW+A5h5cSxt47wAKZXTopJz0RpKV7+Fz/2Y4p2jDvrDQsmhl7naoAUV7d31HnnTQR5g
 JWcswGLe36RoEzUii0KffXQGUBl4Z12wLhUWWW/YRiMMEvV1z8wMdkTnBAu2X03SjCGb
 7vdO/JRk31WHisOyyfaLRHW93PyfYmFYESjUcwqVO958BsomdvkMYd2SMhEIVZ+Rl+/s
 1RjQ==
X-Gm-Message-State: ANoB5pneO6Yan42idHchzlTwGZ7Ems1rDgb+Vtp4zfDjD9h+z2oiNxmR
 S281uATsyIAIZsuUrCqt++Ks8RfA4Tk=
X-Google-Smtp-Source: AA0mqf5OTcD5PZcz486Da9I5/RudpDeyUN9vp6BffmQ8JOH4KhlAeBryZfTZWJxAykWIgpc/svSvgA==
X-Received: by 2002:a05:622a:1e17:b0:3a5:977e:9c77 with SMTP id
 br23-20020a05622a1e1700b003a5977e9c77mr39383783qtb.20.1671254019325; 
 Fri, 16 Dec 2022 21:13:39 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 q17-20020ac87351000000b003a7fef41526sm2448854qtp.77.2022.12.16.21.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 21:13:38 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 00:13:33 -0500
Message-Id: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yRmyT5iSVJA5cwszEM0aOgXga5YUfmagc5bvaGwM/E=;
 b=ExKEAGdP0iIry+x6bs6jvZV/Xv2xDyl5GbtduBinE3wQk08Cf7WvZDeB2XaS8rnAfN
 USplbKuvA/r9FmAQCwNm3k/piklrbH6/asxbI5rSmYc1ai0Uu/6VPhl3O+oOdoNoXXpL
 Ps1M4vIAY3Gxvx8f8MMghU82nv8nEWMxb3J9/+AUN9wh2+tfe9ZQmanfT5ev9UbKcjkT
 0m2Ize6BP9RLQReZxROKgPnMhBcxP+RprrdtUk7/A3Raz5xmL9q5uNqV5GNXP7aMUxaC
 +Ca6knI2WWUGDLKbNn+hUJbZulHlXWiAKEVAxJC8ss+d0sXyuyOoxz88/QIILccvLV5Z
 qE5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ExKEAGdP
Subject: [Buildroot] [PATCH v2 0/4] Add RISC-V 32 NOMMU support
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch-set aims to add NOMMU support to RV32.
Many people want to build simple emulators or HDL
models of RISC-V this patch makes it posible to
run linux on them.

Yimin Gu is the original author of this set.
Submitted here:
https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html

Though Jesse T made the configs more concise.
Aswell fixed the 1k line Dconf,
and split into 3 distinct patches.

A couple things to note:
- UcLibc seems to want __ARCH_WANT_TIME32_SYSCALLS
for adjtimex, but Linux doesnt provide this for RV32.
- Patch 2 adds __ARCH_WANT_STAT64,
but I'm not sure if this is needed.
- Busybox doesnt build umask or unset for NOMMU systems.
I have seen this happen on STM32 aswell as I.MXRT

[__ARCH_WANT_TIME32_SYSCALLS]:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20190218210712.3503891-5-arnd@arndb.de/

Jesse Taube (1):
  configs/qemu_riscv32_nommu_virt_defconfig: New defconfig

Yimin Gu (3):
  package/elf2flt: add RISC-V 32-bits support
  package/uclibc: Add RISC-V 32-bit support
  arch: Enable support for RISC-V 32-bit NOMMU

 arch/Config.in.riscv                          |   2 -
 board/qemu/riscv32-virt/nommu/defconfig       |  16 ++
 .../riscv32-virt/nommu/patches/linux-headers  |   1 +
 ...nfig-Allow-RV32-to-build-with-no-MMU.patch |  43 ++++++
 ...le-stat64-and-time32-for-RV32-uclibc.patch |  40 +++++
 board/qemu/riscv32-virt/readme.txt            |   6 +-
 configs/qemu_riscv32_nommu_virt_defconfig     |  31 ++++
 package/Makefile.in                           |   4 +-
 .../0007-Added-RISC-V-32-bit-support.patch    |  87 +++++++++++
 .../uclibc/0001-RISC-V-32-bit-support.patch   | 145 ++++++++++++++++++
 package/uclibc/Config.in                      |   2 +
 11 files changed, 372 insertions(+), 5 deletions(-)
 create mode 100644 board/qemu/riscv32-virt/nommu/defconfig
 create mode 120000 board/qemu/riscv32-virt/nommu/patches/linux-headers
 create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0001-riscv-Kconfig-Allow-RV32-to-build-with-no-MMU.patch
 create mode 100644 board/qemu/riscv32-virt/nommu/patches/linux/6.0/0002-riscv-Enable-stat64-and-time32-for-RV32-uclibc.patch
 create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
 create mode 100644 package/elf2flt/0007-Added-RISC-V-32-bit-support.patch
 create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch

-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
