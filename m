Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90645C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434AE81B04;
	Tue, 25 Mar 2025 20:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9CX_vKDa2YY; Tue, 25 Mar 2025 20:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722438130A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722438130A;
	Tue, 25 Mar 2025 20:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87097E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF03407E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIwFZ-FQd8sQ for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 751C54072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 751C54072F
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 751C54072F
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:02:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3965c995151so3039148f8f.1
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742932931; x=1743537731;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSbPXaUpBqVGoXoQFCjqHoixRWqZ2T7kSxDyJanAG/Y=;
 b=imD9iJoHgzqkHocv/ZddI9l74PMOahQq5sIdN0RgjdDUd3j+oWDH/lcZmxI2GX6Lpg
 lR6pj4hIvo00F8bZxw63GYUNpoMD4jVtwxbrBUARePJ8bV7hEGpbA+uDCEH/Bg7F+RGN
 hJLrCiGNW+BLUQa7bUI36Y8VB7jZchD/GuRPcQpQcK9L+M4FCeKfM9B6h4pjr9lUbvT1
 U5KAMvBAIpXEtmZgWHX/JWxoi2pikcPowvQxujobUZ7nwsvkPFp+rQwOU4K82eyLu0zv
 ugNPH6PzjQ71wJmRu69duG2t2ksC1RVGc9fCjqAVxGBm+4kuJoRYBte367JJu9CZiXs1
 VStA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUriEAFU/KLbRnTBovhALbakD9DBQexmXqfAIsxfWOCD339EoopueqIPgSTmPUmUpGpooe62QATh8=@buildroot.org
X-Gm-Message-State: AOJu0YwJUvbrlJmg7/0kBWLthqFRNHH0Qp0YHxyTgQ6jG5R4oAaauTEU
 RqAvnNzBn5heCPui/K4FBEXzPVJZfw2vLWuu7fNtJUtcaZ6x6joisyhw7hxyFJM=
X-Gm-Gg: ASbGncsomF7YhI/Ev9Uj+7cpREss5APi5LqHlDJADptd5rn0s6neMkMy7qXRK4OwUfJ
 o2WZnzwbRWMyNzcBhWZOuhthex0rsBCB/WPJNNGQRm2YJ8S6bMFLdQw0WSE9YNRO/6K8214VeC4
 Xdvj5z074jv9u91c6boboMXu41ao55/6Te3EU5nlps4B//Z8lNRe53iBL7Re8vmOZrVo3FeXulX
 rekvKRtcg3yECqPUcZpFR1reGv2IlvgxnYLXVwZwXBfTCYJ6r/22zTdfwqBK/IAXZmURm7yq502
 0qpUf6ydWDeZgoAzUt5kSXQFboM2txDy0lysL+dfUR4wmWMnFJ/i9ozhhIhTnHiT6C0H6NmDIn4
 WbGzAr39RdyLHgDj44QyXy5Af6oLP+O73dZLmnew8xhbIvz++KkpXbl4eiWcaNEEy94ka74OfpG
 8=
X-Google-Smtp-Source: AGHT+IFTWJZzcSmTFxSCDDEjo9h9j8ChS8xzG7SyAevwEn5WKKo7sCZKwPX9aTFsiUbgFqK+i9op5Q==
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id
 ffacd0b85a97d-3997f8fc43dmr16601878f8f.15.1742932931372; 
 Tue, 25 Mar 2025 13:02:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceb780sm163836175e9.4.2025.03.25.13.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 13:02:10 -0700 (PDT)
Message-ID: <3ad02faf-5b21-4b54-93d9-bfb307ec8aea@mind.be>
Date: Tue, 25 Mar 2025 21:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Jakob Cornell
 <jakob@jcornell.net>, buildroot@buildroot.org
References: <070aaa04-49c7-46d6-9e3b-b4cf55b0b43f@jcornell.net>
 <09ac641b-4cf5-42bc-8888-a55e6254438f@pengutronix.de>
Content-Language: en-GB
In-Reply-To: <09ac641b-4cf5-42bc-8888-a55e6254438f@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742932931; x=1743537731; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TSbPXaUpBqVGoXoQFCjqHoixRWqZ2T7kSxDyJanAG/Y=;
 b=UrXBQxVH+vOVtDUnkGL8KYu3XYxgGdUjzhaszZ1kwg9YHUrFlTVwQqdQOb3kb/+znR
 27SWuGESiYWlme9vlcW2abCTRK1QYAn12CtPRZhL4otHfKcJ5MFklhy2LWDuENnC3bcC
 UfoeWw988NcjAUMUxYQPLGQ31sCWP8rIqaTkIGQYRqfgazFKfqRTTZ09UtY//JAxiJrk
 OkRaTSAa5HB1gzNE3ZxCgUknZ+tucNdp4WacCDzHxzWZA5LAE65cIVXInVgMBgVKgodL
 xN6Ov6z1Tt3V4XrPevIqX+lpyuleBKTsagEKsEafsJBy3Db02rEHkrJd3P/FLU9KvWWt
 xubg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UrXBQxVH
Subject: Re: [Buildroot] How to configure Barebox for 32-bit?
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/03/2025 20:03, Ahmad Fatoum wrote:
> Hello Jakob,
> 
> On 21.03.25 03:07, Jakob Cornell via buildroot wrote:
>> I'm trying to build an image for a system that has a Via C7 processor (IA-32), so I have Buildroot set up with an architecture of i386 and Via C3-2 as the architecture variant. When buildroot tries to build Barebox it looks like it's targeting a 64-bit architecture:
> 
> barebox no longer supports IA-32. There used to be legacy BIOS (non-efi)
> support for it, but it bitrotted under newer compilers and was thus
> removed due to lack of interest. On x86, the remaining EFI support is
> 64-bit only.

  Then we should add a

	depends on !BR2_i386

to barebox Config.in, no? Care to send a patch?

  Make sure to mention since which barebox version that is. If it would have 
been removed in 2024, we would still like to keep the option open. But I see it 
was removed before 2022.12 so that should be OK - but should be made clear in 
the commit message.

  Regards,
  Arnout

> 
> (This is x86-specific and doesn't apply to other 32-bit architectures)
> 
>>> make[1]: Leaving directory '/home/jakob/projects/igel/buildroot-2025.02/output/build/barebox-2022.12.0'
>>> make: *** [package/pkg-generic.mk:273: /home/jakob/projects/igel/buildroot-2025.02/output/build/barebox-2022.12.0/.stamp_built] Error 2
>> What could be the cause of this? I've selected "efi" as the Barebox board defconfig...no idea whether that's right.
> 
> You'll need to find out whether your board supports UEFI or not
> (might be a user-settable choice in the BIOS) and then configure
> another bootloader accordingly, e.g. grub.
> 
> Cheers,
> Ahmad
> 
>>
>> Jakob
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
