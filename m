Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E0EEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D268261162;
	Fri,  6 Feb 2026 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2-xiG2Q-ytl; Fri,  6 Feb 2026 08:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677DD612BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365555;
	bh=0t/jHSaigCJHxUeWbLqM/t3FUMkzrxq8SONTo8+Xpso=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fR2V5uWu+klFPf9l4Kl/qUhu5cDy39ZYyR3Nd8cxGziuI94bHFvrdhdNEMO3yT2al
	 chZlA83h5KTOe6lUMBqxWAVZmkLiXhXOPUqNcQAeejF69cBNZ9qBDrw4XfJwJ0Y1PR
	 fHOvMThitvL3hgESIxWcYtbODqCto0ikJ5WIlgfu6i1iMmvk7GJZYo9JKxDLOexFNx
	 IrcVuVfr11wqngPMTSVCSSjjr77SZ66SZtjnRBAjEdpzARYf+3poQs68hpWa+YkkOh
	 0iF8AJs7eXL8Ok27M+ewO5ZJNtqDdcI4TjFZGk4jrZBEVVTzBtvPr3YvgXDbxK6kL0
	 8iqjjmbzZXLUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677DD612BC;
	Fri,  6 Feb 2026 08:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D40C219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 277CE408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcX7l3BRg5Ld for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6C7C4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C7C4018D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C7C4018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4362c635319so197918f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365533; x=1770970333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3gcuTJk1HjbBhLSyZfWvDPuG5vuvnzHJTRLm2OQsMtQ=;
 b=QPhkwcH8dxP5HOmzmYNSmFnWnquQrvSu3QEY8MX768GT7hb3LIRqLPddvK1P3Xg2CT
 vcoT1940hiz5L9SLnM5korkFzKpSijJY4xuhT0OidwAj2voMutJTMs+wgVPDanzV9s4o
 x4hftybI9gs0J4SEwtTqK23JmJTwbL0voBj9TgIByJ1eh4XrBSkDLpCneMvEWhyhQdB/
 LAC5eupv/djTV7GhdzFep5Vr3LQLqT4hUu4FNW69lkKx32OlZN8bpXW5xb1q9y7cwhur
 XCAMdH/zYdxJ/ijcWfNjU468K0iS4V6bXOpxHDko2/Uuac0ByxllzBy0saxCCTSfWPmi
 tN7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbfPGSLEzt9MoJrRmqO5+n8SqnmbralwaZ3NTQ0A5kVmI1uZWVDtHvL+K2D0+Gt7FwLVzRTHJPRLw=@buildroot.org
X-Gm-Message-State: AOJu0YwVVS6mL03FnjFaUJVw5QBKOpoG6rzV40z8eqcDgcKn+jGjhtLm
 RFSscyrfFlVIfW5lQPHt0tKL3x4Z/IGUbuGlAsMFwO+GDpIRHAVqMfoHTILiruUMHZM=
X-Gm-Gg: AZuq6aK3qCnam7M9OWpOSW0Pm1zDuLDSiSpYdk//sgDXlHjxSlHBdkGfdWEU5rqko8P
 YiT+jg/nHy2MmkBqWmTuAoKr6KaIPLlWfB5NslATH46wvSRKhm1v2lkaixw9cGiw2YLKgjHb9sv
 h6Ry3C+tDeDJkx2fqe2kpELMuVNBN4sMfbIWz+PT9jDu0t0Z6OfYV7vjyiqSjmSz7GQgZJ8r8At
 kvJEmK7NYlzT0feZ0uRjmeF/BrcAihYlDLF41kjr0ithAMo0+zREfA2tGApNYpCMlwz2tC94z8p
 KV2/EuLLCFRFHxTbG5S4JuS6dMVUMArflFVTjMoMZYoVZ1nkpsgqDVfdb2Nve3+4bg8OMB8lhlq
 R4l4pcbZc4hGe0kdyD+AJ/RMm/2Zj61pHEGDrIW9QRvGjd1rTz+McfFliYevY9ffMyZOZKT4FkW
 e+F+4=
X-Received: by 2002:a05:6000:2c08:b0:435:a48a:123f with SMTP id
 ffacd0b85a97d-4362937b167mr3168974f8f.42.1770365532791; 
 Fri, 06 Feb 2026 00:12:12 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bdc11sm3989983f8f.14.2026.02.06.00.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:12 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:12 +0100
