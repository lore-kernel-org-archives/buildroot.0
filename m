Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B1DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781D46112F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 781D46112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC2683B69;
	Thu,  5 Aug 2021 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8Vo53L2I4dg; Thu,  5 Aug 2021 20:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E6782AB9;
	Thu,  5 Aug 2021 20:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70A081BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669904060A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlTANPySSBIn for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A17C405E9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:32:44 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gs8so11541153ejc.13
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jpIRfhjLPAK9bqZe4qcSvGxSzzGf6xm/50BguLIxL6k=;
 b=C5a8t+V7Zy4FA/QC7rBTahnm1MfvjglUtv6qVFlS1lMwHe3Nl37kXuqFglbeztRjp9
 fXlOSDR2MQOHs9QSv1RyEqUmz3URJO96nHKGSKPwrA3rVDvMVKH0BAr9M7XAoKNzWqia
 fopv/K07UpN3G6kOMJYfvQFq8zBPLctLKyxiy4yzGgQ+DfO5cXX9VWXsVdlY7wcmkqsd
 fz/oIfqSzQDdBnLT3t9YCIAkMNWwJfbepAIOkU0axDrT8ycMzzN9ZwICaixGMagbGR1h
 JxrHmDSn2sg25rJ8UhC5s9H7oQZhjPKRwoRnvHQQWGLhvnCRoVy5s4XtYkRTca4P/lIr
 TqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jpIRfhjLPAK9bqZe4qcSvGxSzzGf6xm/50BguLIxL6k=;
 b=K3NHm0gwI0+3Y81BdFWjJCQs8lEm2DN+ZWJ4t0GlSbqmBsDATGG0bCEUwvhCi//Fsx
 5bqjVoH0G52VdhTNhzgWRWnnizDT2fq/T3eH1cdGYwM4CHEgLMkUE/3pPIL0CkAYiFjv
 hXwJu3PmAhkWuzWZ27lO5Q0Dnijwen1fnyABZf4c990Ojk1GdFqDePAIXd9cyN0n4vZS
 w0hCcRvxQmn95bpQlc2zkUoxUf/tLECijj1q2TpJUSwky5J+ZOhKBGsisZr0+BhbYzOr
 /XM55pIY8Wvmw32YzCnXM7AcFXRuMxYvwz20jQ8JbbP0Vv90Wd2xTyGMvBWjqhPf/VC0
 VUkg==
X-Gm-Message-State: AOAM532m4JFKxwwx6FBjRSBJ1DOQcs8svXYl9UkdIu3NaeVr54+7I+Qb
 cdCPtiY402WDW/TkWtkezmLoA0vQBWic1Hj0GEQ=
X-Google-Smtp-Source: ABdhPJzWbbCEoxXgsRBVWj902D3crZRhziORWz7jaJflab1YoaR8HxQDufm0zAB7ZUGU2oc7XYqWgw==
X-Received: by 2002:a17:906:3c04:: with SMTP id
 h4mr6447600ejg.89.1628195562438; 
 Thu, 05 Aug 2021 13:32:42 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id q11sm2075467ejb.10.2021.08.05.13.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:32:42 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805202517.2665707-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fe869a6d-9ab9-33f8-cf74-02eaf67e58db@mind.be>
Date: Thu, 5 Aug 2021 22:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805202517.2665707-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libebml: fix patch
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



On 05/08/2021 22:25, Fabrice Fontaine wrote:
> Fix patch added by commit 1116a3060955c36c43a8bea5f1f00ea4effb4e48

 Gah. Normally I do a 'make foo-legal-info' to make sure that the patches apply,
but I trust patches that come from you so much that I skip that nowadays...

 Anyway, applied to master, thanks.

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/997d0d6204ad7a5456f25392257c8d876a1289ca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com
> ---
>  ...riate-header-files-for-std-numeric_limits.patch | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> index 83d1b92051..c7e789c02e 100644
> --- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> +++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] include appropriate header files for std::numeric_limits
>  
>  Fixes #80.
>  
> -[Retrieved from:
> +[Retrieved (and updated to remove ChangeLog update) from:
>  https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
> @@ -14,18 +14,6 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   src/EbmlUnicodeString.cpp | 1 +
>   3 files changed, 6 insertions(+)
>  
> -diff --git a/ChangeLog b/ChangeLog
> -index 034cf86..e4b13a9 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,3 +1,7 @@
> -+2021-02-27  Moritz Bunkus  <mo@bunkus.online>
> -+
> -+        * Fix compilation with g++ 11. Fixes #80.
> -+
> - 2021-02-21 Steve Lhomme <slhomme@matroska.org>
> - 
> -         * Remove Coremake project files
>  diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
>  index 27e55fd..4c05fcf 100644
>  --- a/src/EbmlString.cpp
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
