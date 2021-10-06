Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CBEC433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:57:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC4B61152
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCC4B61152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5FEB60675;
	Wed,  6 Oct 2021 20:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFT0-Zrp5nFx; Wed,  6 Oct 2021 20:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD19606A5;
	Wed,  6 Oct 2021 20:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121DB1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C8E40924
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ron52JbJWuM2 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C88AD4074D
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:57:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id p13so15134815edw.0
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MkM2lR3LOFBtrpC/uTC5wMTdNjtaqwG6SOSgKsnVVcw=;
 b=XYXsEswLYHkS93bc8M0DLaWe2yy8DV3cJbNKMzNVLrGLSgjyZYzn1QWYlfUaD8zetl
 xF1FrfAVdja7ZsfXyOrsc93AXIPkQzxmOzjUA+3gaVzD50pge/vVUORW8mSwy0fHLIKF
 17wSMv868tLmQZFt8UTLj1P9bzrlh7RMU+o9m0jwzLZxz7ejHdpj0Ohm/P20Hneokr91
 99uCh5P57VUpz24N2x+1ggE4tbUtUuZVUxyqkr8vne8wPqg/Lus1IYUd6SpMtFzEjwsL
 RHmGrsuu7l8I2fOOtz2h9DdEvwb90pfrdfIKWxGYhUiTQWwTp5thaDbu+egXvw9w8nCt
 d8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MkM2lR3LOFBtrpC/uTC5wMTdNjtaqwG6SOSgKsnVVcw=;
 b=DsKtZ00dZoSizoJtiDGeu2MVF9umZ1gZLZJE1vzkfIzQSgsjWpd1xdHrsQWjfUz8vZ
 dCXe+AN5m4x3haBA/ItcIj/3nfHXOrSrTOXDWzr80rbsCHBnbLwJwgVlEI/1WKm6/XBf
 E8GD8OkbG6lmnKVn/InX7QEIQnXQhhQ/E69h6fVmvST/NzI5a2ATHo6o6FmeOs2gxM7g
 YDybeAYE9hV1739ujJPFjJTZcNlyFxufJD82avxu0KaBJre20RB3fnKGEMCZkk9QLU6a
 LIo9Hmh4MUQhpEVSTDZPeWmOZWFJtHdqITnv3pGZ6XgqLKfHr7Ornzrz7DzHliPUstRP
 KGSQ==
X-Gm-Message-State: AOAM5333jDydiyyPGvzT/3RX86sywR4DnV1Y/Lwktnx4V9CTfX/+lPk2
 Dzv9yf9PEuYBh4GfUDDgQgG3rg==
X-Google-Smtp-Source: ABdhPJyZolu6+ueijcDGmaOf/OK2QNGazSVG1PRjLRwC+h1lb1LcyTU8K0XfdWKOpRisrRfLqEw03A==
X-Received: by 2002:a05:6402:1b92:: with SMTP id
 cc18mr624632edb.31.1633553841821; 
 Wed, 06 Oct 2021 13:57:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c6sm2621053ejb.41.2021.10.06.13.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 13:57:21 -0700 (PDT)
Message-ID: <2f76c008-c7e9-3cc3-e381-5fd413670d9f@mind.be>
Date: Wed, 6 Oct 2021 22:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, Takumi Takahashi <takumiiinn@gmail.com>
References: <20211003175446.3076312-1-takumiiinn@gmail.com>
 <20211006190922.5baf43b9@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006190922.5baf43b9@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: Support Device
 Tree Overlay
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 19:09, Peter Seiderer wrote:
> Hello Takumi,
> 
> thanks for suggested patch...., comment below:
> 
> On Mon,  4 Oct 2021 02:54:46 +0900, Takumi Takahashi <takumiiinn@gmail.com> wrote:
> 
>> Building the Raspberry Pi GitHub official kernel repository
>> will generate a Device Tree Overlay Blob files under
>> `$(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays`.
>>
>> This commit changes to install the Device Tree Overlay Blob file
>> generated during kernel build under the following conditions:
>>
>> - `$(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)`
>>    - `n`
>> - `$(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT)`
>>    - `y`
>>
>> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
>> ---
>>   package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
>> index 181650fa08..39962b3d70 100644
>> --- a/package/rpi-firmware/rpi-firmware.mk
>> +++ b/package/rpi-firmware/rpi-firmware.mk
>> @@ -30,6 +30,16 @@ else
>>   define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>>   	$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays
>>   endef
>> +ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
>> +# If you are using the official raspberry pi kernel, dtbo will be created under
>> +# the overlays directory, so use that.
>> +define RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
>> +	for dtbo in $(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays/*.dtbo; do \

  It is possible to use an upstream kernel that doesn't have this, and enable 
overlay support in the upstream kernel (i.e. using upstream overlays instead of 
the RPi hacks). In that case, this will fail with something like '*.dtbo: no 
such file or directory'.

  To fix that, use a make loop instead of a shell loop. Something like (untested):

	$(foreach dtbo,$(wildcard 
$(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays/*.dtbo),\
		$(INSTALL) -D -m 0644 ${dtbo} $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir 
$(dtbo))$(sep))

  Note that you also don't need the 'exit 1' any more because they're all 
separate commands.

>> +		$(INSTALL) -D -m 0644 $${dtbo} $(BINARIES_DIR)/rpi-firmware/overlays/$${dtbo##*/} || exit 1; \
>> +	done
>> +endef
>> +LINUX_POST_INSTALL_IMAGES_HOOKS += RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
>> +endif
> 
> I believe this is the wrong place to copy the linux-kernel generated overlays
> (as they are independent of the rpi-firmware package), a better place would
> be a BR2_ROOTFS_POST_BUILD_SCRIPT script...

  Indeed, if this feature would be added anywhere, it would have to be in the 
linux package, not in rpi-firmware. You'd need to add BR2_PACKAGE_RPI_FIRMWARE 
to the condition as well.

  I've marked the patch as Changes Requested in patchwork.

  Regards,
  Arnout


> 
> Regards,
> Peter
> 
>>   endif
>>
>>   ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
