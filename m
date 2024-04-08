Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A73CD1296
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F4060AD2;
	Mon,  8 Apr 2024 13:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ky6oTyUWBXpO; Mon,  8 Apr 2024 13:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C83760B00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C83760B00;
	Mon,  8 Apr 2024 13:00:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E420D1BF3C2
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D06EC40494
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leZHb4EYgfHZ for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E276440159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E276440159
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E276440159
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:00:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41551639550so30807795e9.2
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712581247; x=1713186047;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mt71+BstAuZ4nzUAcXXIU8ruJSksDZg72u8A8EmvAEI=;
 b=azgw/xUkJhUOvFH5kr3XLnAPSCwDz7lTVtC41mZ6y5Lgfdt6qOHFwItAtOhSpHEs3q
 SVx4hfQB2cMUudRL+Z5bm+fnEr1YgavCs6tyFHJWLwsVOHuh3KzcXtUbGDdRtqhs2ZT4
 iF+/IHlmZQ37DDPcy/oa1Sw5iFdPaLm0oYC2pS+nf+VihjZyU+fNUOS6+TwGNpT1SVMB
 /w2Z8UxusUX5oTub+wKamKbliE90F+v/Lj+OLWDmAXo38prLP0twjfR99DWzAxbKtru9
 Y+EzJ1d3YmPIFRsxpVPevENQVdLwoxBrKbi34qJfq2x6GxibaLqitS2EwjcJTfws4G47
 /+Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1WqyCep8w6pCQ+y+f4tPM7NJPN3ep9DLHdQNrYtCFp4QTkGZoVy85WAQjIj4IpOKl0aPVY0cDOl6RlIaPcJ5Z9TNJTiNscw==
X-Gm-Message-State: AOJu0YzgDJmtRoJYRQtql1CWJeIwXxtnggytt5c+wItw+ZbA4ZHG7tMp
 oj2PI13PXljfqQBBHsF936KGzd0/1DVmsLlVkW2ZM09sL2ODtmMoBMGeveIh5Wk=
X-Google-Smtp-Source: AGHT+IEpE9J6MRhC5IykDVkwV8zdZR0t8sedRZxNG7Ylzu8eOoDTzN1rGNU/R6hV7QntgekaYmysPg==
X-Received: by 2002:a05:600c:470d:b0:416:6b95:fc89 with SMTP id
 v13-20020a05600c470d00b004166b95fc89mr2507318wmo.1.1712581247333; 
 Mon, 08 Apr 2024 06:00:47 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b00415dfa709dasm13369327wmq.15.2024.04.08.06.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:00:45 -0700 (PDT)
Message-ID: <452821da-0cdd-41af-bf8f-7c78297878d6@mind.be>
Date: Mon, 8 Apr 2024 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-8-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-8-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712581247; x=1713186047; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mt71+BstAuZ4nzUAcXXIU8ruJSksDZg72u8A8EmvAEI=;
 b=ZfFLHnxmj1+Y/Xt4ir4fHUSE8Vq3ZsonMuV9PN74ObdKYNTXRj03AHXTnJMRCONCwC
 7SB+Efvkw8TirOCeVnYOw1GrePOSHWGAet5uuNF2jaaVQkK8AwQH3nnYm7iWKqCk9xKr
 qm9Bwv985qwhQ68Q1AlIwm3qRxrnoCm+wAQzE4rTLDzClJiZcEfV8QY+BOJAlI3BKVj8
 1cwTkYJxvh5zn2vdIgO6TwO0gAPL/nCwLzz0W12qvhfp5NHxsgXfGz+JQNiPjrQ0IUHi
 ytvCtl9weZhuf+eJBOXpxkupm99o/fkPnKSZTbklxG8mlaMRUlnPkz3ryUs6rAv03f2J
 Umvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZfFLHnxm
Subject: Re: [Buildroot] [PATCH v12 07/16] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2024.01
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



On 07/04/2024 12:35, Romain Naour wrote:
> From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> The 2024.01 version of U-Boot for the am62x-sk board has introduced two
> major changes:
> - The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
>    /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
>    and the use of extlinux.conf for the proper loading of the device tree.
>    Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
>    auto-generate the extlinux.conf file so that developers can change the
>    kernel loading options by modifying the .config.
> - U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
>    necessary to use custom tools like ti-k3-image-gen.
> - Use a custom tiboot3.bin since the default is "hs-fs",
>    but the ti_am62x_sk_defconfig expect the "gp" one
> 
> Tested on SK-AM62B-P1.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

[snip]
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label am62x-sk-buildroot
> +	  kernel /Image
> +	  fdtdir /
> +	  devicetree /${DEVICETREE}
> +	  append ${append}

  I wonder if it's really useful to have this custom extlinux.conf... We could 
also give the devicetree a common name, and move the append line into the device 
tree itself.

  But this patch has had enough iterations, let's just keep it as is :-)

[snip]
> -BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"

  The hash for 2024.01 is currently in boot/uboot/uboot.hash, but as soon as we 
update the U-Boot version, it will no longer be. So to be future safe, we should 
add a local override of the uboot hash file as well (which is simply identical 
to uboot.hash).

  Regards,
  Arnout

>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
> +BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
> +BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
> +BR2_TARGET_UBOOT_USE_BINMAN=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
