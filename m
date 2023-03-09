Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C24C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BAD820DF;
	Thu,  9 Mar 2023 21:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BAD820DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7c_3ULCqFTC; Thu,  9 Mar 2023 21:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15765820CA;
	Thu,  9 Mar 2023 21:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15765820CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB1A1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C4A4198A
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C4A4198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ4P_wV1M7wk for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:43:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B5941927
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76B5941927
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:43:29 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g3so12816862eda.1
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678398207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tkhw0QMMl4efpDaE9EYlFR4TBkM8Xw6tlTz99QEgNm4=;
 b=g0FrQG9092YrgNtgi2HtEbu9YHrkcTnXHDTSovlqK1f0EQjM0fmYTvzTB8XHGmZlee
 czHS0c/BGPftFWwslWeIVi95/CjxaWwzGRkqVKPfvOx00W1/5Cz/QP/BB6n4HijlfRtL
 vqPeh3gI/QV7IF6EbYS5v7Idp5ASy6kGI1ekviVJjWwcEUAz2sR1L5C+B+DfCVk0AT/M
 oJ5QA5J4MiaCKG+yRqGtDoGWrlmpla8xvCoNz40fN8l/fjj20Gf/WHoVl4L+g4JT2MAc
 nNHwkmQoRIJ6Hi9d2uNnJeYWo3pr7dCZLl9rTPRR6iJanw+kSbho6Y9NJj1Aih4c4AAM
 rdkQ==
X-Gm-Message-State: AO0yUKXmneukdyeRdUx8HCOLUgV/t/m2TIVBaOrny3dvj7krPdaZ/ZPl
 749jC/+e/g0pugRle3rGRF073g==
X-Google-Smtp-Source: AK7set/WGBMXosOzYyu1pKymKJsNsZAEllm5T4MlPLufZ4Rof8Kx8yCMTFolaFm36Jpu83A4MT+dcA==
X-Received: by 2002:a17:907:9c04:b0:8a5:8620:575 with SMTP id
 ld4-20020a1709079c0400b008a586200575mr23996256ejc.3.1678398207325; 
 Thu, 09 Mar 2023 13:43:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1709060dcf00b008e51a1fd7bfsm40763eji.172.2023.03.09.13.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:43:26 -0800 (PST)
Message-ID: <d14f65df-99d6-0cf2-db1c-ef5e8826dc35@mind.be>
Date: Thu, 9 Mar 2023 22:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230222143512.1555539-1-fontaine.fabrice@gmail.com>
 <20230223062259.GJ2718518@scaer> <20230223224201.0e351b16@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230223224201.0e351b16@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678398207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tkhw0QMMl4efpDaE9EYlFR4TBkM8Xw6tlTz99QEgNm4=;
 b=IpAjuI5qfjLWjKie8zl5DBIgh05oRUSgHHnCrRNjcusIwWnNf6JNa+GRFXIYxaD2qa
 ToW8FUlDw0xz6qxq2rUToDWzCSXTOPEKpumM8xFmG74oUYIlvamqy9+DWze6a93v4mOs
 QvwgKc7f7r/H+fHsJOI15wWQMUp/67ECF+tcJ/EeYUxEHzep4U71MmEMa0SFijmpWwqF
 YnstHIrAWKlFG9qHCGj5d2DZHFRsGvc2qx6lEWCmQ3bFTZZrNqlMWhWTIGC5LCe3oVTa
 Xw8PILjru7IwwjliWrnIDvl3P8N7XkCaUW7k5X7XRV7NYqnnBzCsRGFcB8OviXb95aiZ
 EPWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IpAjuI5q
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: force arm mode instead
 of Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/02/2023 22:42, Thomas Petazzoni via buildroot wrote:
> Hello Yann,
> 
> On Thu, 23 Feb 2023 07:22:59 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>>> +# src/libev has some assembly function that is not present in Thumb mode:
>>> +# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
>>> +# so, we desactivate Thumb mode
>>> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>>> +AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
>>> +endif
>>
>> But then it would not work on systems that have a armv7m: BR2_cortex_m3,
>> BR2_cortex_m4, or BR2_cortex_m7.
> 
> BR2_ARM_INSTRUCTIONS_THUMB is for "classic" Thumb, not Thumb2.
> BR2_ARM_INSTRUCTIONS_THUMB2 is used for Thumb2 platforms, such as
> ARMv7-M.
> 
> So the above condition will only trigger for ARMv4/ARMv5/ARMv6 cores,
> and they all support both classic Thumb and regular ARM instruction set.
> 
> So to me, the above proposal from Fabrice works fine.

  I completely agree. Adding those redundant arch dependencies adds a bunch of 
needless complexity for libev. And we can be pretty sure that we're never going 
to add a thumb1-only architecture.

  So I applied the v1 of this patch to master, thanks.

  Regards,
  Arnout


> 
>> I looked at the code, and it's going to be very complex to patch it to
>> support armv7m, i.e. thumb-only.
> 
> Thumb2-only, which is totally different.
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
