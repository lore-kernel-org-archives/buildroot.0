Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B50AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E6B60240
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E6B60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9DB404ED;
	Wed,  4 Aug 2021 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oyddis13y1K; Wed,  4 Aug 2021 20:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38FB40552;
	Wed,  4 Aug 2021 20:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B85C51BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A76608BA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1Dchst2RMTR for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:50:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9401F6073B
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:50:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z11so5198940edb.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xwqdpnW/a+wKcPhg6ifnor7YegiVxVbpWlWIf/z2gYM=;
 b=O7DGXT/gx7beayT6ZBLwOSfPrHjT9Pn1Hr6yTC4cCqCZZSsFbASXEIiOFDW3GLlokP
 dR3h5Fm7RJhY8Ou5K+WQpptsyDNNRcLSpGFGHtn7B0eIojYZZeHtBc6nVn0VPetHAkGa
 xWBhiqX47awf2RDo16EyCV9CINb/I/KmVImLjCFtOm4XwaKCSM0VNHfB/dWkt+IaYOpY
 YzY1n4o7OB0rw3BzBauSZUtCSiVb2qgWUenKFjc7CkCToLxJ7tuqvExdO1o6MMEFvcK/
 oV6gaIDwjk2GONQABfyQ411YP1B1PNJEwzvhtKoG0hDbZWAdyKrNlKVMUfao7ZRT2t04
 t15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xwqdpnW/a+wKcPhg6ifnor7YegiVxVbpWlWIf/z2gYM=;
 b=eFTovZ3HXfL0CCjGpQG4U228nIle7YF93HfLdWLL6x/eRPSthHhZ5JMaJRF48yjooa
 HDSXV8eXA4iDcijQBr3tyEThTIf4fKZNivwZ0ORjwviGk18YfN/y6w/mXGfWrCyLyJ7b
 Ca935gq2B7Rm95dxYW0IdNbBX1x+F2IP9cAAYxoZoMZGXh66oG8PocaFNo0Nt7OuJ9uU
 9ByBUnZWoe2R7OlhRgUQQJ9oTtmHL0J8Cxp+VrgQo21cfv1O5eofoZvQ0DRjEUm/wWu6
 GRNrn4cfXbhTFVdTH9GrBpBEJx07QGHkNQrToD3hZ/n355g+v9khKlWr9gI2PojIGYv9
 z7QA==
X-Gm-Message-State: AOAM531chAwAMV0FuTKi/YC6CGy0+f0asax50JPylDIIV2aUwVjQaPI3
 NxWmHazmoKeRHRoJ3jTBcERyfQ==
X-Google-Smtp-Source: ABdhPJzEbsL6UJB6GiDmRO/c2wKBN2NRWwjeUMKyrGt9ZwBI/zwXrZiWs/mRfHC8g8IAg2UwlfwxVA==
X-Received: by 2002:a50:f61b:: with SMTP id c27mr1919788edn.96.1628110245818; 
 Wed, 04 Aug 2021 13:50:45 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id i11sm979647ejx.82.2021.08.04.13.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:50:45 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803170602.343034-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <cc6dc450-f89f-9b93-2985-a8f86d8d56f1@mind.be>
Date: Wed, 4 Aug 2021 22:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803170602.343034-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/php: opcache needs dynamic
 library
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 19:06, Fabrice Fontaine wrote:
> opcache needs dynamic library since version 8.0.0 and
> https://github.com/php/php-src/commit/9a06876072b9ccb023d4a14426ccb587f10882f3
> otherwise the build will fail on:
> 
> /tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/instance-4/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> __uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> /tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: __uClibc_main.c:(.text+0x160): undefined reference to `__fini_array_end'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/526d2e3108ff2506482d1665bcc3ed083961430f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/php/Config.ext | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 7c97316048..5da5d8bed9 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -10,8 +10,12 @@ config BR2_PACKAGE_PHP_EXT_FILEINFO
>  	help
>  	  File Information support
>  
> +comment "OPcache needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_PHP_EXT_OPCACHE
>  	bool "OPcache"
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  Enable the Zend OPcache accelerator.
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
