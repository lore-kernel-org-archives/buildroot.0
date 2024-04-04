Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DF9CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 08:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E7C1401C9;
	Thu,  4 Apr 2024 08:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w98dwwj6rTtL; Thu,  4 Apr 2024 08:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E40D4038B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E40D4038B;
	Thu,  4 Apr 2024 08:13:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8D191BF2B8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D597D8249B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYEavuDIU_5Z for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 08:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58ABC82368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58ABC82368
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58ABC82368
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 08:12:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a468226e135so95380566b.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 01:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712218376; x=1712823176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vk8MUfEsJrZ2kzG3t8OEH0vCVqjvd3er2ihTjAtDwP8=;
 b=Ca10QEO4Bn+p3IDBftGW6P+x92IhS3mlAO7m+GmN0aZ7ZZd+SBPfFAH5WZeyFGZaR/
 w5ksI49Oi0DodnIf0yS3dO8iJ9aC+/ukwo5uMGa7w2Lodmt/UYqpGxqOjd1YjSfg5F1u
 8EDh4GGlQgwrBtJZe/sME6YhVRxpjeFvp7nxTW9nYd9igwYlKPG1coUFfLYA8vYPlnYo
 UZNPALptgKzkem+GoE8kVRgg5j4OzP2busIqTVdfd/j3/lfZFY08dilD4ohG7AF08tW7
 TCjX2M3HwDdifrdBbChyy9vs/UYRPHgCR85kBHxZ3pFSe6DhPzBTdschUcu9vUYQA89f
 E8Kg==
X-Gm-Message-State: AOJu0YxsytOQ00qNqYaqf6FNg996ZoUUS54KTC6UQs454us9gnVXl1gj
 HT3snL/uWiZpDg0JoczKku+g6i23LM6aBMfznVAvC71LdWzh2pAOKaP2c7AG
X-Google-Smtp-Source: AGHT+IFkSADN1xJP8I0AokH9BLP/YgJciytu3pQ2jAhV/i0/qcCiL8ecZzC39Fhv7z9jYkPEqU6gXA==
X-Received: by 2002:a17:906:ca04:b0:a51:7999:3d17 with SMTP id
 jt4-20020a170906ca0400b00a5179993d17mr1094953ejb.2.1712218375723; 
 Thu, 04 Apr 2024 01:12:55 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 ce8-20020a170906b24800b00a466c66804bsm8673682ejb.49.2024.04.04.01.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:12:55 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 10:10:23 +0200
Message-Id: <20240404081021.1180936-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712218376; x=1712823176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vk8MUfEsJrZ2kzG3t8OEH0vCVqjvd3er2ihTjAtDwP8=;
 b=ENMFvzKS6SnT5ik1rxKiwzG65eobEK8QmZQniBUbMfL0/3WcBW3nzcX08zBJeAtbrc
 MkXw5EqHixcR7P95fof96MesuL73d83BcI/0mAbU7jKO2vXVR4I0Gj6AP5LpSidun28X
 kuJdfXUmGRHAFUF6I2RvLNzsSqwNJ0pK25xhdPchHNADCxDJWcfu6OTliJNFfi2NhhxE
 F3y9snGDi6xohyzdMT28rCskrE9vPTEQwN+VtJv5rtYwUwoeSOrnWCmVhg5AENvqPWFd
 B0k+HL4Z0hv89Wa3AnEYhLC3lLX3U0RwgW6CUPoVOVgwQoMXLxH1SMO2Dmvr33kQEXmI
 lE5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ENMFvzKS
Subject: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump version to
 09.02.00.009
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Michael Walle <michael@walle.cc>, Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 95131180ef..2398d02da2 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
+sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 1f8ade207c..fcf7b93235 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -6,7 +6,7 @@
 
 # The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
 # Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
-TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
