Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC5DC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 12:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC26E606B6;
	Mon, 16 Jun 2025 12:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3SxeT1keJ40; Mon, 16 Jun 2025 12:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E6D60714
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E6D60714;
	Mon, 16 Jun 2025 12:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C40C21A4
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 12:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0BF580C38
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 12:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaApxP5-tG4E for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 12:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD4E580C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD4E580C1D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD4E580C1D
 for <buildroot@busybox.net>; Mon, 16 Jun 2025 12:21:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so843550f8f.0
 for <buildroot@busybox.net>; Mon, 16 Jun 2025 05:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750076474; x=1750681274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phA1xyaQIk/8bQ2r1TCv4f8+Cg//nIyyk/aXR3ORk8g=;
 b=BMGgRmFWVVubV/Uc9gYf6AUSyMmNNwNWy4z4oT089hzXvUuUhpUBwcbPLLSy/CgOPc
 MLMDsRtricMLdTcTZg2IrzhHUtANUS6mX7r6zGZ2weWWzcRITWfcBp0OhbsY7Hr6E8hQ
 paubxUWMYppIjuWlm80/+PVzSwW+Ej7Fqe7zSV4XicwuYZ6wzORNmAloyCNEAYwLZAmP
 Fs8jA9KCg+M0IWmNi6RwpY15uzTg/80VU7xuGI2/cPXe2ldjxotPut/TZyk3zXwIhyNZ
 fxWunsfjJPnoFvXGESA0JWI+iXVu7eQtBGxO44Talv615uNfhgiPpXd65kn/tRmchzj4
 tuqA==
X-Gm-Message-State: AOJu0YyOIloUbxYDIVn4bWZ+21Afb1VLPgnLG4dx/zl7L6FNrdoU7/K8
 5b5UA7LABfluFtKDEfOtYPkexE3wF+fpaeW+LRjXFbPoLfI4kMzrtIcG3Qg72iF7PrC5HMrQU4l
 AfoMQ2A==
X-Gm-Gg: ASbGnculEpMAJYmCvmNuZTajgt26NCp1ZHviGhvKJ5Fnhdxw8vdajRVymjJha0Tz0Ok
 MdrQW4IfbzFqsdj1QrMgmh8GLEuFS8TSJoD+yTpMRdg/+NN++uamwchPMSiko4ySnnk1o7LD350
 k+/ggo07slf3AFsVoK3eDDLQDTmh7+dyYM/jOKKQ3zPrV0DFclkKGyRbSKGkk1zGBFKooIi9kzV
 Kx0e1PCe74X+skiz6urf659N332P1RdTgjmqZxTvUB6eveqBpio08LswNRJcTNCdTCW+sLcgOm6
 5eTvYqx9nxcw9IlVyxeKD1d3THuSALSoykOzhKZQVNzZtocTWdfgUnkNI9Owk7u/I2SdQ6ecsmC
 ZeC8UCBfqYq2vdWiWXxlV
X-Google-Smtp-Source: AGHT+IEzkSNE42shSUXVunP2k4Ber1/caDikYHs9IT312IeUEAmcHIJgCfEhP96VAXRra9DxUA454g==
X-Received: by 2002:a05:6000:4602:b0:3a4:f00b:69b6 with SMTP id
 ffacd0b85a97d-3a572e9a740mr6914729f8f.54.1750076474526; 
 Mon, 16 Jun 2025 05:21:14 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54d1fsm10819028f8f.2.2025.06.16.05.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 05:21:14 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu, 12 Jun 2025 12:48:22 +0200
Message-ID: <20250612104822.1279887-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1750076474; x=1750681274; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phA1xyaQIk/8bQ2r1TCv4f8+Cg//nIyyk/aXR3ORk8g=;
 b=LcK531vHBcZFNRACqdvbsiYBNOJ1j8mhZEtAcwHOaeHIpxCRVW9ALKRkcjoZMQrRSL
 wKvmBp3VSPxGiTST2ztKGVRobVJMUVrIBmM28W5HGe0v58XoLI8F5CixfVyyGM4YAqIv
 QeDVxvATq9zDyImQZnUnqiyAz3WD8ks7T4c6kgqAEE+pR5+rhiU9NcsR+eoGnVKdvSuM
 CpQy8tLJ+G9Yo2PY1Sy+/JfCpXcVpqx8SBjiSJsVlC2KitIY8YT7UQ+DKK+LT1c3nSaW
 i5acY3/uJKL4c4he9W65EMjsgramY0HmT0sHaMDDTuSPFzHMbya4PgA+ulBgHv1VL+T3
 U0kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=LcK531vH
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.12.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 15a44f9db..02474d036 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3fb3d960dffb2b2fe9de7e3cb004dc4d0b34bb3d342578af84f84325c669102  luarocks-3.11.1.tar.gz
+sha256  3d4c8acddf9b975e77da68cbf748d5baf483d0b6e9d703a844882db25dd61cdf  luarocks-3.12.0.tar.gz
 sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cf5f966cd..37d48a947 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.11.1
+LUAROCKS_VERSION = 3.12.0
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
