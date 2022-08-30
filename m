Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25433ECAAD5
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 20:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1A561017;
	Tue, 30 Aug 2022 20:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1A561017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2SlAde2D1Vj; Tue, 30 Aug 2022 20:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FAF460E92;
	Tue, 30 Aug 2022 20:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FAF460E92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBE4B1BF4E6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9570E417D8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9570E417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kigymZK7CdKL for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 20:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45317417EF
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45317417EF
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 20:33:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id cu2so24589764ejb.0
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 13:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NmLjSGFi+UpK366PZEBQqrRAGUEBdszzfxJGsIwUNT4=;
 b=WstSGZ4CAU4cf6CpluaLrKc/ETlbtGbVWRiu2Jb8z3vJD4HWxLq4pqxwKZ/om6LgKp
 dWTBwg4eeGmSs7i8f3DzZFUzBNu0D0+JBoaWsAqBTZpB7cHgLWHYtdn9n/NnZgkXqNgd
 9n12eY8c88jMTzBuCOH3b6BE1cU2kjEqcel5GY1eswX9yd5h2gBHT8Z96qFQvgiBO8Rb
 pfZxTil1FeZGG6lXYAPIPl3JyfzoZCGI5uHmWIm1YA/SEbQafXyzGt3lXQSOtpjCJDDu
 +mUnD4XlzCWMGfqVXoeysj5vXmATx4GL0BZLIUReJC2cDdLt9vHasZYToso87T4L3ER1
 qtsA==
X-Gm-Message-State: ACgBeo2PGRVLyHO0CkFAW4tm+YQ4cea59XIaNEYeoSd6LU5KdXmjznED
 nOQ902A2HLywQN4CW/vS0ob9FdXllWO6IA==
X-Google-Smtp-Source: AA6agR5LCAJB0l1a+oC7F8hHMWY7y++WZZTqxazXoMAcgt3ZwLsRS762StTLO76SSkiH7beyKE2P+g==
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id
 gn7-20020a1709070d0700b0072eec79ad0fmr18764147ejc.296.1661891586449; 
 Tue, 30 Aug 2022 13:33:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a17090631c800b0073bf84be798sm6350897ejf.142.2022.08.30.13.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:33:06 -0700 (PDT)
Message-ID: <875e2558-5b20-9a24-498b-60a062cc18f1@mind.be>
Date: Tue, 30 Aug 2022 22:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220827161431.333659-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220827161431.333659-1-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=NmLjSGFi+UpK366PZEBQqrRAGUEBdszzfxJGsIwUNT4=;
 b=YqZroU9toT28XBHTAkLLbRaw2UXINXsfJRKAki5HtXDKyCtd5ARuQI4CmfNF3rxg8R
 OBLeJYVLCyMC7SOlrBMfvyZPrH3k9oF24qF0bYwodch7XO7Y45x01ng+Y2+xuqMle+y7
 lrzc3DyX8/dqasRarHvlTUx22v7C8op01f0xEzgBVEZSnkZfNqXjmyorNHvNmwHuqPWu
 7nmoN0TOkgKCwFMAMIr3mGtNb3NQSYW+LURoyRgn2KxIcYYLFbEOx0J8RD7WyhUTTG6t
 iF0wPr66Qv7Wg0gXDddUcfkltBnWV2UWfvPTb4XHDMOALKOwwWZmDFOt7NZlXq6RrKEj
 6Q7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YqZroU9t
Subject: Re: [Buildroot] [for-master 1/2] package/glibc: glibc on or1k needs
 a toolchain w/ headers >= 5.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/08/2022 18:14, Romain Naour wrote:
> Commit [1] enabled glibc on or1k since it's now supported but it
> requires a toolchain with linux-headers >= 5.4.
> 
>  From [2]:
> "Here we define the minumum linux kernel version at 5.4.0, as that is the
> long term support version where 32-bit architectures start to support
> 64-bit time API's.  The OpenRISC kernel had some bugs up until version 5.8
> which caused issues with glibc fork/clone, they have been backported to
> 5.4 but not previous versions."
> 
> Fixes:
> 
>    checking installed Linux kernel header files... 3.2.0 or later
>    checking for kernel header at least 5.4.0... too old!
>    configure: error: *** The available kernel headers are older than the requested
> 
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/2875256686
> 
> [1] 68d0aede597d32816c5b2ff32de0ce33cc14eb93
> [2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0c3c62ca7d9ff3bdacdd13e636bc858101e3e288
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/glibc/Config.in                 | 1 +
>   toolchain/toolchain-buildroot/Config.in | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 23cbfcd9aa..ba9f691d80 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -36,6 +36,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
>   
>   if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 836af3b22a..154cf69ef1 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -67,6 +67,10 @@ comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
>   	depends on BR2_arc
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>   
> +comment "glibc on or1k needs a toolchain w/ headers >= 5.4"
> +	depends on BR2_or1k
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +
>   config BR2_TOOLCHAIN_BUILDROOT_MUSL
>   	bool "musl"
>   	depends on BR2_PACKAGE_MUSL_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
