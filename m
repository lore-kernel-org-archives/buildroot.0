Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939DAC54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DEB40595;
	Sun, 17 Mar 2024 21:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0QMQsHZ15w5L; Sun, 17 Mar 2024 21:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE9C4058A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE9C4058A;
	Sun, 17 Mar 2024 21:44:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBEB1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B54260654
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ipo8v9uEbZK for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D52D260635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52D260635
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D52D260635
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:44:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so3436812f8f.1
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710711848; x=1711316648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j9EAB2pyvBte6BPwzmF4hieNCM8LJZKXUcFoI5d1T+k=;
 b=ZAl1EW37aHvFqiJG+FaDtOcg7hsh9wSIL+fTzjS7bomPdUhuEysLzynouS4o/IYADl
 382FJTidd18ufciedrr565K3v83h3/T2ZG8nqtrHjxSkXB0tsS2NcvVZdT0Lg+uNCmLv
 f2Bv9YeJ/8+B78DI9ekpLQgtFJqyFV6TmDL0a1dnecsR47ODFtMpGB1Z8uzbXpMeMh4q
 QLR68IwO2/oNwN88lcWs6UZcBIPUV2iUcMwGsXwmmzS5Es84FafCodQFKK72dAXE22sW
 nz1R2otb//q3sv+ammwFrxcf7BqzBsx7lWn6ofhjnpOfenqVnNVYdLQ26Qslet9DCm+g
 n6Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyo//+M51QiE/IzHyCFIrWVTnGOhWndvNoLuAOAdLw/Nzxwtl/HNshNUUm/JLxpCW1mHECEfeVkAnns646//diGL4JJEjSeg==
X-Gm-Message-State: AOJu0Yw4akl3TzipSQJzJ1/Iyul+Jm4HlrszAiF2sxzxSQgEFVfNFaTD
 x+M6iaQGMIcOIFDGas4UjV5Hm4T2N3iI/kV2gK460R/KQ49Ze8tDZk3KPo1yLiPVXG9iXwnxBW0
 N
X-Google-Smtp-Source: AGHT+IEBlZM6K1h42MKff05DnXwX3AhtCIU80zkFg3BV5VjbDz7Oods5hzcHptMThjssasV8nAmgGA==
X-Received: by 2002:a05:6000:a90:b0:33e:4238:8615 with SMTP id
 dh16-20020a0560000a9000b0033e42388615mr6911960wrb.40.1710711847776; 
 Sun, 17 Mar 2024 14:44:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dd12-20020a0560001e8c00b0033eab3520a9sm8303580wrb.43.2024.03.17.14.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 14:44:07 -0700 (PDT)
Message-ID: <e601f629-6282-4cfa-a016-bf1db6c42504@mind.be>
Date: Sun, 17 Mar 2024 22:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317101420.62065-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317101420.62065-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710711848; x=1711316648; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j9EAB2pyvBte6BPwzmF4hieNCM8LJZKXUcFoI5d1T+k=;
 b=XXPnR5MPa+U7LIBZHNyIDWQVtSFFvgWmYGu3FtVFoTG0gQhEWruc1UulEPqUSHQryK
 3QzF8Ymk8nV3EOpxcRaghNfaQZntoGfDsOP/L4gmZDusZivl2iMO2JkLRoDgMVQsyHL3
 gJ7hhPEWYobMkMwoAJyeUUE2kxSiY9y3ABMkrtsqRN5GqBJEKwckju7tXHHDyoTCMtA2
 48RHyde80qLKdkGSoPTF/AUHrt/PaTl/dVV7C9GcdpveFpR7AI33DbD7y1L/NFaAD8hY
 OykYCj4hLxWBbBf6Spxv+EWrjgYjqvIBYJeO9WCccmcr9suR7r8LgM0t+5f5UuynOEno
 oDZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XXPnR5MP
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: only supports 64 bits
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 11:14, Fabrice Fontaine wrote:
> osm2pgsql only supports 64 bits architectures since bump to version
> 1.10.0 in commit e056aeeca9cf8c00c6da62c39979ce6c55c92791 and
> https://github.com/osm2pgsql-dev/osm2pgsql/commit/389904269a1b1f246641d203abadfcd5cebb97cc

  Based on that commit, it looks like it should depend on BR2_ARCH_IS_64 instead 
of having a list of architectures? If there's any reason to have an explicit 
list, please explain in the commit message.

  For now, changes requested.

  Regards,
  Arnout

> resulting in the following build failure with arm:
> 
> CMake Error at CMakeLists.txt:20 (message):
>    osm2pgsql needs a 64 bit architecture
> 
> Fixes: e056aeeca9cf8c00c6da62c39979ce6c55c92791
>   - http://autobuild.buildroot.org/results/30c2675a732fd810c68dffbb6483f9cf8e4fcbf3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/osm2pgsql/Config.in | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> index c6a38f3180..b97b258c59 100644
> --- a/package/osm2pgsql/Config.in
> +++ b/package/osm2pgsql/Config.in
> @@ -1,5 +1,16 @@
> +config BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_x86_64
> +	default y if BR2_mips64 || BR2_mips64el
> +	default y if BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_RISCV_64
> +	default y if BR2_sparc64
> +	default y if BR2_s390x
> +
>   config BR2_PACKAGE_OSM2PGSQL
>   	bool "osm2pgsql"
> +	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
>   	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
> @@ -24,9 +35,11 @@ config BR2_PACKAGE_OSM2PGSQL
>   	  https://osm2pgsql.org
>   
>   comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
>   
>   comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
