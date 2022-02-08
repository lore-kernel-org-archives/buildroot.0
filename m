Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BDAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A0D40176;
	Tue,  8 Feb 2022 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fIq0g5om5F1; Tue,  8 Feb 2022 20:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F4E24018A;
	Tue,  8 Feb 2022 20:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91EC91BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F963409BA
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoFpWDBwTA01 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51B4E408F9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:25:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id yw18so174094ejb.3
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1F1AqquVnsr5YL6DRrlE4Lz1Ct5WrnDFNsGWSsL/B8M=;
 b=AKbjwuUiuQh/xrlhGttMfsR0PY1C6h7cjqeeMxscY3VUyAgtP5/43v09mNZHb/nvpj
 41iYKBCdzuH6Rt5y8nwBgY8q/rOE/SvAMgldJEFpb1l6T0vX7A69RN4wzKqHE4b790zw
 ousVnjKTSJbsiFWcEZiy5K7KEFEj1JUYeLi9JC04pNrswhzZm9BdLcGI9rl63qq+loLg
 q1oX8WeTKAIpGgFLOfTueK9/HbCisLxegRVJTixc2RZON/tNcnivEyGxuLZlNRN76qh8
 FbeYLToTyPBFsuoJQPy9dLof0Y0+7s+9uOGcl3ObWKgPONghN0zzT9ffRc6HopaiOOsm
 iTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1F1AqquVnsr5YL6DRrlE4Lz1Ct5WrnDFNsGWSsL/B8M=;
 b=8IJ+eHuehsptFzl8BIXF5XnaWNn0M6vdmy/hdi9ovwQR85+9PiqOa1IORiqWbfAjS7
 +SI+kBtSXIYX0b8wZL+XiIzuWsjcQlWL+pOENpJoNuMySXHqFZt1frDyA7ppSHK/BpbX
 bk9NSB4hFHNO1cJ8V4btedhYxYiURWc4DwA3Lg0x2nerNaYnWc9wp7/hYs4OBQjCbGli
 DM6djgbjiud6FUGDArBqM8Nplc5hw748FReUrl3EFP2prS2Kx/c+kjrqcxvjSotZ/HCG
 BrG853hLYxRweNrhIJC6UCdVARG9vl6UlN5E2WiXR7HN8YYilKiIU1h8+fWcYPfI+gSu
 odGg==
X-Gm-Message-State: AOAM530C3MxsjUTBeh4tmKxU0v5ps63tAot6zRgG8UFzzXz3KDGIPgjI
 Iw+Zhm8xfg3Gfux6xStbI70tsQ==
X-Google-Smtp-Source: ABdhPJyF1absp/8ismrKwN8EZ77o/BjUkOBPV1HJLrK4BxbGHSGsJnoVyASxilOClHnN7rbkMTSSng==
X-Received: by 2002:a17:907:da6:: with SMTP id
 go38mr5272052ejc.124.1644351926016; 
 Tue, 08 Feb 2022 12:25:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i12sm5181296ejj.198.2022.02.08.12.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:25:25 -0800 (PST)
Message-ID: <cdc45fa5-d794-e3f8-3a54-793778ab8cc0@mind.be>
Date: Tue, 8 Feb 2022 21:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-2-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115200306.14037-2-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 1/7] arch: move definition of KERNEL_ARCH
 to Config.in.<arch> files
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>, Guo Ren <ren_guo@c-sky.com>,
 Mark Corbin <mark@dibsco.co.uk>, Alexander Egorenkov <egorenar@linux.ibm.com>,
 Nylon Chen <nylon7@andestech.com>, Jonathan Ben Avraham <yba@tkos.co.il>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Spenser Gilliland <spenser@gillilanding.com>, romain.naour@gmail.com,
 Cyril Bur <cyrilbur@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 21:02, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Similar to other arch-specific strings, the 'KERNEL_ARCH' variable can be
