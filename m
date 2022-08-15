Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA97C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365DE41807;
	Mon, 15 Aug 2022 16:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365DE41807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KncuCgninDLh; Mon, 15 Aug 2022 16:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF9241916;
	Mon, 15 Aug 2022 16:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEF9241916
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 753081BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D4B182486
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4B182486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClTQzn0qrdlC for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F75813BD
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8F75813BD
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:37:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id j8so14420499ejx.9
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=AVfD5+h87JfGsSgLFiqd7nNc0u+Bi+8O8vM3qVu/nWM=;
 b=1Qys+NZmE6TH6jbO57Xxs7VamkC12TQ1xzXjgjKYTAg8+XXuC4XcDGkj0Ft3Trqw7m
 F/6VGAJuh38Rky/vDWatDXNKexXLfkbkauVKfhkyPYUSK7ZVYWwxli9s35r0HBszc9th
 SX7mIv1Ep655UVy26dc6Wl0Lq9AxeJkQBO+e0S/i2ZafcO4ZCSqPgYfKxbouqqa6V/ie
 wq2hNd4hbW3xOVxN5viuYlRofvbhSOR8ptl1D3Qav9tAgds44Epct5Yo30gI2RHZZTY0
 EdyXZ7cSgPQYSM93JoYRisWKpjbembj4e2OD77EpBCD72AEi9sjueS+ihkjm2xlrmOiF
 KShw==
X-Gm-Message-State: ACgBeo1A4VJOOLwc84SdRKFo5Rp+oXU5w+92RUj/OhvqGCTVsCc3A8U2
 j8ghAUUmLOmIcMZqT6Q8kNDbMyGxZMsqU60U
X-Google-Smtp-Source: AA6agR6mzehTgXG6XTckw466YSUSeTw7zOFJ0UvZDl0yTnza4xRC6nItvpQ4rXySfU8rvtR+LYCblA==
X-Received: by 2002:a17:907:738a:b0:730:7537:848c with SMTP id
 er10-20020a170907738a00b007307537848cmr10954926ejc.488.1660581454999; 
 Mon, 15 Aug 2022 09:37:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a170906148c00b00730a1c73288sm4252390ejc.49.2022.08.15.09.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:37:34 -0700 (PDT)
Message-ID: <9046cd29-f215-8393-6447-1c19193866b9@mind.be>
Date: Mon, 15 Aug 2022 18:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815111710.1459820-1-arnout@mind.be>
 <20220815111710.1459820-2-arnout@mind.be> <20220815130513.GX2854108@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220815130513.GX2854108@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=AVfD5+h87JfGsSgLFiqd7nNc0u+Bi+8O8vM3qVu/nWM=;
 b=TlAYDhhmYPwDgS7EGsIvDwfVgSc7NqIsx20ctz+CTmj0KAfCiuQypbRrfaNY1qOBGa
 RfpkxQNWmLCLu5PNjH4JXusfJJmD1msrro6q2A31S5LgI2S6ZvKdST2x0vgMVUSZ8hHZ
 HLh8FFQs8ZS5Bc2APsuJKfy7iUdY5r3ZZr6CyzcElNU8k0WF9YMpscTEDBuG7gaVWFaR
 FCIIpysW1enWH3e0vT2gQbhzhTZ05NX3q8kkVAkp4hooVCOi0YYSwsdsmrkYsJh5bGL9
 yhT7eX1SFt+EhJzFi7I9V7JOYyNRJhNlKnAyYDTLSroMYum1N2zHPDZNr3Hmvw4/3mcA
 P+rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TlAYDhhm
Subject: Re: [Buildroot] [PATCH next v5 2/3] fs/cpio: new option to use
 dracut tool
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 15:05, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: Thierry Bultel <thierry.bultel@linatsea.fr>
>>
>> Adds an option to invoke the dracut host tool, providing
>> a configuration file, instead of having a full cpio archive
>> of the whole target directory.
> [--SNIP--]
>> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
>> index c1151a2881..de83aaad65 100644
>> --- a/fs/cpio/Config.in
>> +++ b/fs/cpio/Config.in
>> @@ -7,6 +7,40 @@ config BR2_TARGET_ROOTFS_CPIO
>>   
>>   if BR2_TARGET_ROOTFS_CPIO
>>   
>> +choice
>> +	prompt "cpio type"
>> +	default BR2_TARGET_ROOTFS_CPIO_FULL
>> +
>> +config BR2_TARGET_ROOTFS_CPIO_FULL
>> +	bool "cpio the whole root filesystem"
>> +	help
>> +	  Build a cpio archive containing the whole the root filesystem.
>> +
>> +config BR2_TARGET_ROOTFS_CPIO_DRACUT
>> +	bool "Invoke dracut to make a partial initramfs"
>> +	select BR2_PACKAGE_HOST_DRACUT
>> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> 
> As seen on IRC, host-uboot-tools are not required just for dracut.
> 
>> +if BR2_TARGET_ROOTFS_CPIO_DRACUT
> 
> Empty line after an 'if'...

  That was kind of intentional, to make it more clear that the condition is just 
