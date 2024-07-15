Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87208C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 492F9400D8;
	Mon, 15 Jul 2024 14:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSLAJtzS-6ff; Mon, 15 Jul 2024 14:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F7040734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F7040734;
	Mon, 15 Jul 2024 14:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 661F91BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5295C80CBD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeT2r7cdcbJf for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6016F80CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6016F80CB8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6016F80CB8
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:34:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4266fd39527so32192075e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054066; x=1721658866;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sSMkDe7HzI/KQJSVMZyczA57sLUevftNcTb8gGRUig=;
 b=CESoehDO/bHC9xuY83MnmbXGKtPSb1V09KfaPO0muSFTL7O6NWvGYZj84crAjanaka
 OTRPTqBLN59Cvq+o/q8pj0xSLy+cmPJ/9riGc1ks1CQwQWF60oImJSdR7x6+Z4rbmKc4
 c7FYoilNeGfVMWVQKPA+X/z0XEFRSX4f5vF+v9Ertv+vDG0v5Dmd9CZbzMLkmxQ4ohae
 2bGfsP9tAdLWTAvV1D3pjtFNpZyPBHkhgEc7MfKtx+7Sw0SGrbWk8dQLd0FfX2gCll46
 3eu3zH4MH+KNruqpoXL5AMjfngAdf7Mbkfl2S2/eljB38evHxiLGvQcCF/dNqJxyiexM
 VjHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjvxmSoeWNA/jQw7zpH5eY6OTuyZD4vnIQ6a0dkz7eg5OE5INLvFv9KhVx5UNzXqYwKEaDI5kZ2lGcFz8/lSsJhoBACLajsw==
X-Gm-Message-State: AOJu0YybxGFrs80jLuEHzjrL+ECjYL3gVGNLw55h8aiiee80wplz87UU
 33p528OjlmhuTVJhgeG2aKGU7UZ0Usu0FcAUmW4w8XVG6kiytyxGZg5pnTdAqww=
X-Google-Smtp-Source: AGHT+IHgbJq3aDLjM3EBzqcSVoUx/hUEem9tZRgqK1cuHDqNjHakKJvm3Mk9GLeXmXckWKWW52xq6w==
X-Received: by 2002:a05:600c:2248:b0:426:61f6:2e38 with SMTP id
 5b1f17b1804b1-426708f1912mr122379125e9.35.1721054066200; 
 Mon, 15 Jul 2024 07:34:26 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm123993555e9.44.2024.07.15.07.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:34:25 -0700 (PDT)
Message-ID: <fc07c4f5-ef09-4018-b927-df092311889c@mind.be>
Date: Mon, 15 Jul 2024 16:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20240711092728.3083087-1-kory.maincent@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240711092728.3083087-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054066; x=1721658866; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0sSMkDe7HzI/KQJSVMZyczA57sLUevftNcTb8gGRUig=;
 b=Qsm85dsMzC/KIB8Xo9XFHPF2+NzzP7Rh58EZAI+tjOyd8xOTwHTrxS7Bz3lYEC8d+8
 bFWt244/AlPrsHPfoORyA5cdkcO06F6ZjjADZ/NAjWfDcvmay6Tj+lOvBFvlSvNF8k0P
 e8CKRRSSSRtfU8d4PRc3NFMPT2pfl+PjBZ7nc4cCN1bELUQjzkh8sf0EutV/gupo7WfN
 ZWVJxtWKlGpWrN1B0xNDcIZI63/wHbq/NSAKmRR52+lY651e+yhp5fklbX//o7UCoi7N
 Puv6IAAD7NDamQp1WdlzKxYZ3leABdleflbJDHBVYeaPwK+/FR01+iE9c55UDShxlWjq
 JQ3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qsm85dsM
Subject: Re: [Buildroot] [PATCH] boot/optee-os: Add support to build with
 host-cmake
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
Cc: thomas.petazzoni@bootlin.com,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Etienne, since Kory is on holidays, perhaps you can answer the question below?

On 11/07/2024 11:27, Kory Maincent via buildroot wrote:
> Some specific versions of OP-TEE need cmake on the host to build the scmi
> firmware, like the newly release STMicroelectronics 3.19.0-stm32mp-r2
> version.
> 
> To allow building such OP-TEE OS versions, this commit adds the option
> BR2_TARGET_OPTEE_OS_NEEDS_CMAKE which when enabled ensures that host-cmake
> is built before OP-TEE OS.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>   boot/optee-os/Config.in   | 6 ++++++
>   boot/optee-os/optee-os.mk | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 34ea993136..7870629732 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -91,6 +91,12 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
>   	  python-cryptography. Select this option if optee-os needs
>   	  python-cryptography to be built.
>   
> +config BR2_TARGET_OPTEE_OS_NEEDS_CMAKE
> +	bool "OP-TEE OS needs cmake"
> +	help
> +	  Select this option if your OP-TEE OS platform configuration
> +	  requires the cmake build system to be available.
> +
>   config BR2_TARGET_OPTEE_OS_CORE
>   	bool "Build core"
>   	default y
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 33b4e2e1ab..8fa5c824da 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -30,6 +30,10 @@ endif
>   
>   OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
>   
> +ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_CMAKE),y)
> +OPTEE_OS_DEPENDENCIES += host-cmake

  This should be $(BR2_CMAKE_HOST_DEPENDENCY). I fixed that.

  You should also check what the minimum CMake version is, and if it's higher 
than 3.18, select the corresponding BR2_HOST_CMAKE_AT_LEAST_X_Y. Etienne?


  Applied to master, thanks.

  Regards,
  Arnout


> +endif
> +
>   ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
>   OPTEE_OS_DEPENDENCIES += host-python-cryptography
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
