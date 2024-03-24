Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF8C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CED4B4034A;
	Sun, 24 Mar 2024 15:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iarYflFOshB; Sun, 24 Mar 2024 15:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC3040469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC3040469;
	Sun, 24 Mar 2024 15:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA121BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 250F360725
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JKh60EBAHtJ for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00AE6606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00AE6606F7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00AE6606F7
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:59:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41488d7d0f6so1585585e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711295969; x=1711900769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNOeOE8ERQ01kn+7NPZK3AzHykl8PkCh0ptKaT1KgjE=;
 b=mLvY+Yk2siMN38q9VhmR4sk5R5/WEPG0oG7x/B67i0oz6AT4zIv944tsuB83tHlkXi
 TmmlfI+QF2CSNpIod1+J12Q7N5zA8xZB5IDb1mTRpZdmaqeLk+J5BD47HI+8G9ePwnu4
 jmXiyrueOzeHAYRAcLbwT0AL0zfMgdoqN8BJ0/Ek+o08d1KYBCn8u4K7151/7I3FecNN
 eeEa2ZnODcZGz0Tji+7KxsRCHEVUcSU4W0eB9mc2XFuTWxZr0lxSc5FBloqVZY6XT2lF
 LPy8RaJRpOUUp5KrE8wZwjVZRDR5ynhAUa5vPjlt6tC8C++JHxGSm3VeEIgyYV6WIbIa
 8Gzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2E4otUuwsHa0xOonnAG1lfql49y24F3L9vVE3kjtJa6AsQZY92LFLiJrHv0bj4rhDHFE+lF4he81C05DxaaxXVv45edEjQA==
X-Gm-Message-State: AOJu0Yx/ytzW/YCo8QJiurJLsNRgmMZLT+ce4G9l0N75I7SL6ssLlQpu
 boP8lPkhIWFguNOrFYrS4VHPrMtQqLjC4QlgQXiW3YIohp4vTB3/PkP1/ZWOvC4=
X-Google-Smtp-Source: AGHT+IGhP7OGDrd/ACla+oPtLLeHm+5qVVd5rjMu34CzLZrkQvRs6/nGTq3oG5C5Bw0RHhahKrculA==
X-Received: by 2002:a05:600c:1d08:b0:413:30dc:698a with SMTP id
 l8-20020a05600c1d0800b0041330dc698amr3282071wms.25.1711295969356; 
 Sun, 24 Mar 2024 08:59:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b0041477f3f99fsm5556770wmg.30.2024.03.24.08.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:59:28 -0700 (PDT)
Message-ID: <0d6a9ceb-382e-4749-a857-df3d64f60179@mind.be>
Date: Sun, 24 Mar 2024 16:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240316084335.20839-1-bernd@kuhls.net>
In-Reply-To: <20240316084335.20839-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711295969; x=1711900769; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KNOeOE8ERQ01kn+7NPZK3AzHykl8PkCh0ptKaT1KgjE=;
 b=Cs7/qEF6YvN0DxGEFP9Cs8Zo8Ic4SeNbIqENDpLqnLZdduKpqq6Y4urI/zK2DX2aVj
 DGumI9WrCDUK8gHlApvrxzoSNKn+TLAPZ/m+EAfkjRG02sEc84cF4/6SV+4U8k1b5UWE
 s0pQDrwP79KveOaEfCG+qpa8QBQnh7wQkaLVERc4wEOJ5o/b1W6PS7EsIyKyA0goPKlp
 utBiOQgYrP1pot1a2ovh4wgUPCpovi2nRZdAhJaakcXEvk3lYCimW9+n3UR/UhTAGEYx
 gZRUBNu71mztaxjlH9VDewrR6NfpTGeiEzR7alFlsanEOVc0YtyxxhQjTd9hfWEES7FK
 5aiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cs7/qEF6
Subject: Re: [Buildroot] [PATCH 1/5] {toolchain,
 linux-headers}: add support for 6.7 headers
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2024 09:43, Bernd Kuhls wrote:
> And add (and default to) 6.7 to linux-headers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.hash                                    |  1 +
>   package/linux-headers/Config.in.host                | 13 +++++++++++--
>   toolchain/Config.in                                 |  5 +++++
>   .../toolchain-external-custom/Config.in.options     |  6 +++++-
>   4 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 977ad30f73..6b0c5de1f6 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,4 +1,5 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> +sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
>   sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
>   sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index fe4fc5011e..1c2500fb79 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -3,7 +3,7 @@ comment "Kernel Header Options"
>   choice
>   	prompt "Kernel Headers"
>   	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
> -	default BR2_KERNEL_HEADERS_6_6
> +	default BR2_KERNEL_HEADERS_6_7
>   	help
>   	  Select the kernel version to get headers from.
>   
> @@ -47,6 +47,10 @@ config BR2_KERNEL_HEADERS_6_1
>   config BR2_KERNEL_HEADERS_6_6
>   	bool "Linux 6.6.x kernel headers"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
> +
> +config BR2_KERNEL_HEADERS_6_7
> +	bool "Linux 6.7.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
>   	select BR2_KERNEL_HEADERS_LATEST
>   
>   config BR2_KERNEL_HEADERS_VERSION
> @@ -124,8 +128,12 @@ choice
>   	  If your kernel headers are more recent than the latest version
>   	  in the choice, then select the latest version.
>   
> +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7
> +	bool "6.7.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
> +
>   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6
> -	bool "6.6.x or later"
> +	bool "6.6.x"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   
>   config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_5
> @@ -409,6 +417,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
>   	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 1641dbae06..d71fb96d40 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -645,6 +645,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
>   config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   	bool
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
> +
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   	select BR2_TOOLCHAIN_HEADERS_LATEST
>   
>   # This should be selected by the latest version, above, to indicate that
> @@ -658,6 +662,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
>   # stops affecting a value on the first matching default.
>   config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>   	string
> +	default "6.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
>   	default "6.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   	default "6.5"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5
>   	default "6.4"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 5554d56719..a7c239dcab 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -162,8 +162,12 @@ choice
>   	  If your toolchain uses headers newer than the latest version
>   	  in the choice, then select the latest version.
>   
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7
> +	bool "6.7.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
> +
>   config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_6
> -	bool "6.6.x or later"
> +	bool "6.6.x"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   
>   config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
