Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D285BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8939840262;
	Sat, 12 Feb 2022 20:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Md6p-Gtk-XDA; Sat, 12 Feb 2022 20:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2A240259;
	Sat, 12 Feb 2022 20:44:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4D181BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C111660A70
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0g9q1TjGMhE for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:44:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8258660644
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:44:33 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d10so29539722eje.10
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nXk+8+/fYcphSCAp4mYo72EhgoHx+jRxyLutyE33ClE=;
 b=L2ymgAPQDqdWAjgUQTSUOYPIJw+3C33uKLF4C/mBdonVOYIRCZywx7VYNhogWFlU53
 7NKXqsqj4t/Fucfryra5tx9lv9S8w7NKwgF1T5V2pzfg91uDGCweH/JCMZ+H6i+X26ot
 t01FYX5eM2zUJcSeahC1+f8h9Sxahe1frPGlzSclWfJCPGow6hXj8LI8QT0LTbDsaua4
 9MP4gFjN/0CznsWiODkbRiduaD3POtodj0ivJLZ8/FhwP0WedhdvWhVrv/cdgk7lEo2O
 XihLl9mpaeFf993juQItm3QrzDRUS9845XfBstZnYWW4FQBtV3ovNPdOwI85NBHb4qzY
 ZppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nXk+8+/fYcphSCAp4mYo72EhgoHx+jRxyLutyE33ClE=;
 b=U0+ywQyH7xCI4oheasWHY/Zqd4Ws6D3PczCvnaCAOsW1mgYcwTn+7pzTT8TkYHkprj
 43GxU73kPqjcUbdKbyBOnqs1qq0urG4rcJO1X2JJ7f55Yz93DKs8qo+Nx5wyTh6BacLH
 ctXeypIqHo68qdZOTftxGShMxixaMRkWQ2ENSmx481GAApE0sKbpcP8EsDFRHU6TMSlr
 9yTMLdMarWD51oNdsNNbvbnl2xNH1KfiNvvoxUzS3calOYzAVIDUn+zoND2bE+FkgFKM
 LXEPOpo/wkK1nq27SZLlv713T2QRCxwyNi4YqlOfG5L22aLC5kd3dBFASR8e4WFkk99b
 0LHg==
X-Gm-Message-State: AOAM532yY9YDHna6vCMzRkjw0Vaoyof0ELMcr2Y9vS9Bn1D1OM7O9y6T
 x4j5Yzl2IhwOB+O9s+wAaokQVAxJcVZISA==
X-Google-Smtp-Source: ABdhPJz/ZY4M5jtdfvnq2PGAk2VmaF7tiMgIvJNM2ms8ZScwwyou/LpLPL/+2rsqbN4ZJK+MFLMGIQ==
X-Received: by 2002:a17:907:f9c:: with SMTP id
 kb28mr5650494ejc.213.1644698671795; 
 Sat, 12 Feb 2022 12:44:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jz17sm9070955ejb.195.2022.02.12.12.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:44:31 -0800 (PST)
Message-ID: <b670a993-4703-eac4-41fe-dd493fe1c4de@mind.be>
Date: Sat, 12 Feb 2022 21:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20220129140831.1284832-1-michael@amarulasolutions.com>
 <CAOf5uwmwoVsqZ45hduVNyLWKGJMkah1w3TFW=DuN1RKbj2Kg2g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAOf5uwmwoVsqZ45hduVNyLWKGJMkah1w3TFW=DuN1RKbj2Kg2g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/freescale-imx: Add installation of
 easrc-imx8mn.bin firmware
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2022 11:13, Michael Nazzareno Trimarchi wrote:
> Hi
> 
> On Sat, Jan 29, 2022 at 3:08 PM Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
>>
>> The easrc firmware is used for audio resampling. The firmware for now
>> exists only for imx8mn device
>>
>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>> ---
>>   package/freescale-imx/firmware-imx/Config.in       |  4 ++++
>>   package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
>> index df266fb28e..06c4d8036c 100644
>> --- a/package/freescale-imx/firmware-imx/Config.in
>> +++ b/package/freescale-imx/firmware-imx/Config.in
>> @@ -39,6 +39,10 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
>>          bool
>>          default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>>
>> +config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW
>> +       bool
>> +       default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>> +
>>   config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW
>>          bool
>>          default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> index 3acd053d0f..211a43c4ca 100644
>> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>> @@ -113,6 +113,17 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
>>   endef
>>   endif
>>
>> +#
>> +# EASRC firmware
>> +#
>> +
>> +ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
>> +define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
>> +       mkdir -p $(TARGET_DIR)/lib/firmware/imx
>> +       cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
>> +endef
>> +endif
>> +
>>   #
>>   # EPDC firmware
>>   #
>> @@ -160,6 +171,7 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>>   endef
>>
>>   define FIRMWARE_IMX_INSTALL_TARGET_CMDS
>> +       $(FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW)
>>          $(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
>>          $(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
>>          $(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)
> 
> 
> Is something missing here?

  No, it's just that patches that are not reviewed or version bumps or fixes can 
take a long time before they get applied, because there's such a huge stream of 
incoming patches.

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> 
> Michael
>> --
>> 2.25.1
>>
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
