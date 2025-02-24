Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F3C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 18:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4665640382;
	Mon, 24 Feb 2025 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyVmbGVMCP3f; Mon, 24 Feb 2025 18:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A3C40892
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A3C40892;
	Mon, 24 Feb 2025 18:45:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A626943
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A79C40892
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIXY2PpkE7iW for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 18:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE09D40382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE09D40382
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE09D40382
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:45:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaec111762bso149209666b.2
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 10:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422737; x=1741027537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=896kamYN7i7gaHc8iCKgvpAWL+KBdJNz52y6VVUuPE0=;
 b=NbcTMJAkfxzMbJun9Y+ykvXR2D+XINtyporK+R3eqdsGN5ckvRwwofGEd4i6hhs5MG
 EguWx1Zs+acAVjxP4LDd08iA8kuXRfuFJWRZ+TIdsgzRNuAnFkeut24Xxuu3AkMfyr9P
 dyiSEGHeBETc6wAl9KYlCKul4UQmnpFuWUeQvxzJNoiEK1WxJcI/UWCXhw2sW2/qKQaf
 4TuDUXfRKqsZVeJCE4CdY8uu/REgLu4CbBxI54QyS19Th8fl37Hs55amX0sqhZJb0nvm
 gVLnIqbWXRgNRNPNHxlXEmXCV8Ra9zFm/fPfWIzA30dZXvnO6bgalSNIqju3locsuU5a
 SinA==
X-Gm-Message-State: AOJu0Yx+TrdgZJqW/L41veLk/d7M1avQzGkFo2i1twMap9Pl8qtAxYSE
 qf3zAuMk+j87DS+2DKHGPDqaF6mzzvojrMixDSldFJY/RA41X/rH46B/I0tRtJyw/GCTtG0ie4z
 K
X-Gm-Gg: ASbGncul/Llt106QRCGWdly3KyW8N2+bDhAZa0XTdlDRRCtEt4y6frWDUexJRtleF5Y
 B332gfajx5XMPG2iQd9QYTDDuCmRzlzG2t9ro4IhZkpfS2/aCIjOAbdv0PKfEldBEbn22qcEK85
 ++YILqZspLbpHaU4TjFzhL09QpQec6ICVdUQ82bsRzZ7wPhx/SM+QmqeOc95Ce7QpEcyptLBSbp
 fTWaVU0jIfo0si7rsnkSDUp9AweDYnBgw2hayhDEEjk2YaCWS+H/fV9r1v3glimnu6KrfpDdxF3
 5dCnplhiJWH8TvSavshHjE1nVHCO1JUiBdxo3UE+kR6Ucq43B7+npv5o8CbbgoxACfY/C91h+sE
 BNnvvKdcPIksCH/c/bQ==
X-Google-Smtp-Source: AGHT+IHZH1IlVvemxqdO2Ob5hzxf54mkZFde13ywO71kz7c3HMGk+namSkUHxfM+4U2biwO4qP2/ow==
X-Received: by 2002:a17:906:e098:b0:abc:a40:4195 with SMTP id
 a640c23a62f3a-abc0a4044camr1409362366b.9.1740422737458; 
 Mon, 24 Feb 2025 10:45:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2.196.124.195]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2010f74sm3870666b.121.2025.02.24.10.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 10:45:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 24 Feb 2025 19:45:32 +0100
Message-ID: <20250224184532.314335-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740422737; x=1741027537;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=896kamYN7i7gaHc8iCKgvpAWL+KBdJNz52y6VVUuPE0=;
 b=jY0tpUCRZN3dr0EMYag8tB4Nw087RWeNHkV6Pc4rqj52Y5sozyWScbDqdaLmZwQrrY
 VSAqJ5ttRcqf9MGa8wpqQDHGXBZ7ohHE2YYtPqOvg7NBQDTKNPZaAb7bDb+T9jQdjT6S
 Sh1y43ckCnWnGNE0e8D7hSS5v97pw6Mn1GFu4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jY0tpUCR
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.4.0
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
index 9ef258e160d4..734d0c6db97d 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  fc70c3089a8d2bb7f2510588597d4b35b4323f6d4be5db5c17c6dba20ab4a9cc  armadillo-14.2.3.tar.xz
+sha256  023242fd59071d98c75fb015fd3293c921132dc39bf46d221d4b059aae8d79f4  armadillo-14.4.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 14d7738ea3f0..704199ff9148 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.2.3
+ARMADILLO_VERSION = 14.4.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
