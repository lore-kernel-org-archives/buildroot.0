Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C4BC3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7FB811DC;
	Mon, 15 Jul 2024 07:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqmm0k58RSh7; Mon, 15 Jul 2024 07:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB4D08119A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4D08119A;
	Mon, 15 Jul 2024 07:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73F241BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6138780E46
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aglFfx4Izn1O for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E354C80E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E354C80E07
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E354C80E07
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52ea34ffcdaso4276287e87.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029481; x=1721634281;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xlYG1aKEBGzEtpNt9/aAJ3mED/9XjXW70d0tTWv6FqQ=;
 b=Mb/Pr3kqa5MymrF/3u7PnlsxkUa7bchFNDfblnAwj7GQBQC9HNYNMu9TUe5WLUSyjV
 hIEegnLL7LYP4pXLIb6VMTh7JWsFnUEX+lS83HF+m7cgPBEBEw/smIwClzZ5fH1MtQo2
 /l/NWDrpzxUkO/bR/Fy/KGBCR5YBpyO980OAYB5hU24M2E5DlAPlckzpSS864Mo8Tc3A
 8nDKjsOL/34rksSPw9q63Q/s+CqNb8e/cG4qy4VZfX1xy+z+Kd4jmvSy28SnP96J07QM
 mqDHPBZVNIQ7AKZlDNN+BYxp4rptaFAQu16bXIp6h4dQ6ikKmeEHYcBYkCAl8qX7hbLX
 aWYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDWXTLK5G4LB/TGXSFtizuCS4MkJSVfYpcCcEOfqerru/cZYgUMh+aQeuLPa663f4UuCsFZpIzD1aOvItk1kdZWiWHj34+VQ==
X-Gm-Message-State: AOJu0YyPJJ1ba1puHvjA482oelFkaCjleL+0IWMBSCJuLOrqxKtGRO8+
 BIGB4Y5Iim5a8Paf/dKUxypupCUtzLfCxc2mBgrRXdD18kA4zs+/Nvlq+s1C9Vg=
X-Google-Smtp-Source: AGHT+IFU5HCa71aDUBi+lP75OIABYozD10dtr/ow++IHuCPzQM1sbhU75qzQSAIq5X6pGkymZyvW7g==
X-Received: by 2002:a05:6512:31d4:b0:52c:9421:2739 with SMTP id
 2adb3069b0e04-52eb9990fd0mr13097085e87.9.1721029481137; 
 Mon, 15 Jul 2024 00:44:41 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:40 -0700 (PDT)
Message-ID: <238ce545-4d37-4836-877a-51809e8447e4@mind.be>
Date: Sun, 14 Jul 2024 22:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20240711210342.250810-1-buildroot@heine.tech>
Content-Language: en-GB
In-Reply-To: <20240711210342.250810-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029481; x=1721634281; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xlYG1aKEBGzEtpNt9/aAJ3mED/9XjXW70d0tTWv6FqQ=;
 b=CFLsk85+FwOEjqMUe9jBJXBubQTPjJnnwTIJR4ZA73rN/Iw8B1QLbEYp7K2R25ukh6
 T+zW/bPue7ciTqgdWdnB6iQZ5SPy9dgBiy+GL96jTo1+uSAGZJXu6tqU7QitS1q4obje
 ez/+IyWQRg4tv/vpH3RTh8CK6DzcCYMNOCi1BJ2StCjrlCLrwCHf5yf4qUV43igWsrPb
 QwSZHAkeyox58PFXqiFwT4/usw241RP/hZiaeSvlJAK58+iwqdShKb/AERn2qkgEICW7
 UvJJYrvFslmY32XB4mGdPZpU27FeAn1THs+wcPJiNz21VhsqFpgUkrnVqT5nTiU2tmvX
 SDyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CFLsk85+
Subject: Re: [Buildroot] [PATCH] package/boost: cleanup
 boost-context/fiber/math
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2024 23:03, Michael Nosthoff via buildroot wrote:
> boost-context
> - requires C++11 (gcc 4.8) since 1.61 see [0]
> - dropped the dependency on (boost) thread in 1.77 see [1]
> boost-fiber
> - needed C++11 since it's creation in 1.61 [2]
> boost-math
> - add comment for gcc version
> 
> [0] https://www.boost.org/doc/libs/1_82_0/libs/context/doc/html/context/requirements.html
> [1] https://github.com/boostorg/context/commit/8425e830eab0ad550db937027392c4b4a54df695
> [2] https://www.boost.org/doc/libs/1_62_0/libs/fiber/doc/html/fiber/overview.html
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/boost/Config.in | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 60cc0a11a2..908a53fea0 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -50,13 +50,14 @@ config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
>   config BR2_PACKAGE_BOOST_CONTEXT
>   	bool "boost-context"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-thread
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> -	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_6
>   	help
>   	  C++11 context switching library.
>   
> +comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
>   config BR2_PACKAGE_BOOST_CONTRACT
>   	bool "boost-contract"
>   	# pthread_condattr_setclock
> @@ -72,16 +73,20 @@ config BR2_PACKAGE_BOOST_COROUTINE
>   	bool "boost-coroutine"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
>   	select BR2_PACKAGE_BOOST_CHRONO
>   	select BR2_PACKAGE_BOOST_CONTEXT
>   	select BR2_PACKAGE_BOOST_SYSTEM
>   	select BR2_PACKAGE_BOOST_THREAD
>   	help
> -	  deprecated coroutine library, the non-depricated coroutine2
> +	  deprecated coroutine library, the non-deprecated coroutine2
>   	  library is a header-only library and does not need to be
>   	  selected.
>   
> +comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
>   comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> @@ -109,21 +114,20 @@ config BR2_PACKAGE_BOOST_FIBER
>   	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   	select BR2_PACKAGE_BOOST_CONTEXT
>   	select BR2_PACKAGE_BOOST_FILESYSTEM
>   	select BR2_PACKAGE_BOOST_SYSTEM
>   	help
>   	  C++11 userland threads library.
>   
> -comment "boost-fiber needs a toolchain w/ NPTL"
> +comment "boost-fiber needs a toolchain w/ NPTL, C++11, gcc>=4.8"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   
>   comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>   
>   config BR2_PACKAGE_BOOST_FILESYSTEM
> @@ -242,6 +246,9 @@ config BR2_PACKAGE_BOOST_MATH
>   	  Octonions, like quaternions, are a relative of complex
>   	  numbers.
>   
> +comment "boost-math needs a toolchain w/ C++14, gcc>=5.0"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +
>   config BR2_PACKAGE_BOOST_MPI
>   	bool "boost-mpi"
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
