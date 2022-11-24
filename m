Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D975C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 12:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDFE41859;
	Thu, 24 Nov 2022 12:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDFE41859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8ZKav09qaT1; Thu, 24 Nov 2022 12:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC4B41876;
	Thu, 24 Nov 2022 12:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC4B41876
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02D281BF2C0
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF22E82136
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF22E82136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48vYaH-lywpS for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 12:36:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A724182117
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A724182117
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 12:36:45 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ha10so3919326ejb.3
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 04:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i9pDRjr7XOvhBY/Rlh4TQBRxe5wjlgoR9++2vRURRRk=;
 b=FRyNh+UZRjGE/CiGeMDhhioTCN93kTgloEWLbishoy5mtz9Y/WJzBVvIQN5XusAHCj
 MeXbBzLx5cz+Dl+AfWVYQz89W7tA05412Zao5nPgo8+lHgl7YAm2WDOE8zteN9JabgZy
 NthVyFzTzf8xn9RjKQcMus+eymgezWFhq+XkNJ7zJghW2R8dOKblqFKkxTzVO9Z3Pdag
 D7m6p3IZen8mZOjLfSI70b6prboJOdsMljAEl5rBpBeY/TfYV7TC2AlM9QXMEVj3mN8L
 jJ0ZiOq370dS91CddCb6T32Y2qiSbm7/8lseXZYjJFeCTpJEXJWtu+MkFgu1dapnwIEI
 DXmQ==
X-Gm-Message-State: ANoB5pkmjdueP023RrnOTUXxCc4ERs4sTcn76LLB9M55LGxzGWj+6bAM
 T5QaelHS+5IAFbpMeeF6bcMXcQ==
X-Google-Smtp-Source: AA0mqf4znYjY7kqqZHeePPBhkDrWiT03VLqi6Arw2Y/6b1tsIbqLOErKgZiIWnQzk5nJFAOLJwGw9A==
X-Received: by 2002:a17:906:fc9:b0:7ae:ef99:6fb2 with SMTP id
 c9-20020a1709060fc900b007aeef996fb2mr27001002ejk.761.1669293403679; 
 Thu, 24 Nov 2022 04:36:43 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 u17-20020a1709061db100b0078128c89439sm392286ejh.6.2022.11.24.04.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 04:36:43 -0800 (PST)
Message-ID: <6b6fbfea-d87e-3230-b471-235d91c60f7f@mind.be>
Date: Thu, 24 Nov 2022 13:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <6cff8-6370db80-5-75c4db80@248833567>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <6cff8-6370db80-5-75c4db80@248833567>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i9pDRjr7XOvhBY/Rlh4TQBRxe5wjlgoR9++2vRURRRk=;
 b=H6IoB8eu3jTddvuHuSvlrxezLJKZT4TXEhJvdtMEUeDsfoGRRIRcsYhnG4YdliRI7i
 piEwGzodnYKSqZyZEcj6hN5vDIASyzGNVMUhtt+YB1B0cZHhqZJLuiDR3+UJfxwW5vxn
 Cqlfw/tj5qosTxh3DxhVZXnFn69XFtg0vOZtFwyU7oqp1XTEPJvAmYWzBQZcNMNh0HIU
 0BWM5DHtJN+vSZ2tzs2Hf68ALfFevfgCgzcxB3wcb51q/1jcrJtWFU2/Duy5FYNvU4e5
 ZAoJGuDKht6YFRbHOZJaAYLc2TH/tfCxi+ZTA/uT4ElDVehHh9BwCZjbmvpght1IZyhF
 r1nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H6IoB8eu
Subject: Re: [Buildroot] [PATCH v2] package/swupdate: add libubootenv as
 dependency
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
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/11/2022 12:56, Michael Nosthoff via buildroot wrote:
> Hi Thomas,
> 
> On Saturday, November 12, 2022 21:32 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> Hello Michael,
>>
>> On Thu, 10 Nov 2022 11:23:12 +0100
>> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
>>
>>> when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
>>> use uboot the build fails because libubootenv is not a dependency.
>>>
>>> Fixes:
>>> bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
>>>     23 | #include <libuboot.h>
>>>
>>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  I rewrote the commit message completely, taking into account the discussion 
below, and applied to master, thanks.


>>
>> Could you provide a bit more details? Your change is only making sure
>> libubootenv is built before swupdate *if* libubootenv is eanbled in the
>> Buildroot configuration. This would mean libubootenv is an optional
>> dependency of swupdate.
>>
>> But your commit log seems to imply otherwise.
> 
> (I just noticed this is also broken when building without PPD if libubootenv is not accidentially built before swupdate)
> 
> swupdate has many optional dependencies like libgpiod, libcurl, zstd, zlib (see it's Config.in description).
> All off them are not configurable from the buildroot kconfig but from the swupdate config
> (see make swupdate-menuconfig). So for all other mentioned optional dependencies there is already
> the "if available depend on it" switch set but not for libubootenv.
> 
> (Interestingly most of the other dependencies also have a "HAVE_*" configure flag when building swupdate.
> For libubootenv I didn't see one.)

  I think that can be considered a bug in swupdate. It would be nice to add a 
HAVE_LIBUBOOTENV and send it upstream. CONFIG_UBOOT should only be visible if 
HAVE_LIBUBOOTENV is set.

> 
> To reproduce you just need to add
> 
> CONFIG_UBOOT=y
> CONFIG_BOOTLOADER_DEFAULT_NONE=y

  The second one is not even needed, simply CONFIG_UBOOT=y is enough.

> 
> to package/swupdate/swupdate.config an try to build swupdate.
> 
>>
>> We are not seeing any build errors on swupdate in our autobuilders.
>> Could you provide an example Buildroot configuration that exhibits the
>> issue?
> 
> Are the autobuilders trying different swupdate-defconfigs? Then this should turn up...

  No, they only use the default configuration. It would be nice indeed to have 
some randomisation of the configuration used by various kconfig packages, but 
that is going to be extremely difficult to implement in practice.

  Regards,
  Arnout

> 
> Regards,
> Michael
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