Message-ID: <20260206081212.33465-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201093357.981428-1-bernd@kuhls.net>
References: <20260201093357.981428-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365533; x=1770970333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gcuTJk1HjbBhLSyZfWvDPuG5vuvnzHJTRLm2OQsMtQ=;
 b=d4mvXrLOrMgclkV/yyWeyanrNJFjWvP0nhO4Fm/u1EshDRQAY8V4SZ3Ona1eRbyRJG
 sp4iNZfNqx4Df9Es/PU5sFqpJVBO/G3iAE4rKfIL4NO3u/LbcCBeUZ2GJaT+sycOG2b4
 HEF8mLDDDdlWY6DL50ILYzRHGz1Ob359mk+J+TTVN6y7c0Rqr2r0YSRzRS6yfxr8AYS0
 AE1DAYMB3AHSVTPotWwgsyWS1tjwsNcdU+0R1GfA+65cplnWr/LVQk2O2XukY+EO0P3J
 XuoYTxhZvEv819uY4h5nfYcyartx5O6C5/bakNST+YTanxUwvJBDbt/RLrDYhP5Kdz8u
 uyMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d4mvXrLO
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump version
 to 22.22.0
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
> https://github.com/nodejs/node/blob/v22.22.0/doc/changelogs/CHANGELOG_V22.md
> 
> List of security fixes:
> 
> 22.22.0:
> (CVE-2025-59465) add TLSSocket default error handler
> (CVE-2025-55132) disable futimes when permission model is enabled lib,
> permission:
> (CVE-2025-55130) require full read and write to symlink APIs src:
> (CVE-2025-59466) rethrow stack overflow exceptions in async_hooks src,
> lib:
> (CVE-2025-55131) refactor unsafe buffer creation to remove zero-fill
> toggle tls:
> (CVE-2026-21637) route callback exceptions through error handlers
> 
> 22.17.1:
> (CVE-2025-27210) Windows Device Names (CON, PRN, AUX) Bypass Path
> Traversal Protection in path.normalize()
> 
> Version 22.18.0 includes
> https://github.com/nodejs/node/commit/a2d2d36bb1c8a5599cda5c5ed7b65ded2abee72d
> which fixes build errors with python 3.14
> "ImportError: cannot import name 'FancyURLopener' from 'urllib.request'"
> introduced by buildroot commit a0a6abc8b193e5bdab5326324d7299c19d5d8c67.
> 
> Updated license hash due to upstream commits:
> https://github.com/nodejs/node/commit/ec60473ab1e4980bf6388b0d5ab34fb86b3ec466
> https://github.com/nodejs/node/commit/0b5613f9fe38fd0f500d0bd147fa7d442189c7e2
> https://github.com/nodejs/node/commit/0edf17198fe118c6cc39746feb8707a91d739f94
> 
> Switched _SITE to https.
> 
> Fixes:
> https://autobuild.buildroot.net/results/da8/da82dc03cf0d42463fff1b5d9bf7a3c18cbf44dd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/nodejs/nodejs.hash | 14 +++++++-------
>  package/nodejs/nodejs.mk   |  4 ++--
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index e087d8a7f9..c3372f443c 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,8 +1,8 @@
> -# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
> -sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
> -sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
> -sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
> -sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
> -sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
> +# From https://nodejs.org/dist/v22.22.0/SHASUMS256.txt.asc
> +sha256  1bf1eb9ee63ffc4e5d324c0b9b62cf4a289f44332dfef9607cea1a0d9596ba6f  node-v22.22.0-linux-arm64.tar.xz
> +sha256  a8b4f15f6e1f371422f1f7abcca4c46bd7abc1c732c274bc5cb108b841c1f0ff  node-v22.22.0-linux-armv7l.tar.xz
> +sha256  d83b9957431cc18e1fc143a4b99f89cde7b8a18f53ef392231b4336afd058865  node-v22.22.0-linux-ppc64le.tar.xz
> +sha256  9aa8e9d2298ab68c600bd6fb86a6c13bce11a4eca1ba9b39d79fa021755d7c37  node-v22.22.0-linux-x64.tar.xz
> +sha256  4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683  node-v22.22.0.tar.xz
>  # Locally calculated
> -sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
> +sha256  e991d81497a85bb24fc6bffae0a3637a6accd6c6bc5ce1f2c5698bd555cf9d49  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 310face2d2..9f01d60baa 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -5,9 +5,9 @@
>  ################################################################################
>  
>  # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
> -NODEJS_COMMON_VERSION = 22.15.1
> +NODEJS_COMMON_VERSION = 22.22.0
>  NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
> -NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
> +NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
>  
>  NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>  NODEJS_LICENSE_FILES = LICENSE
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
