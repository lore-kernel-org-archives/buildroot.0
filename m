Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545B8CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B18E822BB;
	Fri, 19 Sep 2025 12:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxDKZchqhZ2d; Fri, 19 Sep 2025 12:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F90810BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F90810BB;
	Fri, 19 Sep 2025 12:56:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD094E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF514831B0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g7OKzHLHk0i for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E2F683103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2F683103
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E2F683103
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso285637f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286593; x=1758891393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kIE/LP7xt7MXbR518DkLFY7CI6Aje6AiEZIb3KZYxY=;
 b=iJo1QVi8SVbQFOT0Dx6uVYyqYH3ER9OgcvY79zl/lU3o51GDskbgwbDjnJHz2twr1X
 Ql8wpqBcfOUHyeMKm3sEHvA0bhmB56M0nS56CIs8rTHYyuMJy94A2F2azoQolBEqmd3I
 gTQ4TXPNZWiNaEQ+Yo34yJXymbLL8bVV6xuNSw42+e7HOHuT0XuS8rlt+8nBY9K6uFXb
 C25Osi4leeMHE7xo8ENlMTx+sYjh7KQcfZ0BhRsdsg6Kz3YSsu8TiMW5Ocnz0aMJZRdr
 a/AubjjulLlPICabjjLPcD3u9ugJ+trJaTdCbGNOSWKDWi99h+uYXfIVPnNQF3lhdSz1
 FiQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Quv7C+v9+7/jb1Ru3B8/0TAHw1SMUVRGKIPO43EwS66eajPo1ookt9Tdn/Y+plMLyxqrfLePQdY=@buildroot.org
X-Gm-Message-State: AOJu0Yws840AEt/PdE9qsohkBMJv6btm+UtuXtVDUuwsSUik9pxp3qvI
 PB/JiyccKUXsrbYFH1IIY8ZjTHiee7joHwMlfmiamKlVnprW7XrH/BVYKYkOfNUztFg=
X-Gm-Gg: ASbGnctGhpuz/ZjSCoCxFO9mMYBGXSjjzb81AqWO5WJpp9TQKCg6RlERa8iXWnUFS9J
 St+q3lpw6zPWOJMLjxVkPBHVRlfs+TetejiXVRERRwSzUUNDRRc/z5h0Qq56MwCgJUb9BAq0PIp
 Niq7FOKr8hdUCgoCOPNpXmsUZ6z7qbRG4VgtOXL4sf9Dl2FNl4+NxHyZx0mjzCzOq8+BEGEFzrM
 drc+4gqY59duZz5XB0grUjBPJN5dpeHuPhijcRCbrEOIauG/id7zYaK6CP6YA+Ev2xyPEjxrvyx
 3YzIpMUm8VX0yMxF/9NnSA7BbcB6m1iO1UHB9PzjgHvBieq9Fjsak92SkoncIo7wCu/L0S5stgU
 Xo4QgQPmBFXj4XPU=
X-Google-Smtp-Source: AGHT+IF02Jt6Aq3+4ZjgpK8EGIAGKhbbUYryclAg6oPI+mxRZB5ndDE2ZkyNhNJ0UohMNMeL9Wp5yA==
X-Received: by 2002:a05:6000:4210:b0:3ee:14db:6ffc with SMTP id
 ffacd0b85a97d-3ee7f04c3c8mr2290757f8f.19.1758286593009; 
 Fri, 19 Sep 2025 05:56:33 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm129128755e9.23.2025.09.19.05.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:32 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:32 +0200
Message-ID: <20250919125632.136853-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250914143440.51414-1-peter@korsgaard.com>
References: <20250914143440.51414-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286593; x=1758891393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kIE/LP7xt7MXbR518DkLFY7CI6Aje6AiEZIb3KZYxY=;
 b=NuUM1WY6eZdy6JlOtrwdbnXCW4Nbt/9X22RZbqAKRBFTGaU6KKaa7nI2FI8ZX9y2aM
 xjfGNKMKgWbS+v+35j2Nche2PGFT65o7VYfhztpRb6d7mWn26W39HrsIM18GDnP62/z+
 TyqArjdR6Uhl+jz9y41KboCIu5rE5FBKa+jzKjE82EOWjda9m77n/+rSTEBvpMEFQmXO
 I1/7C6HMkgWyx1ohL1wPLRHU2ePBHn9E71nKQX34fviZnV7Ym43lxK5BtiaAOEEhSpJJ
 1L6QKR7jVIvOomRUELPDLSNT4XfLmoGuy9IqODqHV0yN+dSPsjr9a2ChIn4vbKSHVTqB
 DsPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuUM1WY6
Subject: Re: [Buildroot] [PATCH] package/pcre2: security bump to version
 10.46
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
> Fixes the following security issue:
> 
> - CVE-2025-58050: PCRE2: heap-buffer-overflow read in match_ref due to
>   missing boundary restoration in SCS
> 
> Compared to 10.45, this release has only a minimal code change to prevent a
> read-past-the-end memory error, of arbitrary length.  An attacker-controlled
> regex pattern is required, and it cannot be triggered by providing crafted
> subject (match) text.  The (*ACCEPT) and (*scs:) pattern features must be
> used together.
> 
> Release 10.44 and earlier are not affected.
> 
> https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-c2gv-xgf5-5cc2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/pcre2/pcre2.hash | 4 ++--
>  package/pcre2/pcre2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index 35b87ad854..bd2422d991 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature:
> -# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.45/pcre2-10.45.tar.bz2.sig
> -sha256  21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4  pcre2-10.45.tar.bz2
> +# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
> +sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
>  # Locally computed
>  sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index 6d2b729dfe..1d0a3b845f 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PCRE2_VERSION = 10.45
> +PCRE2_VERSION = 10.46
>  PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
