Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1EE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9242D80ECD;
	Thu, 21 Sep 2023 19:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9242D80ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmFCOF_7Ayj9; Thu, 21 Sep 2023 19:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C148142A;
	Thu, 21 Sep 2023 19:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C148142A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72D001BF3EE
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BDAF8142A
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDAF8142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quvmgudj9bL2 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:19:40 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68DDA81429
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68DDA81429
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50435a9f800so322391e87.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695323978; x=1695928778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CtCmUqD96k9o3XqdZQpWpPrKiIZTlY7OGzN+yyVm+f4=;
 b=QZHH3aOciT5Pnkl0S03cI5COdrXz+NJ4Ehuxspz9647Biey6qeT+Qns+QAWswQcoQU
 StGeB8fXw5pJq37g7xFPFsUguTzD2BocRAmvIgvKg7HCp1tR/w0lD+AczWpw96a5uFUl
 l6I9o1cORpAO+7i/+yUKl/KdxD47lGsu6MaddJvAMkvnjDoxwKIg0oKepVXBTymurlzN
 KTpf2S7K1oUdid6XkL+K6iaR6mRboCby17Ae946p+4uAYwP6YmKxjsj237ttQTzvoFNp
 KDB/9FpW3DDDnsvN+TKMAEabK7PYxWmcLTDeV/Mh1XlnFNhARe7x9k7Is/TTNQP56YzD
 7pjQ==
X-Gm-Message-State: AOJu0YyivvgNEkTpCnSdJj2xR2iaMoKbi/cTvGnbKAxszOrr0CeIac10
 GUV0jgw1ECQs5OaGwk03w4ewrctd7kFdmaSQPDA=
X-Google-Smtp-Source: AGHT+IEgiPddx7bo8bmRQ4Dwffbp0SQ6RFUTeHtL2YFqy4lp8eBZX/2UwYiS1zJ5Vpar9NtWtkEgzA==
X-Received: by 2002:a19:e006:0:b0:500:a08e:2fcf with SMTP id
 x6-20020a19e006000000b00500a08e2fcfmr4836780lfg.47.1695323978215; 
 Thu, 21 Sep 2023 12:19:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ba26-20020a0564021ada00b005333c729654sm1217740edb.24.2023.09.21.12.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:19:37 -0700 (PDT)
Message-ID: <399e2ebe-9bbf-1328-561b-afe68c180aae@mind.be>
Date: Thu, 21 Sep 2023 21:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Jens Maus <mail@jens-maus.de>, buildroot@buildroot.org
References: <20230917205416.1518714-1-mail@jens-maus.de>
In-Reply-To: <20230917205416.1518714-1-mail@jens-maus.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695323978; x=1695928778; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CtCmUqD96k9o3XqdZQpWpPrKiIZTlY7OGzN+yyVm+f4=;
 b=Zq8auWtrhZ6D0vzviJbtdlXhqVo4Ggk2YO3jyocfqSnGZhkXcpfL0KjvcLnz3J1H98
 XXaD1wUrW0WQRZ6dGDWnSZIVK0V3ckrppKiJ3Bk+uIWtvlL677OyZ/zWBQM7aNjZx3Ts
 L6qZ2CHOiPIh0/MMdrp2UT7fcXFCFPEzPWPcnEQomwCGpe39RuDcK0GNtqoA+wl8e4db
 RZOD7uxGhpJruU/Dv0h29vfX+Jrp4vMlBHFfJ7oq9ciFmuokqEAeM6/iMJhy5T95UD3f
 9k9A31/mtcqZyFEmSPnDPFwh34pE5mHbsgPTHfKOF3bINaYaY+J2i/9kHQ55EALVttq6
 8+pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zq8auWtr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add iwlwifi quz
 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 22:54, Jens Maus via buildroot wrote:
> This commit integrates support for the iwlwifi QuZ firmware files
> to support the wifi chipsets for the intel NUC10 type of hardware.

  I've added this information to the help text and applied to master, thanks.

  Regards,
  Arnout

> Thus, this change adds BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>   package/linux-firmware/Config.in         | 6 ++++++
>   package/linux-firmware/linux-firmware.mk | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 46e538776d..f86818996e 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -279,6 +279,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
>   	  Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
>   	  supported by the iwlwifi kernel driver.
>   
> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ
> +	bool "Intel iwlwifi QuZ"
> +	help
> +	  Firmware files for the Intel Wifi QuZ devices supported by
> +	  the iwlwifi kernel driver.
> +
>   config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
>   	bool "Libertas SD 8686 v8"
>   	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index f8c239d816..0cd1f30c16 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -527,6 +527,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
> +LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
>   LINUX_FIRMWARE_FILES += tigon/*
>   # No license file; the license is in the file WHENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
