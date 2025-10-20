Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993D9CCD1A7
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4E5614F7;
	Mon, 20 Oct 2025 16:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWKBdYiw6pfI; Mon, 20 Oct 2025 16:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D5D6150F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D5D6150F;
	Mon, 20 Oct 2025 16:49:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E07F43F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 788AC82297
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KK8Wfl5KMOO9 for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 16:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69374822BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69374822BE
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69374822BE
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:49:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo1010477066b.0
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760978960; x=1761583760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZCtLvzxRS5Yd21B9U0ImW4Tn1VFide+mD+EEK1WhlA=;
 b=n/lzZaOekkRlKL/yR3dgLVN2jjXkJeaJD0pEhEHUbu3pD7spPYCqTQs6w4Y199gDwU
 m97anInPCe1p5Pl4KB+7mFStt41XKtMBxy2gWTSYiGzN2akkDi+PP8XUcwo1BzwXpdvg
 ocxXqiBbciLQTsgmGaNnZwMX1S+z+GKv7hugDITlwzO4bWUKpStVCVHkAfEWSIVbXj4f
 17g8MXqnkoAM8aKjlChHHku0zHtZ803cfWlozovjhlAp2AKuFsEr32I+PK9akJ6vInZf
 lnp+/DRzO9/1sq1ABzkpNmLWqCYzj0EIT0aQAqEaN5xcCwaajhP1ebu9XIw06uZZ8jaA
 d+mQ==
X-Gm-Message-State: AOJu0Yzdf4GF+yqRldik7yl7Rlz5qoj7kOJSC/DZ+tckDBnvFtmRhSFA
 B6SRl6ep4rX6n0f4zJKy7qrxpf1i8Ni3UtNWQr10cdUCHtrHssyPHugVvJMN78CfV/QvynwaA0u
 wrWdK
X-Gm-Gg: ASbGncv7DhiFSZA/yIgurKyV8JJ9GPjM51MvYB/GR4sQoPrPbXLvMyZRlhYtrlB7yq1
 YtJ4dITphhqtkXjS/c5FW/Yui0ETRgn2dcvyut0W6V1Pr18zerLWkLy++x0YwPqHrwHpdvF+GsQ
 a/964LEIQqQpZSpAS6DoFAxT0UqklGUxa3lAENOT4qTrkiiPGpDgGTUzQ8VsWze7NvZPiDc97yU
 RpaGqJhpU3XvY56DFJlNmJQ4UgZtavWWEFZuQUjJNev4SBU1WhLL4pVzjCOh4SSkMAIAtDABHTQ
 FHMI9i/blNzihVwk4HxjYiiwfvgSi2j41pGEwNqQMMdkfLdCaE7QfRjSlyH27FEBKp6/bLX4Je5
 UtGcu66O1jmfW5GWdreVWqwwbVS96T2ZKVM7Xf1dMHE7YAyHvY0ntKqaY7jBUqb3j2ZvBLeS7Zz
 CjC+MgfhaeBkuU7Uj8oTFDNU+nLvVIZNBcObW4z8E=
X-Google-Smtp-Source: AGHT+IENkrLNj/jjQOuz8co450zetKLNH147tvLgrOBG1nf+uHLkzEOz91LgAZEmF7N4HiXOSHy3hw==
X-Received: by 2002:a17:907:3e85:b0:b3a:7af8:c4a2 with SMTP id
 a640c23a62f3a-b6472b5f826mr1725666266b.10.1760978960221; 
 Mon, 20 Oct 2025 09:49:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.40.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb526098sm824020566b.62.2025.10.20.09.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 09:49:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Oct 2025 18:49:11 +0200
Message-ID: <20251020164911.1712014-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020164911.1712014-1-dario.binacchi@amarulasolutions.com>
References: <20251020164911.1712014-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760978960; x=1761583760;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZCtLvzxRS5Yd21B9U0ImW4Tn1VFide+mD+EEK1WhlA=;
 b=CUbtt+rGdmrReuM9O93E2HZQFZ88OQ8LPgEPgEYEvOJFy2aANDzxj/YxQLKlnBWv1r
 A0FQlgipWmIS9AyHlSIPydw/yrolIOCtkGaON1auAyTqKGAad19oF2e9GfajatM3+lHc
 XvJQly/Dh7YukWao+bdlQ2IbutZOsccoonn6Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CUbtt+rG
Subject: [Buildroot] [PATCH 2/2] package/libbpf: bump to version 1.6.2
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
https://github.com/libbpf/libbpf/releases/tag/v1.6.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 809d6934ebc4..9a2acb252165 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d360ed1541fa4fc036132e7732fdf1e4569c187d3e4a4ddc07fd9dbfd121c4eb  libbpf-1.6.0.tar.gz
+sha256  16f31349c70764cba8e0fad3725cc9f52f6cf952554326aa0229daaa21ef4fbd  libbpf-1.6.2.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index f5154813e6e0..3a728867d8cf 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.6.0
+LIBBPF_VERSION = 1.6.2
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
