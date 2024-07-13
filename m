Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881CDC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4A460670;
	Sat, 13 Jul 2024 09:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prWJlNY6BeFA; Sat, 13 Jul 2024 09:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5679B605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5679B605E6;
	Sat, 13 Jul 2024 09:13:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF2AA1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7690407D2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjW8yV92tJfK for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A52B40678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A52B40678
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A52B40678
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:13:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso18424235e9.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720862020; x=1721466820;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+acugVtOCVHccujmfdfyyQrUuB83htMPvl+Qz8E3xbk=;
 b=sDyE1bYJ4mL5DrvV9W+vn0kNKLwgNjMTSxDQoxP6fR3LY0FqGCU4gkMpYwazmBPCje
 qRN+57sMkhAyOVNErxXjAK7RbGXsA0X+rg9PSJ4o1YGOR0NW0qC7b9MOHJxJ9+QoP409
 yL8ZOLFD7qzkwaH0Bp/KWJB4u6bbX7/N6XfnuiFH9saJpcr69jyckdQSJ8NAaAVKMWOO
 48AGF0tuEM4jrIey+hgjU43XtORQdw3cb3nID38xz30CjqACM2D6Q3NFXKiHKB9pyu4j
 mzMKI72a43NqRDtCMUAL5K2JntqhHe63mBv+WL1l9paPlLe/+tyZQc8kZ138scFmCWqU
 CxQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7fipJ2MwIgX3/XPrZZrtNGoguErxk7ZzvUr00X4lBHgGqQh+qFZlaSzzKjwR5jgUouE6KR/DYqpuWKUrRrrMq7yeMYpNjKg==
X-Gm-Message-State: AOJu0YxPJdGMZy3wwITjsfkirunQBD8O1dUIm73H+OwZVQlBQmOthCJC
 +u2C59W2cN/0rSd6ipbhPV/HN63q49/ACPn2JrrI3Ryhy1fGk5KrGuxjXr+M4/E=
X-Google-Smtp-Source: AGHT+IHi3sT4PrxJ/3UA5RBLuW3rFEteURDB3oaCie4F4Xy32Mc8UKnwKSVbZ0kEM32ClK10p8qAEg==
X-Received: by 2002:a7b:c414:0:b0:426:6379:3b56 with SMTP id
 5b1f17b1804b1-426707d895amr99819975e9.15.1720862020255; 
 Sat, 13 Jul 2024 02:13:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc2efsm48544815e9.36.2024.07.13.02.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 02:13:39 -0700 (PDT)
Message-ID: <2256a069-eed7-484a-b463-28fdd7dff11a@mind.be>
Date: Sat, 13 Jul 2024 11:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Burt <caseorum@gmail.com>, buildroot@buildroot.org
References: <20230112075509.2200-1-caseorum@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230112075509.2200-1-caseorum@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720862020; x=1721466820; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+acugVtOCVHccujmfdfyyQrUuB83htMPvl+Qz8E3xbk=;
 b=GgNqCHwjOKMnX2SijCQ12teTb0xvq6QEX/5Fei0Zid+Sa/uZ1PZRUP8Zr4zZpQCsxJ
 WnObfi4Iyu3MPE0YHww97ah78GVjzfYzNaYDnUz1LIGwecEXClbSuD7TJOeWmbyLXvEn
 wUFl0FoHLQGtq01gdt6ulZN9CjjIFTz+TZLWNjG1R0AC0jW2UidoDoO16dOTB1vTjIgT
 7JRfO/nNkQWENVAEo9pGWvhsTf19QBn1DbljJh6766gou9cS1MYEiZ0jIsK3u+CGyXd/
 Ma/drsn9aueYriGoFBGuba4yxRKNicCfrCTGZROqQ5Rf3BXJU7xjoiIV9kkHo6ru/L6n
 xaCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GgNqCHwj
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: reenable Qemu user-land
 emulation for musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2023 08:55, Joseph Burt wrote:
> Compatible "struct sigevent" added upstream in musl 1.2.2 [1].
> 
> [1] https://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb
> 
> Signed-off-by: Joseph Burt <caseorum@gmail.com>

  Applied to master, thanks.

  We're more than a year later now so 1.2.2 can definitely be assumed :-)

  Regards,
  Arnout

> ---
>   package/qemu/Config.in | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 154b98a541..d818bebb34 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -102,16 +102,11 @@ comment "systems emulation needs a toolchain w/ dynamic library"
>   
>   config BR2_PACKAGE_QEMU_LINUX_USER
>   	bool "Enable Linux user-land emulation"
> -	# Incompatible "struct sigevent" definition on musl
> -	depends on !BR2_TOOLCHAIN_USES_MUSL
>   	help
>   	  Say 'y' to build Linux user-land emulators.
>   
>   # Note: bsd-user can not be build on Linux
>   
> -comment "Linux user-land emulation needs a glibc or uClibc toolchain"
> -	depends on BR2_TOOLCHAIN_USES_MUSL
> -
>   config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
>   	bool "Select individual emulator targets"
>   	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
