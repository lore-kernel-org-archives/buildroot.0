Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC2CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E71FA412B3;
	Fri, 12 Jul 2024 09:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YXTvc2N7ySq; Fri, 12 Jul 2024 09:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 788CB412B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 788CB412B7;
	Fri, 12 Jul 2024 09:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2432C1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DD098460A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjDP_8Bz21L1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFE2F84577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE2F84577
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFE2F84577
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:06:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso8948425e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 02:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720775205; x=1721380005;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6Ka/YYVTVTTg0swwAsw18SokweEy04uys0nIV91tzw=;
 b=w8uxiRDVZ1glSGmu8m/lTO7hdUoKh837HzV1+gBBNgJRyCchWXDq6tMG0IH4qpuXVm
 9RvjuVki/cO4eRcWntN5YPz5dKp/tRAHv/6/K+Jmj/un2Nff1WxXIxcXQDmBqMJqhnuW
 4n7KN3krI7N3Y7yxsJSAtIcouplyv/QjAZUBvGKqwZ8qFfMstvNV3xnQBzYKkk/WPGqG
 MQD9yolnA1Q6SsnCHEoRpIluPjmr5VqP6qKaTByD+cL40v5ZKFxPIlgxq7BG7u+y57OC
 JPWULz7bWCgyX6ZNrJJClVj+g+tb9mNFFjoQlu8gYTOeEhqE3CLbHvS4MFovOGiVKEZU
 T4Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq5UNZ+WeceaRAnyCX+fAg3ccec+5bm1EoiTr0aY/FwxI6DGmDoBbI0SXF/kRXDjfvW0qzwU03KB3Dm2mQVpx40R0MJFvZGw==
X-Gm-Message-State: AOJu0YxH12bDJOFrXg1vu1G0t99Ev3MhG7F6WYQU8s/unTNOcSEQ+srQ
 +42xiMnQBtMyVMUkzvk4dM+QnwN1CZw54XT1zPe7jTIcG/TBU3MX/qOYnBfbWvo=
X-Google-Smtp-Source: AGHT+IEkJzfZ0p62AVSbaHGkc6fK/IqM46rvpeu/xSLM5kA1e+DcwGvf7tEHlnY1NHMB+0hCol0Jbg==
X-Received: by 2002:a05:600c:4d0d:b0:426:6326:4cec with SMTP id
 5b1f17b1804b1-426707f90d0mr72357005e9.29.1720775204665; 
 Fri, 12 Jul 2024 02:06:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f264875sm15983815e9.11.2024.07.12.02.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 02:06:44 -0700 (PDT)
Message-ID: <45610001-5454-4cab-bb53-5914984d8053@mind.be>
Date: Fri, 12 Jul 2024 11:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20230804085118.315117-1-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230804085118.315117-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720775205; x=1721380005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q6Ka/YYVTVTTg0swwAsw18SokweEy04uys0nIV91tzw=;
 b=KlkYlTg604KPH6YBrmVVWnEhaGXF74UP/4TyUlIdBMibeVK2+1OfxppnsEMK6uFWPm
 f44qba2AbszWYzTO4swrKikD7BYAcIOx9iszjsw9K48i/COFGF6UZBiVGKb1bG8IodvX
 im3L/msucoe2fOkGlghVUEZsCtCHIZ8a/dqdIUSNj3Fo8IRJb7HDMvWMk2AwZaFyYcoM
 D2y51ylKz7TtlwvgqpH1pF8hj+i7iP8wNJmooqzYx/x7gnYMczXyA0Eu8M2F58Q1UJZD
 iWXVI2MVbKlHGMKE+yD/leQkD3tyQpZkzqZvAtZQNVuGYjC/mtEKnfKETXsZa6stofGJ
 rDVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KlkYlTg6
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: add option to install custom
 environment file
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
Cc: Michael Walle <michael@walle.cc>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Heiko,

  Thanks for reviving this old patch :-)

