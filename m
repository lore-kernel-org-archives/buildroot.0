Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7926C369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 08:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7570242398;
	Thu,  1 May 2025 08:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvZQaNnr12WT; Thu,  1 May 2025 08:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EE4423A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EE4423A0;
	Thu,  1 May 2025 08:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 925E6E4
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786F283466
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO49e42j94_9 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 08:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B27C833C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B27C833C6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B27C833C6
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:42:32 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-301e05b90caso799999a91.2
 for <buildroot@buildroot.org>; Thu, 01 May 2025 01:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746088950; x=1746693750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHEKNJp0pgXGvahMeEwKA/jzpq2u/ghhtsLMNYmmGn4=;
 b=S7pGwdUTnNktdQiQQ5VoZI3BJYHU2XvzyiQRCvXgxMMX+L7/p5oiE+7YpDzFiRs44J
 6po8U08vy43NvS8qdde9kwE5qlw/kfEkywdTJiVsp9DZQNyEzAZoGc0Yx3XC1PuwkdkD
 W3Qu75AbvRPmq9jnKgYW4lcKLOrWtySI5nk3vjlIjnHjBoXLRqR1dglujb7Oo14/Md3t
 FgZCPhigzihrqJfSKTw+5KWJCVSuIteN8XRA7+uy+SrMRKl5Y+a45lwStxOpTQoeh6uI
 wfDY2Etk2YhoCYWyjgOSCN/q48lQGefiY6qwZ0KC61U4ej/lN9N1j8vV1yaCkkcD6Z7U
 xuyg==
X-Gm-Message-State: AOJu0YzdXh20q5Hxh1Ch2S5FiLvcLrhCoFEG6yZDGn89WQus53PNqZOH
 386Xl/xMJR78nmOIVu0nUrl11dL6bquj9mme+usV7/g6bEJmi5DAvjz+olxA
X-Gm-Gg: ASbGncupErJRjsSsSYH2xWr7gqy5WZPQU/CG2Xm0//pAVRyV6CE6AYUBm1CkLFEHcSK
 x2vfQxTpONSRU7rlB8eucEgpHvmsdHsvwVqRypA3W0/skAtIyAnwW8UlSdM5C/oBGhY2N/G9NfS
 Zt9Bi6mKTATALTsuWMB8MaD2oGXBSf43L4C8fS3K51r4mTgkmulJj5Gv5ezNZvKG2bvXuxOPsJ7
 jjtt7UOp70D1IaOIbZy60KLY/T/XV1s9z3WAJSjn7MfTsittU2WIuiE8740LKMPC0G24xbbsqQ1
 EE0cUVAe1DU9JZkcmr3gzVVN0Xmurn0KITCJg1ncjTaD/KOob6dQMi4wGMg+K3GlIa4qxXHEZGb
 hGHIHVsTvGAoInKLFOj7oXEBnbuA=
X-Google-Smtp-Source: AGHT+IH+1C8cxffOh8UBuKk2dyQn4zussYyuAowpgFCnqzvpv9ABqbdGryX388m1rjRqxT3Lx5kpug==
X-Received: by 2002:a17:90b:568d:b0:2ee:b8ac:73b0 with SMTP id
 98e67ed59e1d1-30a343eb192mr9736969a91.2.1746088950397; 
 Thu, 01 May 2025 01:42:30 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bc7a737sm2126095ad.164.2025.05.01.01.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 01:42:29 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 01:42:26 -0700
Message-Id: <20250501084226.46927-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746088950; x=1746693750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GHEKNJp0pgXGvahMeEwKA/jzpq2u/ghhtsLMNYmmGn4=;
 b=ANgH/sqa1TTraCHbfhJK+VbnWlUL7qsxxv00rD4j9OTFmu/rXdHR+0cNrYXC0K7ybR
 cWEtIrJJMfHq145yuERwiiAMDuI6dpQrARze1LFIL1p+oEZ7tQPFtaJWjXRqovK69SGT
 EIbX7pusNGop6MvyRyDb3s85OIhc2MvW3+BidjibMdKfCE0KTvHtQjHl0muQFEER9ds5
 F5U8xHtCz2gCNEpOa7Iko+kAE85G8Do5t7yoSmGVJEGQBmXXzJ6WXeNyWGLcSA7gYhee
 XXYDvi/Qg69yDNdZqZrfkxILnIyVuiYpAj67lSrP5wl8rmzgDOnLSOeNOnerm2gZjH+X
 kCuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ANgH/sqa
Subject: [Buildroot] [PATCH 1/1] package/protobuf-c: bump to version 1.5.2
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
https://github.com/protobuf-c/protobuf-c/releases/tag/v1.5.2

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/protobuf-c/protobuf-c.hash | 2 +-
 package/protobuf-c/protobuf-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index ea7262028c..c7eee9e7e1 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
+sha256  e2c86271873a79c92b58fef7ebf8de1aa0df4738347a8bd5d4e65a80a16d0d24  protobuf-c-1.5.2.tar.gz
 sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index b1e8c25496..3df6a2edad 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.5.1
+PROTOBUF_C_VERSION = 1.5.2
 PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
