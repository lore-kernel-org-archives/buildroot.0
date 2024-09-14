Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A64C021A5
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C359580B85;
	Sat, 14 Sep 2024 16:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToQm9WZyOmnu; Sat, 14 Sep 2024 16:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C115B840D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C115B840D5;
	Sat, 14 Sep 2024 16:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE7B1BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ECFC607BD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVB1XwQUEwM8 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 596DF6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596DF6061E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 596DF6061E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:28:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb57f8b41so25865775e9.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726331320; x=1726936120;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JhoEs9tsB/rlXsK/5dC9kmQDiD3lr/SLgwVma791Ico=;
 b=w+UCL3sWoNhviKPZ8Jt5yLxL0O2phNdVSA3W8DqDndL7VxNLU7yCme22ZTq65fT+0W
 oxLCTxucR7LBRRKumQushgr/lusCv0MykAJxLuL9T8ys9eNCGSO8WS4eeOMPkcIn90K8
 H0MPHIv7/U8zt5jEKrytu2u4R5iY6C57wbPiVQK+kEcHoH/FNzD4Wo3/5NKSsn1JmS01
 ggCuz8o6kG3wCKx08s2KBf31A/sa21Nf4eSsBwvVNjfOvoYL2ce+n7Z3cxVMcKwb2oKa
 0pcSqhrIslXMRddwRNx6jAYkyWoGQfrb2aYi9qtvyCv4MZqCZURjGYDxYX0MTiWyHt6W
 BFtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaSVe0A8yN5n3lIDKC9cQ/eBl/ChVaFYE6THCThcIxiEoCieKpUBr4M8UTZ1ryKhuMA5g1BYtQwWQ=@buildroot.org
X-Gm-Message-State: AOJu0Yyr7PWYzxQqQQklg7mC/9kQZ0rd0WMlLS8WKLLH+QK6ndIxlT81
 cAUzc2aBCaiy+UoTZKvaMLNyaokoNjwjgEByfRP8gqQAVGIbvXqwsC2O7tKMdDA=
X-Google-Smtp-Source: AGHT+IHEpFfv6SAM34Lqsy97tfoMY6X/pcHViRvE66jevjhLBwgKOqQj1D0k+AZOw/gh8EBgGDNPmA==
X-Received: by 2002:a05:600c:3109:b0:42c:a387:6a6f with SMTP id
 5b1f17b1804b1-42d90829e80mr51817985e9.20.1726331319940; 
 Sat, 14 Sep 2024 09:28:39 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e80afsm2224351f8f.38.2024.09.14.09.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 09:28:39 -0700 (PDT)
Message-ID: <d848ddee-e823-4ec8-b562-072831e4ba45@mind.be>
Date: Sat, 14 Sep 2024 18:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sabeeh Khan <sabeeh-khan@ti.com>, buildroot@buildroot.org
References: <20240914121016.3530250-1-sabeeh-khan@ti.com>
Content-Language: en-GB
In-Reply-To: <20240914121016.3530250-1-sabeeh-khan@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726331320; x=1726936120; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JhoEs9tsB/rlXsK/5dC9kmQDiD3lr/SLgwVma791Ico=;
 b=DYLk7HRItpwtUqtnNOESa65xBzFEsGGiHuI/z+4Erir/5YlSHUqaHgUeda1gSbNjzL
 owiiwh2o5WMLKY8BC/IA6/ggCS7Q0wAfHRLjod0XYmDYv8AG9ScgIM6m15W8DUgH7g21
 H0KPlGYiP7m5Gq3g2ysC73g8le+lFqkRKUMYH6SZPFmqYpHWEw4TDv5iK00GFSZ2wJik
 8eTxLbbvRNGBXh4pOSrBaPoW/Tezc7s4Z1guAYaF/2aAg858bVCIvIOPO2M1UsTs2lve
 UuZvLH8OljvCVX56ExjvQZtoVJSTSU7sZVUqmzCur3ZWAHurOPpA0SDQc+LNQlMFXa1Z
 vhEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DYLk7HRI
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add WLAN and
 BLE chip TI cc33xx firmware option
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/09/2024 14:10, Sabeeh Khan via buildroot wrote:
> Add an option to install the cc33xx firmware files.
> The TI cc33xx family of devices support WiFi 6 and BLE 5.4.
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/linux-firmware/Config.in         | 5 +++++
>   package/linux-firmware/linux-firmware.mk | 9 +++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 4a17ceaf0b..f0d5fefc2e 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -527,6 +527,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
>   	help
>   	  Firmware files for WLAN and Bluetooth modules wl18xx
>   
> +config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX
> +	bool "TI cc33xx"
> +	help
> +	  Firmware files for cc33xx WLAN and BLE family of chips
> +
>   config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210
>   	bool "Qualcomm Atheros wil6210"
>   	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index ae10e160b9..80a6f38a85 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -486,6 +486,15 @@ LINUX_FIRMWARE_FILES += \
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
>   endif
>   
> +# cc33xx
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC33XX),y)
> +LINUX_FIRMWARE_FILES += \
> +	ti-connectivity/cc33xx_2nd_loader.bin \
> +	ti-connectivity/cc33xx_fw.bin \
> +	ti-connectivity/cc33xx-conf.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
>   LINUX_FIRMWARE_FILES += wil6210.*
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
