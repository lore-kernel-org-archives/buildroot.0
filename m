Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A736C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84192817ED;
	Tue,  2 Aug 2022 20:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84192817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sF9I1aNp4a1I; Tue,  2 Aug 2022 20:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9912B817BD;
	Tue,  2 Aug 2022 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9912B817BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6D41BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A31260E1B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A31260E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rN8Ln0hFO4f7 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:22:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804C160BD8
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 804C160BD8
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:22:05 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id h8so10476348qvs.6
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vE7RGVLQQ03qSwUsxWSGie6sjapbJqi2xs8WBTeZJqc=;
 b=wMm+x3/p2UDBsPSvXoI5AtjRRGJ7Rvm69qYSGFk4p6P548BlkbwpELS2M8HUw16lJZ
 r2lP21a4Vj1JFTQTQMbd8IzMwXo7oh//9vD5KhQi/5mlsZk5yvBodi7Q1ZlBdxKkWKFs
 fRUBzBrASt7hwjLVd/nPEU6qClawS8bMfzn6w6LszzgBOgJjp/9vK6eV+ktuVVl3FS5F
 0KkXUBPjatzWHlQv+t1e0pxhoaDsP4cmzOu/niMQyW0E1UjrGDjttCHaproOvtLzbxpt
 orW9LdHu/LU9D9ghfe+DVA396LVtuPG/LRqGtAYJUfyI26bKMV8aGdTCD/vEWImld42j
 zgDg==
X-Gm-Message-State: ACgBeo1jHMssQFX4p0NvqULBk4BoR4VQrKKGTKpj5NHPcsg7srZIBNEG
 V/hBVYrxZKQLnviEjG1XjYkf/ms+GZtpWQ==
X-Google-Smtp-Source: AA6agR6VA0y7AKcG3zQhHEDllZ/cTouKvL1I4OByG5duXa7PkGURvXhLnaltC2WBlg9Yangj6bKlNQ==
X-Received: by 2002:a05:6214:e86:b0:476:6129:25fc with SMTP id
 hf6-20020a0562140e8600b00476612925fcmr13049523qvb.9.1659471724189; 
 Tue, 02 Aug 2022 13:22:04 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a448e00b006b6757a11fcsm11661660qkp.36.2022.08.02.13.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 13:22:03 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 16:21:38 -0400
Message-Id: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vE7RGVLQQ03qSwUsxWSGie6sjapbJqi2xs8WBTeZJqc=;
 b=xlv0/BaytcIBA653xf0NEa7hIQ9M5S7wF938NkoeZZXTaIipGidPjeWg1JE7CZ/wjG
 ZGzRuUyynrGyRCEcgPlPmIwfbjb5GTsplGbrbgiJH7ontEi6XUswhU6xwJ2+PI7YqneF
 5nfU8vS+JWoW+oKhWC5l/lbQA16FenotdrxbO2KcztXaFF2oEHTU3si0CJ0D5PccYlbE
 JQvueBdEAUZ3X8dN3UN14o3OZw4FzefqIFii8WzjnKZb8PNPFjvQ1RrNV+9MzYFK9iKV
 FBkaT60fHCXB0URhBon6Q3xYMqXpDZyouByGlTOcr4Ag5pVh4d9Yg81EJMFB/ajVWeFf
 I1Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xlv0/Bay
Subject: [Buildroot] [PATCH v2 0/4] Add support for FDPIC binaries on ARM
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduces support for the FDPIC binary format on ARM. FDPIC binaries
enable more efficient use of memory on no-MMU systems.

The first patch reverts the removal of general FDPIC support, while the
second adds support for FDPIC specifically on ARM. The last two patches
disable FDPIC when building Linux and U-Boot.

Changes in v2:
  * Simplify special casing of FDPIC toolchain target
  * Add additional patches to fix building Linux and U-Boot with an
    FDPIC toolchain by passing -mno-fdpic. I have submitted fixes
    upstream to do this automatically, but they have not yet been
    accepted and will take a while to end up in Buildroot.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

Ben Wolsieffer (4):
  Revert "arch: drop now useless support for FDPIC"
  arch/arm: add support for FDPIC
  boot/uboot: pass -mno-fdpic if FDPIC is enabled
  linux: pass -mno-fdpic if FDPIC is enabled

 arch/Config.in           | 15 +++++++++++++++
 boot/uboot/uboot.mk      |  5 +++++
 linux/linux.mk           |  8 +++++++-
 package/Makefile.in      |  6 ++++++
 package/uclibc/uclibc.mk |  8 ++++++++
 5 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