around this one symbol. But perhaps it would be better to turn it into a depends 
on instead.

> 
>> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
>> +	string "dracut configuration file"
>> +	default "fs/cpio/dracut.conf"
>> +	help
>> +	  Dracut configuration file. It determines which parts of the
>> +	  rootfs get included in the cpio image. See dracut.conf(5) or
>> +	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
>> +
>> +	  The default configuration file is suitable for busybox init.
>> +	  It doesn't, however, pivot_root into a full rootfs.
> 
> ... and before an 'endif'.
> 
>> +endif
>> +
>>   choice
>>   	prompt "Compression method"
>>   	default BR2_TARGET_ROOTFS_CPIO_NONE
>> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
>> index 81f8c393d1..b62d804ad8 100644
>> --- a/fs/cpio/cpio.mk
>> +++ b/fs/cpio/cpio.mk
>> @@ -36,6 +36,8 @@ ROOTFS_CPIO_DEPENDENCIES += host-cpio
>>   ROOTFS_CPIO_OPTS += --reproducible
>>   endif
>>   
>> +ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
>> +
>>   define ROOTFS_CPIO_CMD
> 
> We customarily do not define the _CMD (or _CMDS) conditionally. Instead,
> we define conditional macros, and we expand them all in an unconditional
> _CMD (or _CMDS) macro.

  That would be weird in this case - you'd have something like

define ROOTFS_CPIO_CMD
	$(ROOTFS_CPIO_CPIO_CMD)
	$(ROOTFS_CPIO_DRACUT_CMD)
endif

but the two are mutually exclusive... In this case, IMHO it's much more logical 
to define the _CMD directly in the two conditions.

  I'm not going to look for an example, but I can imagine that we do do 
something similar for _INSTALL_TARGET_CMDS when there are two completely 
different installation processes depending on a config option.

  OK, I was stubborn and did look for an example: imx-mkimage.


>>   	cd $(TARGET_DIR) && \
>>   	find . \
>> @@ -44,6 +46,37 @@ define ROOTFS_CPIO_CMD
>>   	> $@
>>   endef
>>   
>> +else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
>> +
>> +ROOTFS_CPIO_DEPENDENCIES += host-dracut
>> +
>> +ifeq ($(BR_BUILDING):$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
>> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
>> +endif
>> +
>> +ifeq ($(BR2_LINUX_KERNEL),y)
>> +ROOTFS_CPIO_DEPENDENCIES += linux
>> +ROOTFS_CPIO_OPTS += --kver $(LINUX_VERSION_PROBED)
>> +else
>> +ROOTFS_CPIO_OPTS += --no-kernel
>> +endif
>> +
>> +define ROOTFS_CPIO_CMD
>> +	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
>> +
>> +	$(HOST_DIR)/bin/dracut \
>> +		$(ROOTFS_CPIO_OPTS) \
>> +		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
>> +		--sysroot $(TARGET_DIR) \
> 
> Hrmm.. --sysroot is misleading in our situation.

  Well, that's the name of the option, what are we going to do about it?

> Also, it can be spelt
> -r so our wrapper must also cope with it (in case it is called from a
> post-image script).

  Arg good catch!

  And annoying GNU getopt extension allows both -rfoo and -r foo so it's even 
more complicated :-/


  Regards,
  Arnout

> [--SNIP--]
>> diff --git a/fs/cpio/dracut.conf b/fs/cpio/dracut.conf
>> new file mode 100644
>> index 0000000000..6184457723
>> --- /dev/null
>> +++ b/fs/cpio/dracut.conf
>> @@ -0,0 +1,93 @@
> [--SNIP--]
>> +"
>> +
> 
> Spurious emoty line at EOF.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
