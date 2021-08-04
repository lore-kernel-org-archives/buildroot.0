Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22462C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:43:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8468360F25
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8468360F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF0E83CD4;
	Wed,  4 Aug 2021 12:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZMe5Avlu4I2; Wed,  4 Aug 2021 12:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DC583CBD;
	Wed,  4 Aug 2021 12:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4937D1BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37709605EB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbdVEnVhJEyx for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FBDD605C1
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:43:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id go31so3502278ejc.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0mFYS5Ys/yAw56e97b29bY2RsDvCnNfFH+XpeQPaIvw=;
 b=bgYuZlCjAkmI939M4Pn8Sr4JdeTKaZyaNAzpoQC8w3JjcaK/0+yKxHL2A+2bLF7B5j
 BeONqfMlM2570e3doPfT10IdT/rO+zbLvs0MtIK3h2TMbh4o2VkjhQWwY5mMr4+W59FA
 wTAgUIs6DoX44phfl+8YfCyZC8cO/O+v7i8I7LodhGPY+ifuFjWh09yJAQuoafv1IDv8
 axSfsSR2hyqcNRddgWCcGJkvpLjW9Q5h3WickBPI9jnTiE3RJM/Vr9OgZVYGo64gSepc
 ZZe3Zwxf0zTlxopB7Yq86HJdr97aBzL6TweYC6yYmi4K6b2KvzYFpZVpekt9VLSlyyrX
 PBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0mFYS5Ys/yAw56e97b29bY2RsDvCnNfFH+XpeQPaIvw=;
 b=R6O0/pUxtv/pSfPbZGavs9bCXu6N3LbsJtFywHDARC79VUaHfZDCaYYPizcRON8X9p
 VI2lI+SF3kTTU3Pe2Dmht9dVn94CeC8b1s/muMnRwcEAbbZRz3CoU/MTD1+hu6nXHDXp
 99b5D6Tv2vTxVVZaHzNMD6avqA1sHK/GPfVHbwzT2JlRRh6H5vv1FxgFCXZ4wS67ooPG
 qPhIs7RcUezgeOCUcoIL+NwsUzLyPKUak+IoGhqvWKg9y/LIoDJNsJQ8dmADSDyutP+z
 FN8tZgZv+q62RsQp404CJmVegTmsnhZtgqFRcdJsDdJuulqy/BtBWW5rIp71qzalg/7F
 gIJg==
X-Gm-Message-State: AOAM532qOwsGar5t5aBrFL281oUPYxEiunph1n2VCG5w9B7KmA7v8dZk
 jnVHoDLZvj1mUtfFmktCgrEhpg==
X-Google-Smtp-Source: ABdhPJzn13uH98u1XwtIg6L20PpTgHN9xPfOnfIzmnN6T/nNEW3DuJ7bUjA8NGSacb+0higGzkaVFw==
X-Received: by 2002:a17:906:9a51:: with SMTP id
 aj17mr25278551ejc.296.1628080995960; 
 Wed, 04 Aug 2021 05:43:15 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id bs13sm640711ejb.98.2021.08.04.05.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 05:43:15 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>
References: <20210701192959.137405-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <528b3218-6e5d-6fe5-9747-6adac91c21a8@mind.be>
Date: Wed, 4 Aug 2021 14:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701192959.137405-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/zstd: fix dynamic build without
 threads
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



On 01/07/2021 21:29, Fabrice Fontaine wrote:
> Dynamic build without threads is broken since bump to version 1.5.0 in
> commit aad8bbf58842dd62a4911d2c671ad9598e26b459
> 
> Indeed, dynamic library is built with threads support since
> https://github.com/facebook/zstd/commit/91465e23b2710de031a762874cafb417f8b7556e
> 
> To fix this build failure, add -nomt if needed however libzstd-nomt is a
> "special target that builds a library in single-thread mode _and_
> without zstdmt_compress.c". For an unknown reason, this target fails to
> build and don't create any symlinks so replace libzstd-{mt,nomt} by
> lib-{mt,nomt} even if this will have the side effect of building a
> shared and a static version of the library.
> 
> While at it, also replace "libzstd.a libzstd" by "lib"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e609601a0fc91c44d88a12c35b29ce937381462f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 I've applied this one rather than Norbert's patch [1] because Norbert's does a
lot of unrelated stuff as well. Also, this patch has a better commit log. In
addition, it handles the "libzstd-nomt doesn't create symlinks" part.

> ---
>  package/zstd/zstd.mk | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 2a876376a2..47d774bc81 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -43,19 +43,22 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  ZSTD_BUILD_LIBS = libzstd.a
>  ZSTD_INSTALL_LIBS = install-static
>  else ifeq ($(BR2_SHARED_LIBS),y)
> -ZSTD_BUILD_LIBS = libzstd
> +ZSTD_BUILD_LIBS = lib
>  ZSTD_INSTALL_LIBS = install-shared
>  else
> -ZSTD_BUILD_LIBS = libzstd.a libzstd
> +ZSTD_BUILD_LIBS = lib
>  ZSTD_INSTALL_LIBS = install-static install-shared
>  endif
>  
>  # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
> -# one. Building a multi-threaded binary with a library (which defaults to
> -# single-threaded) gives a runtime error when compressing files.
> -# The 'lib' makefile provides specific '%-mt' targets for this purpose.
> +# one. Building a multi-threaded binary with a static library (which defaults
> +# to single-threaded) gives a runtime error when compressing files.
> +# The 'lib' makefile provides specific '%-mt' and '%-nomt' targets for this
> +# purpose.
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))

 Here, I took inspiration from Norbert's patch and included the HAVE_THREAD
setting inside this condition instead of having a separate condition in the
beginning of the file.

 Regards,
 Arnout

> +else
> +ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
>  endif
>  
>  define ZSTD_BUILD_CMDS
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
