Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5EDCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89762411D2;
	Fri, 12 Jun 2026 11:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r3oV1U_2yUw; Fri, 12 Jun 2026 11:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0460411FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264234;
	bh=x6hwxLzz3zSQRcCqD24xzgTz0frClJeu2UTaHsjVGSg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OOfRW9tn8SUNaTy9TJ4bbzzhXNBOwcjhjcUr6TKmUvoMxku5OzS1CGUbVMADrm0eX
	 ZEnk6WieVFHeFlInaSc0cBEahGDtukpc1Dedba/M4+bP5hmp9LQRMKEiemIGExI9Ux
	 jNNWG3vHcQjE9GVJPMVHiFgGcccQAareP2bGHVyxeCDkRwboKwq/G5H1XhsmCPWay/
	 CAWWBApjLoIURTkysa9BhYq/IKYWA0Fp4kXd6xQkC639/WZMniyzOakjGx/s9Nivv/
	 dgl6B1FGZ+x//rynjIE2ygbE9cesWqBXJ6GKZdXiYOWt0Bf0q3q6eJ7spvAhsIUO45
	 Imih0aDwgQaMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0460411FB;
	Fri, 12 Jun 2026 11:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D8A5237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116F2403B3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNHIr-YX7yAX for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6850C411C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6850C411C1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6850C411C1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso4939485e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264227; x=1781869027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uDC+kupwDsnK2XunAQl+qisgwpKOinIirP9SWoUiHAU=;
 b=IGBEoyeVczH9gWiT6l22kFs9X8Su1ZHPF3/+VjDUZhMFAg41HmkuQDfh/p1itM4Oo3
 qf5IhqaOar9ZNP9LHhi22NYRee8Bq43jmYusDfSzS8Xa6gS/OwZg85J/Ze9J+L/5macg
 FfUDDp6XoZsZaF/d7VoPXvDEfQw6nocBAxWOkoXx0XjI+9UlSTyA/18GI+zqTNhM7tDn
 ShkwpexQ4BQbPCfE4OTJ2Y0ZZ1zpPZHiiaYyC3Zuuk76GNi++5hUj/9Z1ZdtWA89lkek
 ylFBzCIbbWWEkABhDBsYS0VO9bnf6VuwN3xfLmYUYzGNMg9eg3SAdWYrAhxzl9SWCsV9
 6Vxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EhL2LoDaVIJ2KrIWQHF4vDIXy/YKJMGGxECLHATIDjrVpxH4T1miBT4yLs/2mzOU5akyhtcNyg6U=@buildroot.org
X-Gm-Message-State: AOJu0Yxtt0tIZ2x4I9dDpIicjCg/BacXf/d9gn0s3BEKOmuigquKCiTP
 /u6tm+L4dg6cNMjcsFqKHiGfgcniE7dq4YHnKCGnw6NftPDmsm2697ISdmsOhpjaIAhX2k3LPfP
 D8sZJ
X-Gm-Gg: Acq92OF3naBwh4XCVliQomYSvX4o4eF02iPIHXVtihb/xvFy0xKNeTjhs/Za4X9XszV
 Rdi6AEPmUMSW2Q2op+l6Lxvjx8GK2H5PcP1+e0BbYVCvxX50a5fO9AJbvExsaUAVZd0R1Mc6Nw7
 URers4CCQ9lonjc7RAYr6O+R1GdZjsorSiJUje+Yn9swr8LI0GPmBuNjIRh5FnhDK/YTYOMyJsc
 iTDVGz/Gymz6P7Rkbkl2HkT/g520T4t3VbMAqC/Q/5RB+Jm/aBaRpooh02AcpNUIR2bTkVvIgwo
 iqzAnmZ94eqitR8QS7rR3CLfyiMdVLP5NOlcMOsgApus7qnRTUEw4XvVXuMHNameDwTQi/o9a60
 yD43hqL4t+dslElPJlgrFheRZp6ZDaMbfqIYaLA3fS9CZ0bhegl5zfzSDep7A4Wg1EwEAdBhRR2
 4GGL72qTWNQICsHaU=
X-Received: by 2002:a05:600c:138b:b0:490:5000:917 with SMTP id
 5b1f17b1804b1-490ec480f21mr27202235e9.1.1781264227322; 
 Fri, 12 Jun 2026 04:37:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a399fsm45998335e9.0.2026.06.12.04.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:07 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:06 +0200
Message-ID: <20260612113706.251297-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602210756.2837692-1-peter@korsgaard.com>
References: <20260602210756.2837692-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264227; x=1781869027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDC+kupwDsnK2XunAQl+qisgwpKOinIirP9SWoUiHAU=;
 b=Fh9ecMSGg/ktPYHht/bbQ4dF5ramNPzVafcElr07epll6XBdKs8skJkLz1rMW+7VEF
 wQeTOrsGHyfgMrPdsk6olIGqJG16ug3gzPeFXuLiAU1dSegXzpLHi1TtpAtImBfwRkPz
 N+3LmJX8PnBdmSAOHz+B+xG4ApRPezCXKkI/ne2jAr0IMGbP9YkwyrwVobJpQS1bGyar
 CPBmt7jm40lsNnvSDBs0Ai5rHWxvDlR00fTYPB4JSlMF/94p9LM/bQIyqbW4Sh3r5ZBE
 j37gMAHbaDBzOEMAJr/QFTR6JF8x73bwtj8llCu5kJCVyoI7QN3Le4KBDSse676wxvJ3
 FgXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fh9ecMSG
Subject: Re: [Buildroot] [PATCH] package/runc: security bump to version 1.3.5
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
> Fixes the following security issues (1.3.3):
> 
> - CVE-2025-31133: container escape via "masked path" abuse due to mount race
>   conditions
>   https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2
> 
> - CVE-2025-52565: container escape with malicious config due to /dev/console
>   mount and related races
>   https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r
> 
> - CVE-2025-52881: container escape and denial of service due to arbitrary
>   write gadgets and procfs write redirects
>   https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm
> 
> In addition, 1.3.4 and 1.3.5 fixes a number of regressions.  For details,
> see the release notes:
> 
> https://github.com/opencontainers/runc/releases/tag/v1.3.1
> https://github.com/opencontainers/runc/releases/tag/v1.3.2
> https://github.com/opencontainers/runc/releases/tag/v1.3.3
> https://github.com/opencontainers/runc/releases/tag/v1.3.4
> https://github.com/opencontainers/runc/releases/tag/v1.3.5
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/runc/runc.hash b/package/runc/runc.hash
> index 76857afb31..d3132b1008 100644
> --- a/package/runc/runc.hash
> +++ b/package/runc/runc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3262492ce42bea0919ee1a2d000b6f303fd14877295bc38d094876b55fdd448b  runc-1.3.0-go2.tar.gz
> +sha256  72620f9b0e62d8da80c0c08a6265ab10d24330c544115c30713ba1429bde706d  runc-1.3.5-go2.tar.gz
>  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index bdff619751..10ff98c9d7 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RUNC_VERSION = 1.3.0
> +RUNC_VERSION = 1.3.5
>  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
>  RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
>  RUNC_LICENSE_FILES = LICENSE
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
