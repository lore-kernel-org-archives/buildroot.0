Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D0CCD187
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 23:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D206084F;
	Fri, 10 Oct 2025 23:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lexpsyEK2Jkp; Fri, 10 Oct 2025 23:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F80860838
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F80860838;
	Fri, 10 Oct 2025 23:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 763CFBC
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 23:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6797C40621
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 23:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGtXt2i1jUmO for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 23:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B45440620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B45440620
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B45440620
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 23:57:54 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-3c73e93eadfso700727fac.3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760140673; x=1760745473;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylGuKBM5uZQRPOGAALDuz/BMDh+ECOFEZG+HghIf8jI=;
 b=dMqp8kRADHej5qgKYIz4gqGZmGxAwA0kJAf+D9v3lwzS57+6DHLjFLeSUyA77wOmDp
 X9LSjDv6ABXTS9wKBx0xa5edfuTS+cgyMT3yVA2boHpnn9h4xseFoK4X2mDhd7SbY1hQ
 reKqrxsfSEBRENIenS/YEVvUdehgmoyj01aUclr6IDtgT8TK+IPvu1Wg+k1p4j7XETH7
 zmFwGOpwFpnGJgG9Ctuij0vaDC0XZYukLB4rnP9wWBAL9+A1UTNHRBvq0yAsahKh6hZ3
 kXgskRXRKJ6+zvvZzRRWS+SxBMyli+rJud9H3AImWqwRkIeAWC4ckupRnPjrzssfnpqv
 a/Cg==
X-Gm-Message-State: AOJu0YwPmYYzA5qaLVMEUZZsAAo/Uxdfswl5lz3NtbJTTMG9Bf3/z3GA
 Ieqo/yN9jY57PLUp2Npv2hsMAj1Z7aRHj5yt76we4Gpz94xn9oeQNcS/foLVgoRPYvE=
X-Gm-Gg: ASbGncsvitjjz9N2gQzEO7BGCSSuNl+6Y5E4/eTxalqtzjjLWmG4yz1Xsy6eA3GzRqo
 yTAyOgw2Fwd0lEyYX1UkTTEwwNr0wrklYjGaewcjKUs0MAG8o5k0UHDKn/y9YcwY6FWejEeWYQq
 aqa44wX7sKr4xxRtRYb0d1dc52B9c4yrlWAeJ0JuY8QMsbZZ8ZV5QqpkpqeGHwknfszNbBiE4qD
 KqUeq5xyBnDcoOm4Ffi0qE8ewFEcgLi5ZPglONrOnEFa0xHZHXQupPMQJMwzP2C+vU6q4OKgGf+
 lW3BHpJq7arsKQd5euR+CVDu00ghGSaL1DSDUiAdhMbmsV4oOG0/QYV3xdWcjp1idry2l5VcxZS
 RMCK7/Rm7lUifgNnu6L00EDwsfC6oW+FwS5YV8B2XtLx71k+etysrPk/Tr+UpaUCHYC9+mnBe
X-Google-Smtp-Source: AGHT+IFHspMCSZraZVS+uZsNpVJrBXg4zkKUZZtW1Hq+IGbqw5FTivO7ulQY4FO0QLOTjM8q/dUplw==
X-Received: by 2002:a05:6870:e309:b0:32d:ecb:51d with SMTP id
 586e51a60fabf-3c0f590e90emr6662317fac.16.1760140673143; 
 Fri, 10 Oct 2025 16:57:53 -0700 (PDT)
Received: from [10.10.10.191] (97-120-234-78.ptld.qwest.net. [97.120.234.78])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3c8c8ef735csm1350859fac.21.2025.10.10.16.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 16:57:52 -0700 (PDT)
From: Kris Bahnsen <kris@embeddedts.com>
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <6d56490e-3b6e-4c11-be84-c81b6f33ae47@embeddedTS.com>
Date: Fri, 10 Oct 2025 16:57:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
 <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
 <e6e23b2657445822512e036a7f8876b8@free.fr>
 <46cb2cf3-e3be-45d0-ab5f-53fbee9b263b@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <46cb2cf3-e3be-45d0-ab5f-53fbee9b263b@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1760140673; x=1760745473; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ylGuKBM5uZQRPOGAALDuz/BMDh+ECOFEZG+HghIf8jI=;
 b=jR4LgdHZAXo51VZMivHYwuxeths0UGefTBzIhh5AZ9pgVd924nP96c8QrCDq4D/gTC
 PnbKPg8zDDYYtxqm23z9p3RKyEBlaAot1CPYdc+CHfwcUGwwo0zNK6ux33W26+ANX6ji
 7Km2aLuyDMJBt/FP0eQ5NcPad4XPtcqrAT2vg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=embeddedts.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=jR4LgdHZ
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, Julien,


On 10/10/25 12:32 PM, Giulio Benetti wrote:
> Hi Julien, Kris,
> 
> On 9/13/25 13:47, Julien Olivain wrote:
>> On 08/09/2025 21:24, Giulio Benetti wrote:
>>> Add a local patch pending upstream to fix build failure with Linux 6.16
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Applied to master, thanks.
>>
>> This commit adds the fourteenth package patch to wilc-driver.
>> The package is currently at version linux4microchip-2021.10-1
>> and I see there is a newer tag:
>> https://github.com/embeddedTS/wilc3000-external-module/releases/tag/ linux4microchip-2024.04
>>
>> Could we reduce a bit the number package patches by bumping
>> the package version?
> 
> Sorry for the very late reply.
> 
> As pointed here:
> https://lore.kernel.org/buildroot/6b3b8dd5f1a4229c813d29b449a655cfcc74ab29.camel@embeddedTS.com/
> 
> they have 2 different branches that reflect Microchip ones:
> 1. 2021.10-with-community-patches => old kernel versions check but some potential bug. I keep opening PR I know that will never be merged AFAICR
> 2. 2024.04-with-community-patches => no old kernel versions check and it had to be maintained, but last patch is from 31st July 2024 and only
> supports Linux 6.7
> 
> On Linux Mainline there is no support for wilc3000(WiFi+BT), only for wilc1000(WiFi only).

Note that the WILC3000 Wi-Fi is currently supported upstream, its in
6.12 LTS. But BLE is not supported as part of 6.12 (and I havn't looked
in some time to see if there was any update on the state of it).

Until both are supported, however, we're going to maintain the
wilc3000-external-module as best as we can. Likely meaning only the
latest LTS kernel support due to time and testing constraints.

I would love to get your patches merged in, and its on my list, but
my time is unfortunately been directed in to other things. Currently
the 2024.04-with-community-patches supports at least up through 6.12.

> 
> So at this point I could take over 2021.10-with-community-patches on my
> company Github Benetti Engineering and keep patching for new Linux
> versions the same way I do for the other external drivers in Buildroot.
> 
> @Kris: does it work it for you?

I have no opinions either direction. If you would like to fork and
maintain the external driver in that capacity, you are welcome to.

For the time being, our plan is to certainly keep it working in the
latest LTS kernels with minimal patching outside of what patches
that Microchip maintains in their kernel.

-- 
Kris Bahnsen
Software Engineer
embeddedTS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
