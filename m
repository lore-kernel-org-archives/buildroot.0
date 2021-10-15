Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBAFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F5C611C8
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46F5C611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E1340806;
	Fri, 15 Oct 2021 21:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgfVQxSEJ0-N; Fri, 15 Oct 2021 21:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7540C407FC;
	Fri, 15 Oct 2021 21:16:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75AF11BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65355407FC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lw4bK17H-qOi for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:16:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B035B40471
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:16:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ec8so43086921edb.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U+WErpeF4HKxPkSGfGUuzxB35BZS1+KnapqGWiK74Ow=;
 b=QHB6q+2MP0vADk17v2RsXB2aKR4n2Fekh/lCSB2bXD+yCohwMvHz6TE0FSmOGRFgfA
 XtWOg4vzwapY7TPfWGGb7DfMIVZ9imqFskTjO27vPoHyKox38f/ldnd+kbhAuS1S5sTM
 O6LQP3c9CKE1OXls55abhPkIN5ZoM1SKg2TycVO10d7UNZa2DTooYKa7ejzMuvq7QMCU
 nkmfvor18+HlwsYpDNkyz0UGzHfHoWrMTYuDzmagEP6LNz6SldugpwLvmwpA2jBACwtz
 IdnkVbZoXeKyrpMx76ZiQ4xo3q403jhGq5lqTdKcszwMdmUL8g+bcZI4AsPFQkHF6amT
 +pvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U+WErpeF4HKxPkSGfGUuzxB35BZS1+KnapqGWiK74Ow=;
 b=QFz+N7nJH9KG9yiJFA+5Q8Ct2kFLeJTFbc5nFFQteIjBh8tv1t/t6RZ5HjqVN29bjK
 BrH+ZVof6GwljEBw+B14jr1VKfV+IwUszMyW6zGmumadvFpoFPo216cY4QBr6TO2T2km
 53r3PlcAdpL4IN272QylvZ1aGTs5IVZ8csurVl/D8gOLpzWUCKzxgJ/JjV6VdBGPyBTx
 4i+TfIfQNCvsXFHSpudN6ixzf3jEqOE/gbitgFOsiWHWEkWXqwfEaG+3gZxe4IOiM6Bv
 4+KwaFBJ2VyK8jlz20+2NEewhBkqPsCe3jn+RZeKzFTh0PoxLcDV18pBuCx0cQxJLCxN
 YUXQ==
X-Gm-Message-State: AOAM5321vAlA3ZFs2CvczYqXuhqHlO0z1W0in+ByRb+kzIzYq3zREdjB
 q6HXWT/kw0CE5F0hBiN9q7zw/A==
X-Google-Smtp-Source: ABdhPJyvAo9rHJW16+dTtBJ3/Z+4tHwtHyV93Z8woBHCUDOZLU822mxKNj/XAV7qVhBC7Tvw/CBa9A==
X-Received: by 2002:a50:cf4c:: with SMTP id d12mr20468099edk.115.1634332596839; 
 Fri, 15 Oct 2021 14:16:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f12sm4333992ejl.5.2021.10.15.14.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:16:36 -0700 (PDT)
Message-ID: <d3c41c38-9677-e40e-9be3-fe6ebe0acf04@mind.be>
Date: Fri, 15 Oct 2021 23:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Vyacheslav Bocharov <adeep@lexina.in>, buildroot@buildroot.org
References: <20211012143653.830644-1-adeep@lexina.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012143653.830644-1-adeep@lexina.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/armbian-firmware: bump to
 commit a1df8ab2ffbac51a8260905dd841bf825cf1bc53
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 16:36, Vyacheslav Bocharov via buildroot wrote:
> Update package/armbian-firmware to latest commit.
> Add config options for AP6255 and Realtek 8822CS WiFi/BT combo chips.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/armbian-firmware/Config.in            | 10 ++++++++
>   .../armbian-firmware/armbian-firmware.hash    |  2 +-
>   package/armbian-firmware/armbian-firmware.mk  | 23 ++++++++++++++++++-
>   3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
> index 7c5f6ba193..7fb654b6d5 100644
> --- a/package/armbian-firmware/Config.in
> +++ b/package/armbian-firmware/Config.in
> @@ -18,6 +18,16 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6256
>   	help
>   	  Firmware files for AP6256 WiFi/BT combo chip.
>   
> +config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255
> +	bool "AP6255 WiFi/BT"
> +	help
> +	  Firmware files for AP6255 WiFi/BT combo chip.
> +
> +config BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS
> +	bool "Realtek 8822CS SDIO WiFi/BT"
> +	help
> +	  Firmware files for Realtek 8822CS SDIO combo chip.
> +
>   config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
>   	bool "XR819 WiFi"
>   	help
> diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
> index ceefafd97c..16bc1a2978 100644
> --- a/package/armbian-firmware/armbian-firmware.hash
> +++ b/package/armbian-firmware/armbian-firmware.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  a370a6aeb30f12a17f8d47c81a4d81aa822b9408589305a4d6a67d544280520d  armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e-br1.tar.gz
> +sha256  2e61dc5e43f6011868417504f6633e6de6c220ee48fba3b58823e4ce33a6b933  armbian-firmware-a1df8ab2ffbac51a8260905dd841bf825cf1bc53-br1.tar.gz
> diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
> index 0ed069025d..5974d4428d 100644
> --- a/package/armbian-firmware/armbian-firmware.mk
> +++ b/package/armbian-firmware/armbian-firmware.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ARMBIAN_FIRMWARE_VERSION = 70a08503ac9e765f5d1ccf4fa3e825db0751e53e
> +ARMBIAN_FIRMWARE_VERSION = a1df8ab2ffbac51a8260905dd841bf825cf1bc53
>   ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
>   ARMBIAN_FIRMWARE_SITE_METHOD = git
>   
> @@ -21,6 +21,27 @@ ARMBIAN_FIRMWARE_FILES += \
>   	brcm/brcmfmac43456-sdio.txt
>   endif
>   
> +# AP6255 WiFi/BT combo firmware
> +ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6255),y)
> +ARMBIAN_FIRMWARE_FILES += \
> +        BCM4345C0.hcd \
> +        fw_bcm43455c0_ag.bin \
> +        fw_bcm43455c0_ag_apsta.bin \
> +        fw_bcm43455c0_ag_p2p.bin \
> +        nvram_ap6255.txt \
> +        brcm/brcmfmac43455-sdio.bin \
> +        brcm/brcmfmac43455-sdio.clm_blob \
> +        brcm/brcmfmac43455-sdio.txt \
> +        brcm/config.txt
> +endif
> +
> +# Realtek 8822CS SDIO WiFi/BT combo firmware
> +ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_RTL8822CS),y)
> +ARMBIAN_FIRMWARE_FILES += \
> +	rtlbt/rtl8822cs_config \
> +	rtlbt/rtl8822cs_fw
> +endif
> +
>   # XR819 WiFi firmware
>   ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
>   ARMBIAN_FIRMWARE_FILES += \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
