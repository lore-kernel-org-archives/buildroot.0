Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB84C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF9A60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEF9A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF8804024E;
	Wed,  4 Aug 2021 14:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z3qAWZdIXC5; Wed,  4 Aug 2021 14:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4EB140231;
	Wed,  4 Aug 2021 14:32:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7DB21BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E44AE608B5
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUAD09T7R0aY for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:32:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ABE0605AE
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:32:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id zb12so3967922ejb.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4efrXd21lEbTWjhRgF95DXzq2uBLehmxULvCB9/vbsI=;
 b=cDsXd4i+LiUwDEWoyv/CqVbTDegS0qRwMzCpPb4Ih0HvBYOdxDQuyhXwttfenQCreN
 VHfz57cByrY2v7ZQddQ5r4pJ1Wtb6ere8b5tTGqD5QlEUx4abY74916lEyjphwa8v780
 C7muvC+1f16XRYDPh3MfBtQ1jMHlp2p9PboBZcCOgziuDKE+KroT8lW+5pztXSKer7jl
 i0itmMhSV0eet0zMIbso4Z5erpbpevbW7c1O6z2dieRWmT3+9xu0/BvNNWWvLssIHIxO
 9WypmSAwES09g1lhJsT9PHm72rFtvVTQgSmYlP23nqb0mFHN+eCoYvMa4NF1I17348NE
 e61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4efrXd21lEbTWjhRgF95DXzq2uBLehmxULvCB9/vbsI=;
 b=ay5eMbD9EeBMevLOY24VX/+/aGkef/JWO4pUlXpYlc5JZ9IaU9PzsNhg2aKISOHWD/
 4xECZonsdeEaMiQPjBJC5D0xr8HTsVGzrxX7UxqJ9H+GDocoU6qEzKG1yCHn/559u0ds
 +Yi4givK98NQSGRMLdYulYCIxpzmPVKEuoowpYUTjsREZG9Z34xOmUtGyaxAob0mNtmw
 726TOTQ3hzi+BJRIVqRdiXlppPdIXAf3fdc7+R9imMPRY99fLz/Niu2rRIUIL/MjB1U8
 rIvto4TfbdS9slo0zaNQIDc0iu1dzfsPMLmK4B2zEZDD4afgOhlOKTgHJXMrO7JklUiC
 cwcQ==
X-Gm-Message-State: AOAM533z5xzfZywyPyXNqAxkBX/LMKXWDfjV/N+RQxyNAf33CtWnHqNm
 zTUwPUNI6LbtftP3MTwlavmKPg==
X-Google-Smtp-Source: ABdhPJyeegmAYVx58WYC2W4hWnpoPH1laznHDaQHtiEJuRPIhmkORfc/j0FOjBVUQhUpYxk4UgjA8g==
X-Received: by 2002:a17:906:d147:: with SMTP id
 br7mr26689825ejb.126.1628087550354; 
 Wed, 04 Aug 2021 07:32:30 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o5sm1011326edc.16.2021.08.04.07.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 07:32:29 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20210617091456.272611-1-nolange79@gmail.com>
 <20210617091456.272611-6-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <be4146ca-9be0-15c2-962b-85d598779364@mind.be>
Date: Wed, 4 Aug 2021 16:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617091456.272611-6-nolange79@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 3/3] package/zstd: Prefer dynamically
 linked tool
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 17/06/2021 11:14, Norbert Lange wrote:
> If the libzstd DSO is available, then link the
> tool against it.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However this depends on ZSTD_BUILD_PROG_TARGET which was added in the first
patch, so I haven't applied.


 Regards,
 Arnout


> ---
> v2->v3:
> *   Drop config options, just use zstd-dll if possible
> ---
>  package/zstd/zstd.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 58b0d0099e..2131f3fb16 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -39,7 +39,12 @@ endif
>  # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
>  ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
>  
> +# prefer zstd-dll unless no library is available
> +ifeq ($(BR2_STATIC_LIBS),y)
>  ZSTD_BUILD_PROG_TARGET = zstd-release
> +else
> +ZSTD_BUILD_PROG_TARGET = zstd-dll
> +endif
>  
>  ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>  ZSTD_BUILD_LIBS += libzstd.a
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
