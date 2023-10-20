Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D14CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B8D704E7;
	Fri, 20 Oct 2023 10:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B8D704E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dm_d1_5I6Dw; Fri, 20 Oct 2023 10:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4797704E2;
	Fri, 20 Oct 2023 10:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4797704E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35D01BF3C1
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 10:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA81842D28
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 10:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA81842D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNJRIsKrt7xi for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 10:07:22 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BFFA4ECBF
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 10:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFFA4ECBF
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso890431a12.1
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 03:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697796440; x=1698401240;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P0C9NEO47Zo/Q+/9dwGXXcd+yQmH4jjNma+j6zP8lJs=;
 b=RPxMRz92jgV0CC2UZB05pEc7iFMtmJzbctGCJL8uYQRaQZ/UtvCJoDPY0yNw8fXRld
 +W9rYfdUf/vTIztNIdXCLDPmXzvqCOopa64VR8rFxTilhBzjstHg5woj9CFJemI3Mrby
 2q2+P8q/ylcqgO4jiiH7EHmbp8Fb4eHB+6Tfq8W8D5BGU0PCi5oD62Uhey7XKQfrOpzJ
 3tDAxjdYa58n4nZjeVIdB5dFoqEVXlXFbU0f3DVhjMt8dAh6C5MZDwchSKqCMPfUlPZn
 FxSymrhMXjjoqhlLI3iWM/kmQYzHSlYtt3EMP4HDG3IAuq8gV6rxnTol0WaPrKQ2V4RI
 ozmw==
X-Gm-Message-State: AOJu0YyVHSxf43AAWEKVCZfs0cb4MxZhrgZxqIWUVV9tZfkmbA1rHB1s
 03re1xZWVTvq3bLmxr62Q+SSft6ofJWC9EJHy8s=
X-Google-Smtp-Source: AGHT+IHWW0/YEgrJm2O+kZw18ZwcPpMbnj2sk3sWADB8znRvgyGU29G4fvgC9nGPTL4W3FvvmHinBw==
X-Received: by 2002:a17:907:944e:b0:9bf:2bf:65f3 with SMTP id
 dl14-20020a170907944e00b009bf02bf65f3mr1003840ejc.7.1697796439883; 
 Fri, 20 Oct 2023 03:07:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r21-20020aa7cfd5000000b0053e07fe8d98sm1136423edy.79.2023.10.20.03.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 03:07:19 -0700 (PDT)
Message-ID: <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
Date: Fri, 20 Oct 2023 12:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20230817230844.450092-1-romain.naour@gmail.com>
 <20230817230844.450092-4-romain.naour@gmail.com>
In-Reply-To: <20230817230844.450092-4-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697796440; x=1698401240; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P0C9NEO47Zo/Q+/9dwGXXcd+yQmH4jjNma+j6zP8lJs=;
 b=RHQLsd/hEMHYY8Q5WmeC3y/JKxnXT6a1YBIPvA8EGhV6FWY9JfZ9puyeoToztYPoGv
 c01BXIEg5xex6F5qcSAMw1XTaxd0+D9+tTkWGB8CmonIqJW/JBI7DHU3TZ7F82Hi2dO6
 PdUz87q1YgWCYFgPtf7MlgtuEYLKI0N9Zy7qYBKX0wJvNFw+d8M8XA2AtWTHEsct3Bui
 x87JXMROVgw1z6TnHF3p1uqzJxE7mO6E/1ZLVdO20mbZsEDkRd6Fh/mp2nJlCiC/4GsJ
 j3a+X1FL9DLpnJeT5Yxx/UhglckWLfxOvLKQgZaklXWU3EpiCAz5IQep6uqAyv8ekjb5
 3DaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RHQLsd/h
Subject: Re: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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
Cc: Marleen Vos <marleen.vos@mind.be>, Dario Binacchi <dariobin@libero.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Romain,

On 18/08/2023 01:08, Romain Naour wrote:
> This new binutils version break the ATF build due to new linker warnings:
> 
>   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> 
>  From [1]
> "Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
>   of a new warning when linking the bl*.elf in the form:
> 
>   ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
>   ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
>   ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> 
> These new warnings are enbaled by default to secure elf binaries:
>    - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
>    - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> "
> 
> Bump the ATF custom version to 2.9 for binutils 2.39+ support.

  Did you test this on the board? I now have an avenger96 board (*) thanks to 
Embedded Recipes, and I did a quick test of this defconfig and it gives an error 
in TF-A...

  Dario, Peter, I believe both of you also had an avenger96 board, did you test 
it recently?


  Regards,
  Arnout

(*) Actually I no longer have it, I gave it to my colleague Marleen (in Cc)

> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436283
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>   configs/avenger96_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index 1f8e7a50d1..adfd7585c4 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
