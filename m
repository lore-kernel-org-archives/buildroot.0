Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC6FC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4402A820C8;
	Wed,  5 Jun 2024 20:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9tNYOoOFCcU; Wed,  5 Jun 2024 20:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35720820B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35720820B4;
	Wed,  5 Jun 2024 20:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF5C1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4629941A10
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id petizis0tOYX for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 869F541A08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869F541A08
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 869F541A08
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:29:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-421555a4454so2960665e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717619393; x=1718224193;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3yLxodURdaZ1K6amBziD8a7FOno8assT64lh78TZKcw=;
 b=gstZ4frwoqB1X/1KNYjO0sh1+pD1KpKc0WEHo/CT2AFtZ118P+hG5u1+z5lqwwmMGv
 HvSEmeXuJtnF5uyDZj4SzLBz+DgjqQAMt1D5MfcL7dDn1+6X4AKxZpdx6U5ZFjWAK+//
 E9ijXMCQPu2thCfnw3rRvDzFUw1U/09FbwQTiTNHfxNPI9zA6vG8s7UbODl7QYOqh0b3
 5pw5autqecuDJJuKkQSsi9VVSZiyAXxLaksbgALo8HkFjysVwtm4KFuTzHkk/24Qg+vv
 PUf4eYtvl0b2VaFAV8Wi1+2++3t4UoUm3NYnxjVY/C2eGsoHfwEQwnOJHiyn1RzOiIc2
 XJBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBDX366GNzpZenpjFypZS8M+Y/sPLiiBD5ax3TxbMrPs00JLj9hZFwGueT9mGpsIEcOgl2YsjaUci8fAJdRKZUOXk2MTW0Zw==
X-Gm-Message-State: AOJu0YzwLKsnYr0POKyxHqqDHxXGBT75K/q8dq+fImSBYdkU3T00J3vp
 whpOyK2Kn6Eh2WB0oGocSomDKNPK8x1YFU/vW70o60YhquNwhhqf5KZ0C4X+Me7D4XvGqSPBuoB
 z
X-Google-Smtp-Source: AGHT+IFeLj+mPEICcvNsyhM92nqn7G6WmZgOCD7tjX6Jf06PCnvFUz+M8kkQ29lYLcw4Ss5QynH1hg==
X-Received: by 2002:a7b:ce94:0:b0:418:ed23:a9f0 with SMTP id
 5b1f17b1804b1-421562e96d6mr27593635e9.18.1717619393106; 
 Wed, 05 Jun 2024 13:29:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c027bdcsm323045e9.13.2024.06.05.13.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:29:52 -0700 (PDT)
Message-ID: <d85cb411-3fc5-44d3-af88-b1ec7da5c1c0@mind.be>
Date: Wed, 5 Jun 2024 22:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michel Alex <Alex.Michel@wiedemann-group.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608E0ED4F12B037E2A86AE8A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <AS1P250MB0608E0ED4F12B037E2A86AE8A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717619393; x=1718224193; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3yLxodURdaZ1K6amBziD8a7FOno8assT64lh78TZKcw=;
 b=M2Mr8KZE6ngp099uTFyS85tXHER6GLiRri6z9jZZsjBGRf5vFOiZcraQ7AWkofC3jM
 Cf/5WfHsrywm2yNrud6Yuf1jmpn0DSQJG8lWWsGLY4qnCO1ZN5PB6dLsQWBK5vJYBhw8
 G2FJOeOBnQBr3MusqWzu/uq2PeSxnYzU+y846TPrQW87RfRzQcqxyOEtImL7fOloWkW/
 wcjyO1UBFfzJzQx0XH4GfkrMYnVQRd9E6QuuOsF72ImBezq2cbJMf6zeHmBW9GHT+YO1
 jtQdJ569JOXRJ5l30dacME0gJbW86CuGuaVavmxsvYArIzW3gTzdxQx9uOQuEk+ijfGp
 wBdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M2Mr8KZE
Subject: Re: [Buildroot] [PATCH v2] package/libzenoh-c: add GLIBC and
 aarch64, x86_64 and arm dependencies
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



On 04/06/2024 10:19, Michel Alex wrote:
> The manual of zenoh-c says that:
> 
> zenoh-c only have support for following targets:
> aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi
> 
> This patch provides a blind option BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS,
> which is default y for above architectures. Additionally adds a dependency on
> GLIBC because one of the autobuilders had a problem with MUSL. Moved also the
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS from package's dependency
> list to the BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS option.
> 
> Fixes:
> http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75
> http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56
> http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c
> http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82
> http://autobuild.buildroot.net/results/c85927b1dd25a84981adc5cc537eb07d02da40bc
> http://autobuild.buildroot.net/results/5389ac0174791b3d899fda7769b4f0f2dfeb805b
> http://autobuild.buildroot.net/results/285bd8f5aa338dbaf9ac0e5f78593b10bd54cbb5
> 
> ---
> Changes v1 -> v2 (suggested by Yann E. MORIN):
>    - dependency of the C library moved from _ARCH_SUPPORTS symbol to the
>      package's dependency list
>    - show comment if architecture is supported but the C library is not
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

  This sign-off should come above the --- line, because everything below the --- 
line is stripped from the commit message.

  Also, please make sure that your name in the From address is the same as the 
Signed-off-by. git commit -s will make sure author and signoff have the same 
name, git send-email normally takes care of setting From to the author, although 
it's possible that your MTA messes it up again...

  Applied to master with that fixed.

  Regards,
  Arnout

> ---
>   package/libzenoh-c/Config.in | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
> index d22807c047..c0028bec6f 100644
> --- a/package/libzenoh-c/Config.in
> +++ b/package/libzenoh-c/Config.in
> @@ -1,9 +1,21 @@
> +config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_x86_64
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +
>   config BR2_PACKAGE_LIBZENOH_C
>   	bool "libzenoh-c"
> -	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	select BR2_PACKAGE_HOST_RUSTC
>   	help
>   	  This package provides a C binding based on the main
>   	  Zenoh implementation written in Rust.
>   
>   	  https://github.com/eclipse-zenoh/zenoh-c
> +
> +comment "libzenoh-c needs a glibc toolchain"
> +	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
