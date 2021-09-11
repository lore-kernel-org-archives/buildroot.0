Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:01:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52BAD611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52BAD611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30BA561BE4;
	Sat, 11 Sep 2021 19:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9JhuPzLj_vN; Sat, 11 Sep 2021 19:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A06C607BD;
	Sat, 11 Sep 2021 19:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76BF41BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E8981BC0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ag2ByztC7Fkg for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B36DC81A92
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:01:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id 9so7590600edx.11
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pqs7KAvo027QZLSGtFfb+ZnXrgA28esY7YlO+0JCXXY=;
 b=b7Xfdbs+QOVg1eX79252A3LCFD8vs5J1DvZyCS/jhCwevQ1EcXL3l5fGcenJ//Wugp
 dKgGjoen/teztWYxenmkZXQBb9v2k/R1XBbYt8LuzWhZvghzKymNrKd1ND6ErnNLs1ig
 7/diQ723F/LmAww4rBhjNF5pHl5pg+sODG5Sl8OF9LDsCzDDjaSfA8XHtSuxEINf9gto
 mYctvH1/07gl290sL7cQHoXWPrwYCZTKkz2LAKaDK+6ZfSojjH6HPX+GjRhZ2WvOdJgM
 6MaBDrJ+i5hegZaf3WmrIxN7A15r6olKHudAzAuATOzbP53gZkMS/U1h3Yqk1akb9XTA
 uKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Pqs7KAvo027QZLSGtFfb+ZnXrgA28esY7YlO+0JCXXY=;
 b=Kz6V5ZdOmCz5K6c8A/g6i5izZd3u/jB930hIwLT4jCZpuYz1A9SZ+V1tkpUbgDICdi
 F9xMxYF1JKNtMu8oUfASdW+dKfk48A8SK8rq5ihuz98E92r2ain/IBIV6hkefA0G1CSB
 8GCK5TCL6qv5sg54E1cu52SA/q1N5Kd9956dcQUznYPSEv/4XPgUs0cZ7056xF/99HqM
 vW4CQs7imkaHyABh5pLWa4PYSi04Hgs30byc5kycvvEkpcBDvnnc9fC8TPjoEYwL8ZXU
 0Q5ass6WJvCSNW3gCpzj/UON+cv37qr7aVQNHFDPDwPh2+cDXn2RwlqJ0EKGZHjfBd+Q
 Dl2g==
X-Gm-Message-State: AOAM533DyrntdxneuewhneOctnVEzopcW4W2V2ZhGa9uuvde5rO4n0H9
 I28FVHNthoXND4C+MSN+TAwpOA==
X-Google-Smtp-Source: ABdhPJy7DYqreo3BS5LYTMz/jtIsUJUo/bO4JCRBZ/Ah8xHzmmMqMTIsDjZKtSjewXghprBYGCUbaw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr4497503edd.63.1631386873893; 
 Sat, 11 Sep 2021 12:01:13 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm851593ede.28.2021.09.11.12.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:01:13 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-6-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <76815e4f-984e-2135-43f0-75530975670c@mind.be>
Date: Sat, 11 Sep 2021 21:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-6-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 5/7] g-ir-compiler.in: Fix shellcheck
 warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 18:20, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gobject-introspection/g-ir-compiler.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
> index 3313cc501f..712753023a 100644
> --- a/package/gobject-introspection/g-ir-compiler.in
> +++ b/package/gobject-introspection/g-ir-compiler.in
> @@ -1,3 +1,3 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env sh
>  
> -$(dirname $0)/g-ir-scanner-qemuwrapper $(dirname $0)/g-ir-compiler.real "$@"
> +"$(dirname "$0")"/g-ir-scanner-qemuwrapper "$(dirname "$0")"/g-ir-compiler.real "$@"
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
