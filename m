Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25099C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874B984BA6;
	Sat, 23 Jul 2022 14:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874B984BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpI5CkcbNxOH; Sat, 23 Jul 2022 14:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D761884BA3;
	Sat, 23 Jul 2022 14:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D761884BA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE5E1BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 234EB418CE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234EB418CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPwc8MuVn5wO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:32:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8105441706
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8105441706
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:32:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m17so9741585wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 07:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MSRUNj7rzeFpW4QCEqLB8uNrShZtnaO0TCILJ8XKXUY=;
 b=dpnrkVf278tuE3Iw7pH/5d7y9gmFmfRVBnkB4CJBaf6FJ7AKi50V74LX9L4wDqoPfp
 h9ufNDzUmxVgOB1HKVAEKaoyxUEMU0ZxZeRJ2KWOyNgQcfIfGwC2jnaxmp1JHxYvAIG5
 /AAp8ajrUjoDpXquMCqr6GRsUcfIUX2NwbJ+nm5y7HDthsiBrKva6M0tToYg9IKNqZ6a
 Tmr7IuVkNt+3mRpxnpZaxGFf+QwiSg6E1zDQuKEG/vnMvWiNZHnTEDFGjJHJbcXXgaWg
 q56BTNT4lh6AS2fznopVogILIMtUEY4GKHbgWoYBn+QWkOiTr6P0fXRwC/TfPs7cdyw6
 uU7g==
X-Gm-Message-State: AJIora+linPQYC4OyxJhKGDhzyHwr3fV9yOw+oBESyibHV6MdvPyBh1d
 lcRPbbSQtJFxSXjrSCTdusb/gg==
X-Google-Smtp-Source: AGRyM1vZf7PD3SUm/NPkAbynmCP9iKdJVUcfRkxj7PWhwNU0PLymp93tbLjv8l93LXBrXKTi20N5Rg==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id
 b9-20020adfd1c9000000b0020fc3dce980mr2894128wrd.552.1658586730126; 
 Sat, 23 Jul 2022 07:32:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i13-20020adff30d000000b0021e4982270asm7359143wro.13.2022.07.23.07.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 07:32:09 -0700 (PDT)
Message-ID: <eba6ca02-80f0-8baa-4627-6d1b2138c2a9@mind.be>
Date: Sat, 23 Jul 2022 16:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220720024531.435748-1-damien.lemoal@opensource.wdc.com>
 <20220720024531.435748-2-damien.lemoal@opensource.wdc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720024531.435748-2-damien.lemoal@opensource.wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MSRUNj7rzeFpW4QCEqLB8uNrShZtnaO0TCILJ8XKXUY=;
 b=JM7uhSbfV5Prt3z8V7iuYq4pQxcbxv8s+/tSDAcud966jqdQ5hzkP9yBDwILb5rgjS
 hDmCoAHd2u6JK/Zp61trTVEj6VpRdho1LhZCk1vce2/KMN8D/nWECJES8aXl9civ0Q3K
 mhbBRHQ/B9iACZWgl/0zycUT9PznvpjquuMocxOIIxd2uaggMghmo4yQ+anIekkYq1sp
 /fK9l0rdoCDIMH4zHQEHjxdev8znP66vGk0XAPXddeWJWsyx7FqcASLb4baOEwVmq2D3
 VfYW0BKu7rKSnDZH+RFxXAPHrFYpuRhq4ws03GxHdVyDgD7pf4JJnx5/stTh/zIXpxyM
 URzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JM7uhSbf
