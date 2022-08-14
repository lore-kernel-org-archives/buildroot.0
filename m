Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CB8C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C19260BB5;
	Sun, 14 Aug 2022 21:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C19260BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOK7qkgGNqva; Sun, 14 Aug 2022 21:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFA360A88;
	Sun, 14 Aug 2022 21:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFA360A88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53C311BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DA1B8289B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA1B8289B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoG82j_G0JUD for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070AA8281A
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070AA8281A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:51:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o22so7512144edc.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 14:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+TZ2XeL9HMcnBRPG0mVhMKdXw7lqvNsw1ugyWJJnTlM=;
 b=hgd4jTVgoFdCjKtPCXfKP4R/XZe9+9cYJQpP8/hLFntyuf/BZ3HcCXPLuHCv8h0F9t
 dgWCqWfAh9qN2B97DVWAIXqEcFAYexlwMu9FAVHUmcyY/xoctywPmQdCkVb+kt7bSJgg
 7f8rcEc0HRN6SQywsHJRaUpCeSEgZISDvUs/zupghP79s2BdCa6pXilyFlGGNoJPOVwJ
 ovGKJxAqNsc9Z5NeJLsHK0XdeGC3Ib1BZznrZFi4Vtg+PMN/sTYq/vA0VVxmWxWbpPfm
 h3QYx29d0Yg6CSj8tSLQcdUI1nSogPXcotVlfHMxkWvCshqvX2ZXSwLUsLT/ZZZyt52E
 qxKw==
X-Gm-Message-State: ACgBeo2SsvHFAuL65TUdy68Rlxq6JqT0Bq+rfjW375YNrOk/XpXuSD0M
 WqrJExb/1ncOnpIbUf7hpWbJ1g==
X-Google-Smtp-Source: AA6agR5wgEpo2vqg9lUeoa2targ+bhRPBBOXPNN0nZxoIt/HDFKLHx2NzQlcs6eOYkdil871OlAjEw==
X-Received: by 2002:a05:6402:43c6:b0:43d:79a6:4e32 with SMTP id
 p6-20020a05640243c600b0043d79a64e32mr11526639edc.281.1660513892229; 
 Sun, 14 Aug 2022 14:51:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fv35-20020a17090750a300b006fef0c7072esm3393236ejc.144.2022.08.14.14.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 14:51:31 -0700 (PDT)
Message-ID: <6e12f328-01e3-6120-7125-aa5f0ae00983@mind.be>
Date: Sun, 14 Aug 2022 23:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Michal Ciesielski <ciesielskimm@purelymail.com>, buildroot@buildroot.org
References: <20220811210103.kbygtc3h5ffwuhsx@purelymail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220811210103.kbygtc3h5ffwuhsx@purelymail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=+TZ2XeL9HMcnBRPG0mVhMKdXw7lqvNsw1ugyWJJnTlM=;
 b=h7nbouO6b/QuKf9PYiJUFfORLXJ3T4+u1cJScGDbB7y2TrXHHodpqOxhOnNmAZ/hch
 pZhrJo97LhO4rgw/KJdY2ni3r70fxHrzIj8in4pXE7pPvdUAp7+WUHKQJ2Vi3O9bo9pS
 0sjfHmWrfVlhh6vfuv/1lOVWHWZYZPXMtA/WLtOn3ZJnoEQjHarAxOUOx3JqehFJMHBk
 oxSG7Mab2Y84FQZxFyMERtpC82ZeAkOaYnwd+HmHH92m3xKDFeUo2Z10J9o6C6yHQ0IJ
 b7OLuX+baRBFFc8AAWdHh3UUKitQaOmcS4MYwjVOhuIooFvMQITEI9YjbRl/dxQSLQPN
 B1Fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h7nbouO6
Subject: Re: [Buildroot] Unable to build for Banana Pi M2 ZERO - _libdft
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/08/2022 23:01, Michal Ciesielski via buildroot wrote:
> Hello
> 
> I'm trying to build bananapi_m2_zero_defconfig. I'm hitting the following problem:
> 
>    OBJCOPY spl/u-boot-spl-nodtb.bin
>    COPY    spl/u-boot-spl.bin
>    MKSUNXI spl/sunxi-spl.bin
>    BINMAN  u-boot-sunxi-with-spl.bin
> binman: No module named _libfdt
> make[1]: *** [Makefile:1348: u-boot-sunxi-with-spl.bin] Error 1
> make[1]: Leaving directory '/home/mc/gits/buildroot-2022.05.1/output/build/uboot-2019.01'
> make: *** [package/pkg-generic.mk:293: /home/mc/gits/buildroot-2022.05.1/output/build/uboot-2019.01/.stamp_built] Error 2
> 
> Before that problem I see the warning:
> 
> /home/mc/gits/buildroot-2022.05.1/output/host/lib/python3.10/site-packages/setuptools/dist.py:530:
> UserWarning: The version specified ('u-boot-2019.01') is an invalid version, this may not work as
> expected with newer versions of setuptools, pip, and PyPI. Please see PEP 440 for more details.
> 
> Looking at the path it seems it's using Python3. Looking at the description here https://lists.denx.de/pipermail/u-boot/2017-October/308661.html.
> it seems this would be solved by using Python2. I found the option BR2_TARGET_UBOOT_NEEDS_PYTHON2
> but this seems to be legacy option.
> 
> Is this a Buildroot problem or is it me? Any idea how to make this work?

  It's a Buildroot problem in the sense that we removed python2 support 
completely, but U-Boot 2019.01 still needed python2.

  The typical solution is to update U-Boot. A patch that does that for 
bananapi_m2_zero_defconfig would be very welcome! Failing that, we're just going 
to remove the defconfig in the upcoming 2022.08 release [1].

  Regards,
  Arnout

[1] https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/

> 
> Thanks, Michal
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
