Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBB6C25B0C
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 19:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4017641871;
	Thu, 11 Aug 2022 19:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4017641871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPX4dP4lrn9u; Thu, 11 Aug 2022 19:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035E34179C;
	Thu, 11 Aug 2022 19:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035E34179C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C39E61BF271
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE8A40217
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 19:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE8A40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJKjLpb97tTO for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 19:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365DE40121
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 365DE40121
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 19:00:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y13so35009173ejp.13
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 12:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2u7WDvNZtsf3JF+1T+wjB8dTcvSNhr8hBlWOhukR5+4=;
 b=NLZgFocIGJAQfSDBhJZESZEpEeDuhRIPaocTgVnSrz4N92lqRebhqQWYc8sQ1Z5bDX
 wn/Y7PWQscVL5l9/b7zxbrSJb9FP90klUuantd5CdBGfyBT6SQk/4t1a6pIJyZvun6/G
 asqsfmNb7H516tz5dpqL3553jDFpN1cIFL1lEvGJs9VwH9hSu8G4cfNbMFPurJ+GLIZR
 oJXENrBkRODNBAhCKCmFIjI3bXNWs88KIhoguqXs/swGPg8vCb+w03PLOO71khgoCUbc
 tBNO5zlrmtWBqyO9dDGDfrBZj/Yp5KQw9HQPq/aKT4/73f0Y8PSBBJ1LEjR2wIgZ01xm
 3SSw==
X-Gm-Message-State: ACgBeo1fYJ9HWtOMTxGGkopVrTHWx5vbIzKS1nAM3LPVhHNWjZoB7eAE
 Q+LKi0KbUv994u58QjbRYgZK9SqCRrd1gg==
X-Google-Smtp-Source: AA6agR4Wxmvr+EDJSOFW/Zjm+6Zagrt9p7bVjeuuMyELimhJ0yRTVh/G7W2DCEYhRoDw2fsaA07FFg==
X-Received: by 2002:a17:907:a218:b0:731:5e2c:c28a with SMTP id
 qp24-20020a170907a21800b007315e2cc28amr315562ejc.472.1660244414446; 
 Thu, 11 Aug 2022 12:00:14 -0700 (PDT)
Received: from [10.1.16.83] ([217.110.184.17])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709060c0c00b0072f5c1f05a4sm3806723ejf.44.2022.08.11.12.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 12:00:12 -0700 (PDT)
Message-ID: <5ea8dcb9-268e-c93c-d3dd-5a302c141b2d@gmail.com>
Date: Thu, 11 Aug 2022 21:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220712114510.1434413-1-titouanchristophe@gmail.com>
 <871qtoqt9f.fsf@dell.be.48ers.dk>
From: Titouan Christophe <titouanchristophe@gmail.com>
In-Reply-To: <871qtoqt9f.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=2u7WDvNZtsf3JF+1T+wjB8dTcvSNhr8hBlWOhukR5+4=;
 b=co5/a6JMkRjTI4Kf+YohyrCHkU0KwOTFzlkJGLEsU45pCF4Djc8nAQmpNMwK6DaThN
 SDzlcQLyj2Ym0JD8XVts6tiN2XPEbX95CTQQmqvcumw0RvzXK/pzrzFkXcqH0c7ZiZbN
 b0bki5M8XDLDYI6aUMFj5pOKguDqiZx5FjQUdSQkoiNyHfXtGTijak+JSmhP8PzqI2n2
 6npaKWp/XA6zD1crsrXJXy5mhTa5BnvbAoP3XyQjZ8Bu+9XZS9BZSBrU3zH4asaetLTT
 4P0+O7HlJriFCIS/YW5mf5ZvJQ3qM7JZHy4IH4vT23CYl6g7JPwbDsMOCxbQHHSuaeg3
 mNpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=co5/a6JM
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.3
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter and all,

I just sent the patch to the ML even before seeing your message below.

Could you also please backport it onto 2022.05.x ?

Best regards,

Titouan

On 10/08/22 12:37, Peter Korsgaard wrote:
>>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:
>   > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
>
> Committed to 2022.05.x given the fixes, thanks.
>
> I see there is also a 7.0.4 release with security fixes, care to send a
> patch?
>
> ================================================================================
> Redis 7.0.4 Released Monday Jul 18 12:00:00 IST 2022
> ================================================================================
>
> Upgrade urgency: SECURITY, contains fixes to security issues.
>
> Security Fixes:
> * (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
>    key in a specific state may result with heap overflow, and potentially
>    remote code execution. The problem affects Redis versions 7.0.0 or
>    newer.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
