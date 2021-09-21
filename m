Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A948AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5258661165
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5258661165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C76406D4;
	Tue, 21 Sep 2021 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7MVA-zR2UA5; Tue, 21 Sep 2021 19:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B83F40696;
	Tue, 21 Sep 2021 19:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC50C1BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84B3403F9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qiZP4kWmc1I for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2434400CF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:17:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c21so673937edj.0
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hjf5blSb+2kmiuPMJ2uYJ4ptmcefKNCPKft/XgUDCzw=;
 b=CxW+wRWwKabcE6TYYqfh7nY83CXBlAwq1puBlvKCZjjxqbWjd6LmpEJwWJYAwJL9wP
 rUjMc9RlO1iGn/KAOo8hsZkmQhftgL4J6zT+f0UHE8bJ9wFtUN9LQJL2l8Z0QvSMFEln
 EJiqkRmfLOHCtbaAn04cDza/8YoYIg0/Af+jjjIlyRMkD/hVOVarvEd7FvScEZNG03R3
 JNW9tDWrx4ddVemHKqqnz76/yhknGUTCefcGl+kVh9vGwq1JFysOTk+beVhr2sojBDOc
 KQlFCVGYryMag7cpk3dTqVFlvXQeX9Ew/eK/C29YCVNGFNNmspYlLpciNUOGBc1NXG3p
 AY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Hjf5blSb+2kmiuPMJ2uYJ4ptmcefKNCPKft/XgUDCzw=;
 b=TJ7saK1SljkVQuOvhX1YeyE5cRDkQi0Yg/GhDSnYhxYYmQVdR6Nb7PCAfTLx+WSNxB
 uLi+UB/7kdIrTWqtPBbjvGEmvpmCe3olodzHcJZ3b9CCBTR9Gcetpb1/dDie1HcxOzA0
 pqDtyT2xvvnBW+TnwTPcDfKNGxerogdgYF0RQs5YuMVKes0DuLsQyo3b7vev30YMdIgs
 RvZm1jPruSinP/9JX37+SUpJ+Rcej2iD4WxiCdIXxpEbQMbLRo1RECsd05qsXxcGkmkR
 1NwTHrciM7CkZ9PMsraRuetzLT6i7cG/EUOM8iTmXipM4R8jxl7YFy/kH0fSyqQCDZJH
 qOug==
X-Gm-Message-State: AOAM5319743sDQ1xUq1VyrFyVvb3Ks3FHakBEZWcZ00kG45/Bfp7XA2E
 2LyxLdLvoa+PU9tidP1c1iZOKg==
X-Google-Smtp-Source: ABdhPJyoWtqw8GEjq4iT3OIn2mKXlWF68AkmATi+xJT6S5TXuMXdFKbjB77IgX0trqUBeQPYHP735A==
X-Received: by 2002:a05:6402:142e:: with SMTP id
 c14mr19834921edx.209.1632251844237; 
 Tue, 21 Sep 2021 12:17:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s3sm8044997ejm.49.2021.09.21.12.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:17:23 -0700 (PDT)
Message-ID: <7c1a8cb8-62eb-3fef-1c5a-71268809178e@mind.be>
Date: Tue, 21 Sep 2021 21:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20210910104758.519291-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910104758.519291-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH-NEXT v1 1/1] package/protobuf-c: bump to
 version 1.4.0
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 12:47, Christian Stewart via buildroot wrote:
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/protobuf-c/protobuf-c.hash | 2 +-
>   package/protobuf-c/protobuf-c.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
> index abc11afc58..13e1b474bc 100644
> --- a/package/protobuf-c/protobuf-c.hash
> +++ b/package/protobuf-c/protobuf-c.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8515da8b84ea36768ae69a52f9ede8d718936d6058077265b6e458cfc55f8bdb  protobuf-c-1.3.3.tar.gz
> +sha256  1068bca1e9870e9492096f97c409cd15f10c5019c183e52ec6d53e8d18630cbf  protobuf-c-1.4.0.tar.gz
>   sha256  20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
> diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
> index f28f5ff57f..baea4d623f 100644
> --- a/package/protobuf-c/protobuf-c.mk
> +++ b/package/protobuf-c/protobuf-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROTOBUF_C_VERSION = 1.3.3
> +PROTOBUF_C_VERSION = 1.4.0
>   PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
>   PROTOBUF_C_DEPENDENCIES = host-protobuf-c
>   HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
