Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0444FC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69AD14030F;
	Tue, 23 Aug 2022 19:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69AD14030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUSGJDYWjIYo; Tue, 23 Aug 2022 19:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4C540881;
	Tue, 23 Aug 2022 19:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4C540881
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547BA1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2853E81819
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2853E81819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iL4oUlFNOmTp for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62341817D3
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62341817D3
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:20:33 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a22so19273743edj.5
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 12:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8mKBaJWcCM3eJbPn+wKAPbYBNjFE04WgWcwRsw0Wxio=;
 b=DoCTaHrIwTKZOhv39vVMjNWSK6pCNWY5FXjOeW/9lMiibldxD1iKY2OP/w/Bqj19xU
 HHGcpkh1fIwtUoA761qHDMbm5a0A5JgeWEXMKZRlXeGduGrT5OASaflfBosAjPEuhfnH
 +/+blqJ7D+8jwiWy9S6Tm7T3Azlt5tB68ybSlWEYQp/DH7GNV90fELJC6qCTCa4d3zye
 rNX0CNYgj154PdmKppHmzl/pW7tHdi3P/B3SUHfc6ci/yFN+vCr9/TI0SVi+JfEQ6lCA
 nuVNtXzGJ+ZS3Am6QKsM/TOw0F2w7vS2GNZSxQooXn49RMJ+aEgjXZBjhtFIn+AGeMXO
 2jMQ==
X-Gm-Message-State: ACgBeo2AabinRfhbAkMlofLvYXWI1qy9gp/2ffnzv9jObS0hSUDwVgjg
 4wVSyF7uMkXHM3eV6ETRyW1ZuA==
X-Google-Smtp-Source: AA6agR6b7z3dlci4bf8TP3U4ex3Tfa8RR51uJrQs5UdDJfYVmqJkIEpeiTAqufmYzvT51nLlhjcdTg==
X-Received: by 2002:a05:6402:f09:b0:447:3d58:d1f2 with SMTP id
 i9-20020a0564020f0900b004473d58d1f2mr1755812eda.49.1661282431522; 
 Tue, 23 Aug 2022 12:20:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a170906b00300b0072f112a6ad2sm223928ejy.97.2022.08.23.12.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 12:20:30 -0700 (PDT)
Message-ID: <d48f85ed-6cb5-c18b-4913-c8b30bc4ecb7@mind.be>
Date: Tue, 23 Aug 2022 21:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
References: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
 <20220820121323.GI2167049@scaer> <93037fb13a2d46a9ad5d4821b8cf76f4@agner.ch>
 <20220820142134.GK2167049@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220820142134.GK2167049@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=8mKBaJWcCM3eJbPn+wKAPbYBNjFE04WgWcwRsw0Wxio=;
 b=WkpWoprj2b97aTIGoywoacvLOwE85wZD5WDsRx9sY1KDnFLP4VqNfYBhCtxpYDeRJR
 CnRhXl/VqF+WE9EFe/fROIKa0+A+EwkheGB967INNI7Wtz71Z8ahIEuVDhE3sUL5gG/J
 btnWT9BMdhf0lSV9hIJ59RWaNuIa+m9zzCWKY49d/94Y75IWPz3yeAIJDwAFbxc5QPFC
 w/I5loX6UYAWm/0fNFxjmajGhwITEdfJgInDe5BHPN+sTmElQA/YX1PXVvo/9Pmc7W+m
 /4BwEGAYRRTLCnTgRD+7tMyEPENcgyBEZskspx6+kzinKotI8/YIhGthCgvaU2bbWh7Y
 oRhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WkpWoprj
Subject: Re: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel
 WiFi 22000 series
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/08/2022 16:21, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2022-08-20 15:40 +0200, Stefan Agner spake thusly:
>> On 2022-08-20 14:13, Yann E. MORIN wrote:
>>> And then, we'd have to code some non-trivial magic that iterates over
>>> all iwlwifi-Qu{,Z}-*.ucode and check if their API part is in the range,
>>> and for a single "family" of firmwares, keep the highest one (how do we
>>> know that two firmware files are f the same family? Just because they
>>> only differ in API version?) That's a bit brittle...
>> To avoid the direct dependency I was thinking of using the
>> BR2_TOOLCHAIN_HEADERS_AT_LEAST Kconfigs, essentially maintain a list of
>> default max supported API per kernel version in Kconfig. Not sure if
>> that is a good idea.
> 
> Indeed, not really, because the version of the running kernel may be
> different than the version of the kernel headers used to buid the
> toolchain.
> 
> For example, you could build a toolchain with kernel headers 3.0, and
> run a 5.19 kernel. In such a case, the highest API derived from the
> kernel headers version may very well be lower than the lowest API
> supported by the running kernel.
> 
>>>> +LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
>>>> +LINUX_FIRMWARE_FILES += \
> [--SNIP--]
>>> This list is not entirely alphabetically sorted.
>> This is on purpose, I've used the order in
>> drivers/net/wireless/intel/iwlwifi/cfg/22000.c.
> 
> Then, add a comment above, like:
>      # Keep this list in the same order as in kernel's driver
> 
>>> Also, why do you extend the prefixes, from iwlwifi-QuZ- and iwlwifi-Qu-,
>>> to include extra c0, b0, a0 and so on? Why can we just have:
>>>      iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
>>>      iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode

  Note that this could be simplified to just
