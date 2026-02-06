Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BFCEB28E5
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3787C61262;
	Fri,  6 Feb 2026 08:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngxPbMevRRur; Fri,  6 Feb 2026 08:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8632B61176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365548;
	bh=vSrFvTCbOiNkUkvXe5DFM+kJHpbtgCifdRudZIC2/AQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bxLHpLdNaL0Dmcd9KXa5VwRckOthg6KVfIZ03Ga+xEAckX8ul8neRWneOMajl/qEv
	 9PLc4TCupsh0Vveq2mUyD4QbWLKIIgECFQU1NkMt44qAfg1TpGCv3guSSMPnlP4tND
	 SZpOg8YnsXPSZuto0aVOh2SjgHS/AhmGq08cuYzHFeV/0rHSStlVq2GvuJMFKphq32
	 PFoGeRYlt8dh8OOagar3yjiYgQV3Ue1zYMSdRiVYYxiRpBpxZQG+s3tzM0ugE8mm6f
	 D+KVcox67nwUIclEBc+Fgf7anAeW0CuazynZsQr/1aF4PSJhe7t/Ip/k/FA7XUhoaa
	 Fjy4nL+Jg8ASw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8632B61176;
	Fri,  6 Feb 2026 08:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 078BD173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D24E61246
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvyapiSXSAnE for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65AE46123B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65AE46123B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65AE46123B
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48069a48629so16564715e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365528; x=1770970328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KrDUtPD/H3Kg9XT6oKuABh6tzexBN3oFrnvDMIbXF3Q=;
 b=gmSmLkyyCRgt1iy/G4xOe37GK34kUSI57SDagUz5a6POeBGZNIgy0YY9g0K+DvoMTn
 Cq7V9x5F62Q2lPmN6wI3/y2YDUrfwi95i25Kjv2DSAPzBxN7mgFxSI76UtfMiuEWVz9c
 yCSRVY1bpcd4dQPVNWIzz1DQWH7BitoZ5GgS+PjSpbjo6AaEC0/79sWTsh1Y+KwApjx+
 g4Yc9gQw6FKyeR4NK0/3NzJr/Cn69nogQBQD4h1NQFa5PnyWcJGRPkADuQbTFqbImH5R
 kf6ULJIGRJgn5xX1nMFkSOTLPz6eaaAdUqkPMmjUWvd0bWjAsakwe1cur7mtdztVjiV7
 x+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgl44V5VdxplfLNyKqxaOQ9bJvzcCvEXNwuJALzC6ugfF50WtNEN7dy3f+resNRb5ZezWDrz0Kq98=@buildroot.org
X-Gm-Message-State: AOJu0YwzfMCq7OoKbDUnAFWa756yLXVxhM9ELMOpAr7IPF+rRCOfbp84
 PjAcUXCTU43n8l8EY/hCD9/zgGemAE6mCDs4lnRD/r7HN/s5MUEGV9O3GhaOUqmgVFzBwKZTAyT
 vUI/5
X-Gm-Gg: AZuq6aIoPNlRnjdiSJFCHxxtC66PXMKP6z3ChcEH/Nv/ZjZSDYSCzsieJAKmxOSJJej
 NLMP7v19/02yBlIsmBKy3kR3SQF5AiJVFTK3FIJNd1pbuz7MMkhfcNI7QMNOxb9+WY8VlnYaPie
 P61YOelGcl3vc7MC6HEQfLEQWnedR4XBbjENYnkMDWl8UkqsltKMudHO8UnPWUSaRCe0BD54zbL
 trVSWg99Pxt/UbAo1+WBdtgN1/sZd2Z8csM0r2ETvB4Esnt2KcGtOYSOO4hKo114xnmyynVan26
 VEPfznPwYP2hKwaIzW7UI6gwP5/gt8x/k0NYbkK7wZaI6MpcjPHQI8FoVsjmpBjWNiy9UzWwrNk
 ou7UI3DcbygEHkT1jqT4QuvH5OpQU7p9mZesv9zpwi9itCHMnI8C2ARdsOPVomHcE70XzcpCVyj
 OoXW0=
X-Received: by 2002:a05:600c:1387:b0:477:af07:dd1c with SMTP id
 5b1f17b1804b1-4832022a235mr29742485e9.35.1770365528308; 
 Fri, 06 Feb 2026 00:12:08 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203d5ef7sm20877415e9.1.2026.02.06.00.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:08 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:07 +0100
Message-ID: <20260206081207.33195-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127213112.1668038-1-giulio.benetti@benettiengineering.com>
References: <20260127213112.1668038-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365528; x=1770970328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrDUtPD/H3Kg9XT6oKuABh6tzexBN3oFrnvDMIbXF3Q=;
 b=X2N4OgQ4weXIh8rwMoKBGZ2eTqDa4mS16NvtF0cFUhm4SL79484+4k5zfjyyJJ4PYY
 f+tN93m1hT7yluux1LLcf/f7MeiZhWRIUwUrKeq4YanMWUi5DghMkEEWc9q0xEu6DhHn
 ZykSkOIKIE/FeZLxugEQz0ki8FE0kRwt6c70UpoFMM18OQ35watcplMDfPLVJcrjF3TY
 0whYrdaZsA0LJgroMwdfj2zZ4nqG5OZKuE1bcaB/BYYTJNqmEUIuOf+U/DITO7vxSlDC
 nF6w1TsAVTiUnjXLagPjuE4dy8FmhjT7dSPW7dn7PJMX4syGICPuBEbK+p+rpHfEen2o
 YAYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X2N4OgQ4
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.4/docs/v2.8.4-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index bbc9171e77..49126a4a2f 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f  cryptsetup-2.8.3.tar.xz
> +sha256  443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83  cryptsetup-2.8.4.tar.xz
>  sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>  sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index e8f2f1673a..6be05e6457 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
