Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9620FC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 10:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4165B41D1E;
	Wed,  4 Jun 2025 10:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbRRUHsugbRM; Wed,  4 Jun 2025 10:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6A341CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6A341CAA;
	Wed,  4 Jun 2025 10:13:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E1411A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8002E60D56
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4JL8cHQcu0R for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 10:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7126460B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7126460B48
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7126460B48
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 10:12:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad69e4f2100so982574666b.2
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 03:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749031976; x=1749636776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zDaSLkpspfS2WN1vVveeohhUcgXabMIQgc9nZy4ZCY=;
 b=tPz8feMjLxPLBKfSnCuAlYATqkG+cjNyVJFD/JT1cWOvnKGCSPs9AiGnB1wUNWNdCz
 LsSZrkC4XRSCz/BqIF7oL0myNYJNMtUouJ7KYT+qHA7dP6iRumxL6p+G2xz3talDlnVV
 dAH4Rr1NKIxlVm7zYWv6knLa1RnS9gIkOcd9SrfmYJpXYJzhP3+z+wDOJCcnwcU76+0v
 V7+C21/P6LsYBJWmEX4meVn+fqGqGTdVsnI0jcahmUOkwqrM0TEuC1CTXDLfeJwWO65s
 MNSXiJFXVnfd6Wxb675Yt75/d5VuwCRwH9YQKNPgP3NzaCE/zGD+fvAzVhlE3kHdtL1w
 iOpA==
X-Gm-Message-State: AOJu0Yyxl1TeCpUcvvwSSBvvH4vSMnSkK5mEw/9cQFWz4QcbyP6JVvKP
 Njx2q+nefDPT24hnJAqDftkhL+38rS9hBYT+266oj1+GH0dY7JGSnd4NkRK/L96KcnGPz6TOVmk
 lm/1a
X-Gm-Gg: ASbGncv3P5NDl8m7ql8WCkkmqL3KXMT3DAimjvXV5n81STHp2DyI7nktvbSu8c4VJ0x
 1shrdujcVwMSw/nhXpTCZyR8X18OD8460sD5S1WqaGoXpqRaC+M87egC8Bgm3pEM7d76PDkP3Mw
 rX7DlLsPv3wFmIDJKG9WSHabgxVWQiVMj8ma46U8E0Jd9psHK2cX8sSuaqZByfFmAGG5z0xsQaP
 JProQgW9qeBAVyD2h34H/m6WlCU6mkjOTB3dhekTFj/scDYCF7/HkXz+bkaXJPDklx/jKy8wPhy
 ZjU/Oj4bMnUBXwOJuHn0J6GhBNyXRU5/NGmIhlm5EOft7tu3EM6ilBtiFL59ArIjBpuQ5DfBbXh
 EbvGF0jbMItC9w+w=
X-Google-Smtp-Source: AGHT+IF/NQChzIkyHc/jDg2Q9NxUWL88UVahCP8VKtyZXqbk36gsPPAiBosECPZc4eU8m/VVHVbRfQ==
X-Received: by 2002:a17:906:4fc7:b0:adb:4342:e898 with SMTP id
 a640c23a62f3a-addf8f23fb6mr193173766b.28.1749031975952; 
 Wed, 04 Jun 2025 03:12:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adb34881d45sm887929666b.128.2025.06.04.03.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 03:12:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed,  4 Jun 2025 12:12:53 +0200
Message-ID: <20250604101253.4177079-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749031976; x=1749636776;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/zDaSLkpspfS2WN1vVveeohhUcgXabMIQgc9nZy4ZCY=;
 b=l4hTrS/+4irZBWVFocp1k6Uel6VmUL1Aq4oaygEKgP4w7mEKNng/wjI8HUILmIYP07
 WTCALYu6MrK5KHjhU2SOS4h8uKJ81q3IuyNWJgskh22p+FvEUez99QyqCSbX2rkubbje
 SXKozppDtOHDFZR8EyRG8m0s6YqpOLcPyzhjo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l4hTrS/+
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.4.3
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
index 61ed4d85283d..0dff217335dc 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  6dfddcfbd91e70679d7c11e94a5963a7efda002fec351e6f4875ac8e245c5117  armadillo-14.4.2.tar.xz
+sha256  c3aadd59bdb0ea4339b056f29972f92ee19fdc52f68eb78d32d2e4caf4d80c3a  armadillo-14.4.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 3ebec29cf3b6..259aff1251ea 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.4.2
+ARMADILLO_VERSION = 14.4.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
