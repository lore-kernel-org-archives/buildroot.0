Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99452C021A3
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 426DD804C6;
	Sat, 14 Sep 2024 16:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w926qVHRHM7h; Sat, 14 Sep 2024 16:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363ED840E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363ED840E1;
	Sat, 14 Sep 2024 16:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF0B71BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD422408DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJgtLdcQ7DjR for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 799D3408DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799D3408DD
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 799D3408DD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:02:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so1307957f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726329731; x=1726934531;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FRndkSJ6S+nghMBCplfPRIdBTLuHp7g6PIyHIX6F6ME=;
 b=tY7DQpamDL+7Cbkh6Jd+AvzZypzdjv0+2gG2ZCbuptfIhekCzgrbXJlZaPxyDhHlGM
 AjcaZkZS8XhcM1zFznSGUk5g5pecJpPa9MpizIlLG2uAd8pbtnBL/q4gDrMW2ckXGoIH
 yfZ5N3/zgW5UpRhVN0LJldmuFK/0o68esRerKUBnG3wj0wEmuHelLw/o17P/Ha8X5zSs
 fx+K/FXS63Nd8ELUk5u8rTTc8FQLFMTKK+DIBDlM9n57LMhgaS8f/WSXx2ys0ugRgMcp
 9XrBFpwuB4mzAT0IdsLSMU3Gzd0OsnKTnzKyFYwNppbLzpkV8sZHAFiQYmaqhQFsE0Ox
 KgOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXokVcQw+cWQ+1nVk7UgcL+Jno7aPe93sOf69KQVs0L7zKKW5hQF2NCqNFymIt/Y41Ii17eVjTsD8=@buildroot.org
X-Gm-Message-State: AOJu0YwsHWCyALUfe68F7gz53F+J6xenHX99F+bBSAtQLbM8J+Zk5W3W
 sqRLdHjQfxLj+lcJhfboqSpnmUWzbQFnBbM/omPYcWO3JOx3ant6X++Oul2b0mN6TkDQTKlSAAs
 P+2Q5ww==
X-Google-Smtp-Source: AGHT+IEfbz7SCMuIv7KFvOwrBxg70oR14tVzuSWX0BbmoPopGPwapsPHSt0gOqI2d8Rv62qg362vtA==
X-Received: by 2002:a5d:64e9:0:b0:374:c122:e8b8 with SMTP id
 ffacd0b85a97d-378d61d5314mr4019289f8f.11.1726329731025; 
 Sat, 14 Sep 2024 09:02:11 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780031esm2163834f8f.84.2024.09.14.09.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 09:02:10 -0700 (PDT)
Message-ID: <15d03499-bfe8-4b53-bc24-af06ab9fb97a@mind.be>
Date: Sat, 14 Sep 2024 18:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20240817112203.3719873-1-peterlin@andestech.com>
Content-Language: en-GB
In-Reply-To: <20240817112203.3719873-1-peterlin@andestech.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726329731; x=1726934531; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRndkSJ6S+nghMBCplfPRIdBTLuHp7g6PIyHIX6F6ME=;
 b=P+LFGzTf15gMOxmcYxygUtxEAFsZDVohZUfzAVuWOuPM8P4NHPMhNot3TUnxgiycp1
 XF3dq8lqB4ZyUBpkJjkgVHPdiLrnCoNZJz47nXgB9DwnHX79vBi44cAwiJh2Fwl3DAbl
 tS4MfaygEjCe5Iwk7a94pTCWndjYDCqktxxqs1qv4sivjrgdaT8jny4MZInaNYDRnic3
 y7ZZYqAiVdkL0xHLao2yOEQgi6Al3ds1DY7fdekCAsBocUWpvJTYcvOROg8F9EcVR967
 zVnVkPfqNDyvdLAbq5yBDG7425IGGE65rXrI48MFMdWBp1R9MisPyPa6amIJn1ojl9wk
 KN8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P+LFGzTf
