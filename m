Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA01C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:23:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E3760ED6
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E3760ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597D560A54;
	Thu,  5 Aug 2021 19:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmgOxf-6Osqv; Thu,  5 Aug 2021 19:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08C660A60;
	Thu,  5 Aug 2021 19:22:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1D71BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D0DB60AF3
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUdStJbyOpDv for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C80260A6D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:22:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o5so11356601ejy.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hhex5NgYaH/+C1nBzDrOnPObZz+gMupKTrjD6AcLgiU=;
 b=HZ63iFyz4rC2Dii/RFgbw1Dq+I9Zyj0QqQSK9yo0uPbjNpKJgo/jHw5trzHtTOaWZc
 yHvZfV5QdqX/8AEllY99hvAt/S4DLJ3wxpwLSaMWDj+dOMRaO0bh7MnSdTtjy4LhSnm+
 KAXoDDOdxNFRwBq1A2jEdUUav334TRlv7aKTTcdoLXqW5bjQu9lbiOvlcrwEqOYktSf2
 IoVDsEA00CF9QfzEZ3GSwrI/ElqKLAxYA0DmFWCDGI2sq59JuJMWtI1mrufhPPduMjsQ
 xqwaUja2/oAaFhtkcjWyj+y/5IQrkp9asoyKaUpYb52eVwMOmGfsfCRx774E/LptGViG
 eezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Hhex5NgYaH/+C1nBzDrOnPObZz+gMupKTrjD6AcLgiU=;
 b=uAFK2ZLsR2aeMwTxfO4ayOjYTqJ2Ye/sadtM3uQDpP49UcBBZL/z9GH0Yf55JbMBLU
 276pLZAIZvxxaal1izvoiL7UgOCTIcP2y1fDB4u1CJPTp73evOIFSRMZtBzMFEYfs/li
 /myKDYgo/UHTIInmT8uvUkxKmQIillf+IAEzJIpNshVZ6Bm72gSwlQzrYqYOJXaD3RUB
 EONuS3KeX1ZtIRPb8ZLuK1A8R235MSWJvPqvkjlE3VgbLLvH1ImthW+xk6zdgl6Z2z64
 yMVozsGddazvIkhgXgdZe4y4GTEMk6jJGeyy4zxn4wD1X3P7Tbdii49QHcfHLTQPzoUh
 KiOQ==
X-Gm-Message-State: AOAM533HT+GpKIEV+obHU5Wg+xtkkCRTnlEnPb0bhJE+unGiS9wJZlSm
 tBVTvMyTKYWhTXyNRpHkcA4XrxsPMVM8adrkQfQ=
X-Google-Smtp-Source: ABdhPJx60+4MwTRvw7kpV+8JVX2SJN4tzP24PssCputtyo3oinMzXgNGXfxSCZO+oKAhi/fQG5wNHA==
X-Received: by 2002:a17:906:5ac5:: with SMTP id
 x5mr6273352ejs.271.1628191337730; 
 Thu, 05 Aug 2021 12:22:17 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o23sm2738387eds.75.2021.08.05.12.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:22:17 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210805173439.4172080-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <648416a2-29ee-a48c-098e-045d4ae74758@mind.be>
Date: Thu, 5 Aug 2021 21:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805173439.4172080-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libfuse3
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 19:34, Giulio Benetti wrote:
> Add myself as libfuse3 package maintainer.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1547ff123b..bb39abefab 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1052,6 +1052,7 @@ F:	package/xapian/
>  
>  N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>  F:	package/at/
> +F:	package/libfuse3/
>  F:	package/libnspr/
>  F:	package/libnss/
>  F:	package/minicom/
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
