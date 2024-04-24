Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E4C07E8E
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 08:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0D54076E;
	Wed, 24 Apr 2024 08:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zczn7cW5OquN; Wed, 24 Apr 2024 08:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A90A407D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A90A407D6;
	Wed, 24 Apr 2024 08:32:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 427B21BF47D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCFC681F12
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkUMpJ1Xy48E for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 08:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD1FC81F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1FC81F34
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD1FC81F34
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 08:31:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a5878caeb9eso226473966b.1
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 01:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713947514; x=1714552314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jr7eThso/tJv8TRjFzN26Y3T4kSqbxXCqwKu32u8fXw=;
 b=s5hh8QgqfpTaO30LxLp5ZX5accP1xSxGk2ponrn7scvAVjnoedTBXaewo9KouAKeKa
 tXeR0PfY/kbnaLQKQbNTlRnzFkgc1SgpQ3zNzKjBi26FF0RebCqUhxMXUXv4b4JXGqnC
 nWNzqacUYyOSnC7SmcDghEfvEA6WjB4ye5K0E7ArsAwrA1nR1g1cWyTRAwz1NcKALLKk
 IGO7QtMbqNq48dwFLCriyY024C5ykWNFdPosK8HF4awyhBekopPIWVTgij+MGtjQm+aR
 YWl0vW1Th11KDE7of1UG0J9i5r5FoFMaN1ff7jdinCh0L8OaZcOIrgAGrff6gky0Sy+k
 Bufw==
X-Gm-Message-State: AOJu0YxgvWJsUhqpgi4EC7ui4ljfgeZgcTJNDQUURlU8fPURtZkUh8g6
 qiHx6n1iUHT3sAfOfgMDGQDzYKUoz4NPVhuSp9J+Vumvz+vNwzGL3oEs0J+zAkTLgGV4rtTr8cw
 EXQ==
X-Google-Smtp-Source: AGHT+IE8h2F8swiVey2zOVK/tW9hC2xG4d6HDnFgXt/XBGkMMbLhRian7cp50QErd5XNc4h1CyVYEw==
X-Received: by 2002:a17:906:57cc:b0:a47:3312:b32a with SMTP id
 u12-20020a17090657cc00b00a473312b32amr1089007ejr.58.1713947513772; 
 Wed, 24 Apr 2024 01:31:53 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 lk11-20020a170906cb0b00b00a55b6e7e16fsm3434617ejb.0.2024.04.24.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:31:53 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Apr 2024 10:31:20 +0200
Message-Id: <20240424083121.2818-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424083121.2818-1-francois.perrad@gadz.org>
References: <20240424083121.2818-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713947514; x=1714552314; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jr7eThso/tJv8TRjFzN26Y3T4kSqbxXCqwKu32u8fXw=;
 b=l4WEAqZq/2a3b75B3Xpdn1cS69qsHL0F5j2mc5OSpTwGEnIu2zjczpHx7ermAX9tpq
 OS9SLhCWF5gbOVKcr5/PtKI7MyAVWphil8U4Gu0zq8X/PvtKSnDOSZjV3KmbfJCXLaIC
 0DXrFgelaKKGLgWiIPBssgON/2216mVgbfcOYHeUtNkqGauI6cY5INtCDFzBnQ9lHgSZ
 gHheOHZm63/d2ccQEmfSAs8OLeEG4zHUv7H6i0CoqnB9ZNJ8ODCj8iKS79Gp9jcVITHm
 OVZTA4keMPi/swD8j4RyoPAuZaHvwOLXze+e4sHM2ypFJGIRh7oHzA2XsIXDpPdacJm9
 JaVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=l4WEAqZq
Subject: [Buildroot] [PATCH 3/4] package/lpeg: bump to version 1.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lpeg/lpeg.hash | 4 ++--
 package/lpeg/lpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index cb995bde2..1dbd522b2 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
+sha256  6637fcf4d3ddef7be490a2f0155bd2dcd053272d1bb78c015498709ef9fa75dd  lpeg-1.1.0-1.src.rock
 # computed locally
-sha256  2b80a8cce793e008ba433e5e0184f20aca4a67ec741439fafd86a874a6a91c49  lpeg-1.0.2/lpeg.html
+sha256  3f4f8a7997d9e0d9d0fca6d2b9877a5714251fff056783dd71288413b0abcf36  lpeg-1.1.0/lpeg.html
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 7326e59e0..35fadb579 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 1.0.2-1
+LPEG_VERSION = 1.1.0-1
 LPEG_LICENSE = MIT
 LPEG_LICENSE_FILES = $(LPEG_SUBDIR)/lpeg.html
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