> determined from Config.in.<arch> files.
> 
> Besides aligning with similar strings, this also means simplification: the
> big 'sed' covers several architectures not even supported by Buildroot.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
>   Makefile                  | 17 +----------------
>   arch/Config.in            |  3 +++
>   arch/Config.in.arc        |  3 +++
>   arch/Config.in.arm        |  4 ++++
>   arch/Config.in.csky       |  3 +++
>   arch/Config.in.m68k       |  3 +++
>   arch/Config.in.microblaze |  3 +++
>   arch/Config.in.mips       |  3 +++
>   arch/Config.in.nds32      |  3 +++
>   arch/Config.in.nios2      |  3 +++
>   arch/Config.in.or1k       |  3 +++
>   arch/Config.in.powerpc    |  3 +++
>   arch/Config.in.riscv      |  3 +++
>   arch/Config.in.s390x      |  3 +++
>   arch/Config.in.sh         |  3 +++
>   arch/Config.in.sparc      |  4 ++++
>   arch/Config.in.x86        |  4 ++++
>   arch/Config.in.xtensa     |  3 +++
>   18 files changed, 55 insertions(+), 16 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5fc7137e5a..e012d121b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -437,22 +437,7 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
>   
>   # Strip off the annoying quoting
>   ARCH := $(call qstrip,$(BR2_ARCH))
> -
> -KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
> -	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
> -	-e s/arcle/arc/ \
> -	-e s/arceb/arc/ \
> -	-e s/arm.*/arm/ -e s/sa110/arm/ \
> -	-e s/aarch64.*/arm64/ \
> -	-e s/nds32.*/nds32/ \
> -	-e s/or1k/openrisc/ \
> -	-e s/parisc64/parisc/ \
> -	-e s/powerpc64.*/powerpc/ \
> -	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
> -	-e s/riscv.*/riscv/ \
> -	-e s/sh.*/sh/ \
> -	-e s/s390x/s390/ \
> -	-e s/microblazeel/microblaze/)
> +KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
>   
>   ZCAT := $(call qstrip,$(BR2_ZCAT))
>   BZCAT := $(call qstrip,$(BR2_BZCAT))
> diff --git a/arch/Config.in b/arch/Config.in
> index c99af89efa..edf337f13e 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -328,6 +328,9 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_11
>   config BR2_ARCH
>   	string
>   
> +config BR2_KERNEL_ARCH
> +	string
> +
>   config BR2_ENDIAN
>   	string
>   
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index f7a6d920b5..cc55c9e68f 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -62,6 +62,9 @@ config BR2_ARCH
>   	default "arc"	if BR2_arcle
>   	default "arceb"	if BR2_arceb
>   
> +config BR2_KERNEL_ARCH
> +	default "arc"
> +
>   config BR2_arc
>   	bool
>   	default y if BR2_arcle || BR2_arceb
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 4c0910e4f8..0f50512fad 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -822,6 +822,10 @@ config BR2_ARCH
>   	default "aarch64"	if BR2_aarch64
>   	default "aarch64_be"	if BR2_aarch64_be
>   
> +config BR2_KERNEL_ARCH
> +	default "arm"		if BR2_arm || BR2_armeb
> +	default "arm64"		if BR2_aarch64 || BR2_aarch64_be
> +
>   config BR2_ENDIAN
>   	default "LITTLE" if (BR2_arm || BR2_aarch64)
>   	default "BIG"	 if (BR2_armeb || BR2_aarch64_be)
> diff --git a/arch/Config.in.csky b/arch/Config.in.csky
> index 7e2029f759..df9e7ab75b 100644
> --- a/arch/Config.in.csky
> +++ b/arch/Config.in.csky
> @@ -39,6 +39,9 @@ config BR2_GCC_TARGET_FLOAT_ABI
>   config BR2_ARCH
>   	default "csky"
>   
> +config BR2_KERNEL_ARCH
> +	default "csky"
> +
>   config BR2_ENDIAN
>   	default "LITTLE"
>   
> diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
> index 275f47f1d3..7f3aec7232 100644
> --- a/arch/Config.in.m68k
> +++ b/arch/Config.in.m68k
> @@ -1,6 +1,9 @@
>   config BR2_ARCH
>   	default "m68k"		if BR2_m68k
>   
> +config BR2_KERNEL_ARCH
> +	default "m68k"
> +
>   config BR2_ENDIAN
>   	default "BIG"
>   
> diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
> index 5fe2906d40..52aa252a2c 100644
> --- a/arch/Config.in.microblaze
> +++ b/arch/Config.in.microblaze
> @@ -2,6 +2,9 @@ config BR2_ARCH
>   	default "microblazeel"  if BR2_microblazeel
>   	default "microblaze"    if BR2_microblazebe
>   
> +config BR2_KERNEL_ARCH
> +	default "microblaze"
> +
>   config BR2_ENDIAN
>   	default "LITTLE" if BR2_microblazeel
>   	default "BIG"	 if BR2_microblazebe
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 619456c2d5..b4923f8484 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -235,6 +235,9 @@ config BR2_ARCH
>   	default "mips64"	if BR2_mips64
>   	default "mips64el"	if BR2_mips64el
>   
> +config BR2_KERNEL_ARCH
> +	default "mips"
> +
>   config BR2_ENDIAN
>   	default "LITTLE"	if BR2_mipsel || BR2_mips64el
>   	default "BIG"		if BR2_mips || BR2_mips64
> diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
> index 322ff49f2e..61fc346260 100644
> --- a/arch/Config.in.nds32
> +++ b/arch/Config.in.nds32
> @@ -1,6 +1,9 @@
>   config BR2_ARCH
>   	default "nds32le"
>   
> +config BR2_KERNEL_ARCH
> +	default "nds32"
> +
>   config BR2_GCC_TARGET_ARCH
>   	default "v3"
>   
> diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
> index aae435fa17..c77b1a1c59 100644
> --- a/arch/Config.in.nios2
> +++ b/arch/Config.in.nios2
> @@ -1,6 +1,9 @@
>   config BR2_ARCH
>   	default "nios2"
>   
> +config BR2_KERNEL_ARCH
> +	default "nios2"
> +
>   config BR2_ENDIAN
>   	default "LITTLE"
>   
> diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
> index abdf498fb8..ef1bded453 100644
> --- a/arch/Config.in.or1k
> +++ b/arch/Config.in.or1k
> @@ -1,6 +1,9 @@
>   config BR2_ARCH
>   	default "or1k"
>   
> +config BR2_KERNEL_ARCH
> +	default "openrisc"
> +
>   config BR2_ENDIAN
>   	default "BIG"
>   
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index ba56c9c721..33b2471cf9 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -157,6 +157,9 @@ config BR2_ARCH
>   	default "powerpc64"	if BR2_powerpc64
>   	default "powerpc64le"	if BR2_powerpc64le
>   
> +config BR2_KERNEL_ARCH
> +	default "powerpc"
> +
>   config BR2_ENDIAN
>   	default "BIG"    if BR2_powerpc || BR2_powerpc64
>   	default "LITTLE" if BR2_powerpc64le
> diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
> index e6436d7c39..1a008a935d 100644
> --- a/arch/Config.in.riscv
> +++ b/arch/Config.in.riscv
> @@ -118,6 +118,9 @@ config BR2_ARCH
>   	default "riscv32" if !BR2_ARCH_IS_64
>   	default "riscv64" if BR2_ARCH_IS_64
>   
> +config BR2_KERNEL_ARCH
> +	default "riscv"
> +
>   config BR2_ENDIAN
>   	default "LITTLE"
>   
> diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
> index ad866b421e..bf4b70f957 100644
> --- a/arch/Config.in.s390x
> +++ b/arch/Config.in.s390x
> @@ -17,6 +17,9 @@ endchoice
>   config BR2_ARCH
>   	default "s390x"	if BR2_s390x
>   
> +config BR2_KERNEL_ARCH
> +	default "s390"
> +
>   config BR2_ENDIAN
>   	default "BIG"
>   
> diff --git a/arch/Config.in.sh b/arch/Config.in.sh
> index b5cce18e22..fde42dfce2 100644
> --- a/arch/Config.in.sh
> +++ b/arch/Config.in.sh
> @@ -24,6 +24,9 @@ config BR2_ARCH
>   	default "sh4a"		if BR2_sh4a
>   	default "sh4aeb"	if BR2_sh4aeb
>   
> +config BR2_KERNEL_ARCH
> +	default "sh"
> +
>   config BR2_ENDIAN
>   	default "LITTLE"	if BR2_sh4 || BR2_sh4a
>   	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
> diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
> index 4c4dc61745..b91df6892b 100644
> --- a/arch/Config.in.sparc
> +++ b/arch/Config.in.sparc
> @@ -21,6 +21,10 @@ config BR2_ARCH
>   	default "sparc"	if BR2_sparc
>   	default "sparc64" if BR2_sparc64
>   
> +config BR2_KERNEL_ARCH
> +	default "sparc"	if BR2_sparc
> +	default "sparc64" if BR2_sparc64
> +
>   config BR2_ENDIAN
>   	default "BIG"
>   
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 0ba9ecbcea..b38d0f8106 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -337,6 +337,10 @@ config BR2_ARCH
>   	default "i686"		if BR2_x86_athlon_4
>   	default "x86_64"	if BR2_x86_64
>   
> +config BR2_KERNEL_ARCH
> +	default "i386"		if !BR2_x86_64
> +	default "x86_64"	if BR2_x86_64
> +
>   config BR2_ENDIAN
>   	default "LITTLE"
>   
> diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
> index a79d906985..acc340eca6 100644
> --- a/arch/Config.in.xtensa
> +++ b/arch/Config.in.xtensa
> @@ -48,6 +48,9 @@ config BR2_ENDIAN
>   config BR2_ARCH
>   	default "xtensa"	if BR2_xtensa
>   
> +config BR2_KERNEL_ARCH
> +	default "xtensa"
> +
>   config BR2_READELF_ARCH_NAME
>   	default "Tensilica Xtensa Processor"
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
