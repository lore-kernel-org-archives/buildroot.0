Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A11EC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C9080D19;
	Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmGrPICmN0m9; Thu,  7 Aug 2025 18:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3ED80C40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3ED80C40;
	Thu,  7 Aug 2025 18:23:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F7E310A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04ECE400B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShTgg-LQjaBW for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DDE740057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDE740057
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DDE740057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b8db5e9b35so680549f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591027; x=1755195827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgolQL2VSEDRS86oV6Li752bt/t/GQopVabX+o+OI0I=;
 b=I1ZwFjM/A/MsVImqL3HwAXfoFAfOl0IMKmZtJLCWWFhMt8yw7lRYnsNuLuDKe2994l
 NvpDkfSRFBaoK3IMVrunLNSsRmZt38PnGr1mZIniTDNeDoSCLGcGNmWHc/0+DxUfM3sv
 jgoKhxH4a0Cp3UkDB3yUOrNr8OI+0KBQReVwPT+cYKDHoGm1/3OikZWbDC/tMyiJ/RSc
 EkNvYz4OWtvfCD+fA7lFeC8Y0a+7gmKm64qLqMt6QH92Luiigi+g8N/6F/nnp4lPi5V7
 TOThUiQXx95zLTW37uu30t4Cp12h0hO4yhdDIEaY0oJsp34IKQz/hh0ZFGPeLkWsA6kj
 0+Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRiaJgfhrSEV0elC/K0guLu+W7Go/wcGCxA1yu8jP1EMBj0+Uevt3spUEOYq/smkBx+3l70VOumPk=@buildroot.org
X-Gm-Message-State: AOJu0Ywu4DMa9hWAcsW77PPS1NEKf2p0fhrCvM+7MZB+fPzj1DKwlRlL
 1RewG9rzaclWHjwpv0Hri/Hv9mDiMV72al7NA+zLiVZQmy80ra8i8m+9/o2D1/AgzqE=
X-Gm-Gg: ASbGncv6nfB+DyjPILkH+e9jDcsPyhOt2ddVAkahSQa0kCmy35B2KeIt6dYSl3eZZr9
 qu6mxdbqsvraoSm6DyzvJeyWoX27Ga5cg/omniNCwkxe/zrHGGj9QJlT8exa5ye2cmgirGdFOrp
 aRbPbE8geLZDocYvSGAXk5XTuYg4kOi5pJnVzFqhl6niEzG6Rhr21DYNmYcEG84vISxHmF3l9cd
 187Jq0Hc5XeF2RN/Q7jac4viRY6e2IyLl7n9XA6jmlHsmuiS1smuVnOz5uvsEjWKxhVNLAOo/hw
 lpL9VTdRMZS8U0pqFaKMwU2NUF0ExdrTxSS1m+6LXMFtOg2pDIf4ydMubA//PcbvBZJH6pF3PIY
 Nk95o+ujcWgn4SQ==
X-Google-Smtp-Source: AGHT+IFm0NPZJtT//I0U6GJMrZDGjsna25l6nx3prJWcIjA+CLwC0/JKHnNdxdJXYkWgAo2/tkU1QQ==
X-Received: by 2002:a05:6000:400c:b0:3b7:8b2e:cc5a with SMTP id
 ffacd0b85a97d-3b900b51183mr191544f8f.40.1754591027047; 
 Thu, 07 Aug 2025 11:23:47 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a7b0sm2942240f8f.63.2025.08.07.11.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:46 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:46 +0200
Message-ID: <20250807182346.723358-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250425201824.141234-8-thomas.petazzoni@bootlin.com>
References: <20250425201824.141234-8-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591027; x=1755195827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgolQL2VSEDRS86oV6Li752bt/t/GQopVabX+o+OI0I=;
 b=S/y3HV3n+9+1TwceeefycNE7Kv0ZCJ20/wm2peFHYOCA4qh0RPPMSLj+QtCE1GwktL
 eyj4FXMwB2mTdmQfq+5+BXEiUrFttVMScYbA7qr0RvE3AQMoidsNM84x7xl4xpzrlBEa
 IibrRmCW9pML+cu6HVxLtMTY2A9y0iUOPDJJI/6rjWSB+ziEhtH6hr5yZwN9P8CDzSPv
 XbcNyHz/DKWqkxciTT/kYUcys+12vhSb0ugSc0vqplVnmDcndNAXp/cVAwkmswjdp/d8
 es5ef3iZnLkdfMXRjSCxSqusOfvs2xzyHQNBeI9P2T1fXt6KT7JZzRgDGvn2RKlEhrUS
 tKfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S/y3HV3n
Subject: Re: [Buildroot] [PATCH 7/7] package/gcc: drop useless condition on
 BR2_GCC_ENABLE_GRAPHITE
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
> For a long while now, we only support building GCC >= 8.x, so the
> dependency of BR2_GCC_ENABLE_GRAPHITE on GCC >= 5.x is useless, drop
> it, together with the corresponding Config.in comment.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gcc/Config.in.host | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 8930c2a42a..496ead1e6a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -128,10 +128,6 @@ config BR2_GCC_ENABLE_OPENMP
>  
>  config BR2_GCC_ENABLE_GRAPHITE
>  	bool "Enable graphite support"
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	help
>  	  This option enables the graphite optimizations in the
>  	  compiler.
> -
> -comment "graphite support needs gcc >= 5.x"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
