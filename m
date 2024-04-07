Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D353CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57FA812FD;
	Sun,  7 Apr 2024 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xydeZnpmf_su; Sun,  7 Apr 2024 16:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0FE81EA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0FE81EA4;
	Sun,  7 Apr 2024 16:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 997471BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82F8E6082A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wshbyFOOsbNi for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:25:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83575606DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83575606DE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83575606DE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:25:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4166ccac75cso1650305e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712507111; x=1713111911;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Qh/kaQqrbu/5VRNo5e4BZ+B28Y9jKMa3wYIFAjI0lA=;
 b=jf37vzmpyGOgaKJ35Idou0+6Bs+Ftm2vvDA9AakK9tdXZmUB9GQQq9ZmPMGgvGhDiy
 wvWYmFnqkEn3fhCGU67yAKT4mSOtJjcI1GZwr544/qcCUP7mMD/ZYGDBDwNJ+zGc+t/T
 q9Y1Utkg/fkT4mLoH8WHkkXL7Rk+aA5nHWWI4CeBxF1+5tHrBqy3GMenRK5u9cmnm2Sk
 527Prhda7fQuggt1mDInEJrje8ARTc/DIabpdYObl1WleG3oUxHSBN0YSrqlpLqTXsPB
 8QA6yyQ8LHgoZaGoZfXDHvY13JMSF0B697KvVwAp8rGpV7g9kyPeREfNCzY/qoNTutR5
 Uk5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUANxE5WeW2S64PSt7jOc9Ae1fWNQ1oV+pWKIhvCaA1tY/r/WWiYIQSo5Gbipj4otamHCChO4td0bmmv2uK7vFtcuKWk6st9w==
X-Gm-Message-State: AOJu0YzNzMadhb3NXMwFh4BRNzM2edP6QaMNRPIicLM03gTmqFgVM5m1
 MYskozpL2v/dhZK8s3OgHAyn/dPxtlRAAzmLmlsYyRWi2R443SHE+SyEf+3hgU3vfEbd2wR+WD8
 M
X-Google-Smtp-Source: AGHT+IHLcGjsL36kaKp1vLpe98bUG5syytDNMO4xvehJlBR/0uEt964IxxGU0PvP2/sIOJHTMVwNoA==
X-Received: by 2002:a05:600c:1382:b0:413:ff06:83cd with SMTP id
 u2-20020a05600c138200b00413ff0683cdmr4827165wmf.3.1712507111134; 
 Sun, 07 Apr 2024 09:25:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b0041633f1513bsm6643572wmq.46.2024.04.07.09.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:25:09 -0700 (PDT)
Message-ID: <f80db14e-92ee-46f2-b789-73976420a79b@mind.be>
Date: Sun, 7 Apr 2024 18:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712507111; x=1713111911; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Qh/kaQqrbu/5VRNo5e4BZ+B28Y9jKMa3wYIFAjI0lA=;
 b=gXkYb7R1Fd7tCZNBmUNNAo5Q31fMOxl+xu45E3inOHmQgkZDH1jqtDgkSCDHEDWhB/
 mPgB5gfvENHQRJ/HxnQxsnLNMdWOUxaO7+LBCiy/Xg62rh5MyIEWKP5vVm8sDwYzCgWv
 LOjvcFDHIvtdlUbPquEsAvu9Zd5SJrbnGGdZIgHrqwwKHT1obG8JrSSt1+8GDCOaOrwT
 RZhXsVwbjcBMarHb8mj82Ft/mpJZnwSdSmm/JWfg7T08FIE9Zra6t1Dz5KdJfWyOJvQW
 aDns8sK4b+XjQlzAHv9+w+PRZVzjqy4R9BrSRNhXxbEw+vENPMVNCTGw67qhXZhglhqG
 CJig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gXkYb7R1
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: update ucontext
 handling
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
Cc: Koen Martens <gmc@sonologic.nl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/03/2024 15:55, Fabrice Fontaine wrote:
> musl workaround for getcontext/setcontext is not needed since commit
> eaeba56aa2d21f1d264c7e361731808e3f072d9d
> 
> Moreover, select libucontext if possible to get full ucontext support
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/c-capnproto/Config.in  | 6 ++++--
>   package/capnproto/Config.in    | 8 ++++++--
>   package/capnproto/capnproto.mk | 5 ++---
>   3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
> index c472128c3f..abe2a602ba 100644
> --- a/package/c-capnproto/Config.in
> +++ b/package/c-capnproto/Config.in
> @@ -7,7 +7,8 @@ config BR2_PACKAGE_C_CAPNPROTO
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # capnproto
>   	depends on BR2_TOOLCHAIN_HAS_ATOMIC # capnproto
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # capnproto
> -	depends on BR2_TOOLCHAIN_HAS_UCONTEXT # capnproto
> +	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # capnproto
>   	select BR2_PACKAGE_CAPNPROTO
>   	help
>   	  A C plugin for Cap'n Proto. Generates the code generator
> @@ -24,4 +25,5 @@ comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, u
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_HAS_ATOMIC || \
>   		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
> -		!BR2_TOOLCHAIN_HAS_UCONTEXT
> +		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
> diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
> index 943ba9de29..93e3a64fb8 100644
> --- a/package/capnproto/Config.in
> +++ b/package/capnproto/Config.in
> @@ -7,7 +7,10 @@ config BR2_PACKAGE_CAPNPROTO
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> -	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
> +	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
> +	select BR2_PACKAGE_LIBUCONTEXT if \
> +		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS

  This will select libucontext even if the toolchain already has ucontext, so we 
have it twice? Is that really OK, and even if it is, is it really what we want? 
My feeling is that libucontext should depend on !BR2_TOOLCHAIN_HAS_UCONTEXT...
And here, I feel it should be "if !BR2_TOOLCHAIN_HAS_UCONTEXT && 
BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS". Which is a bit too cumbersome to repeat 
in many places, so maybe we should also introduce an auxiliary symbol for that, 
something like BR2_PACKAGE_LIBUCONTEXT_IF_NEEDED.


  Regards,
  Arnout

>   	help
>   	  Cap'n Proto is an insanely fast data interchange format
>   	  and capability-based RPC system. Think JSON, except
> @@ -25,4 +28,5 @@ comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, uco
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_HAS_ATOMIC || \
>   		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
> -		!BR2_TOOLCHAIN_HAS_UCONTEXT
> +		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
> +			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 7424a1420f..d322c27a54 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -29,9 +29,8 @@ else
>   CAPNPROTO_CONF_OPTS += --without-openssl
>   endif
>   
> -# musl doesn't support getcontext/setcontext
> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
> +ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
> +CAPNPROTO_DEPENDENCIES += libucontext
>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
