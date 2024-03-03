Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73936C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2C181EF9;
	Sun,  3 Mar 2024 16:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6w6tEDeahddd; Sun,  3 Mar 2024 16:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 324E281F3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 324E281F3D;
	Sun,  3 Mar 2024 16:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92BF11BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8020640727
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9f1nnLHevEUN for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FE6F406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE6F406E2
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FE6F406E2
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:15:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso67157266b.3
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709482536; x=1710087336;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8aJ8H6LPm9g07bi7uMXPn6lfxQDjxbgosaOWWmObw4=;
 b=PbeqRYrDk6GdNjjD3jfeghjzGDecmqUrIgudeflJyOQV2Q21rLIyUWIHCCbN3VX5Sd
 AcwMGexEMa7+g5qsgRkISKAAHRdqBYRIVOcKGopJTpNAA6tUEwyEgQfwAGAGUyuXsF4T
 JiW5xwcqaQ4Zp2SiPBltHdkVgtGn2zKlhTRwFq1HPFzf01vGRliLak/36Iwl7gWoqqA+
 vYc8+CKBnBeK150CJoOxtTa+UzOj6UhSfdKobMpAKUeo+MUcJiYAuAkRuWlPQZLRsZEP
 OreP7v56LZIHmezmOtlBJ239jiFnEIYMJNStB3OONvCEUMhkfpFcAjYGIGWsssERkJVX
 yJAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXumoDZPtZG9XxV2kTA03QZPyfQtYagxu0k1kafFUcL883P+rExC045i/AcamPOSAqfMjXPiwYsumKrBI3H9s9o48gBAyJ7Vw==
X-Gm-Message-State: AOJu0YwFOZuNO/WAlca9cSeymP3Bn4OFy1qeyiB66GcNMYO+JCOg7dUY
 xUeEa20zkmIwNDHHHIjo2uJzS2tS4YuYTwQIKnHtvQ+CdEs34FMNyywxreaj6c0=
X-Google-Smtp-Source: AGHT+IGkNM46VYKtsfyXKhIwrkDt+hHiwHzYcY/LSYTftGhSnkXA9ou8B0Ns5LTGLf62fKVEPQ7Eag==
X-Received: by 2002:a17:906:22db:b0:a45:aa5:c256 with SMTP id
 q27-20020a17090622db00b00a450aa5c256mr1462848eja.11.1709482536248; 
 Sun, 03 Mar 2024 08:15:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gl7-20020a170906e0c700b00a44e65447f9sm1535534ejb.7.2024.03.03.08.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:15:35 -0800 (PST)
Message-ID: <dd1d4de3-aa6f-409f-ac3c-91c921dd2af8@mind.be>
Date: Sun, 3 Mar 2024 17:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240114125448.819400-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240114125448.819400-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709482536; x=1710087336; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E8aJ8H6LPm9g07bi7uMXPn6lfxQDjxbgosaOWWmObw4=;
 b=QxcgS9Nl7bnQ9yp+xhI/bP/1r0gkhulzTkXeGEjpaA2/v7xzUcrSqXqJ1Xbp+3xr5y
 4EvTlr9e48v2nOLZqTLnsiVj3uVc2SBDQ7ihwn0o+FIRyPeoRDJde58MTDFSmqPK4Eu8
 vdlTZB646KbCCyfBtvvsLnNbG/8UjT2FD+EZ11nGIE/uNZ9Spy0Wbh2tOP5zK8RIxLji
 2o1n4FJu+H7TzuBnVt2+0X34TQd50BKUMz/dD6UXdBcBIlsV3qP7x1r/9hHtTQz5LR2K
 ofwejaLD5B9mWRWbc6GsCO6oEvp5aSJ1U3HKqkON7OFcRgMZxjAc1JFFMhUzU1IzWA9l
 9+eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QxcgS9Nl
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: update ucontext
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2024 13:54, Fabrice Fontaine wrote:
> As suggested by Thomas Petazzoni in [1], add a comment on
> BR2_TOOLCHAIN_HAS_UCONTEXT to specify that this boolean will be set to
> true only when a toolchain provides a full featured ucontext
> implementation with ucontext_t and {get,make,set}context. As a result,
> drop its selection from BR2_TOOLCHAIN_USES_MUSL to fix the following
> musl build failure on php:
> 
> /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/m68k-buildroot-linux-musl/12.3.0/../../../../m68k-buildroot-linux-musl/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
> zend_fibers.c:(.text+0x946): undefined reference to `getcontext'
> 
> [1]: https://patchwork.ozlabs.org/project/buildroot/patch/20230516193307.1543455-1-bernd.kuhls@t-online.de/
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/271f9fb8bfa5ba2f74feef81e6b375b54e21cece
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   toolchain/Config.in | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 5be63d4e15..f1f9212f25 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -34,7 +34,6 @@ config BR2_TOOLCHAIN_USES_MUSL
>   	select BR2_TOOLCHAIN_HAS_THREADS
>   	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>   	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -	select BR2_TOOLCHAIN_HAS_UCONTEXT
>   	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
>   
>   choice
> @@ -303,6 +302,8 @@ config BR2_TOOLCHAIN_HAS_SSP_STRONG
>   	bool
>   	default y if BR2_TOOLCHAIN_HAS_SSP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   
> +# This boolean is true if the toolchain provides a full featured
> +# ucontext implementation with ucontext_t and {get,make,set}context
>   config BR2_TOOLCHAIN_HAS_UCONTEXT
>   	bool
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