iwlwifi-Q*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode

>> Same reason: Align with kernel sources.
> 
> But then, users would had a need for one of the firmwares now excluded
> from the list will have no way to enable them.

  To allow the user full freedom there, the u, uZ and a0 etc. could be made part 
of the glob, i.e.
iwlwifi-Q$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode


>>> Oh, and in at least linu 5.17, there are also references to
>>> iwlwifi-QuQnj-, iwlwifi-SoSnj- and a bunch of others. And
>>> specifically, there is also iwlwifi-cc-a0- which in Buildroot is
>>> installed with BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260 and not
>>> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
>> There are more firmwares in the kernel sources than present in the
>> linux-firmware git repository. This is essentially the common
>> denominator of Linux 5.15 and the current version of linux-firmware. It
> 
> But why limit ourselves to what is know to 5.15? If someone uses 5.19,
> they might need other firmware files? And even if 5.15 and 5.17 have
> exactly the same set, then the upcoming 6.0 might need more or a newer
> familly (the QUQnj or QUSnj for example).

  Also, when we update linux-firmware, we're not going to look at all the new 
blobs that are in there. So we want to be as future-safe as possible with the 
globs we use.


>> might deploy too many firmwares for an older kernel, but it is
>> guaranteed to work (list a non existing firmware causes the tar command
>> in the build step to complain).
> 
> Well, it is easy to solve:
> 
>      # Fiter-out firmware famillies that do not match the API version glob
>      # so that 'tar' does not whine later on.
>      LINUX_FIRMWARE_FILES += \
>          $(notdir $(wildcard $(patsubst %,$(@D)/%, \

  Maybe we should just add "shopt nullglob" to the command that creates the tarball?

>              iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \

  It would make sense for the globs to be allowed to be a list of globs instead 
of a single one - but that would be a bit complicated to implement together with 
the wildcard.

>              iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>              iwlwifi-QuQnj-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>              iwlwifi-QuSnj-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>          )))
> 
> But adding new firmware "categories" (QuQnj or QuSnj et al.) should be a
> seaprate patch, of course.
> 
>>> So, maybe we could split the families further as an alternate solution?
>> I'd prefer to group them as they are grouped in the kernel sources.
> 
> I am slightly conflicted on this one. I would prefer they be grouped by
> whatever the user can use to identify the chip: by actually looking up
> the reference on the chip, by looking up lspci/lsusb/lshw/... But I can
> also see the appeal of matching the kernel driver... But if we were to
> change the categorisation, that would be in a separate patch.

  Well, you actually want to have just the firmware that matches both the chip 
and the driver... Our current options for linux-firmware are a bit in the middle.


> But maybe, going for boolean entries was not a good idea to begin with,
> and just a single glob option for all of the iwlwifi family as a whole
> would be better. Like:
> 
>      config BR2_PKG_LNX_FW_IWLWIFI
>          bool "iwlwifi familly/ies"
> 
>      config BR2_PKG_LNX_FW_IWLWIFI_GLOBS
>          string "iwlwifi familly globs"
>          default "*"
>          depends on BR2_PKG_LNX_FW_IWLWIFI
>          help
>            List of shell globs to match firmware files.
> 
>            For example:
>              - BR2_PKG_LNX_FW_IWLWIFI_GLOBS="*"
>                would match all of:
>                  iwlwifi-*.ucode
> 
>              - BR2_PKG_LNX_FW_IWLWIFI_GLOBS="Qu-* QuZ-*"
>                would match all of:
>                  iwlwifi-Qu-*.ucode
>                  iwlwifi-QuZ-*.ucode
> 
> This is way easier to do and, with the $(wildcard) clause I suggested
> above), should cover all of the iwlwifi cases, and we can coalesce the
> 22000, 22260, 3160, 3168, 3945, 4965, 5000, 6000G2A, 6000G2B, 7260,
> 7265, 7265D, 8000C, 8265, and 9XXX, into a single option with a glob.
> But that is not very user-friendly...

  I think the way it is split now is OK. Most of the other chips have just a few 
versions and are much less bad than 22000.


> Thomas, Arnout, Peter: thoughts?

  I think the current patch, if simplified as proposed by Yann, strikes a good 
middle ground.

  One way how we could improve the situation globally is to add an open-ended 
string option that allows the user to specify a list of files or directories or 
globs to include. That way, if you don't want the redundant API versions, you 
can simply only set that option and not the named ones, with exactly the 
firmware files (or globs) that you need.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