On 04/08/2023 10:51, Heiko Thiery wrote:
> U-Boot has the capability to set the environment variables via a text file.
> The text file has to be located in the U-Boot board source directory and
> selected via the CONFIG_ENV_SOURCE_FILE option. The value of
> CONFIG_ENV_SOURCE_FILE must only contain the filename without the
> '.env' suffix.
> 
> Thus the buildroot option BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE is added
> that needs the information about the target of the file in the buildroot
> environment.
> 
> Since the environment file must be located in the U-Boot board source
> directory <SRC>/board/<VENDOR>/<BOARDNAME>.

  More recently, Luca has posted a patch [1] that achieves the same purpose but 
using a different U-Boot config (why they have two configs doing essentially the 
same thing, I don't know...). Luca's version is a bit more elegant I think 
because it doesn't need this special directory.

  Could you test that patch, change it if needed, and resend it? Luca hadn't 
noticed that you had already sent a patch with the same purpose, by taking over 
his patch you can recover some of the credit :-)


> These information about vendor name and board name are available in the
> U-Boot .config file and can be extracted from there to determine the
> destination directoy.
> 
> Cc: Michael Walle <michael@walle.cc>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2: change to shell expansion instead of make shell expansion. With that
>      we make sure it is expanded right at the time the command is called.
> 
> 
>   boot/uboot/Config.in | 10 ++++++++++
>   boot/uboot/uboot.mk  | 19 +++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8b726eaa57..cbbf629ba6 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -607,6 +607,16 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
>   
>   endif
>   
> +config BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE
> +	string "Custom environment file"
> +	help
> +	  Provide a custom u-boot environment file. This will be
> +	  copied to the U-Boot source directory in the corresponding
> +	  boardspecific folder and enabled via the U-Boot config
> +	  option CONFIG_ENV_SOURCE_FILE. The target path will be
> +	  determined based on the U-Boot configuration using
> +	  CONFIG_SYS_VENDOR and CONFIG_SYS_BOARD.

  The help text should indicate the minimum U-Boot version that has this feature.

  Regards,
  Arnout

> +
>   config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
>   	string "Custom make options"
>   	help
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index b3d26b16fe..2007647e3b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -181,6 +181,24 @@ UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>   endif
>   endif
>   
> +#
> +# Prepare for custom environment
> +#
> +UBOOT_CUSTOM_ENVIRONMENT_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_ENVIRONMENT_FILE))
> +UBOOT_ENV_FILE_NAME=$(patsubst %.env,%,$(notdir $(UBOOT_CUSTOM_ENVIRONMENT_FILE)))
> +ifneq ($(UBOOT_CUSTOM_ENVIRONMENT_FILE),)
> +define UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
> +	sys_vendor=`BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_VENDOR`; \
> +	sys_board=`BR2_PREFIX= utils/config --file $(@D)/.config -s CONFIG_SYS_BOARD`; \
> +	cp -f $(UBOOT_CUSTOM_ENVIRONMENT_FILE) $(@D)/board/$${sys_vendor}/$${sys_board}
> +endef
> +UBOOT_POST_CONFIGURE_HOOKS += UBOOT_COPY_CUSTOM_ENVIRONMENT_FILE
> +
> +define UBOOT_KCONFIG_CUSTOM_ENV_SOURCE
> +	$(call KCONFIG_SET_OPT,CONFIG_ENV_SOURCE_FILE,"$(UBOOT_ENV_FILE_NAME)")
> +endef
> +endif  # UBOOT_CUSTOM_ENVIRONMENT_FILE != ""
> +
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
>   UBOOT_DEPENDENCIES += optee-os
>   UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> @@ -497,6 +515,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
>   	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
>   	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
>   	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
> +	$(UBOOT_KCONFIG_CUSTOM_ENV_SOURCE)
>   endef
>   
>   ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
