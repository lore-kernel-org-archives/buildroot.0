Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F093CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3D76133E;
	Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QuJcUo8vc5q; Fri, 12 Jun 2026 11:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1818B60F8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264287;
	bh=tiwO9Yz9m6d5Zr3C+rmePoUrKxV1cqkY5se3URDntNo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E2Llu7ys4/XqjwPUohtHrruhLGiK8osWPdyQErqD/L4JJwd3GVol5JDXirTzEe/N9
	 lhrHOekJaITL2v/JyvPUVWU3LIfgsa+cAokj83crGoZAGZFe7yABIc+mD9y/v3Po6C
	 H7LEg9Fs1kmHm6ftTlICGgl1kjwqnSR/9NGRE19SKZSJW0u6MNFGZjWOxdYsKTPdia
	 jpZz/Vu3ydXFr2XlcEQkyvyQFC6/tlYiRZ0bsfxDmvS1lDfE2x4kr3H8YwXVFPtQ39
	 TT4MEX50dOlUnwyjgq0roSGnGHqrT1NJpdfP51T5c1VtSLtqUnVVrnVQNAIEAVctJQ
	 W5hCkXbrt6zuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1818B60F8F;
	Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD4D512F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF66D4066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcjoWdzNS7Ra for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9913940664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9913940664
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9913940664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so879066f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264278; x=1781869078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UzxA32CUOUaM1ZprX+nmtSfnaW6HRrj7Xtza2AFQ+Hk=;
 b=av1yT4Zta2apt/Z/qPw70Usb4OqvcAk4rENc3laSRFGPimEEY5ELyCMkMGdyUgQSf6
 E+K+WilL4gbjbLmyAQT5Dh4huSLlvw32biX2mMPMm6YcySZwfXlGPbpjl9yHn0d74qVI
 f9W8NRJB66SgVxZyb+zmWvbRhSLenBUQ5jsm3bCphGOOxa40e9FzfELWV0s41Uv1HI2v
 /pW4pi02fF6MEdfQEzHcTBBeUiDJRJ4/l7YbUuLY9/2VBTFipLUaICn3fjgbspuq2umA
 AoK3RGNY6yTjaDx/WzbSNqTMkeU8y65WetPWXYquRPJma2+uwgFAWZrC2Sk6giVyxjQ9
 9djQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GWx+/DyDiLGkRrBku/nKwrqUtjCMza0bj0nGQsBJKFWE2ilLHPOP4kbsR9oWiGfC/9Qz7NL9tIY8=@buildroot.org
X-Gm-Message-State: AOJu0YwXDwKrJV1kzsIg5Bl9n63r2akZWsTLBb6X4SKs7yZLa0QYCal3
 YUweIc+pmNmLj+T2S/yp4eKQM300cXHkG7ObptOZg/OyXG8O/qx0yYwF9IKILn+/hN9DBOHr4NC
 yk3cY
X-Gm-Gg: Acq92OE1Gp5ZVwjwkNNAvwsczQNdgiH3bU+JGBncAzolqqK528+J4TmJ7M/amAZuYv5
 Bxhd62X8qKzba0syQmW2Qf3XwEiD68JQ++VnAGVrRmgyz1g6auXVhd0YpHCtx9YrFyPQyDw2zBJ
 PPLAR/O2A7I+UPyzffUSXo6UKywvpTnACgTe6eE8RrR9W9fncWXUotVOFEU6ts2m+HNYEduhI5N
 HPsyVy4+CcBY96CGdJcvBqxffDcLkyoICnXBwmBErJVX47TRSIfHz2WwThO/oqIn+K5fOpRhozX
 VhafVnSV/3uvMhiO55oZKqzOU6UG/y919zkaPaJXRherlJAEY7jTyNuw0DF7d942CHP4rF0luP+
 goxJNyIKsa4ddpzse6Y1hRO57Au/S0+U6Jrgkwx1ckcXCxdjqwLn8KAuJdIop4stY83N/escvYL
 +8nP0wlXO43pJKXAE=
X-Received: by 2002:a5d:6702:0:b0:452:c246:ab69 with SMTP id
 ffacd0b85a97d-4606da7783dmr2755536f8f.13.1781264278512; 
 Fri, 12 Jun 2026 04:37:58 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm5086973f8f.28.2026.06.12.04.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:57 +0200
Message-ID: <20260612113757.252525-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601192158.3687045-1-bernd@kuhls.net>
References: <20260601192158.3687045-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264278; x=1781869078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzxA32CUOUaM1ZprX+nmtSfnaW6HRrj7Xtza2AFQ+Hk=;
 b=Fsto7dCM4wWiJV8lPiYgEgrtL60LVs56qhWjE3W3YD2VELCgx1rpnNtgdaS26hfaQl
 fhAvERVSusa5mu0pVKtJlWe4xXJ2zxJ0d0zqTIPbGOTEbruHHh1WVphptvjgKwUTYsFO
 luz2nZ1M27sMnRX8Cg7MXkZ99CxKvT6+E+0lLxH7DLWt+S7PWR97rAJXXC6GrBFygqyM
 KKCc9hrSIu1Vq1EFMXrzhWJUr9XeQt/RlsWO+obxFGnTq1rbEF3OrT/eiAaZWdVe75EE
 rLG6Vqm6GG93jbLAA71X/B2K/Vp4dlIAzy9fzoZlfDq0/NZsWErA998lmuwsFvj+iDdE
 xFXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fsto7dCM
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.9
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.9/ReleaseNotes
> 
> Fixes
> TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
> TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
> TROVE-2026-021 & TROVE-2026-022.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/48fe2acd75c1028cbe94598180882493ecd33550
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index f748afecfc..a6771b1fa1 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
> -sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
> +sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index a24708ddad..ca5a4d026c 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.8
> +TOR_VERSION = 0.4.9.9
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
