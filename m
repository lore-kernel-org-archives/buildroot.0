Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63421C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2690B80B0C;
	Wed, 28 Feb 2024 19:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLA54YBPCCMf; Wed, 28 Feb 2024 19:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0516480B2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0516480B2E;
	Wed, 28 Feb 2024 19:34:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8B9C1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F27400FC
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ia5Q1XEvlued for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F29B400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F29B400DC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F29B400DC
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:34:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412a9ea61adso912365e9.0
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 11:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709148888; x=1709753688;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXW0vVCnw8vQ7BBtl5oEEGmrTMApQZsJWPM0jX+QsXo=;
 b=WzBXOpfs7zHTAb9UPjBq/r5Hq5dALKQatYPv9Iz1LzFOHI16IR/bR3nlH+tRp1OTzn
 yN9NMFyF0Kxj2+rylTZfr2TNeaJko+PWxr5d7/oHNLxzgw4NjSuLGbCoVLkG3GddzMth
 SzwZsaCmdpGpT98TyJ59dQ3nNIdhwh7jbYRgndrz3xrdEjO1BvBJFgHIHz2OqoLqJhQT
 fBjwnADT8PfvN8iTfIzA0gCwziGbiYO6AUV2QDdXgPUI4lW4TTW3SsVtUlkCrgDjO5rI
 y+wRdJNaOTbesEVYM+JLsFMovEuBmmd0u1oUDgitGngDlcia2BNY6p6Mq3nLl3Ews3B9
 hk6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7sXvW4aL6onO8vzU0EJGFu9YxnOKWvFGddoxw6zFSTMcPAm4c8FEvPcLy9CHUEWOtqxsWcFU123J01j/P8pAasWUVKQch0g==
X-Gm-Message-State: AOJu0Yw2AjIB/C5chVYDeaJAXTcKk2YPbkd+IlmJ/HgWqBk6r0Fnr+4H
 l3aSgkzofpk7d6+vxxVQ+azZVR5eEPZPfM5IjzNaU4z008t2ZP2qEPQoXyHdNp49gfXKOdOXTff
 U
X-Google-Smtp-Source: AGHT+IH4LSn5xZTrXgN6wY1arT6FR+zTJZ9Acz0T1qCqtKQOxo08pnGYeIchzK52V9FJ8dBJepKxXw==
X-Received: by 2002:a05:600c:1d8a:b0:412:b15c:974b with SMTP id
 p10-20020a05600c1d8a00b00412b15c974bmr138632wms.10.1709148888537; 
 Wed, 28 Feb 2024 11:34:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c249100b0041288122af0sm1378514wms.0.2024.02.28.11.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 11:34:48 -0800 (PST)
Message-ID: <65c2613d-781f-42ab-acd8-6e72fbadd5b9@mind.be>
Date: Wed, 28 Feb 2024 20:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1708898731.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1708898731.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709148888; x=1709753688; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXW0vVCnw8vQ7BBtl5oEEGmrTMApQZsJWPM0jX+QsXo=;
 b=ao0jNdkcpF7MbPud6bR5B3DvPDrY/HyoOOmi26zkrmYCOxggO0yhws7fRR1CW+qC49
 VquZmccrlYdKuqJrWSbeNRDicAHcibFPq4445CPA1j1Aa7dX3fdxwlNhkl45K/L0VnQF
 W7ufhcQSU7dc8veEOx2asRVr/CDziuhzqz19p59cbAOsGDcp4cj1I775He/qwXSKS7Bf
 f7cfzHz5IKvyVUrvDnbfcR/dGprrOVOE4oYf+SXZFKjcjEKe4J7U/IjIxX+faQDhFCmD
 ipLdZDYx7BS6GAlS2BY4NpRHreIvgDY8RDS41GbMUPBJm8LKbFjxGAL2bjZH01Svq2u0
 AJWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ao0jNdkc
Subject: Re: [Buildroot] [PATCH 0/3] support/scripts/pkg-stats: fix CVE
 identification (branch yem/pkgstat-cve)
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



On 25/02/2024 23:05, Yann E. MORIN wrote:
> Hello All!
> 
> Since we switched to the FKIE CVE feed (as the NVD JSON feed are oing
> extinct soon-ish), we missed the fact that the new feeds did not have
> the same layout as the former ones, breaking CVE reporting.
> 
> As a consequence of having no CVE reported, w emissed the fact that the
> CVEs were not sorted in the new feeds, while they were in the formers.
> 
> This series fixes both issus, and introduces a minor fixup for a python
> deprecation warning.
> 
> Regards,
> Yann E. MORIN.

  Series applied to master, thanks!

  When I was working on it, I thought something needed to change in parse_node 
itself (because that was done in the other NVDv2 series), but apparently not.

  That said, we currently do make some sweeping assumptions about how a 
configuration is specified....

  Regards,
  Arnout

> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>        support/scripts/pkg-stats: fix datetime deprecation warning
>        support/scripts/pkg-stats: fkie json format
>        support/scripts/pkg-stats: sort CVEs in HTML output
> 
>   support/scripts/cve.py    | 26 +++++++++++++++++---------
>   support/scripts/pkg-stats |  6 +++---
>   2 files changed, 20 insertions(+), 12 deletions(-)
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
