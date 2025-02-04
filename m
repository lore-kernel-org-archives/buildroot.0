Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8070AC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375F380E26;
	Tue,  4 Feb 2025 15:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXF13nLw4tJG; Tue,  4 Feb 2025 15:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385F580E6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 385F580E6D;
	Tue,  4 Feb 2025 15:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CCC12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96384606C1
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYZnCDw9DyCC for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:30:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71FE760608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71FE760608
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71FE760608
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:30:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43626213fffso42032685e9.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738683048; x=1739287848;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VzvSlLyBdGFZnffd1ZWlyJ+pK3QnvwUw36jp0dglWjI=;
 b=Uaf86UdNJkOi0gQFIxYxlrqieaGADF2S9Osr11cRZeYCVj78e3BLFSLbemt3feJqQe
 FxmgViK4G7Uja+kScUi6xgyfJu0/laH2syQZwr3Aab/hMLWtndAgpAtLJwzBhOmljQ0X
 vTLwPRKSUqByTSbHCHjVQTng1YyNHU7h0Tv9r41kejREOItHasocsrmxhC/frkrGhv30
 Cp3a/0IGrPYdUISLkEGxBr1pIue89nd0L+r7GjUXVhwmmk4ohSr0hnLatv3Y4ELkHOfC
 U2Ma19lvK8sbVDqYg/rSXGL39YuGqzo6zOub3PXTi3FtbLIpgo46NbMSsDMVh1HPU+7Z
 V1gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOmEH0Jfu7g1U8sRtNCz2zSQfisF3ZWC/SH5X/30N1Uu7KaAOGMZjriyYMfWAUWjc15lYTxVYGmn8=@buildroot.org
X-Gm-Message-State: AOJu0YyD10gRvh7HHYFEm5xfjgCREALkBnfkrjoBnXOcIphKQE8IIU+J
 8Gd0azv4VPkUNLjA+EjGy4UNk9SfHkWyt6Nf0odXauDot897zw/OKQcA9YNJtKEigsD2lnYUWPU
 s
X-Gm-Gg: ASbGnct43yVI667c1fnpNEpCyGFOP+P32aYQVpMN1SAyEuZVU4LizKkDmf+Qbf4HsyO
 CWyPZJTlP512SGAo9AMpDRA8VEEjgmPunPF4RMO8E+/qQSd6w7zoBEI7ZpR7h8GCv3A7bpnhKzy
 e5V8W2vNd9TBdqY6IHhxS8VVntOsNxZI05ggTAKnCWV0iE1gObigR1bE7yVhSJVrTN3VvmADCiB
 6d8O/OpGSOK/arXwge1tnhpjWsBJE4oXUQyhRORolp8K08l/gbm5YpuUm7ityNqXdjHoyUUn/r/
 enmuyCmvJkRpescYOmfKB2sfqSOfX2MBZbSkAnfaRv9AfDc=
X-Google-Smtp-Source: AGHT+IFFaYsSeRztmkiVm5ecdMP4BrBW0tQiUu6Dcv8J+Zn5mFQaG1h8s27l3VupMhiJEALjGNF1Cg==
X-Received: by 2002:a05:600c:2114:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-43905f8a6c0mr29583395e9.13.1738683048353; 
 Tue, 04 Feb 2025 07:30:48 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6dfb5sm234430565e9.31.2025.02.04.07.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:30:47 -0800 (PST)
Message-ID: <c40b97c4-f75e-434c-abaa-aae9e359e38e@mind.be>
Date: Tue, 4 Feb 2025 16:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriele Besta <buildroot@bgdev.it>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250203172451.760-1-buildroot@bgdev.it>
Content-Language: en-GB
In-Reply-To: <20250203172451.760-1-buildroot@bgdev.it>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738683048; x=1739287848; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VzvSlLyBdGFZnffd1ZWlyJ+pK3QnvwUw36jp0dglWjI=;
 b=TcWKonWaqal15iIV71DqO7FKGjof+fNK23Gd/7WMwxSy5YfuH/La8pgAdVVzthH+ns
 hKU8+zKFiZeSg6tNz6yeonPrzNF3kGhicjuNpveSc3taH5EIjfHsLFreh1ogzgmmRsUR
 qdBYF2wC9wP7viSt1CpGrLBrNiVCMn9Ctnh4h5JYj245asWsD7E8yzRzVGNpX6DdZrTH
 HyeE53tNXI5LGlIr2gTI2mknWIdlmaLi3EQ8YapmGBEGpbi9Jk0k5mXK6LRc2KTHmOCc
 vI/8NuuTdyVlGP0GMoxy7vkNTuxhKUK0HXbORrJLqlKya7/6aRSPqxe4mOobvc0+glAZ
 0r1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TcWKonWa
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: add toolchain
 for AArch64 host architecture
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/02/2025 18:24, Gabriele Besta wrote:
> Enabling AArch64 as a host architecture for AArch64 build.
> 
> Signed-off-by: Gabriele Besta <buildroot@bgdev.it>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../toolchain-external/toolchain-external-arm-aarch64/Config.in | 2 +-
>   .../toolchain-external-arm-aarch64.hash                         | 2 ++
>   .../toolchain-external-arm-aarch64.mk                           | 2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> index 309994d014..8582fe0ec8 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
>   	bool "Arm AArch64 14.2.rel1"
>   	depends on BR2_aarch64
> -	depends on BR2_HOSTARCH = "x86_64"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
>   	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>   	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>   	select BR2_TOOLCHAIN_HAS_SSP
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> index ed80511f7f..3f9c9cea71 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> @@ -1,2 +1,4 @@
>   # From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
>   sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
> +sha256  299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096  arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> index 7f9c97c5e5..cbc923bee5 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
> @@ -7,6 +7,6 @@
>   TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
>   TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
>   
> -TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
> +TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-$(HOSTARCH)-aarch64-none-linux-gnu.tar.xz
>   
>   $(eval $(toolchain-external-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
