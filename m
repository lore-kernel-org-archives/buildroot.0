Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6BBC3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 10:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A156340C6A;
	Fri,  9 May 2025 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QuIj58gWEvC; Fri,  9 May 2025 10:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940D340C3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 940D340C3C;
	Fri,  9 May 2025 10:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDD215A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D021F81A0D
 for <buildroot@buildroot.org>; Fri,  9 May 2025 10:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzbBULhWvK7d for <buildroot@buildroot.org>;
 Fri,  9 May 2025 10:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5645F811DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5645F811DE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5645F811DE
 for <buildroot@buildroot.org>; Fri,  9 May 2025 10:07:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a1f9791a4dso206722f8f.0
 for <buildroot@buildroot.org>; Fri, 09 May 2025 03:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746785243; x=1747390043;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yy0zTVYIxAYD9BYc+UkYsxTnAWOfH1YUf0nXVbQJMjE=;
 b=M+1ePauZnqdEu3/VM+G0+Kt3KtLaQvqc23wRvbpPD7s8hP1U+JGrR4mhWZSu58jrGl
 DphTiyjlBDAUiMph1w7dtxyzn5teMyXTQgi1ogrDQE2waZzGXxJ89ebQEWutf53enVyF
 23vVFcWhvTuo4GiJPhEwJya/rLYJwhkJNeUwu6n6JIeU02i6orne10CCoQJAlc/yj3hI
 d3P/xGVU7mr9jchW4RszfzuB6o2nbgKdMgrgXmHsrv2VnS7QpdvdhNlHRgeSse5uAKKt
 M7kG1Hg/4CQ8/xP1uf/7S9YeQ0EUWaQl3HDqHEvXnTHOBbEzF5AbdFyCeYczCnsaxMWY
 gO0Q==
X-Gm-Message-State: AOJu0YwF/QxKV/gJQStJk9yhmxYgF0ZHW7gVH91xmk1Z4eGmPj32HYQu
 oaGMFf+V3ymf28YN4meH0luGW038xCT+N9lNnvl4i+HLFZnH18YnnYR9G8tXYNIw1F5lSoPmIMJ
 V2dQ=
X-Gm-Gg: ASbGncsN9YDOIqaztNxFCUI3QotHl++unoV3IH4loQ2p8OxPrYzHOdweiIepqHxXPLJ
 IBSMapcz2q23YQVhwIyRAul9DT2fSpgoVqrYA+eBC8XGnubuCTktyT5ZDdJu2L3UbIA0KaE9Ged
 qWS03FTv5TXT+Qe2wxRazJqdn2Nla0/hyl3MHXcbG4yTzozFp5JY8Lv5au9CHyTTjHiJ9FP7Nd/
 cBLlwKMSfG3Z0sp2EZB0D9KK+Ah22FND0L0YtV5HDBdaB1uovoPeHKsZ/aHlm6AiuVtNvqNseLa
 8E+dG7FLvh8n/0rgdkhOdWNu5fpEGO1rxliaBoLvoSG7X+uzpICAwIU1gDPuVvg8uBWJKMNkfvT
 mDSrPa1LFehiLEe6Ga312YIln
X-Google-Smtp-Source: AGHT+IHO56do4gikQIjHhmc5m8xtXfF/PZwpXwCJvwVAb5WyNuK8DPyiDC7nqHMNoUcWIg64p11+tQ==
X-Received: by 2002:a05:6000:43d4:20b0:3a0:b587:aac3 with SMTP id
 ffacd0b85a97d-3a1f643910dmr1387970f8f.19.1746785242803; 
 Fri, 09 May 2025 03:07:22 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2ab2sm2713650f8f.46.2025.05.09.03.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 03:07:22 -0700 (PDT)
Message-ID: <3dfdc05a-fc9d-43b8-a41f-a3e228055537@mind.be>
Date: Fri, 9 May 2025 12:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <20250507132410.1044093-1-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20250507132410.1044093-1-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746785243; x=1747390043; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yy0zTVYIxAYD9BYc+UkYsxTnAWOfH1YUf0nXVbQJMjE=;
 b=h+Ug1duC/JizZZvfOXT4ELlDL8BFX/uH/nYUJmYxco/h+DhptJay8mIbVc6iP5dbCV
 iLOWPv1hfjUKlw+tRWCpN58+UGP64aW93tEKjwY8oykx0pHR/MTDvGZ1IkAOjiH97cvm
 YV9R8ftPm2D8NWlLg03ubuOF/NLI0++fdo2krUoKth8hGXNi5yoMD64lI6N335FYOljq
 pyaifpg/nyyVYxamJDQpdNe+CL4lvIzFs6O1aAnS7eE424PljIdtjFGmxRrG1jZ0xQKG
 SGs7rVi+nZ6vlN6cXq+fDoAVHxz/wFwqQBazw6+/H0xEMhw+judpZiv4iY8CouQkEfGS
 v5fA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h+Ug1duC
Subject: Re: [Buildroot] [PATCH] package/x11r7/xwayland: ignore CVEs
 incorrectly specified in the NVD database
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello dear committers and everyone,

In response to my request 
(https://lists.buildroot.org/pipermail/buildroot/2025-May/777847.html), 
the NIST has updated the xwayland version specifiers, and no CVEs are 
picked up in pkg-stat any longer, as expected.

We can therefore discard this patch.

Best regards,

Titouan

On 7/05/25 15:24, Titouan Christophe wrote:
> The whole batch CVE-2025-26594...26601 has been fixed in xwayland 24.1.6.
> However, because the NVD entries do not contain any version specifier, the
> package stat infrastructure matches these CVEs for xwayland even in the
> latest version.
>
> Until the NVD database is updated, let's ignore these CVEs.
>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   package/x11r7/xwayland/xwayland.mk | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 47dc0b39e6..8052359e6c 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -30,6 +30,19 @@ XWAYLAND_CONF_OPTS = \
>   	-Ddtrace=false \
>   	-Ddocs=false
>   
> +# These CVEs are currently matched because the NVD database doesn't specify any
> +# version in the CPE strings, but all have been addressed in xwayland 24.1.6.
> +# See https://lists.x.org/archives/xorg-announce/2025-February/003584.html
> +XWAYLAND_IGNORE_CVES = \
> +	CVE-2025-26594 \
> +	CVE-2025-26595 \
> +	CVE-2025-26596 \
> +	CVE-2025-26597 \
> +	CVE-2025-26598 \
> +	CVE-2025-26599 \
> +	CVE-2025-26600 \
> +	CVE-2025-26601
> +
>   ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
>   XWAYLAND_CONF_OPTS += -Dglamor=true
>   XWAYLAND_DEPENDENCIES += libepoxy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
