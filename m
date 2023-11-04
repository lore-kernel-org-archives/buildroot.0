Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B402DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6331160F0B;
	Sat,  4 Nov 2023 16:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6331160F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQF0NhkmAaPH; Sat,  4 Nov 2023 16:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A227160EF1;
	Sat,  4 Nov 2023 16:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A227160EF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6F141BF2C5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA9160EF1
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA9160EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3Usq3CdLiLQ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:55:01 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 313F060EC6
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 313F060EC6
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso4993491a12.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 09:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699116899; x=1699721699;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j31X+N1WuVOPh7GShBBJOz38d/n+olYB3Dbx1OMam7w=;
 b=GXWPfoRInz0lPxRNpQgWKI8Q4haIQEE1tcKRRCARKr1YeYjn88KBCVZCheARaY3Yof
 IuJ/oig2Gex/mphxAZGgwBsqNf5Oii1icA+PF3KvIbm93aCyURCyyWpztEtGbiM4rBj1
 mV6Q1R9Tf7hoSaLnM2bTpWiSig2cPyah730GDSzx1JGrVeVst6S1gqXTWO5mbAPLNS8Z
 +75T7ZNSXl290GwIIasnC696ND7+dSz2TAJBbc0NFwsc7A6g/ccm2IGXfz3gzMGkLMmB
 URpEX0wTTxfvhCQX0Dz5zeuX4w9eu4aHLopYMvv1Sedy3G17Vjhq/yNtPltSIg6Gqyeq
 EUVA==
X-Gm-Message-State: AOJu0YykC7IQxJdvvYe448exumEoBeVZkh65DfnLhMzpVNHdK9AO5evm
 CG0Ur3qVU7cXo87mw8Y65etHTA==
X-Google-Smtp-Source: AGHT+IHz+j+DKqew+f/MDY61v0XbmdOegA5vzZE7YTRtyA20jsNwjyD4SXPAnOSsS9ADuc/xCaA6Yw==
X-Received: by 2002:a17:907:daa:b0:9bd:a063:39d2 with SMTP id
 go42-20020a1709070daa00b009bda06339d2mr10219148ejc.16.1699116899309; 
 Sat, 04 Nov 2023 09:54:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a17090606da00b009ae57888718sm2097524ejb.207.2023.11.04.09.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 09:54:58 -0700 (PDT)
Message-ID: <567d5432-f525-4d7a-a3b5-59a32723c9c4@mind.be>
Date: Sat, 4 Nov 2023 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cover.1698941362.git.yann.morin@orange.com>
 <243109e5e05b74bbf150d902a55625da4844564d.1698941362.git.yann.morin@orange.com>
In-Reply-To: <243109e5e05b74bbf150d902a55625da4844564d.1698941362.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699116899; x=1699721699; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j31X+N1WuVOPh7GShBBJOz38d/n+olYB3Dbx1OMam7w=;
 b=CfxxvhY8J/vJrbsRFUePox7qfBkuToxnX2fubNFL8I6X8k+Da9A37r7ZJyMqImteN/
 TZm8ZQLmClML2YmC+i+GKllpVcbp8P/mvUcO+QYVYkUjogCzKDJqLlafeic1dygdzwGb
 evOQhEGTsqeAWP1qdtIxr7aNdVQlxUbs+BR0vYvayFB8Do/KZSKj0tDq/vDQaPo3iigu
 tCMcphC4dS4fvIN9gzHJn/OVtrgw86lVvuqjzpSQ5sf63qDK3nNAqsUQX8XLBAHtyYod
 7B1b+JzfDQOyeBBOiN8wW4KSXM1mXEOWoxe58yQOM5d3CkEjHBt4jjpch28gxzZ3tmwV
 GUNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CfxxvhY8
Subject: Re: [Buildroot] [PATCH 4/8] package/pkg-golang: handle licensing
 terms for host-only packages
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/11/2023 17:09, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The licensing terms are inherited from the target variant to the host
> variant: when the host _LICENSE is empty, then the value of the target
> _LICENSE is used.
> 
> However, for the golang infra, we want to append a little blurb about
> vendored depndencies. If the package is a host-only, then it would
> inherit the target _LICENSE, i.e. the variable without the leading
> HOST_. If that is defined, this is inherited in the generic-package part
> of the infra, but in the golang infra, we saw an empty variable, and so
> we would not add the vendoring blurb.
> 
> We can't move the condition appending that blurb, after we called into
> the generic-package infra, otherwise in that case, we'd have the
> opposite issue for packages that are both target and host packages,
> where the blurb would be duplicated for host packages...
> 
> Instead, we workaround the issue by duplicating the heuristic to inherit
> the target value, from the generic- into the golang-package infra.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>   package/pkg-golang.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 1fa0b001e0..8e27602d41 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -91,6 +91,15 @@ $(2)_DL_ENV += \
>   	GOPROXY=direct \
>   	$$($(2)_GO_ENV)
>   
> +# Because we append vendored info, we can't rely on the values being empty
> +# once we eventually get into the generic-package infra. So, we duplicate
> +# the heuristics here
> +ifndef $(2)_LICENSE
> +  ifdef $(3)_LICENSE
> +    $(2)_LICENSE = $$($(3)_LICENSE)
> +  endif
> +endif

  This isn't a very elegant solution, but I can't think of anything better.

  Applied the first 4 patches of this series to master, thanks.

  Regards,
  Arnout

> +
>   # Due to vendoring, it is pretty likely that not all licenses are
>   # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
>   # so adding unknowns to some unknown is still some other unkown,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
