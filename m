Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BC6C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCDC82F40;
	Mon,  7 Jul 2025 17:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQzLdYk2IvIL; Mon,  7 Jul 2025 17:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF6882F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF6882F49;
	Mon,  7 Jul 2025 17:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C83C1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE46406E7
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLzc_EdQKzvv for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 420BB40626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420BB40626
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 420BB40626
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:30:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso2737086f8f.1
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 10:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751909405; x=1752514205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOfipd2Z4G+pxMbIJ/Ep43cQRW4b8Y/bjHTZsfrZsGs=;
 b=QK3MPMd6vNzNUSinlBnD80idst9Z6n4gyNQ9UzBfCFOhhi/Izmt6/5uo4iCq/KEdZs
 V48zAKEPtIx/xI5Dq3nObcyAPQ+zxYJb68ony5CcMcLQ4un3MVOqCYBt7oOyjEMCkbAJ
 qr16zsaNYG1PFsOb+Ss7F5MVGIQxu4uqYRUbLpgceanhnFQa82g+Dg6lZmrCZepfpJ76
 Q/Ih8UaQEaUlBAQEMplPYXCurppvh5qu6WIUsZnku7pfVR805oOVlXrkn3MGzkSrsyjH
 3s+0zlQH5H5Ugl9onF0UPssheMXQm/Q4BlEZSW60l+LsIpL/5FOvFpJelyC7LMGX/bdw
 MkWQ==
X-Gm-Message-State: AOJu0YyMPpNYTxoqE2ueQuygSQDCNATjDbA1jtVWlL1lib7Krp5zd4dA
 g8fkLi+ApHmMk4K8xb/avZdYS0GXgyzxv3Aj1yVfv42rdfivU+kuzBOQ40b2woSrcKL888E8Obc
 iOel2
X-Gm-Gg: ASbGncsdugxnCWikCXAFc97cRMId7r0OdN5gjhCGZP8wL6Fdk5iCF88T7jutuX3VbXk
 YYuiJr0XPtOctgBrh37kDC3yxAru5Lop/O+MYVyo2UCmGJTiraDF2WtVTk0Cw1FyeYoknrczBjd
 4LLjvmATLTV9qG2Yrix2QgYVqpWbNMaulQya7faRmiZJv8sHxszaBZ1hbf00k7csEHQmMqULCLx
 yxeXJoCwSAHy01w5oxKUlFiBZu7CqOCSvmGxUopwHNsMvYrLCNAiYhFKkGEeLfa4eaoYF+wG3G/
 W00izmU3VzAiYbGlkyTNUvZnD/mM/IjPNKAVIJswSLzfv2Atbqc9O0Fyk4sehmqirBtOzoMO52A
 QReeTtUSOQJ8Zb2mHz6RnSAkdDggpTmyIyXpdag==
X-Google-Smtp-Source: AGHT+IEnEfMG3gcSxTUJ7hfk9UhcMesAxh5UmzwJ2NUF56LfOLo212UGfuOjbzUmeR+1/vDI6BBPTQ==
X-Received: by 2002:a05:6000:2502:b0:3a4:f744:e00e with SMTP id
 ffacd0b85a97d-3b4964f4e0dmr9407384f8f.4.1751909405058; 
 Mon, 07 Jul 2025 10:30:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c9f9sm10986705f8f.93.2025.07.07.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 10:30:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  7 Jul 2025 19:30:02 +0200
Message-ID: <20250707173002.370218-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751909405; x=1752514205;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOfipd2Z4G+pxMbIJ/Ep43cQRW4b8Y/bjHTZsfrZsGs=;
 b=DGBomsi09DqfVf9LdEejIUkPYLzeqwVFwjJoz+iFswghOW5DVl1tSam83KR+nKtgqw
 INoUr8XZ3L8VLZWMZ4jXFtJR1WwE1+YN2n4iWtsTAfZ3fUELHWuxvtIj7g8IBn57ePNl
 yYwbvaWkMxmqS74OiqHOfQMey+YwLm9UmVbYA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DGBomsi0
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.6.0
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 0dff217335dc..26fee7fc094b 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  c3aadd59bdb0ea4339b056f29972f92ee19fdc52f68eb78d32d2e4caf4d80c3a  armadillo-14.4.3.tar.xz
+sha256  d18ccdb78a5da88f18fc529d8a8d40fad455842be6b01c59796f47a6f5bc7fe5  armadillo-14.6.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 259aff1251ea..a50b10dc6d8f 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.4.3
+ARMADILLO_VERSION = 14.6.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
