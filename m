Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB861CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB2841FA8;
	Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnXG7iCgylOk; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD40641FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663843;
	bh=N+ssJ8W+9XQASIe9KtpwwjkyBZIyi9v3cyHXd7jcze4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dn9VDfN/txH3oug6p8LBtZnMCK2qAxGeyrzDgGb/p+zA+RgX3fuXna4e6+3Xv4Q+S
	 dHIeqitg7TlVXwzkhkNeOjfcE10FHu2xrANWTBQ4XxDjAFTxbshtFq41l2NwMNNWjb
	 o16bVOD1lg9dxD9HHT4wtoIJGMTwHIJSWjsPLOQy1dlpH08JFAgQsz/6W9jyHkYWMu
	 3hij0LLq2JG2VS3bC4yqUQ9MNw1DuBK63NTS/CRe5s0ySgXFRkGA3FwVEEgQ9Kislq
	 Ggb+/rpD+VtOATm2sqEfc0t7hb2E7PyRZm+o3kpRv0ZjJCQ+C0hy//C8LinkKSTQuC
	 dnQILc13edyhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD40641FAA;
	Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E190388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C33F61114
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fO-oWhFUsji for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3844D61113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3844D61113
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3844D61113
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso22206815e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663835; x=1781268635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=muD0gA2BfVKLVjkNj39fQuopVhqWBGj0VtLGaidQIbw=;
 b=rUjgZrDklRsBUvRH6XrTFssLYfmrXh6ljVrft1w7taRQM8nm0urhkJuPAgttyAqaOg
 J+hdCDTbnAn3ejlfXLLP87QDe36LnU8ia3R/hGTtby3Oxj3+sLJejv0sRLdZKco9uKoq
 CSKTeznKczqxIYto9fkbU2JpuDWVW1vZ3KW3ckIwJJ9AmPaeibU78XZXnt9OUBXlvtBP
 Y52mq1yq9RZmnGMwny1L3ilhxNzBKC54hbzv6HDfJ7ci8jA8CaqL6wMPps6hBFf5SD82
 B7QQ/Zhs//60oyzn82twkvtAciPaN0n0/PnnYugdT1Vzo0u5r8RgAfnJj3z9nazVN5/g
 7ROg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8XHlNDcb/ATOIwZAHdSI/z+4IPb4dPxK5lpmQvQTIoCiNR2ihyDN5D0o2qc7jFoBjwAUavDx52FU=@buildroot.org
X-Gm-Message-State: AOJu0YyoihBSt+PIiU+Os9R7K43WRRMEdfNQ3YdUAghHw+CaKSriJBVE
 rO4MSM7Lz/Wu8qSBS2aO2+B24SXiAQOqG+/AuVdFl75asRLRChracVJw5yRJZJwBrNJVjy9blsK
 3gF3H
X-Gm-Gg: Acq92OGuHBRgs9qTNGibbxZVCtVKWriXtLTry02jfWRFDv5z4NSfjDnN1SV3uuHjnNn
 CrOgMmcs6ok0oH3oFkdgmWXYvCB+Zp+h5/g5DM6W0n/4EyhJCKQb2umevZNz59l4AnBMJQRhFYi
 3EL7kb06AxAELdK+pFrMu6MRnySX/x6evWFsaHr8At+2HKPottwACmOof/E1Qr1fIY6c/Qraxq3
 oK0PWLup+1wkF1ADJfdJ1xcLEGYRMy0/R7Vd5jXQ1zMmFP62ndcZsb399yvf+0BhRlhgBCl04OD
 ssKqlHDdZ2InDoZud0qFR2ONgpqEnEz+vxJgHR3MDjkrRwUyxcoMLop9fRerk3Q27DoPU6qqaPr
 v95mjp+TaMPL4Ahkz+W9g8tSTDlIujpedeBVcqoFmDxpKxBqHpnHO6QXzppfzXN84wWo1L4KLKJ
 xk2bbf+Hi19j+x8AE5fi6na5bmkQ==
X-Received: by 2002:a05:600c:4fc6:b0:490:b432:6f1e with SMTP id
 5b1f17b1804b1-490c2614bf9mr51654425e9.33.1780663835179; 
 Fri, 05 Jun 2026 05:50:35 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c15cesm160423235e9.5.2026.06.05.05.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:34 +0200
Message-ID: <20260605125034.273816-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512150723.1800805-1-bernd@kuhls.net>
References: <20260512150723.1800805-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663835; x=1781268635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muD0gA2BfVKLVjkNj39fQuopVhqWBGj0VtLGaidQIbw=;
 b=ZFVb5GVxXVnC8DcnTFV1kD95drBlUhHuSTawMX+x2Hf26izqKsWz+mp5mQCmureKwF
 xJTq7MV786pHvVP3PLxfAfqlxw/j3T8CBdb1trf6MwwENM89xgQBnUbQJDu/RoZKHGiT
 y3ocJLlyG5ILVgKg2SIFPdqvfhmYKwsNnxCGQ5Fa/mJHuO5OvdxEtUHhFeV/mdfgDVbg
 ekGxhG5zVpwck95DhynaDaeYVo1mybsep1VfvDksw0/XXdSYnYhWcN8Qw9Zi0IPjil63
 n49cITWUiv6Br52BVAzmljAnAHUHfu1HmtfyRnZzsh95it69PN4s5bo94b93jhfVtFBO
 WoGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZFVb5GVx
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.3
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
> https://seclists.org/oss-sec/2026/q2/491
> https://exim.org/static/doc/security/EXIM-Security-2026-05-01.1/EXIM-Security-2026-05-01.1.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index 745b9f0977..e95f7f5efe 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
> +sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
> +sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 7129e2ebf6..c72e25a2c4 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99.2
> +EXIM_VERSION = 4.99.3
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
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
