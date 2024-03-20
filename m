Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D2C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0010381F50;
	Wed, 20 Mar 2024 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ypz4rns287Pc; Wed, 20 Mar 2024 20:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1290C81FC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1290C81FC4;
	Wed, 20 Mar 2024 20:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCFE1BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5657C60692
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAH-qoOVysTi for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 268B760629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268B760629
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 268B760629
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:31:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4146d750dcdso1832335e9.1
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 13:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710966670; x=1711571470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmrciwG3YmVjTzey2TWp0560apypFdchzTH5TlEXoD0=;
 b=BebgmFduibBeDqmlRwKhwU1Q9VIm0lR8j5xXor2sQg93Qv41vFgXYSv1B0je2100l9
 9B3ZSVBxFgomvnQwR8aFopLVYRKh59evdX0tsI+dc3ZsK7TrdjtVmYjXBojmg3hq3kpe
 sgEiiG3kAWA1jWkRHIzRY8DXO9kILrcd3XBBmrrVb34us3wiVBeiiCFB2/IDrgSIE4U1
 sejfQNn+8LgN4oIVL9kV2TBQKoI+RURck5sYp6/usAnu8jsCZFvlSzyslx+4uRdYshkJ
 m/ku987qwGm9aYH1SoQT97p7qlxsEl1tPJ8dtfZupENZ9Q8lsuGKh/fY9CFrTGMfWptq
 wEfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX55oURP1fDnx8nNHgsjVOpmHAYl51GWqAsNq6E45/whEu5E6C1koElF6dnYqbUdmGKo2WS+UE23RZcumejZiSmuN7+EzE86A==
X-Gm-Message-State: AOJu0YwKkb34A5Z4CnUW/aomxeCnRNwr+TqKY/+On1mxF2BO8W7swvyn
 H+4V4wjT5ePiiAugIfrDlagvJhL2sVSsn8kkjzsmpMRTqHu/mdA13WmuyEIIDCw=
X-Google-Smtp-Source: AGHT+IGpRHxAlVeoudqhwrcewrQFjx1xm0jCnto2mVL/hEp5j/4n1hSUkLwEFrYEO7SFihY8L8MlPA==
X-Received: by 2002:a05:600c:1c87:b0:414:5ee1:76f3 with SMTP id
 k7-20020a05600c1c8700b004145ee176f3mr622880wms.4.1710966669847; 
 Wed, 20 Mar 2024 13:31:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0041461a922c2sm3284776wmq.5.2024.03.20.13.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:31:09 -0700 (PDT)
Message-ID: <12e4706f-e0cb-4d43-aea4-ba3ef13d4a63@mind.be>
Date: Wed, 20 Mar 2024 21:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317220028.1497643-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317220028.1497643-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710966670; x=1711571470; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xmrciwG3YmVjTzey2TWp0560apypFdchzTH5TlEXoD0=;
 b=YgS1gUnHqH4U4r4WjejDbEdDnqJPCj+C9YtwXpj+3XQGlXrgMEKyZg4JW9HwyUrbtZ
 N9ZvHDL2YqJDqGsItLWGQMnXx0S4lZ6Lsc3LHEvIxMX92em13iDsyUUpFIhcte/GmJsx
 jmxjaKUoOCkdyE6JTX52C+leWvntdwoX+dhNd60v96sVNEE9cuCy2+wmfHArWj6ujVau
 ixLf3v1v8Cu51L1flkeRE2eAWq0Hk5V01RZJYf76KdIdr7y1gKecLvchZ27yFlQ0baoP
 sErFogFh5kUhpnz+9b5Q2lC7k7FaZHskM/nJnL5QoXt6MjnqlcE+mXtaIwyRAfSLBCu5
 V+PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YgS1gUnH
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/osm2pgsql: only supports 64 bits
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



On 17/03/2024 23:00, Fabrice Fontaine wrote:
> osm2pgsql only supports 64 bits architectures since bump to version
> 1.10.0 in commit e056aeeca9cf8c00c6da62c39979ce6c55c92791 and
> https://github.com/osm2pgsql-dev/osm2pgsql/commit/389904269a1b1f246641d203abadfcd5cebb97cc
> resulting in the following build failure with arm:
> 
> CMake Error at CMakeLists.txt:20 (message):
>    osm2pgsql needs a 64 bit architecture
> 
> Fixes: e056aeeca9cf8c00c6da62c39979ce6c55c92791
>   - http://autobuild.buildroot.org/results/30c2675a732fd810c68dffbb6483f9cf8e4fcbf3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Use BR2_ARCH_IS_64
> 
>   package/osm2pgsql/Config.in | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> index c6a38f3180..439309df95 100644
> --- a/package/osm2pgsql/Config.in
> +++ b/package/osm2pgsql/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_OSM2PGSQL
>   	bool "osm2pgsql"
> +	depends on BR2_ARCH_IS_64
>   	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
> @@ -24,9 +25,11 @@ config BR2_PACKAGE_OSM2PGSQL
>   	  https://osm2pgsql.org
>   
>   comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +	depends on BR2_ARCH_IS_64
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
>   
>   comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_ARCH_IS_64
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
