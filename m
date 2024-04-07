Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532E9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FEF407EB;
	Sun,  7 Apr 2024 15:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVPukPj-9pzl; Sun,  7 Apr 2024 15:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CAC40835
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CAC40835;
	Sun,  7 Apr 2024 15:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1E911BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF66B60A93
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XZh7pyrjLqV for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1007860A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1007860A8C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1007860A8C
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:50:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4162b74f2a1so21789705e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505054; x=1713109854;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pOoiSVxUHV2WajVISbuFlJgohXLu3OwrLOR+4c3m8aA=;
 b=HCYmm03JMzPtd0DQ9ULI77N2M+AacAyncTNBSGJ7w0/cXcVYQDCbIE46s6xcEnVu9A
 su3SW2K28Lq26CrhQI+UItpeU8SdqKBOIj4xn0/7Y/2+COuY9YXJVT49ISNH7MHJJEeV
 RIHko/TIBfT8ECNmAgyaZKfRxZKCFg8/9LRKw0fu1n1rggmwmKVYeAkz0iQSUE0FMd3r
 J0/PAuE6dxtB4/SlwLsOvIDjOsB9eKj5Zmhv4oYBJbAtsUd2t4qvqr0OflB6ZMCjRd8j
 gFs8zgDpP0T83QjAB15Osan8lHJDgcYE8V4BIYl2NBarj9yZjtLg2HriZ3p2njo7U30I
 KU0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4+fURLWhXEU1+KsfdY45V7qUuiGr0BH6hkGiCK1iHJLeAdxt5QAZBAJwX6RFtHNq0c49KTHxHjT5TWKREI71QhSvLYOMuvA==
X-Gm-Message-State: AOJu0Yz6QSjV8PlFZs7LgZqD5ybi81RjO8dnqTwfSxrXd8twfez0gfhD
 1AuEAKW/6AKsSMdQreg+u/qa5Blkl4kFHFefyQTySPTTXtIiZs/X4hE1fDIp59U=
X-Google-Smtp-Source: AGHT+IEa780PDyDX8iNB/jFdf65LYv8gkWEtahqbqRJWaC6ulW70UCTgtHzQsBddhG/zr55r7KJctg==
X-Received: by 2002:a05:600c:190d:b0:416:5cf2:bc13 with SMTP id
 j13-20020a05600c190d00b004165cf2bc13mr1401212wmq.14.1712505053928; 
 Sun, 07 Apr 2024 08:50:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b003437ad152f9sm6883442wri.105.2024.04.07.08.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:50:53 -0700 (PDT)
Message-ID: <9b60fd4d-7a0e-47da-a37a-9690b4ac84db@mind.be>
Date: Sun, 7 Apr 2024 17:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>, buildroot@buildroot.org
References: <20240305070452.183573-1-karthikeyan@linumiz.com>
Content-Language: en-GB
In-Reply-To: <20240305070452.183573-1-karthikeyan@linumiz.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505054; x=1713109854; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pOoiSVxUHV2WajVISbuFlJgohXLu3OwrLOR+4c3m8aA=;
 b=YiWAL3DxchWftAD2NbUJXAT7G3V0UxfdeAJV++rxYzxkCspKjyruEadQAblNFMD6Ld
 CHoeqDNmN+dNg9FPuguEHwLu0m2xOXnbbaI4r7gkQylkBidODEosO6fNOa8EJZy8cOzw
 Bv4k5b9FXdUrVqm+I5MixgN5xGF2fsGjipAglUpXcZuN/mST9TU7ZvKW/7BUevWSG0sP
 grJJ/SwToxkJQdiTYaDXV/WqUlPrUzMRzeKTM3NV6h4IIppHBXb1JRmhtKZEhepAzFog
 nL4/7jSML7jH9pmCSm38cylUH4HCGSHcbRUftqIFNJkCC/UWsiau6uuhLqXtHRnQzNLH
 vDQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YiWAL3Dx
Subject: Re: [Buildroot] [PATCH] package: linux-firmware: update linux fw
 bluetooth package for rtl88xx
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
Cc: saravanan@linumiz.com, bernd@kuhls.net, parthiban@linumiz.com,
 yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/03/2024 08:04, Karthikeyan Krishnasamy wrote:
> add realtek 8821cs bluetooth firmware in linux firmware package,
> BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT config for realtek 88xx family,
> not device specific config to enable, add fw's in realtek 88xx family
> in build instead of adding them separately.

  I reworded this as follows.

     package/linux-firmware: RTL_88XX_BT: install all firmware

     Instead of enumerating each binary, which is cumbersome and may miss
     some of them, simply install all binaries starting with rtl88.


  Applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
>   package/linux-firmware/linux-firmware.mk | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 60e8861abe..7e1e5cf6f2 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -90,16 +90,7 @@ endif
>   # Realtek 88xx Bluetooth
>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
>   LINUX_FIRMWARE_FILES += \
> -	rtl_bt/rtl8812ae_fw.bin rtl_bt/rtl8821a_fw.bin \
> -	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
> -	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
> -	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
> -	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin \
> -	rtl_bt/rtl8851bu_fw.bin rtl_bt/rtl8851bu_config.bin \
> -	rtl_bt/rtl8852au_fw.bin rtl_bt/rtl8852au_config.bin \
> -	rtl_bt/rtl8852bu_fw.bin rtl_bt/rtl8852bu_config.bin \
> -	rtl_bt/rtl8852cu_fw.bin rtl_bt/rtl8852cu_config.bin \
> -	rtl_bt/rtl8852cu_fw_v2.bin
> +	rtl_bt/rtl88*_fw.bin rtl_bt/rtl88*_config.bin
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
