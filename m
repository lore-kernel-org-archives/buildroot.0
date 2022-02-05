Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD350C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6061E60BE5;
	Sat,  5 Feb 2022 22:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIObds_rYwps; Sat,  5 Feb 2022 22:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68EB6079D;
	Sat,  5 Feb 2022 22:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48C231BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 457CF81CAD
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG0RWxHnVk8r for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:48:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02A0181CA3
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:48:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id bx2so5097310edb.11
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TVu5qSBEQHWJ6t1zLPO1q5g8Z5wP/RSB6FREGtJUXYQ=;
 b=V/B758l5LkcIgVuoou4kzrMq8UiEG5J5CYXgSAHqmBdE55S4w++0nktDOHmZ3fIlCz
 sMA/x9PcxcSpTh/XNsJ8RWJV5uzpq3UUUreKGDXlD5i8HfBztCECxyO4OIwfzw6jelhl
 yC9r0c1Rfw0r97grA/lSIYkjE3fifsLaQidVtqJ/B28e3vBfGhtIx3nRXd9d4Y+ziQKg
 +qvB2zHlfvMIKzUzA8NUH2sc8eRoGlFpEqVv/CnoQGGJrkK1i5JPGkwQYexJbuxkpUK6
 u/QayzBQs6CH5wb65WcjDZcJ7l+yXMUxu+9NDqGbBZrB+xOc8zdiaLQ3LmnJn5PsxaI3
 w61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TVu5qSBEQHWJ6t1zLPO1q5g8Z5wP/RSB6FREGtJUXYQ=;
 b=whIsBuBV+6fCEtL2Hh8iC0S/PeDE/KbWvHGji7eyIgcaMFYMgrhioTGRYCGrkZ3yC3
 V3t++A9awaz7wyRXO5XiR/mHYAQ5/OGxBd1DwOF2VmF+9j6FHIibav8Bzju0JHvgrWVm
 1T4U5dgR7VV6cuhPHmliHffAQE3/PIy67cuPImMU7lXubF7Unm/nKGshYIstRZwd425K
 oJZj27RRNkhiG9CFx5Yepd5CVHuigsZ/6KW4rvrgdItfb4IZACVzOeJ1FLWe3ElWK0AQ
 Y5tqfmPD8WRS0t0GCmOrOGI9MMP4krIWwx+JaRBJbM0youM7ToWSV2dGFAIh19XW3J6o
 JiPg==
X-Gm-Message-State: AOAM533E2tPMGATtQJD2ECmyQktcC2FLdjJqcQH7VbI/iyJrfNYiRHTT
 DcUgQzyOUvi/4lYMOjl1C8gx8ssq5kVN5g==
X-Google-Smtp-Source: ABdhPJyme5fHf+EEMRNASqXzUpZ4ei2DxnSGX+Kgvu5meT7e7rN5EE5BRMPAFczxbYOidxwlpYsj4g==
X-Received: by 2002:a05:6402:3d8:: with SMTP id
 t24mr3559688edw.251.1644101287245; 
 Sat, 05 Feb 2022 14:48:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g2sm2798253edt.44.2022.02.05.14.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:48:06 -0800 (PST)
Message-ID: <81b25800-0327-773c-86f5-a9f53af2914c@mind.be>
Date: Sat, 5 Feb 2022 23:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220124074307.91368-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220124074307.91368-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 8.1.1
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/01/2022 08:42, Michael Nosthoff via buildroot wrote:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fmt/fmt.hash | 2 +-
>   package/fmt/fmt.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
> index e735704023..79956c251b 100644
> --- a/package/fmt/fmt.hash
> +++ b/package/fmt/fmt.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  a627a56eab9554fc1e5dd9a623d0768583b3a383ff70a4312ba68f94c9d415bf  fmt-8.0.1.zip
> +sha256  23778bad8edba12d76e4075da06db591f3b0e3c6c04928ced4a7282ca3400e5d  fmt-8.1.1.zip
>   sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
> diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
> index 6ec86de7f3..be7ffb022b 100644
> --- a/package/fmt/fmt.mk
> +++ b/package/fmt/fmt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FMT_VERSION = 8.0.1
> +FMT_VERSION = 8.1.1
>   FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
>   FMT_SOURCE = fmt-$(FMT_VERSION).zip
>   FMT_LICENSE = MIT with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
