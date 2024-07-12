Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292E2C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B14C412D3;
	Fri, 12 Jul 2024 09:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r40mL0Izx9hX; Fri, 12 Jul 2024 09:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC26E4129B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC26E4129B;
	Fri, 12 Jul 2024 09:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 240B21BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FE9441780
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnyJNzANx10n for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 685E54177F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685E54177F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 685E54177F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:23:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266fd39527so13073485e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 02:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720776195; x=1721380995;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmd7Z7yJnjwGEtmVu5uv87dwFb6eEkUM8tHg0ddVMT8=;
 b=dVpjkzIZjE8S4XzZt1SZymJKZdmXxeSlEAD9V0MGPhgnDFCUDpltuo9SzJr38fwZiI
 MBYmvVN8iLUHrY4SJbpaNiQnnEL22YmNPreoXjwSJ6d9oMk8hfAA3PIVd0uLuPHlC5kE
 jjwoYIz47zs12sCBCsZyV9QWHDbna0KzxdY0X88U+6QawHoF7iLRrgHztLdh7YuxPR8N
 RkJsx6mEfpzWfwdV7//vZhvxldDlsDlakOcVGsHekDeqNHoa4lRQEKAPleMq2plSz/+h
 ATdxlFm452yzgXY0vMxM+MmsJ2K3YBfB6S1zDFPl69JeVQxT3ocWJEvv8VrGbdSJO7KF
 qerg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFM5rCKsJ4Jekuvn1+f6RUppr9j6rBc5B8PUPQz95KUJ7j51U8/FDKZG8n7cVFn8Lgp9oglifzpNfhZvY3fOHRj5cUTmUoZw==
X-Gm-Message-State: AOJu0YzojOXQGTZYBvmeQTrE6Hg7ZnaKX9Xmn7U1eVDFPD0wqJeKCgp2
 ML47M+u83euZ67NUpmQrg5j2YYsGfvDjmkvAg2d2IrMNMHrabimZcRRu3BGucB73GtL2o5Bngzl
 BhzE=
X-Google-Smtp-Source: AGHT+IFrcvhZ5vttUTuhXW/Yj9pi15ew/pzMnt7muLOmZSsLYUMHx0AXqx0HJar3OGWK6icVXhkY2A==
X-Received: by 2002:a5d:658e:0:b0:367:8383:6305 with SMTP id
 ffacd0b85a97d-367ceac48damr7492676f8f.55.1720776194914; 
 Fri, 12 Jul 2024 02:23:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab753sm9696130f8f.107.2024.07.12.02.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 02:23:14 -0700 (PDT)
Message-ID: <bb557f20-2d9c-4b1b-9b33-4072d41fe129@mind.be>
Date: Fri, 12 Jul 2024 11:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
References: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720776195; x=1721380995; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wmd7Z7yJnjwGEtmVu5uv87dwFb6eEkUM8tHg0ddVMT8=;
 b=E6HDryyU5+VfAOdC0FOvxCWFVG2FWldyFpCvN2a+fckrqSeHAaulsPBWj6JcYmlHWl
 seNBkukDX/AlqKQjzDS83mG0W1uL9PHRSHUqzvk9iN39LPQK0mEjGDK6piAeWhz4OkA2
 t33Iay9UY9XY93O3emOqSuE6bGRLZWcGVwcMPg6VbkajC0hdw6Gn8UzGTKcUbGVLLGsZ
 rf7mvXo3fjUyt+sg/kOvk+SdbwqGjo5FPMYgpj0hBohvyNjfDB14cFU5wFcOa9NOekA4
 nm3ujmIyYPf3A9p9A8gxRNTiZhQMS/Dx2HJ2UaHEabswrjsiSD0qWpEw5FMiNmUUDo7f
 9yCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E6HDryyU
Subject: Re: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Luca,

On 17/06/2024 18:00, Luca Ceresoli via buildroot wrote:
> By default U-Boot builds a default environment from its own configuration
> and a board-specific set of variables. However it also allows to bypass
> this entirely and define the entire default environment from a text file.
> 
> Expose this feature to Buildroot. This allows to have a file e.g. in
> board/.../uboot.env which contains an easy to maintain text file with the
> wanted default environment, without patching the U-Boot source code.

  Earlier, Heiko sent a similar patch but using a different U-Boot config option 
[1]. We're going to merge only one of them :-)

  This one is a bit more elegant I think because it doesn't require discovering 
the vendor directory.


> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   boot/uboot/Config.in | 29 +++++++++++++++++++++++++++++
>   boot/uboot/uboot.mk  |  9 +++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f37040a28a97..a3bf3e009c52 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -136,6 +136,35 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
>   	  that will be merged to the main U-Boot configuration file.
>   endif
>   
> +config BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
> +	bool "Generate default environment from text file"

  I think that rather than two options, we want just one string option. If it's 
empty, it is disabled.

> +	select BR2_TARGET_UBOOT_NEEDS_XXD
> +	help
> +	  Define the entire U-Boot default environment from a file,
> +	  disabling all the logic to generate it from the U-Boot source
> +	  code and other configuration values.
> +
> +	  Based on the USE_DEFAULT_ENV_FILE and DEFAULT_ENV_FILE U-Boot
> +	  configuration variables.
> +
> +	  Requires U-Boot >= v2018.05.
> +
> +config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
> +	string "Text file with default environment"
> +	depends on BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
> +	help
> +	  Text file containing the variables to be used as the default
> +	  environment in U-Boot.
> +
> +	  From the U-Boot documentation:
> +
> +	    The format is the same as accepted by the mkenvimage tool, with
> +	    lines containing key=value pairs. Blank lines and lines
> +	    beginning with '#' are ignored.
> +
> +	  For more info see:
> +	  https://docs.u-boot.org/en/latest/usage/environment.html#external-environment-file

  Excellent help text!

> +
>   config BR2_TARGET_UBOOT_NEEDS_DTC
>   	bool "U-Boot needs dtc"
>   	select BR2_PACKAGE_HOST_DTC
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 19f4cdb557e6..3b3d3a13e711 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -390,6 +390,14 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>   # override again. In addition, host-ccache is not ready at kconfig
>   # time, so use HOSTCC_NOCCACHE.
>   UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
> +
> +ifeq ($(BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE),y)
> +UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
> +define UBOOT_KCONFIG_DEFAULT_ENV_FILE
> +	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
> +	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")

  I think we mostly use `` rather than $(shell ...) - with the backticks, it's 
much easier to understand when it's going to be evaluated.


  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com/


> +endef
> +endif
>   endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>   
>   UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
> @@ -530,6 +538,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
>   	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
>   	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
>   	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
> +	$(UBOOT_KCONFIG_DEFAULT_ENV_FILE)
>   endef
>   
>   ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
> 
> ---
> base-commit: 7bfea9372f1842279a8f57b5fc4428bbae822e91
> change-id: 20240617-uboot-default-env-46688521fbae
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