Subject: Re: [Buildroot] [PATCH] boot: optee-os: enable RISC-V (64-bit)
 architecture
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
Cc: tim609@andestech.com, alvinga@andestech.com,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/08/2024 13:22, Yu Chien Peter Lin via buildroot wrote:
> OP-TEE OS and TAs can run on RISC-V (64-bit) machines, so allow
> optee-os to be compiled for the new architecture.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

  Hi Peter,

  Applied to master, thanks. I made some changes, see below, please check if 
things are still OK!

> ---
>   boot/optee-os/Config.in   |  2 +-
>   boot/optee-os/optee-os.mk | 29 ++++++++++++++++++++++++-----
>   2 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 2f996cbafc..cc0044f00a 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_TARGET_OPTEE_OS
>   	bool "optee_os"
> -	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
> +	depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A || BR2_RISCV_64
>   	help
>   	  OP-TEE OS provides the secure world boot image and the trust
>   	  application development kit of the OP-TEE project. OP-TEE OS
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 6b04a0f5e1..d135de6dc7 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -44,26 +44,41 @@ ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_DTC),y)
>   OPTEE_OS_DEPENDENCIES += host-dtc
>   endif
>   
> +OPTEE_OS_MAKE_OPTS = \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	CROSS_COMPILE_core="$(TARGET_CROSS)" \
> +	PYTHON3="$(HOST_DIR)/bin/python3"
> +
> +ifeq ($(BR2_RISCV_64),y)
> +OPTEE_OS_MAKE_OPTS += CROSS_COMPILE_ta_rv64="$(TARGET_CROSS)"
> +else
>   # On 64bit targets, OP-TEE OS can be built in 32bit mode, or
>   # can be built in 64bit mode and support 32bit and 64bit
>   # trusted applications. Since buildroot currently references
>   # a single cross compiler, build exclusively in 32bit
>   # or 64bit mode.
> -OPTEE_OS_MAKE_OPTS = \
> -	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	CROSS_COMPILE_core="$(TARGET_CROSS)" \
> +OPTEE_OS_MAKE_OPTS += \
>   	CROSS_COMPILE_ta_arm64="$(TARGET_CROSS)" \
> -	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)" \
> -	PYTHON3="$(HOST_DIR)/bin/python3"
> +	CROSS_COMPILE_ta_arm32="$(TARGET_CROSS)"
> +endif

  I've removed this condition and reverted to the orginal situation, i.e. 
setting CROSS_COMPILE_* for all architecture irrespective of the one we actually 
use. I guess if it works for arm64/arm32, it will work for rv64 as well... I 
wasn't really able to test though so let us know if something went wrong there.


>   
> +ifeq ($(BR2_riscv),y)
> +OPTEE_OS_MAKE_OPTS += \
> +	ARCH=riscv \
> +	CFG_RV64_core=y \
> +	CFG_USER_TA_TARGETS=ta_rv64
> +else
>   ifeq ($(BR2_aarch64),y)
>   OPTEE_OS_MAKE_OPTS += \
> +	ARCH=aarch64 \

  This is in fact wrong, it should have been ARCH=arm.

  Regards,
  Arnout

>   	CFG_ARM64_core=y \
>   	CFG_USER_TA_TARGETS=ta_arm64
>   else
>   OPTEE_OS_MAKE_OPTS += \
> +	ARCH=arm \
>   	CFG_ARM32_core=y
>   endif
> +endif
>   
>   # Get mandatory PLAFORM and optional PLATFORM_FLAVOR and additional
>   # variables
> @@ -77,6 +92,10 @@ OPTEE_OS_MAKE_OPTS += $(call qstrip,$(BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES))
>   # root path otherwise the output directory path depends on the target
>   # platform name.
>   OPTEE_OS_BUILDDIR_OUT = out
> +ifeq ($(BR2_riscv),y)
> +OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_rv64
> +OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_rv64
> +endif
>   ifeq ($(BR2_aarch64),y)
>   OPTEE_OS_LOCAL_SDK = $(OPTEE_OS_BUILDDIR_OUT)/export-ta_arm64
>   OPTEE_OS_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
