Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D2341480;
	Sun,  7 Apr 2024 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7ocAOqlRfJi; Sun,  7 Apr 2024 20:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ADF54146D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ADF54146D;
	Sun,  7 Apr 2024 20:19:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 655731BF3F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5259960789
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsL9vhkPhHH6 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEEDD6065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEDD6065D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEEDD6065D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:19:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso2463897f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 13:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712521188; x=1713125988;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w0mlnVY8cTJl7xDpzd8CxcaohqKhxKseuNt0Ma3pNEs=;
 b=rQeDK/3ie7bbw6N4F0d6NwM1SCj9Jv0F05G2Nfr2tz8UESMZxgySuK+IIGZPQhOtfu
 TvG+0tSM/uulV9gdOu5gDlfmhpg6UzChNn9Gm/A8acxZzyt3IglwEQk3YYsDQkC5wT/Y
 vuAaYoeaXHlJVQbTzMBlDgJXx3g0zumBQ2q1KnbI18I1vWMNjioEC8+0l183yu5YQ6/l
 S5anZTegqqeb6esvIwxnSXDL2nsRJCUavfL5HA3z2+8DnOl1cQPORHZPuCxPQqlYVOGO
 JFrgxICQCDNduqUb58BOS3F/TKEbjzH8u+S20cR9CEaaaFW/ksqrjpKYD3a/CzCdZ05Y
 le9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqsyX4znwn0ANtootitGRtr5siHw3LyCjW0WiI6Ikr55hiiIVg6XOuBhofgJc+4oRWZfoE3Wmcy6/j82W021V1BiECmszWw==
X-Gm-Message-State: AOJu0YwUNMMX9baxYG7hUxPdy76OCnFrgkV2zU2ma793UzWQ/7n3Hxbz
 /r7l7tR1kSU1A5rtpo4HtvhclupRPwuJUBsWxVvZBRmzUXHyRTkpGSM1CyUvvC4=
X-Google-Smtp-Source: AGHT+IG1le9RRtUy9zeLPaE3oLMq8Y+aeQnnlic2++A0ySh7BqLvNOPZ4IVPURa8/9qSHfsj3L66VQ==
X-Received: by 2002:a05:6000:4008:b0:345:70bc:b08c with SMTP id
 cp8-20020a056000400800b0034570bcb08cmr2488338wrb.60.1712521188324; 
 Sun, 07 Apr 2024 13:19:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fl14-20020a05600c0b8e00b004166d303d6fsm1459013wmb.25.2024.04.07.13.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 13:19:47 -0700 (PDT)
Message-ID: <b10b4332-f38d-46da-aa8a-c60f5bc13106@mind.be>
Date: Sun, 7 Apr 2024 22:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-7-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-7-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712521188; x=1713125988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w0mlnVY8cTJl7xDpzd8CxcaohqKhxKseuNt0Ma3pNEs=;
 b=BHvhMTisLjWUmpZB9N1udDjQZNXneV/Tjo1Eq+X+BOI7evshhjLkuaI3tId63Z6DbR
 sOCF2i9GW5x5xNRa9NNoKSq/uC8FbUyS5LM3WqvUKQINXkeQ4bMOR6Q429KbmxBXvwoE
 SqMfwZ4m2XqlOGUDdcJHTHhfGRyc43bSjil39Y5rVHPOIhx4cGy+rAV59iFakEv/2f0R
 P6INU30V48lafCaarkrPc+55P4aXMhsUC5L/6rzEWAufU1WJyXxCUdsNvHvdU4kLZDOG
 Vb9sMHi+UYJog91hW7sKHWSRMrICsuObzInmZFJrNMpCpt91FnvAb6GqtyrJniYOC50h
 L8BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BHvhMTis
