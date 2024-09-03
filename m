Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB074CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 778654029C;
	Tue,  3 Sep 2024 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c52fX3UVIlZv; Tue,  3 Sep 2024 21:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202E1402A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202E1402A7;
	Tue,  3 Sep 2024 21:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 641B51BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E1EA402E1
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQUJM80ljhPD for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5764940211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5764940211
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5764940211
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:06:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec13so31967885e9.0
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725397576; x=1726002376;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N9HsbH6UYrN+926/tJsQ1eABiXPf+BfzziX0G4Ip79Q=;
 b=R1SHQ43BcaOngJ1LNtIoXlNTPnLVFS+eBrJCxSIjbj8F7ZLXPiM+Vx6L7JLjzIorPY
 jcW8asDo01LKBiBKemPtalmDhIPVb5uXyChkNI7DN+GWQRB/qIodc71yTUgGOII+/ySq
 bXlp+dI0eRRn6iM19IIwEBCqQCTmGZ0U4iER4MsBjjOprL2e5Ie+Wd+bx101BylI9qub
 Pw7HnjvWty8fXgrMz0kRrtVJhD/AK0nz9TFT7Zij+77+Olt7IsohSWU5YnmjwK/GUYf2
 O9O2071g3owuGaoH5GcQvm2zeYhXhR13GegtwjeqcD8Rboy/MBw7dvKhSjUS+oYTH1Ny
 wyoA==
X-Gm-Message-State: AOJu0YxgBelEgJ2BG3gTqc6XRSvbv7N6KN0xqzNcohMzXtGZvE1Xe1WZ
 8pAhS4cofebqoDYIEULbj1jEryBxa3tWBUeJt1qZ7DzOVbwckwU1vAHUza9nPNs=
X-Google-Smtp-Source: AGHT+IHyOSIsZv9sUoG9VCQlvaKvX+YTCY0Zbpzrixyrc7PC6Z9VMAvjlw9HP1fKXZ5GZDw8QUucJw==
X-Received: by 2002:adf:a448:0:b0:374:c61a:69b8 with SMTP id
 ffacd0b85a97d-374c61a6a38mr5622317f8f.15.1725397575849; 
 Tue, 03 Sep 2024 14:06:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6f9b584sm180933215e9.16.2024.09.03.14.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:06:15 -0700 (PDT)
Message-ID: <317c4a83-974e-4a46-9711-f9f82f0fb1b3@mind.be>
Date: Tue, 3 Sep 2024 23:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf> <Ztdp2oxw8KKyKfJv@ryzen.lan>
Content-Language: en-GB
In-Reply-To: <Ztdp2oxw8KKyKfJv@ryzen.lan>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725397576; x=1726002376; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9HsbH6UYrN+926/tJsQ1eABiXPf+BfzziX0G4Ip79Q=;
 b=ewghTLchF/cyGezjpe6XYSuB4nXMM2it+2EIQmcsCqIve4JBJSdLykMekotW+JNomF
 DoY2HjFJ/neJSJ/xRIFXW22C5TjAnaj05bAJqMbsl4pEa66NU2FfZHefTjKnqh+E/M1O
 gRaJ/LrlTxBTjBwCYsY18UN/kF4bIjaX1I32LF0N3F2/pjFVF6aXDrR2hjNtRwf7Y7bJ
 JoAY5utF5HFyjw5HP6tmAzUuUdsyff717+tlXqrHGyu0UtmhWSCUcqjWq3V9lcSldRLd
 AhmXoP5GjCQsU3wpTfdI6+6FehfXiaO+ne+Qtq+eNkBBB/dZ/2b4h0p7INfmZ+DCUDi/
 ge+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ewghTLch
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/09/2024 21:56, Niklas Cassel wrote:
> On Tue, Sep 03, 2024 at 09:26:11PM +0200, Thomas Petazzoni wrote:
>> On Mon,  2 Sep 2024 12:44:31 +0200
>> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
>>
>>> From: Niklas Cassel <cassel@kernel.org>
>>>
>>> The arm64 defconfig enables both the R8169 Ethernet driver and the
>>> PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
>>>
>>> Enable udev so that these modules will get automatically loaded by udev
>>> after the rootfs is mounted from the SD card.
>>>
>>> This way, we do not need to build these modules as built-in, and we also
>>> get the benefit that any device plugged in to the PCIe slot will get
>>> automatically loaded.
>>>
>>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
>>
>> I'm not sure what we want to do here, especially when this ends up
>> needing net.ifnames=0 that you add in PATCH 4/5.
>>
>> We do have already a small number of defconfigs that enable eudev. So
>> far we only use net.ifnames=0 in 4 configurations.
>>
>> Basically, I'm trying to make sure we remain consistent and have a
>> policy that applies to all defconfigs rather than ad-hoc solutions that
>> are different for each and every defconfig. That's why I'm a bit
>> reluctant with applying your patches as-is because they only solve the
>> specific case of this defconfig, in a specific way, without creating a
>> clear rule that all defconfigs meeting a specific situation should
>> follow.
> 
> (Replying with the email that I have subscribed to the list this time.)
> 
> 
> An alternative to specify net.ifnames=0 on the kernel command line
> (to disable udev predictable NIC names), is to create an empty file:
> /etc/udev/rules.d/80-net-name-slot.rules

  Well, I think Thomas' comment was primarily about whether we should enable 
eudev and dynamically load modules rather than using builtins.

  Passing net.ifnames=0 is probably the easiest way to disable predictable NIC 
names. Only, it's surprising that we have something like 25 defconfigs that 
enable eudev, but only 4 of them enable that option... We should preferably have 
one "normal" way that this is done.


  What is BTW not clear to me is _why_ you don't want predictable names. What's 
wrong with BR2_SYSTEM_DHCP="enp0s31f6"?


  Regards,
  Arnout

> 
> See:
> https://wiki.gentoo.org/wiki/Udev#Optional:_Disable_or_override_predictable_network_interface_naming
> 
> I guess we could modify package/eudev/eudev.mk and package/eudev/Config.in
> to create a new BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES Kconfig which we
> default to "not set".
> 
> If BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES is "not set", we install/touch
> /etc/udev/rules.d/80-net-name-slot.rules in the target rootfs.
> 
> That would avoid the need for net.ifnames=0. We could also remove it for
> the existing boards that have it set.
> 
> Any board that actually wants predictable NIC names can set the new
> BR2_PACKAGE_EUDEV_PREDICTABLE_NIC_NAMES Kconfig.
> 
> Thoughts?
> 
> 
> Kind regards,
> Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
