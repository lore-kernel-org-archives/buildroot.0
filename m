Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA824C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7937408A6;
	Wed,  7 Sep 2022 12:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7937408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U20wPySz8DlL; Wed,  7 Sep 2022 12:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582514049F;
	Wed,  7 Sep 2022 12:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582514049F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0DEF1BF59E
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8660C408B0
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8660C408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rYZNbpWfXro for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 12:19:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3BD4049A
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A3BD4049A
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 12:18:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id z17so1825023eje.0
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 05:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=caxIqPDiw0fQE/2pz+5PoJJ5lOkcHDkQc7FCrF3CQ3U=;
 b=y9Aq2jlsdF7Q2NXshe7tchiRUrD4VKLV24gLzDbfpAfzuT/gbx0BX48SbFAa1Hr9+t
 /zRTqx9nGDo/KvEMihiwGI64dkrxyN2NxV0JAQLcZ0ayyjTCFWVfJGkuiHRdZZaC+Zc/
 pyOE/MT7UmNo4dxA3Zk2WGlGn9YwC1AWoBA0/ErdBy2CzBoWL1PBjUZxtFZOxz/5Ivrt
 1+XBcj63YyYA2+pw+NTRW8m6LH4GNvNnJcVvDiJNTV+QdBjlP/mcmzbq1U7uveSOq1Ag
 d3mCisNPB85adgC8DWtuEnoXLj01Ah1KV2adJ0K6MZEQHTeQyI2hZKkUuPWTkstNhfC9
 6X3w==
X-Gm-Message-State: ACgBeo3lz0Ni9RNj9L6lxtPRVEC3nogg5z2jBdaeGdR2JWwjJfaaWaf2
 Za+v0IALUEYELSh65LMPQs/bIQ==
X-Google-Smtp-Source: AA6agR6nV5zNMBiH/ACt0IYlf7Na5O7KubCSOOhnMVETSm88bpy8NqkkVLLd+ij4zDQ7W4r/z8eibA==
X-Received: by 2002:a17:907:a0c6:b0:766:57ed:567e with SMTP id
 hw6-20020a170907a0c600b0076657ed567emr2169590ejc.15.1662553136860; 
 Wed, 07 Sep 2022 05:18:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906308a00b0073d218af237sm8269243ejv.216.2022.09.07.05.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 05:18:56 -0700 (PDT)
Message-ID: <93b9c9bf-ed68-c177-f30f-defb8ba82388@mind.be>
Date: Wed, 7 Sep 2022 14:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
 <20220905201727.GJ1490660@scaer>
 <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
 <20220906200718.GA1490660@scaer> <20220906203747.GB1490660@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220906203747.GB1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=caxIqPDiw0fQE/2pz+5PoJJ5lOkcHDkQc7FCrF3CQ3U=;
 b=C6vnFFTsAuVFWAwdbhE0ksMzWT7yWaFMrZKyHNfo0XVC16OHOXpLabdcuKwXYZ0Gxc
 rujG0w4Dsf4r+D1uJJFhrHvOh9b8x4OGF8QFFg/w7agoJp4Ld6NwG2Qy1hzf5kOnEt6d
 0wuzvOe6kqTDfNYMPcUJ+3WYMXM+BMPlvh7vEREMeNodgERbTjyoEaNey2LFgdwAx30C
 gMXdFsXJyw2FrQdryT674Q0RXH+cZ+cshpdv0endJ4nJab2zsd6GrwRbglqcZ8dDgqkS
 ab8lB1ol/2ZDHXp+4Jqb8DCJfNU6KNxp77EKOLZUKd788biUH/wgvZSzN6xpsIQ3+oNs
 HRhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C6vnFFTs
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/09/2022 22:37, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-09-06 22:07 +0200, Yann E. MORIN spake thusly:
>> On 2022-09-06 21:46 +0200, Arnout Vandecappelle spake thusly:
>>> On 05/09/2022 22:17, Yann E. MORIN wrote:
>>>> On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
>>>>> Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
>>>>> jevents.py")
>>>> 00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
>>>> bleeding edge technology, there is no issue. So, paying the price of a
>>>> host-pytohn3 build just for release-candidate kernels is a bit too much
>>>> in my opinion.
>>>> So, I added a config knob to drive this, like we have for host-openssl
>>>> and a few other host programs for building the kernel.
>>>   If only python is needed, no modules, then $(BR2_PYTHON3_HOST_DEPENDENCY)
>>
>> Dang, that's right, I totally forgot about that one...
> [--SNIP--]
>> So, indeed, BR2_PYTHON3_HOST_DEPENDENCY seems a much better fit...
> 
> Err, hold on, no: we still do not want to pay the price for a
> host-python3 build if the local system does not have python-3.4+ and the
> kernel does not even need it, in fact.
> 
> So, I think we want to keep BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
> but switch the _DEPENDENCY to BR2_PYTHON3_HOST_DEPENDENCY.

  Yes, that's what I meant. The place where I added my comment was maybe not ideal.

  Regards,
  Arnout

> 
> Thoughts?
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
