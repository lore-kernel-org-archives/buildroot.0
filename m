Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3141CE95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B812C60F0A;
	Sun,  8 Oct 2023 09:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B812C60F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sp9zdxCQ5Ulk; Sun,  8 Oct 2023 09:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C3B60E85;
	Sun,  8 Oct 2023 09:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2C3B60E85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA391BF3D9
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 09:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74D94159C
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 09:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74D94159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZPvOzp0KPXg for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 09:40:16 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47FF7400E1
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 09:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47FF7400E1
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b2cee55056so652631566b.3
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 02:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696758014; x=1697362814;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LULAenMoYOvd+tMV6GtpzJT2A6OVVXEhbTwPV4WA66Y=;
 b=gsodzy15yPzxXJvY035j8LFw4FM4cKS/aPBf0dVTGzFIGRQptJoCytrwYMHhBPVbk1
 GYb3ZM1j36kJsfLu9uq+tbN4+Pt640hpcEf3tmePvC533cVDp5sVYM71QcW/ZDw60vcu
 qkD4WfPINZvthWIHyAnNsOJ3fhbQ1/hrjXFBG2cfD3PjzyUUfFbJ6NGNiNnbaZiyqAQ2
 SGuzGGS0OptEBLz7ngiGOE4T9xXksikPBQqmUTVOOJ6noWitp3K/fboQ/JKO9f5P8hSm
 84DIRGImcdJ/RKtQfh/FyO6hAETByWexrqbD9o9kDKIT5+uyv9aBUHbUERbuETyhl5Ea
 vJhQ==
X-Gm-Message-State: AOJu0Yy26xJZnKkQ09eU8sAd2dm2KhX7p9SEO9Hyy6UW6sjD2H3WqgUR
 HTJhFr9QNiktgUWb/S0y/TcHPA==
X-Google-Smtp-Source: AGHT+IG4RCkCjaJK5R2mpyRkTF0GfvPRfWduz4mIC6wKSW+uWnrqmLJyOzvaJeCYIKmqC2wT1Zbp5A==
X-Received: by 2002:a17:906:5342:b0:9ad:ef08:1f32 with SMTP id
 j2-20020a170906534200b009adef081f32mr11700044ejo.37.1696758014024; 
 Sun, 08 Oct 2023 02:40:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a1709061d0200b009a0955a7ad0sm5256695ejh.128.2023.10.08.02.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 02:40:13 -0700 (PDT)
Message-ID: <3e9f019b-a8ad-e856-3ed9-6fec0c119f83@mind.be>
Date: Sun, 8 Oct 2023 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
 <20231007193422.GG2552@scaer>
In-Reply-To: <20231007193422.GG2552@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696758014; x=1697362814; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LULAenMoYOvd+tMV6GtpzJT2A6OVVXEhbTwPV4WA66Y=;
 b=ZG5vNCu+Ucf03oiLrMmAfXjajZSaeg1I2pD607rqjHM4MaBagEqBbdY0SwlHyba5x3
 cHDIwKOZQ6Wtg77qrLNbHwD9R0iwlblkS5zulpvKqdFoistSEpVK5a4uJ/QeOqFMdYrr
 ph3lecrCcaiHj8wFpOa0Eiq056uqut4oKfMC7rf4phUSlyz9SgV7prCNa3rYo1HTj8M7
 BR7kaUrBwJGqK29ga2/owjg2Ag8ueml7e8CUQxdzjUq0aER/OsE+CtZLX5elJIkb+3H8
 LoglqwpTiKwSAo+TnlMiIscpkimFfgbvavP5qxSOcPs+mv/yvk9n4Rz4fyk6czwH4IF7
 D4hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZG5vNCu+
Subject: Re: [Buildroot] [PATCH v2 1/2] package/refpolicy/Config.in: force
 merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2023 21:34, Yann E. MORIN wrote:
> Adam, All,
> 
> On 2023-10-07 20:19 +0200, Adam Duskett spake thusly:
>> Refpolicy contexts expect a merged /usr file system. In fact, there
>> are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
>> wants to go through the trouble of creating a policy that works with a
>> non-merged system, they should be free to do so. As such, only select
>> BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>>
>> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>> ---
>>   package/refpolicy/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
>> index 0e72b895df..f1f3c7e64d 100644
>> --- a/package/refpolicy/Config.in
>> +++ b/package/refpolicy/Config.in
>> @@ -36,6 +36,7 @@ choice
>>   
>>   config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>>   	bool "Upstream version"
>> +	select BR2_ROOTFS_MERGED_USR
> 
> I wonder if this is the proper solution. I would have rather though of
> depends on rather than select:

  I agree. I don't think anything in the system/Config.in menu should be 
select'ed by packages.

  Currently we do select BR2_TARGET_TZ_INFO, and I'm not even sure if that is 
such a good idea.


>      diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
>      index 0e72b895df..c413c1244b 100644
>      --- a/package/refpolicy/Config.in
>      +++ b/package/refpolicy/Config.in
>      @@ -32,13 +32,17 @@ if BR2_PACKAGE_REFPOLICY
> 
>       choice
>       	prompt "Refpolicy version"
>       -	default BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>       +	default BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION if BR2_ROOTFS_MERGED_USR

  This is not great however... If merged /usr is not selected, it will default 
to git, which is not exactly a good default. But there's not much we can do 
about that I guess.

  Regards,
  Arnout

> 
>       config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>       	bool "Upstream version"
>      +	depends on BR2_ROOTFS_MERGED_USR
>       	help
>       	  Use the refpolicy as provided by Buildroot.
> 
>      +comment "upstream refpolicy needs merged /usr"
>      +	depends on !BR2_ROOTFS_MERGED_USR
>      +
>       config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
>       	bool "Custom git repository"
>       	help
> 
> Not totally sure either ways, though...
> 
> Regards,
> Yann E. MORIN.
> 
>>   	help
>>   	  Use the refpolicy as provided by Buildroot.
>>   
>> -- 
>> 2.41.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
