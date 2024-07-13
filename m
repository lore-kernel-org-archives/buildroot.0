Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19CDC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 18:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43A182020;
	Sat, 13 Jul 2024 18:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgzKGsCxWFhA; Sat, 13 Jul 2024 18:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C7E81F4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C7E81F4D;
	Sat, 13 Jul 2024 18:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8345A1BF3F7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70C6E81F44
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs393p_NDkhB for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 18:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62B7F81E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B7F81E9D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62B7F81E9D
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 18:30:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so23564235e9.2
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 11:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720895437; x=1721500237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=57KT/8qww5oSQLpZdKpA9UzrfS5a21Vn7X4J50+1amw=;
 b=PkPi+kgeMWgPot3bCGq41+1IyPP6ZrrQsljP8DcJBV+MAHVeJOUyVBxNWQHlZnp6cd
 hWPNjVpyoFOSp8vFv8j88mC1NlnJyK6bYBv3a4HOHFgfmnby/kgJ8yw38DtR3isktJ7Y
 aU7E9kpdp8SqByFwY+IbqL9EWqG91jj29ReAGnfMGFNch9iAU8D319rux70roCbZkR7g
 selHzPmFxVTgM7lhRcpajpeT6Mrm7wA8Nyevg8730hUc7Fjz1uLQEB3x8l0JWER5V4Og
 O1FaIO1d34wPqHga6odvVlL9kUPGTxzsC7pi/lrO3pg1L2b66hH6WYQKCWimd6yyTRk3
 wa/Q==
X-Gm-Message-State: AOJu0YwcBGGrF0GGzqkJcoh9Kx4iy2iL8HyHvAdhTDX7GSju0S6QGMx6
 zGcVVeZ/AoclACyL+L6YkiI1NURDdTAvWAHow0/SnrodGqnnBAWzdXhpsVCr/juaqZVUYiqItg8
 =
X-Google-Smtp-Source: AGHT+IEZAd7usrreS0ErEFKsdqw+2f8sIFlQFCP019hYJlLAS+OAWis6E90zOCZ/3jni8v2q7j3nXQ==
X-Received: by 2002:a05:600c:2d48:b0:426:55a3:71b5 with SMTP id
 5b1f17b1804b1-426707ce9c0mr109784425e9.9.1720895437605; 
 Sat, 13 Jul 2024 11:30:37 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc27asm64565475e9.34.2024.07.13.11.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:30:37 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 13 Jul 2024 20:30:32 +0200
Message-ID: <20240713183033.129648-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720895437; x=1721500237; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=57KT/8qww5oSQLpZdKpA9UzrfS5a21Vn7X4J50+1amw=;
 b=EuwJife/HuzjB1dJfrf7xdualq2XN2V/7ugbAubot0FHXpKREiyaUO+dhvWH3s5C6l
 D7D2NZ1Jq0VEgJBqI/vHq0plRtHPk157uZsmPtOrCE8Zq6cR2xgGiP0A1La3UHBWM1q1
 fIjeITyHC1cI8Ds/NayEP/fYJEVRK403uMnlZq8TFMUsxtPSDnM7MjyGjCpkHBZ0nlra
 YAYi7BfZFduinhj2qLGbDIdsSQI+7AJ0Mg8p1gRsFCd51w+/6tcezcGXMzCgxrbjWDb6
 Q5iKwdz8a4OKijkL9J5BGMm9z7T/l54P1r20Xx7KyqtoH/LGuLYA/FOi72fE/FBolK8J
 I+Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=EuwJife/
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2024.06
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
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index ed10fad96..3b0e0d62b 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08095605dd2b6a0ebb01394395a725ae561d655700835fa2eff90122a9b1d22a  MoarVM-2023.12.tar.gz
+sha256  24ecedd1220e215742cbfa9228797812f6f281ba87bf5dc58e8caac0c0d404d0  MoarVM-2024.06.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index bd1938d88..125404074 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2023.12
+MOARVM_VERSION = 2024.06
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
