Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E0C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F079B82126;
	Mon, 14 Jul 2025 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkOU9NTKdxc6; Mon, 14 Jul 2025 20:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E3082135
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E3082135;
	Mon, 14 Jul 2025 20:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4552967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5E05406AA;
 Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCLGSoqiyuub; Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB933406A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB933406A6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB933406A6
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45617887276so12914875e9.2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524773; x=1753129573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Ti0jx3mS98LN5n+dWs4h4LulER+wOZTMQPNM2dfQfY=;
 b=i3AQ6bSexSSymul0Qwq2tmXBxKOHUIS83tJprY5Rrl8M/XFmqCNV4mJ/0oerS2SVHX
 3TXwZV1NkK0NESVa0kdj8wZibaa+LfYWNO23/cTjfsalYD0wintXAzzCtufwlWLAQRP2
 dO76jdQnbG7URIMTiQwvllHie/Vgrd3QyLHDc0K6eR/fensD+oOcplkEM1i7pXXSdkpp
 1cw0w/Ar+TeryrNKweNYwI3P9h3O0IVfE125s3muK2/QvkjK79lIJ5JLKot9f1ZgEkI+
 gFxMuicsPZGPrir5J0i2Xkj+uELIarr6muEsN/lEe1v7YYdN+harHQL88lf/Oohro341
 WCDw==
X-Gm-Message-State: AOJu0YyUyHD1EvRhKG6honesyiunBUwyu+Y02k7p/qCZfyhHZrII/3UD
 R+aP8+PzbdbG0nK+CGE4vSf7Mp4MLOLKriZM0sWjnrRhIQ5K+01or7dcPkdBLA==
X-Gm-Gg: ASbGnctXt60HNvdFWOZXCtndpz3QwnZSynsHrormmvUP2osZFucUNsmulXREy0xJd66
 r79VrJZFLX0WrRICgTW/FQ5wmbRLRJuAsPXcGtzSay3ci6JpcdslQeSINFqOtUzCarZuQ1jiWVJ
 04O6b1VQwrykdMq75TwPzoAtMm1d4fdTQvnAvingAGUEkdNWuLnCdTbVBGgBxfkI2ShPbnjtj4M
 VKSc+IrEBU9WZkVdCOSo7lxyEmoCT5c+MM7Ib2Y/oA7grD5+jXkgFwtpoe4PPkJCER7IOZGL/ds
 d4z/0Pfoq1SFG6o3qZIID36JRc13lkV5Ic2IUqtE+LpF3/u1SsRyHbsxwDphCwDbewWiZy9UE6D
 L8koSj8h26CHI2VfCvic2Xln8REgOt551
X-Google-Smtp-Source: AGHT+IFVs0LU+MT/JAvwWlSpdaPfJDQdupk6+0XEUPtul4bQgCWwNiFfz7JeGTfPpyqDp6bRU8CcnA==
X-Received: by 2002:a05:600c:670a:b0:456:1752:2b44 with SMTP id
 5b1f17b1804b1-456175234f1mr44459105e9.23.1752524772695; 
 Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:26:00 +0200
Message-ID: <ec5abafcb064aeba5b6ad12a33c96914a7e6b820.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524773; x=1753129573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ti0jx3mS98LN5n+dWs4h4LulER+wOZTMQPNM2dfQfY=;
 b=WVN8JrlZce6kPsiu+IJLjuDLCALNNYQbG9kwV3ykUhqnts1ZiB6bIiYsMWyngphUVo
 IrON5nsQg3IjMZZWEnqfqlxcGDMjt72FEJpKqaCXlMd/awxECZl1RoYgVMi2LcTTNf5u
 u5B7Gmv9RVt8e41fhc9JfZDd2+9dQ3OEyEzsT+b+//JuXHp5ui9CJsyGti86+qqE81QT
 YGWHrYy0w+BfE2CK2dnaGHTtZ0XnyemaK0h06NRbCxaJ1G/5yplnKWI/QdxGP9+ak0ff
 0QegROpivFtxSZrUtDNWXbMKUM9o//Th2n1DUnlbCJTdyEJImIR9qAM3qDFOex+gDdO0
 N1nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WVN8JrlZ
Subject: [Buildroot] [PATCH 06/13] package/docker-cli-buildx: bump to
 version 0.25.0
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/docker-cli-buildx/docker-cli-buildx.hash | 2 +-
 package/docker-cli-buildx/docker-cli-buildx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
index 26b187d12a..41fcf6ddbe 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.hash
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c9dd3fb18ccba399223ba0f623c9fe09fa38fb2a05283131be8e4e139b2d8fa  docker-cli-buildx-0.16.1-go2.tar.gz
+sha256  e5a7573a5995c0f12c86d35a8148b2a10a6f1b11d1cf8c6977bf03ac281e6959  docker-cli-buildx-0.25.0-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
index ea77a86077..10093bea7a 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.mk
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_BUILDX_VERSION = 0.16.1
+DOCKER_CLI_BUILDX_VERSION = 0.25.0
 DOCKER_CLI_BUILDX_SITE = $(call github,docker,buildx,v$(DOCKER_CLI_BUILDX_VERSION))
 
 DOCKER_CLI_BUILDX_LICENSE = Apache-2.0
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
