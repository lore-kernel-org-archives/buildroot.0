Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB7CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 168534116E;
	Sun,  7 Apr 2024 20:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRsO9Hs13-28; Sun,  7 Apr 2024 20:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A185D40C96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A185D40C96;
	Sun,  7 Apr 2024 20:07:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4E61BF3F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7865A4114E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKTn6bflVCYm for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:07:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBC13410A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBC13410A7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBC13410A7
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:07:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416632343d0so3272865e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712520441; x=1713125241;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4TTusufRTC919ovQQxgKMiU3gTl6zGKnvJXU26xV1bk=;
 b=BioesDZuElIr7QKRjgX+SzoiGbIibtfjHz2By8tdm7rJmkPMxTb/6ax2D+ac7spBAk
 ovWwbc0cz/f32ZRevM0k20lT4nfPrdp/LwyA5vq9PaKTDC8Usnm9HV+LOO/x0RjTFIMW
 173nNXysj/VkU3Kh/KumVQ2IXH2H5U7DVSOrF3aWty6Qh5KwsqLlF8eAD5djl8WhS6Xn
 kNj0pNpbbdF/hpRR7F5nYo47A/ERqU+NsRxf8TRQzkymBX1e9LRxC3D5kbq4REDP/PR8
 wFuxUO7WgaUC87ay6yVFSCZhNBRPJ8nOISGjpQbm0a8jI8Kgks2JQGsyrRmcoRziUExc
 JJjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3YJEixoqmbxhDDvIpdwbSw4YB21zq/LhMIcZWQXB9xjfuSdUaXOss+H3pJJ878GzbuGmbtsXeojOUPgtCTsK2c1toY8IiqQ==
X-Gm-Message-State: AOJu0YwwJYdKX7pkDZFwfXRtP4fB6sfdrhwLb6shqwFRT+V6I5eaeU6Q
 FtgzCrlEgeemQOREZTU9lXMpayMJPW1DzZbRNOgOu2Yx7BZG33+9kcUdURViYdDyOmq4XTfgDPe
 O
X-Google-Smtp-Source: AGHT+IG+ShkKDU6V4c7uiScIfZ+jnr/gGyAmMXXzEVzcsELMMYOjVsknMJ8dmlkQX7LKKQ+4Lgz+6Q==
X-Received: by 2002:a5d:4147:0:b0:343:eb8d:4365 with SMTP id
 c7-20020a5d4147000000b00343eb8d4365mr4796469wrq.42.1712520440725; 
 Sun, 07 Apr 2024 13:07:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004163321790esm8067315wms.19.2024.04.07.13.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 13:07:20 -0700 (PDT)
Message-ID: <19db26fb-d5cd-41d4-a7bd-491b2d19dd66@mind.be>
Date: Sun, 7 Apr 2024 22:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-5-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-5-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712520441; x=1713125241; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4TTusufRTC919ovQQxgKMiU3gTl6zGKnvJXU26xV1bk=;
 b=ABBGq0cGLvbQK0uwXHopCcTJ1l1BiefMnyxAf0SvZcon2Zh2Fxnry/zTrby7L79bn4
 V7DFSgzJTuqBRIzsQ9R+ns+HIpGpU20dHFsE+zE2Brgyt1u5K/kgHH+stxW9W5+9KIlm
 3mgCa7Lqf4VmUi5ec79I4sncjGOo8D1ruWdZrAx/74n73oGUDwKB6oIrmDaxRFTsKE1z
 aWvYRdg/Iscx3dZ58Tb6dfWvYnTyS2agGQl8c5i97pMIycj6t23bU37pROm814CUyHUw
 rKWNn8KoQHcpu3wbzZtz/dQZrjVV29x63MUigkEQVv76BGq/JZtkMWnmZBhH42i9HB5X
 cpKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ABBGq0cG
Subject: Re: [Buildroot] [PATCH v12 04/16] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:34, Romain Naour wrote:
> From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> Recent version of U-Boot use binman to provide a mechanism for building
> images, from simple SPL + U-Boot combinations, to more complex
> arrangements with many parts.
> 
> This tool uses additional host python modules that must be provided by
> Buildroot. So introduce a new option
> BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN to add additional host packages
> in U-Boot build dependency to use binman.
> 
> When BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is set, BINMAN_INDIRS
> environment variable to provide the directory to search for binary
> blobs and select the packages required by binman. Make sure that
> ti-k3-boot-firmware package has been installed before building
> ti-k3-r5-loader in order to provide such firmwares.
> 
> The BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option is currently needed
> since we are in the middle of the process to switch TI AM62 and AM64
> board defconfig to binman. Keep BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> disabled for them until the u-boot/ti-k3-r5-loader version bump to
> 2024.01.
> 
> The dependency of binman is not really easy to follow. First we have
> the packages list from binman.rst [1] then we have to install
> additional python modules [2]. Maybe in the future it will be
> necessary to add host-lzma and host-lz4 in the dependencies list.
> 
> [1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
> [2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

  Excellent that you added this paragraph!

  Regards,
  Arnout

> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Co-developed-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Changes in v11:
> - Use BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option while AM62 and AM64
>    still use ti-k3-image-gen
> - Add missing ti-k3-boot-firmware dependency
> 
> Changes in v6:
> - Update the commit message adding the links of requirements.
> 
> Changes in v5:
> - Add dependecy on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> - Drop runtime dependecies
> - Add host-python-pylibfdt dependency without requiring
>    BR2_TARGET_UBOOT_NEEDS_PYLIBFDT configuration
> - Add host-python3 and host-python-setuptools dependencies
> - Add SOB and COB tags of Romain Naour
> 
> Changes in v4:
> - Drop the BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
> 
> Changes in v2:
> - Change commit message
> - Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
> - Select packages required by binman if
>    BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled
> ---
>   boot/ti-k3-r5-loader/Config.in          |  9 +++++++++
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 15 +++++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index 5f86c045c9..5f4f33b220 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -93,4 +93,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
>   	help
>   	  Path to the TI K3 R5 Loader configuration file.
>   
> +config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> +	bool "ti-k3-r5-loader use binman"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
> +	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
> +	help
> +	  Use binman tool for generation and signing of boot images.
> +
> +	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
> +
>   endif
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 0ffcb8235f..cf18b43871 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -60,6 +60,21 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
>   	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
>   	HOSTLDFLAGS="$(HOST_LDFLAGS)"
>   
> +ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
> +# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
> +TI_K3_R5_LOADER_DEPENDENCIES += \
> +	host-python-jsonschema \
> +	host-python-pyyaml \
> +	ti-k3-boot-firmware
> +# Make sure that all binman requirements are build before ti-k3-r5-loader.
> +TI_K3_R5_LOADER_DEPENDENCIES += \
> +	host-python3 \
> +	host-python-pyelftools \
> +	host-python-pylibfdt \
> +	host-python-setuptools
> +TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
> +endif
> +
>   define TI_K3_R5_LOADER_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
