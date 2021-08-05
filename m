Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED45C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:11:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFBB610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DFBB610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1F983AFD;
	Thu,  5 Aug 2021 19:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qtc3fpdg9lVB; Thu,  5 Aug 2021 19:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500C883AEB;
	Thu,  5 Aug 2021 19:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC631BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFCBF40293
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4KUU8gXiF4K for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E393A40524
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:11:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id k9so9852513edr.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cELIPyqoxNVbaXHOeM624V5uHTn56dJ0LsEO8BhR4lw=;
 b=BO748RhZ3voa6orjP3fOAMRr7UUlCbAKiqpIZrRQaKmzdq7zN/j8+ApPe9AGCgpgMg
 SBaWlXHqBdU6nKPNOfBbGIF/65EO1jou3m6bi2OddHXR2VcM+3zZcFg91lKfgUItvjwZ
 em/gyxjCaatviVUf9TZVRkGQd7w0SyofswT7te5wUch6WzxQDpvhB3NIwCi5I4iRQKZn
 GKN4VaSVjgNflzMllg0kWmzpE7sRLxQ3RINaZSZ4d+GqKR18NKMsqaOYNkgUSqkuY1W9
 dLwbT2TNWL00ZNsH0pkzVr5xorC5/D6ryudsP4kuzWQ3Lm3NvSfJoKwheDR65JcLibva
 5P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cELIPyqoxNVbaXHOeM624V5uHTn56dJ0LsEO8BhR4lw=;
 b=icvtaBqC5VLJ9LzEYeg/YYsdWE7APDpvnMHQTrIK7Afmh3xgzFqpZv0whsScQkpXAC
 UTLjHsHb3PhTLRUBC5lFlkViwjL/goN0dKrxXDAftts/TkbGWOiDBqU+7X08bOD+5IAr
 FyU31tM+ZfPa5NsCGD7k71FJPOJfKKP6aiumgXEjH3lwSRF2mzdEkyUC8e8nR21g5LGc
 ztc5gc7EQ84ZJZZ/ISUXBrp7YfnHqh4BWe4+pIGkJfP7FuaF6mkb3mlM2wVBDypMtLZI
 JfSr43s7abcqUBVD1n6tvHgYB0bQQTOvFmzoZON3FoVruQSLNHl7ZyOxRiZpDXgMK8q/
 DUmQ==
X-Gm-Message-State: AOAM531GZmC4RIa29iHUHmYFvPyokned+J8aMo3K8175y85mITkNwzfR
 M6gmFpE62nrLwdoJ6p5YfAXry3ewwqLMDo57T2Q=
X-Google-Smtp-Source: ABdhPJyvQ+slr4IZx4QfMeBxZPMlg0YmZah0cAzsKun7v7zeto4+1uKdYI7/qMhWtQMrXcGQhe3bWw==
X-Received: by 2002:aa7:cace:: with SMTP id l14mr8638024edt.14.1628190696519; 
 Thu, 05 Aug 2021 12:11:36 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cf16sm2679443edb.92.2021.08.05.12.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:11:36 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805092226.2110638-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8554bc3d-2bd7-78a6-4ba8-f02b8d0d20cc@mind.be>
Date: Thu, 5 Aug 2021 21:11:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805092226.2110638-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2, 1/2] package/mupdf: renumber second patch
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 11:22, Fabrice Fontaine wrote:
> Fix mistake in second patch number added by commit
> d7d23710facd789c8986de055e30792af2591f2c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...703366-Fix-double-free-of-object-during-linearization.patch} | 0
>  package/mupdf/mupdf.mk                                          | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename package/mupdf/{0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch => 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch} (100%)
> 
> diff --git a/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> similarity index 100%
> rename from package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> rename to package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 294cd8a61b..d3d9d3b101 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -22,7 +22,7 @@ MUPDF_DEPENDENCIES = \
>  	xlib_libX11 \
>  	zlib
>  
> -# 0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
> +# 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
>  MUPDF_IGNORE_CVES += CVE-2021-3407
>  
>  # The pkg-config name for gumbo-parser is `gumbo`.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
