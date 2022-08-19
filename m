Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CE5C3F6B0
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E323F41CFC;
	Fri, 19 Aug 2022 15:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E323F41CFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdVa_3lSurKs; Fri, 19 Aug 2022 15:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED87C41D21;
	Fri, 19 Aug 2022 15:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED87C41D21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865F81BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D86D842A5
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D86D842A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFS4QbqU3PDG for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB638842C8
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB638842C8
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:22 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id g16so3441161qkl.11
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UTkasqZeCsZ/E5F/QfYbh2XHNrPMeXTMCC5eKN9ODMw=;
 b=pJ/8d8ebJHHn9OEPzQUAgkwcAMEwfn9vDur7Eom4Gtn7NrFNx+ey2/Jk2DwlxKYMWB
 pcf3BMM73JOt7ZABvvYIa4RxI4AI6GV0raIaILtWzM6DTlqPlq8peTbfrYCVZwHYVyY/
 BjnbCCTsGBeX5aGfFHtCzWXV5pdFk3VJYeEgIsGiUJ+cYTxMmvo14RLMzF64mctbfxX1
 DrbRYTHpiAugAiq61PXIEQCwtOqeQCfzwnI0SMhhjcxuNtjt/0RyIgQWaMK/BN1GA5fV
 ZBbkwEvSiA/e33qAIpDkjnPsQOC/+N8SH0T1XDG0pB1NMqrFRremTQwKR7dKtbOvSWi4
 AiVw==
X-Gm-Message-State: ACgBeo1UZq6HLaVZstsP8huYuTMtVrVQR/CUw6ws1SJJTmpf79DLmbbK
 d2zxPsm3UWevuXLozqiz2eX4Dq084Wa6dA==
X-Google-Smtp-Source: AA6agR7BYrQYap8vPVHAvtflqO0wvQ6oqvVkX9RQNbqjRX4sVK2gEhS/rp4FFzOoTdsFC5IPv0yMqQ==
X-Received: by 2002:a05:620a:1672:b0:6bb:4656:2258 with SMTP id
 d18-20020a05620a167200b006bb46562258mr5742117qko.602.1660922302171; 
 Fri, 19 Aug 2022 08:18:22 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:21 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:29 -0400
Message-Id: <20220819151734.926106-5-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UTkasqZeCsZ/E5F/QfYbh2XHNrPMeXTMCC5eKN9ODMw=;
 b=NFaLGspuos1Uan5rZwag0UJrFp9yDZWD91aCPVkz4JpXdjZ8xaA0ChFq8Yy+IZa2m+
 GAz+/Q5aBWMYDJGZRytYrQTCpCqsapEPyvPGeGWBD1hYcUucMBMTeR1Y5QS3q3HOc+eo
 A6HlCJw/Q3Wftl5i8FKkNYEZcNpeZYvV3oLmeZD2DAGZBhJA1bO//eZkiQzNhXtqyTAn
 2VhcWmvWtg2x37mQ1B3ZdT0MGorJDHx58hYAKb0mwU9egviaalkkkyjGgOQcC+NOmPQY
 7oDhZdgnbmYcQ/72Ckuaxi3OAd5VCIAi0nOJ283rkkE3MGvPdhPuAs+uuM8u3vtDOVzz
 mzBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NFaLGspu
Subject: [Buildroot] [PATCH v3 4/8] arch/arm: add support for FDPIC
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
This patch enables support for building a toolchain that produces FDPIC
binaries.

The target name for an FDPIC toolchain must be
arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
and requires a special case.

According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
available on all ARM platforms, not just no-MMU.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in      | 1 +
 package/Makefile.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 4cd58041a4..c639738f5f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -39,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..81a7028275 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -37,7 +37,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+# FDPIC on ARM requires a special target name: it has no OS field and must
+# use the suffix -uclinuxfdpiceabi.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
