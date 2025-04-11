Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFDC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 09:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBD340870;
	Fri, 11 Apr 2025 09:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FxnYRLM54Ha; Fri, 11 Apr 2025 09:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9854070A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9854070A;
	Fri, 11 Apr 2025 09:50:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E91E0138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D705E40A0E
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 09:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPXyfw_1-8Ce for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 09:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CDE1403F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CDE1403F3
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CDE1403F3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 09:50:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac34257295dso347011866b.2
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 02:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744365054; x=1744969854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TuiBuZowhryHwqiFUau1cdhwxzwa1doR3dqDv+jyZs=;
 b=jZBg27G70TTdpCimh6da4Eb/sO1ZxvhTpComK5x+1cTWglgtLksMld2e4WTfMF6uzI
 6GzlIq+pLfQQvYqhPXbMwb6B7/6WsA0/egZdElrHz1oJnzGWXKVtoHniC7X0KCaKns/e
 WjeqYiZUgeJo1+BtCOrtXBpOJKtNLuYBWJC8WT1eyCjcv2u10Gxqx/LYTCDDGkJL24oy
 TIEoZxIauRyGDclozysxe6Ya4GZ1Z7sT13XR+fsYpCNAyOZ4+6Lodcd1+yL9qmjuUinv
 uCZ7UClvomST/7ecbikjL55HACJ8CASaCvpUAWdsQoCScfQZZyxY2+JLpSbGUMsMgtJv
 K49Q==
X-Gm-Message-State: AOJu0YxlU9JmhYFBDAK5I6HnlTcZd05Rx3YU857OiBqirFjiweGcQX3V
 ZJA92G/H6hUzqE5UZaeprUx5qdvGaPj0IK+kF2EoKij2Lqx7fYYHCmgz6g==
X-Gm-Gg: ASbGnctAKfAJjXguS14LbhjOCifel/UeAmcg1teFyxubKxqh/P7k8pbsagiB4ssx8s/
 4N2AbjBBxf4be0KsaAldRjAuK3czmstVuj9iShnQPcNvxh5QA3ZhlmDHhhjC6NYkyGB8Q+2FH2x
 lmmAy9nKGv7+OoTCvASNKihnhkgJzzj3QsRlr0taL4psDlANaA/xp0rPEZJvs3AAxV1RFw0XDR3
 4yVqxPAv083Wd44imwpvgVwGLHVJgR540VQ6ovc4OoVro9D6x8Mgn4x2BqHYiVOdmkr1HlDZdiD
 A1qehgLTXT2jEk29YE/K8rGLtaqb+RzJ59BY/T9XMWTQZVTy1H7zdS/Df38AW0ocBYoN
X-Google-Smtp-Source: AGHT+IFmw4x6X9CKsyF/fnN2tRR4GUjYvZTHY4H9TV+FUqPGbIAPu8YpvRnqkKOsmw84rbv0HLZvJA==
X-Received: by 2002:a17:907:9621:b0:ac2:9093:6856 with SMTP id
 a640c23a62f3a-acad36d904cmr167897966b.54.1744365053574; 
 Fri, 11 Apr 2025 02:50:53 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1be98b6sm419724966b.52.2025.04.11.02.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 02:50:52 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 11 Apr 2025 11:50:41 +0200
Message-Id: <20250411095040.2276825-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744365054; x=1744969854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+TuiBuZowhryHwqiFUau1cdhwxzwa1doR3dqDv+jyZs=;
 b=HjcJy0ZYt7rCRJOLy7Aewvl+4yVqnrcsB28Ns2ULIggyLdsF1D0cHIslUs4jzj0nmi
 iolM/kbPEq9Z0QfW1dRe6ZBV9l8B5WdszA2ynrRLFl8a3+5YoK57qv7ArWTV8Kz7f5lP
 +dGEl9snwONlRgr+WcWDUyoWdf5UrNPhh66onPJ1jyBnAbW6+Tt9xP3UBClxIaeHRjm8
 hos77eYnGg4HjVx/nknCpTTI/pHiRWBRNwpjN+P1cvztJMlYMy8LRoXQ96GQlI755+76
 5+HnEkXY2j1bNHm+sZFph/wGZ4R8ghjxX2TRyEuTndYU3YM/XXI7UEGq2IoNVYXTknIk
 d9OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HjcJy0ZY
Subject: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to version
 11.00.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest available version from TI.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 2398d02da2..d9cb66cd6a 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
+sha256  884c454b1a518e6d31304acb201493156685fb8ff111383c842bb292a1b35c9b  ti-linux-firmware-11.00.10.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 9332732ad4..e04165edd1 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
+TI_K3_BOOT_FIRMWARE_VERSION = 11.00.10
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
