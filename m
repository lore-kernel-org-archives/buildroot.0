Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F53C19F28
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 17:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 467344097E;
	Tue,  2 Aug 2022 17:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 467344097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAk5cAWqX7fW; Tue,  2 Aug 2022 17:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2897840919;
	Tue,  2 Aug 2022 17:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2897840919
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B444C1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D62B40281
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D62B40281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GH2n-OXj82bp for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 17:28:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F261A4025E
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F261A4025E
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 17:28:11 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m8so18458562edd.9
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 10:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hFrq7jYo0EqWYdatKGvJjs3ieBavwBr1c4IrhORfCmM=;
 b=rtjgd2BhGm/gI46TszUnJKU1nnAvmA7BwAt53KS/rnz8iujtQukJq17+n/YJlMVNTk
 LYgWMltIi3Z8LIzROs28Sd9IZSfeW06zt44BEVSeFHXrtMdOeTWlMz0nhGPcgMyZVLt+
 YbN4EfWtJ9Orflm701gaZ6OCdtTmYrAVj+8h+jx22BL0QpovJP7iCfDBUM1cDFleQdqv
 RUjZBUXTMzOFt+iyrNyUGttQ5zK6trUM57UsVrcOEpiiG1k04LZw6QD+OxL+/n3tfePS
 3OjfTk5XowAwTE/zycZJ2vfvlLVtA0gP02pjOpdvBbLb+I9VHSaKtUKHyOd7yYGU3ltZ
 bHxw==
X-Gm-Message-State: ACgBeo2KzubSTCJ9H26z+et1/jIqG9y46ZtOVxEWBMDKqpjFPXDaDv0F
 3YdYDygKePnV6c90Sx3SUIfKqw==
X-Google-Smtp-Source: AA6agR5R8F2Xp7nbVGj8z5XVplmdIOp55NKkxS9Mvhmlaa5Ip6Cn2kYCCG16B8QUxuSj3u7NzT377Q==
X-Received: by 2002:a05:6402:23a1:b0:43d:9477:4d57 with SMTP id
 j33-20020a05640223a100b0043d94774d57mr11990226eda.168.1659461290072; 
 Tue, 02 Aug 2022 10:28:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a170906395400b0073095265adesm1769769eje.165.2022.08.02.10.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 10:28:09 -0700 (PDT)
Message-ID: <0d5ef050-8eee-f1a2-724d-14fe46f45623@mind.be>
Date: Tue, 2 Aug 2022 19:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>, buildroot@buildroot.org
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
 <20220802133009.1282520-3-Ben.Wolsieffer@hefring.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220802133009.1282520-3-Ben.Wolsieffer@hefring.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hFrq7jYo0EqWYdatKGvJjs3ieBavwBr1c4IrhORfCmM=;
 b=OnT/b/r6TBYvCfJcLt35GWzka05cYMyNNnw6OMovZD/Fe1Q+H8MQdeB0/AY9oBex1p
 C8RZmsd6Ow66j7XchbJrtQ2FIgW+78RZKvwEHEerl5vqA9xauFmy/6txBSC6sF47Vej6
 DA8+mOzFetDLNknc8uozYP1Lhsp0BzrXfeaRK7aZif6F+5cjyjRbJnCrrsLCnOhTNj6y
 9suGlnmHtu43uUHYyB5UGbrSApTVdex3OurPlhcvyEmWG19vMcs/nDkaxGy4CjcggwTd
 nx8S8HoZKajaLi1i+gobn3O4xhFS08RQ6v+wopnReMhAHcBsoYQZB68Ls0dEUAso+TrJ
 V5aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OnT/b/r6
Subject: Re: [Buildroot] [PATCH 2/2] arch/arm: add support for FDPIC
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/08/2022 15:30, Ben Wolsieffer wrote:
> Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
> This patch enables support for building a toolchain that produces FDPIC
> binaries.
> 
> Unfortunately, the target name for an FDPIC toolchain is a bit
> idiosyncratic and must be arm-<vendor>-uclinuxfdpiceabi. This requires a
> few special cases in the target construction code, since there is no
> separate TARGET_OS field.
> 
> According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
> possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
> available on all ARM platforms, not just no-MMU.
> 
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> ---
>   arch/Config.in      |  1 +
>   package/Makefile.in | 30 +++++++++++++++++++++---------
>   2 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index c5d481b9e5..8dab58cf04 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -39,6 +39,7 @@ config BR2_arceb
>   
>   config BR2_arm
>   	bool "ARM (little endian)"
> +	select BR2_ARCH_HAS_FDPIC_SUPPORT
>   	# MMU support is set by the subarchitecture file, arch/Config.in.arm
>   	help
>   	  ARM is a 32-bit reduced instruction set computer (RISC)
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ff60f85092..d75f620d82 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -36,18 +36,21 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>   	It might be confused with the native toolchain)
>   endif
>   
> -# Compute GNU_TARGET_NAME
> -GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> -
>   # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
>   # the regular linux name.
>   ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
>   TARGET_OS = uclinux
> +# FDPIC binary format requires no OS field in target
> +else ifeq ($(BR2_BINFMT_FDPIC),y)
> +TARGET_OS =
>   else
>   TARGET_OS = linux
>   endif
>   
> -ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +# FDPIC suffix must be -uclinuxfdpiceabi
> +ifeq ($(BR2_BINFMT_FDPIC),y)
> +LIBC = uclinux
> +else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>   LIBC = uclibc
>   else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>   LIBC = musl
> @@ -59,12 +62,14 @@ else
>   $(error No C library enabled, this is not possible.)
>   endif
>   
> -# The ABI suffix is a bit special on ARM, as it needs to be
> -# -uclibcgnueabi for uClibc EABI, and -gnueabi for glibc EABI.
> -# This means that the LIBC and ABI aren't strictly orthogonal,
> -# which explains why we need the test on LIBC below.
> +# The ABI suffix is a bit special on ARM, as it needs to be -uclibcgnueabi
> +# for uClibc EABI, -gnueabi for glibc EABI and -uclinuxfdpiceabi if FDPIC is
> +# used. This means that the LIBC and ABI aren't strictly orthogonal, which
> +# explains why we need the test on LIBC below.
>   ifeq ($(BR2_arm)$(BR2_armeb),y)
> -ifeq ($(LIBC),uclibc)
> +ifeq ($(BR2_BINFMT_FDPIC),y)
> +ABI = fdpiceabi
> +else ifeq ($(LIBC),uclibc)
>   ABI = gnueabi
>   else
>   ABI = eabi
> @@ -90,6 +95,13 @@ TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
>   endif
>   endif
>   
> +# Compute GNU_TARGET_NAME
> +ifeq ($(TARGET_OS),)
> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(LIBC)$(ABI)
> +else
> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +endif

  I think all the special-casing for TARGET_OS, LIBC and ABI are way too 
complicated. None of these are used anywhere else (except LIBC which is also 
used in rust.mk - but Rust won't support FDPIC ever I think). So I think you 
should just put the special-casing here in GNU_TARGET_NAME itself:

# The tuple for FDPIC on ARM is very special: it doesn't have the OS part, and
# it must end with -uclinuxfdpiceabi
ifeq ($(BR2_BINFMT_FDPIC),y)
GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
else
GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
endif

  If we ever add other architectures with FDPIC (RISC-V is a likely candidate), 
we may revisit that again, but for now this is sufficient.

  Regards,
  Arnout

> +
>   # Use longcalls option for Xtensa globally.
>   # The 'longcalls' option allows calls across a greater range of addresses,
>   # and is required for some packages. While this option can degrade both
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
