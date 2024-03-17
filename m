Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C81C54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72E14058D;
	Sun, 17 Mar 2024 21:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCyalhpJlTYz; Sun, 17 Mar 2024 21:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4C640589
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4C640589;
	Sun, 17 Mar 2024 21:42:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD9F1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 668EE40586
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCxMXaxHWfgr for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B92F44054A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92F44054A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B92F44054A
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:41:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41403889b6aso15721645e9.2
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710711715; x=1711316515;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ga0GWs3m9lJuxzuDvGTrkR7fdbvu+3PgdCs1W+q4Xc=;
 b=gAgOQg4MIgzR9NthN5DMbLDVPmERneNr+MFihhm+Uyn4vUvaAYyqBLcBqEnSqTc5/5
 mQzygg7OvbUV0ZjEWHcP/A0PLXv6uvHOnMER5MrlTrlfgrw7Uum6E3IgTWzqQV4J6kfT
 PLfJFKEZQhuIZ3qXuPlNJ0T73+cUW4PA9hQ4RxrPhXYoeSWqjq4WJvDUTdBvwfY0n3b3
 lpIYIIESV4vSc+kp6gKH3NxcXERpNe00HA4C2vBQGLEhkcqfcu5X5i33ffSEZ+/RvDJO
 D/Lph3+/pzqfYHUG+dCuXx4yHw9GQXtmmmTTrnvEdJvMb9tRnqaSskfL8+KJbYRmHgYs
 OOOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX11r2GG2r3QASmM9bMXy9kJA+u5z7TxxkYVPLiIj3/HZRVLLZ9tFyoBcbOfmsBfdMSce5lBBQiOWYaF0HvhFj2XXmmQXTEXw==
X-Gm-Message-State: AOJu0Yy7RHB5y/Kjb3J6b4T3mf82yzrmbT10+BaVWth22PpWpa78r3AW
 khwepIHrxGlFnBFBLXQNougVKDyN0NcSLlU5+7Rkb6p+hCxAsbk3j5FTdhSOQxmZ1t0S76qH5HA
 e
X-Google-Smtp-Source: AGHT+IFb8dpvoOfrvUcQfcl9K501+aPJ30kVDESRW9ScaTqgMsFPTcPIEtS+GINz81D/KJn11WRbIQ==
X-Received: by 2002:a05:600c:1913:b0:414:630:26be with SMTP id
 j19-20020a05600c191300b00414063026bemr4261941wmq.31.1710711715561; 
 Sun, 17 Mar 2024 14:41:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b0041401eb021asm8814799wmb.24.2024.03.17.14.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 14:41:54 -0700 (PDT)
Message-ID: <27462b41-cf7c-4ce8-bab1-66a1559479f4@mind.be>
Date: Sun, 17 Mar 2024 22:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317094037.41936-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317094037.41936-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710711715; x=1711316515; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ga0GWs3m9lJuxzuDvGTrkR7fdbvu+3PgdCs1W+q4Xc=;
 b=NuxaMBTogLpD3imtVnfPjFF6MdWLEF6qTQPd4eNt8gkBATh7LFMhllnGs8KUhJdwDm
 FnX9GMbN8pVLctlxHtkdmirKQaQTsVLJZ7J12dD0dD/UO5NukjzRTl2Gsy1QsCo+Bu9s
 ZoenA7yZn3IATMwPIGcPiMvYy3nykLsArtyfE+gTdPtbaIFQwaIxbldktmB2nrC/mkoW
 gqJ/7Dt1N+RdaOWBzHLB1yNhHEqc4EmuZo0aXVERQ/mwaQeCNu0pPc1DdWFgq7pim2Ic
 QyTK/Xl8wrgXj2OnS2iwFy9Dr8PLhM4GpuoV/5kRsJ0jz1yS2+yNZisLjzIAeEKL8lC/
 ntxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NuxaMBTo
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: needs C++17
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



On 17/03/2024 10:40, Fabrice Fontaine wrote:
> poco needs C++17 and gcc >=8 since bump to version 1.13.2 in commit
> 433c4fd38b15efcf74b410e5068e2e51eeba6e46 and
> https://github.com/pocoproject/poco/commit/78234857bf416b718455496800d1b7be3a0d0a53
> https://github.com/pocoproject/poco/commit/10f41c06d9416a6ae0884c4827ea2a91bf5d2cf8
> resulting in the following build failure with gcc 7:
> 
> In file included from src/Thread.cpp:28:0:
> src/Thread_POSIX.cpp: In member function 'void Poco::ThreadImpl::setNameImpl(const string&)':
> src/Thread_POSIX.cpp:162:56: error: no matching function for call to 'std::__cxx11::basic_string<char>::append(const string&, std::__cxx11::basic_string<char>::size_type)'
>     truncName.append(threadName, threadName.size() - half);
>                                                          ^
> 
> Fixes: 433c4fd38b15efcf74b410e5068e2e51eeba6e46
>   - http://autobuild.buildroot.org/results/7b1c144f39a8be4ce8f964aa13a52d0bf62dd0aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks, but I have a question below.

> ---
>   package/poco/Config.in | 6 +++---
>   package/poco/poco.mk   | 1 -
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 7cb9987ec7..9bdef125ad 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_POCO
>   	bool "poco"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
>   	# pthread_condattr_setclock
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on !BR2_STATIC_LIBS # dlopen()
> @@ -116,8 +116,8 @@ config BR2_PACKAGE_POCO_ZIP
>   
>   endif # BR2_PACKAGE_POCO
>   
> -comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
> +comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 8"
>   	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>   	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index cc8a22fc2a..233252c67b 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -68,7 +68,6 @@ define POCO_CONFIGURE_CMDS
>   	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
>   		--config=Linux \
>   		--prefix=/usr \
> -		--cflags=-std=c++14 \

  So the build system now passes -std=c++17 by itself? Or is C++17 already the 
default in GCC8?

  Regards,
  Arnout

>   		--ldflags="$(POCO_LDFLAGS)" \
>   		--omit="$(POCO_OMIT)" \
>   		$(POCO_CONF_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
