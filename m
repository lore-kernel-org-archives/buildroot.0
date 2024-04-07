Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524C9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E1F40AEC;
	Sun,  7 Apr 2024 19:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA7kuIFWeWTE; Sun,  7 Apr 2024 19:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29B3840990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29B3840990;
	Sun,  7 Apr 2024 19:47:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35D0D1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D6EC40907
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCufaKhqyGaG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7841F40990
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7841F40990
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7841F40990
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:47:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2369352f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519257; x=1713124057;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlKonLC5NyfMsKZ/28761k7oY9ORFILpvfCjZ38rNFo=;
 b=lioKw2w+MFKrk1+UijopID4nNVtbuNr/l2t+RFvg/RwbCuWoKBUB+fiiMyQQRyRd7J
 +EB240yUWZuKArcbg8ewJtK0sJP1ssWDuQOCSLV9mX06+vpNHe9Swalv9M2r3N2u2Sby
 8UnW8mOMg3ALtgbGgmFBxfCdOU0I5fU9ys/8vjqEIXlF05W91Ql8cOUgIUIiMZGNIZDL
 EO5mgzQJt8oKmzG5yX7PI3seglatvSEVyCclRM2YxkJitAHa/imqf97v5oPr033f7QO0
 lBKy3s1kfaEsAK3T9VyM4eb+84iZLm2o+rQImOSIMltepPxC0heGyjDtISP/3Jf/r46v
 sx7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGWPNtP1QLVISoQlz3ekW+zzcQhEsqnqN0SwXD64HPlYm3BByGj6GKrcny3evx9rSUxoB80jEsz9wLUbfvhp+HQyGL/TQKqw==
X-Gm-Message-State: AOJu0Yzh3ik3Nrj8CxAKLgWing/HTGdG6+OBXMDsg7DzoZBGMeUmOHJm
 XJvBtA59x8/tUYV8ksmzxuYLp7H97Apjg6dN18hde7aVrfBbB2Oqe+nvXTJ30LQ=
X-Google-Smtp-Source: AGHT+IEkmQ+0JTpxNOgPaZFCEXIS3AaKorawf/47CN51CteIcFjbGJu55QUFFwroxykTXxOxb5+Mmg==
X-Received: by 2002:a5d:634d:0:b0:33e:c0a9:79c with SMTP id
 b13-20020a5d634d000000b0033ec0a9079cmr4589673wrw.23.1712519257348; 
 Sun, 07 Apr 2024 12:47:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004162d0676cdsm10700117wmb.29.2024.04.07.12.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:47:37 -0700 (PDT)
Message-ID: <13fdf2e7-3198-43a9-a6f0-15dc26a96ddf@mind.be>
Date: Sun, 7 Apr 2024 21:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407171445.2795738-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407171445.2795738-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519257; x=1713124057; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OlKonLC5NyfMsKZ/28761k7oY9ORFILpvfCjZ38rNFo=;
 b=OYBnsumyarXsPdDDCwoAfa+rpb6ff1BX6QHUHs4ekUWsrhh4+BPW9BI+Wu3q4PEn+B
 CfCK2tGSec+FKydhirl9Iwf/F03l8TtwnlOrJCgsKJStNnvWNSO45aBOqBWCie2Pm09V
 1RkmFNTsnTxVfU4n+EhC62NvvqlLolck9k3pqduOxzK0KvbsXIeZjI5hFvx3G5UaMLVb
 M8CKgCVhCrXXWHCHx0uZTT3SISqJ8tLw+vwCv3LTpbkdI1Irk9rNsQNe1BFWEL/mS9fs
 IqFYyJuDcercoou5Hoxr6OGaZxJNUD7cEt3Gi6pxJqA+LTP3NvbDORLQ4FjHB7zwmRPL
 HzaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OYBnsumy
Subject: Re: [Buildroot] [PATCH 1/1] package/nasm: bump to version 2.16.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 19:14, Fabrice Fontaine wrote:
> https://nasm.us/doc/nasmdocc.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nasm/nasm.hash | 2 +-
>   package/nasm/nasm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
> index e9771c1d7f..d6513ff9c6 100644
> --- a/package/nasm/nasm.hash
> +++ b/package/nasm/nasm.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  c77745f4802375efeee2ec5c0ad6b7f037ea9c87c92b149a9637ff099f162558  nasm-2.16.01.tar.xz
> +sha256  1e1b942ea88f22edae89659e15be26fa027eae0747f51413540f52d4eac4790d  nasm-2.16.02.tar.xz
>   sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
> diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
> index 043a84cf07..ec03b03977 100644
> --- a/package/nasm/nasm.mk
> +++ b/package/nasm/nasm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NASM_VERSION = 2.16.01
> +NASM_VERSION = 2.16.02
>   NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
>   NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
>   NASM_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
