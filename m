Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D66AE95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB2580DB3;
	Tue, 30 Dec 2025 13:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XroglDV_CSql; Tue, 30 Dec 2025 13:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4E380DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767100331;
	bh=GuuBSiVE6nKZ73MqK8H0TSlnC913WUDFIMkXx4Oiw0I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DWBgxibnvX1hdW1YckZJSzzh0PGu4QNDVBpoHKAOc7beSG3bMUDH8O9jkmn7O66n3
	 vmHRSb4UkQssuDFOVu3ht9mnOeKTvTyTx7OZPtJ0bg2/ctvvf5qiWnFH+QFxR7jfa4
	 1o0ZAfWH5P0hA4WuQg4hBd7u2ey5eJZjaoO0blhhxUgqljrBAylyAF+7xjmjg7oRAn
	 RZrBPq8+DyzCrZTAkpK4kWb2QSF8cZVe/R/nFBmn4/Q/9cXzgnCMvVOeOLkB7qt+7e
	 mTIwNWOZB7j03jJiE3jpb3QbDaNVDEuG4TvkHvQiLjxvqU/bPgWkuftHcMd5Him7Ai
	 +LlQicIEgtfJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4E380DA5;
	Tue, 30 Dec 2025 13:12:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5EA4D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC4DE4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXdJjwoQPbe4 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:12:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C10794013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10794013B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C10794013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:12:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 74CBE1A2533;
 Tue, 30 Dec 2025 13:12:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 42F766072C;
 Tue, 30 Dec 2025 13:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B730113B0392; Tue, 30 Dec 2025 14:12:03 +0100 (CET)
Date: Tue, 30 Dec 2025 14:12:01 +0100
To: "brvs2022@outlook.com" <brvs2022@outlook.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20251230141201.33e6e44f@windsurf>
In-Reply-To: <MA4P292MB00676659A30D80724F77DB70CBA1A@MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM>
References: <MA4P292MB00676659A30D80724F77DB70CBA1A@MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767100325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CU7H4wKEAxdbdZEsPDwG5SoSFQcbj3vOEGN/7YA259U=;
 b=WLfBeJSmYAW+SfmMsa372pAXZZaymX38qSnO2sjK/dogAqNj1dozaSr8YJx4kDzdOa6F6E
 za4RgE6SFEcDyHW5Rxf5ab15L/1B/9BacAubzM36Fvfu3by2v9TKFWaF7Bu62X6Mpu/5Op
 Klk7/Fb5iuGlVjx3U9y23+O+KARGFwx0EkyL82ZMNZONWjZ7RVD0od3VBBDupX7IuYIa98
 ZzKYaFiFtFMPKXHdlB0dMQWY2wiwL4dw7UYzpvSLLhe2mrW9CngffdQ//yKvb6Yy1F1Fp5
 XTSLPK8XwMOgMDKbHGBDzEDpZ4u/PBWlQ6wb0GRVPnw4UDC4GkrKAqDWqE8LzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WLfBeJSm
Subject: Re: [Buildroot] [PATCH] arch/x86: add support for x86_64 x32 ABI
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Trevor,

Thanks for your patch!

On Thu, 11 Dec 2025 09:58:29 +0000
"brvs2022@outlook.com" <brvs2022@outlook.com> wrote:

> From d9e20f4b358b08de6c01fbb1e7b605e01332e2db Mon Sep 17 00:00:00 2001
> From: Trevor Bastion <brvs2022@outlook.com>
> Date: Thu, 11 Dec 2025 09:46:09 +0000
> Subject: [PATCH] arch/x86: add support for x86_64 x32 ABI

It seems like you didn't use "git send-email", and therefore we have
this header within the e-mail body, which isn't quite good. Could you
use git send-email instead?

> Add support for the x86_64 x32 ABI, which uses the 64-bit x86
> instruction set while keeping 32-bit pointers and size types.

Is this still maintained/support in upstream gcc/glibc? I have vague
memories of discussions about dropping support for x32, but maybe my
memory is wrong.


> +config BR2_x86_x32_ABI
> +	bool "x86_x32_ABI"

You're adding support for it as if it's a separate architecture, which
is not correct. It should be an option inside the x86-64 architecture.


>  config BR2_NORMALIZED_ARCH
> -	default "i386"		if !BR2_x86_64
> -	default "x86_64"	if BR2_x86_64
> +	default "i386"		if !BR2_x86_64 && !BR2_x86_x32_ABI
> +	default "x86_64"	if !BR2_i386 && !BR2_x86_x32_ABI
> +	default "x86_64"	if !BR2_i386 && !BR2_x86_64

This seems odd. Aren't the last two lines better expressed as:

	default "x86_64"	if BR2_x86_64 || BR2_x86_x32_ABI

but of course that will change if BR2_x86_x32_ABI is no longer a
separate architecture.

> +config BR2_GCC_TARGET_ABI
> +	default "mx32"		if BR2_x86_x32_ABI

> +ifeq ($(BR2_x86_x32_ABI),y)
> +ABI = x32
> +TARGET_ABI += -mx32

I don't think assigning TARGET_ABI is needed here, because above,
you're setting BR2_GCC_TARGET_ABI to mx32 already, which has the
following consequence:

1. For internal toolchains: gcc is built with --with-abi=mx32

2. For external toolchains: the toolchain wrapper will pass -mabi=mx32


>  	depends on !BR2_POWERPC_CPU_HAS_SPE
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index a7727cbad8..a3fec13605 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -75,6 +75,10 @@ else ifeq ($(BR2_MIPS_OABI32),y)
>  GLIBC_EXTRA_CFLAGS += -mabi=32
>  endif
>  
> +ifeq ($(BR2_x86_x32_ABI),y)
> +GLIBC_EXTRA_CFLAGS += -mx32

I'm also not 100% sure this is needed as gcc will be built with
--with-abi=mx32. Could you test without this?


> diff --git a/package/iptables/Config.in b/package/iptables/Config.in
> index ef02c26242..e5a9b06152 100644
> --- a/package/iptables/Config.in
> +++ b/package/iptables/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_IPTABLES
>  	bool "iptables"
> +	depends on !BR2_x86_x32_ABI

Is iptables the only problematic package?

Will you help fix x32 build issues in our autobuilders? Indeed, beyond
initial support, there is the on-going maintenance effort and we
clearly don't want to be "alone" to struggle with the x32 issues once
the support has been merged.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