Subject: Re: [Buildroot] [PATCH v4 1/7] package/elf2flt: Remove
 Config.in.host
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 04:45, Damien Le Moal via buildroot wrote:
> There is no need to have configuration files direbtly set the
> BR2_PACKAGE_HOST_ELF2FLT option. The need for the elf2flt utility is
> automatically determined by gcc build in package/gcc/gcc.mk according to
> the BR2_BINFMT_FLAT option.
> 
> Accordingly, we can remove the file package/elf2flt/Config.in.host to
> get rid of the BR2_PACKAGE_HOST_ELF2FLT option. BR2_STRIP_strip
> dependency on this option is replaced with a dependency on
> BR2_BINFMT_ELF.
> 
> To stay consistent with the fact that elf2flt supports only the arm, sh,
> sparc, xtensa and riscv-64 architectures, a dependency on these
> architectures is added to the BR2_BINFMT_FLAT option in arch/Config.in.
> 
> Board configuration files setting the BR2_PACKAGE_HOST_ELF2FLT option
> are also updated.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>   Config.in                                 |  2 +-
>   arch/Config.in                            |  1 +
>   configs/qemu_riscv64_nommu_virt_defconfig |  1 -
>   configs/qemu_xtensa_lx60_nommu_defconfig  |  1 -
>   package/elf2flt/Config.in.host            | 13 -------------
>   toolchain/toolchain-buildroot/Config.in   |  1 -
>   6 files changed, 2 insertions(+), 17 deletions(-)
>   delete mode 100644 package/elf2flt/Config.in.host
> 
> diff --git a/Config.in b/Config.in
> index 52c3c4b4c8..af9052d32b 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -432,7 +432,7 @@ config BR2_ENABLE_RUNTIME_DEBUG
>   config BR2_STRIP_strip
>   	bool "strip target binaries"
>   	default y
> -	depends on !BR2_PACKAGE_HOST_ELF2FLT
> +	depends on BR2_BINFMT_ELF
>   	help
>   	  Binaries and libraries in the target filesystem will be
>   	  stripped using the normal 'strip' command. This allows to save
> diff --git a/arch/Config.in b/arch/Config.in
> index 366ce71f3a..26293d4986 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -384,6 +384,7 @@ config BR2_BINFMT_ELF
>   
>   config BR2_BINFMT_FLAT
>   	bool "FLAT"
> +	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
>   	depends on !BR2_USE_MMU

  In fact, there's a one-to-one mapping between BR2_USE_MMU and the ELF/FLAT 
choice, so we can also remove the choice and rely on BR2_USE_MMU exclusively.

  Anyway, applied to master, thanks.

  Regards,
  Arnout

>   	help
>   	  FLAT binary is a relatively simple and lightweight executable
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index bfee9e710a..33fad50a3c 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -6,7 +6,6 @@ BR2_RISCV_64=y
>   BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
>   
>   # Toolchain
> -BR2_PACKAGE_HOST_ELF2FLT=y
>   # BR2_USE_MMU is not set
>   
>   # Busybox with hush
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
> index 44fb81bd74..f107b7e73b 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -4,7 +4,6 @@ BR2_XTENSA_CUSTOM=y
>   BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
>   
>   # Toolchain
> -BR2_PACKAGE_HOST_ELF2FLT=y
>   # BR2_USE_MMU is not set
>   
>   # Use minimal busybox with hush and networking tools
> diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
> deleted file mode 100644
> index 2bab0095c2..0000000000
> --- a/package/elf2flt/Config.in.host
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -config BR2_PACKAGE_HOST_ELF2FLT
> -	bool "Enable elf2flt support?"
> -	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
> -	depends on !BR2_USE_MMU
> -	help
> -	  uCLinux uses a Binary Flat format commonly known as BFLT. It
> -	  is a relatively simple and lightweight executable format
> -	  based on the original a.out format.
> -
> -	  This option compiles the required tools and makes the required
> -	  modifications on your toolchain (linker).
> -
> -	  https://github.com/uclinux-dev/elf2flt
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 11566c27ff..56343daee7 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -89,5 +89,4 @@ source "package/uclibc/Config.in"
>   source "package/glibc/Config.in"
>   source "package/binutils/Config.in.host"
>   source "package/gcc/Config.in.host"
> -source "package/elf2flt/Config.in.host"
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