Subject: Re: [Buildroot] [PATCH v12 06/16] boot/ti-k3-r5-loader: install
 tiboot3.bin and sysfw.itb to BINARIES_DIR
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:34, Romain Naour wrote:
> From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> With binman support enabled, u-boot for k3 r5 core (ti-k3-r5-loader)
> install different target image (tiboot3*.bin) depending on the K3
> SoC boot ROM:
> 
> - General Purpose devices (gp)
> - High Security - Field Securable devices (hs-fs)
> - High Security - Security Enforcing devices (hs)
> 
> An additional firmware binary is required on certain TI K3 devices such
> as AM65 and J721e due to the "Split binary" boot flow [1]:
> 
> - Split binary with a combined firmware: (eg: AM65)
> - Combined binary with a combined firmware: (eg: AM64)
> - Split binary with a split firmware: (eg: J721E)
> - Combined binary with a split firmware: (eg: AM62)
> 
> K3 SoC using Split Binary Boot Flow also requires sysfw-*.itb file
> to boot (eg: am65, j721e). Only tiboot3*.bin is needed for other
> boot flow.
> 
>  From [1]:
> "It's important to rename the generated tiboot3.bin and sysfw.itb
> to match exactly tiboot3.bin and sysfw.itb as ROM and the wakeup
> UBoot SPL will only look for and load the files with these names."
> 
> See the (not exhaustive) list of all tiboot3*.bin and sysfw*.itb file
> variant found in meta-ti:
> 
>    meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>    meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
>    meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62pxx.inc:IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j722s.inc:IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
>    meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
>    meta-ti-bsp/conf/machine/include/k3r5.inc:SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
> 
>    meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw.itb"
>    meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
>    meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw.itb"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
>    meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
> 
> This firmware list can also be verified with the firmware name used in
> the u-boot devicetree k3-*-binman.dtsi files.
> 
> On the SK-AM62B-P1, three tiboot3 binaries are built, one for each boot
> ROM variant:
> 
>    tiboot3-am62x-gp-evm.bin
>    tiboot3-am62x-hs-evm.bin
>    tiboot3-am62x-hs-fs-evm.bin
> 
> A tiboot3.bin symlink is provided as default choice:
> 
>    tiboot3.bin -> tiboot3-am62x-hs-fs-evm.bin
> 
> On this board, the tiboot3.bin symlink links to the hs-fs variant
> but it not always de case for all TI K3 devices.
> (ex: J721e use gp variant by default).
> 
> The tiboot3.bin symlink links the -gp, -hs-fs, -hs tiboot3 binary
> according to where "symlink = "tiboot3.bin";" line is located in
> k3-*binman.dtsi.
> 
> As reported by Michael Walle [2], such firmware name can also be
> customized by a SBC vendor [3], so we can't always be sure which
> firmware to use.
> 
> If required, let the user provide a custom tiboot3 or sysfw firmware
> name from the defconfig. Otherwise use the default firmware choice
> by copying tiboot3.bin and sysfw.itb symlinks.
> 
> [1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/doc/board/ti/k3.rst
> [2] http://lists.busybox.net/pipermail/buildroot/2024-April/688943.html
> [3] https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phycore-som-binman.dtsi#L14
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Changes in v12:
> - allow a custom tiboot3 and sysfw firmware name:
>    http://lists.busybox.net/pipermail/buildroot/2024-April/688953.html
> 
> Changes in v11:
> - Introduce BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN and BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB
>    strings to provide firmware name to copy at the end of ti-k3-r5-loader build.
>    This replace the "find . -regex" from provious patch version.
> - Add sysfw.itb handling needed to TI K3 SoC using Split Binary Boot Flow.
> 
> Changes in v8:
> - Use the `find' command in pipe with the `cp' command.
> 
> Changes in v6:
> - Replace `find' command with `cp' one.
> 
> Changes in v5:
> - Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
>    tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin
> 
> Added in v4
> ---
>   boot/ti-k3-r5-loader/Config.in          | 40 +++++++++++++++++++++++++
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 35 +++++++++++++++++++++-
>   2 files changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index 5f4f33b220..c0c7222a10 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -102,4 +102,44 @@ config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
>   
>   	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
>   
> +config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
> +	string "tiboot3.bin binary name"
> +	default "tiboot3.bin"
> +	help
> +	  Name of the TI K3 tiboot3.bin binary to use.
> +
> +	  The tiboot3 binary name must match with the TI K3 SoC boot
> +	  ROM:
> +
> +	  - General Purpose devices (gp)
> +	  - High Security - Field Securable devices (hs-fs)
> +	  - High Security - Security Enforcing devices (hs)
> +
> +	  Or if the tiboot3 binary generated use a custom name.
> +
> +	  If unsure, use the default tiboot3.bin (symlink) generated by
> +	  binman.
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB

  This should be SYSFW, not SWSFW, right?

> +	string "sysfw.itb binary name"
> +	default "sysfw.itb"
> +	help
> +	  Name of the TI K3 sysfw.itb binary to use (if any required).
> +
> +	  sysfw*.itb are only generated for Split binary based Boot
> +	  Flow (eg: am65, j721e). This option is not used on other
> +	  TI K3 devices.
> +
> +	  The sysfw binary name must match with the TI K3 SoC boot
> +	  ROM:
> +
> +	  - General Purpose devices (gp)
> +	  - High Security - Field Securable devices (hs-fs)
> +	  - High Security - Security Enforcing devices (hs)
> +
> +	  Or if the sysfw binary generated use a custom name.
> +
> +	  If unsure, use the default sysfw.itb (symlink) generated by
> +	  binman.
> +
>   endif
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index cf18b43871..0191a2501c 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -73,7 +73,24 @@ TI_K3_R5_LOADER_DEPENDENCIES += \
>   	host-python-pylibfdt \
>   	host-python-setuptools
>   TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
> -endif
> +
> +TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
> +
> +define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
> +	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
> +endef
> +
> +TI_K3_R5_LOADER_SWSFW_ITB = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB))

  Here also, SWSFW -> SYSFW.

  Regards,
  Arnout

> +
> +# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e).
> +# So, if sysfw.itb symlink exist we must copy it or the custom sysfw.itb.
> +define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
> +	if test -e $(@D)/sysfw.itb ; then \
> +		cp $(@D)/$(TI_K3_R5_LOADER_SWSFW_ITB) $(BINARIES_DIR)/sysfw.itb ; \
> +	fi
> +endef
> +
> +endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
>   
>   define TI_K3_R5_LOADER_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> @@ -81,6 +98,22 @@ endef
>   
>   define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
>   	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
> +	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
>   endef
>   
> +# Checks to give errors that the user can understand
> +# Must be before we call to kconfig-package
> +ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR_BUILDING),yy)
> +
> +ifeq ($(TI_K3_R5_LOADER_TIBOOT3_BIN),)
> +$(error No custom tiboot3 name specified, check your BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN setting)
> +endif
> +
> +ifeq ($(TI_K3_R5_LOADER_SWSFW_ITB),)
> +$(error No custom sysfw name specified, check your BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB setting)
> +endif
> +
> +endif # BR_BUILDING
> +
>   $(eval $(kconfig-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
