Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84FEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C30D60BD5;
	Wed, 27 Jul 2022 11:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C30D60BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBs-XYf_jiNO; Wed, 27 Jul 2022 11:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C9A860BBB;
	Wed, 27 Jul 2022 11:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C9A860BBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1991BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F2640168
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F2640168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seZXXIyzIDnX for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341CB40105
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 341CB40105
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n185so10297983wmn.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OgPO0Nc+a/oq2SPu4aS6/SqUSjNnVLlZHScNixnJK3M=;
 b=1zvkS0LWlGVEr9spzQvi2K1EXrkCmeg7r6sXoE9TktrXyMwbVoaJ3EE2OucHlrxj+2
 +kzo8Bb/2VUj3V7jkNoD3Tnf9OHYQfUVN+ITeZUP6ODrcYIP28JpkT4C1JhXeVE7NjC3
 767RK8Bv1lNycizykUPaPZWIMfqiT3QBQ8v6Ai/bhRSgKhFGnb/ywhB2GiIlI40TK/wm
 VI7GUVf7J3axZrLbF/xYbSQW6A09ZSWK3DEHvNb/tPbkNURhrqQ1crwEkJEsyUjYEE5x
 6orDKSPhy/HiDLyDNq+gDOJp/fDFDfAD2nTxZcb4GPcrAuQ6R8f0Vw5yIy5eAeSgC5Qe
 GOhw==
X-Gm-Message-State: AJIora/1Pz8+6im9EIB849a6JQylKATeY9ZylnbAGMlKcMFGEIrrP1eE
 AJRgXc0Ylnp1KD+COeWEEk0CBcoNB7mdYw==
X-Google-Smtp-Source: AGRyM1twn2H0zWfAqiCXEYiIgf7qrEowrxlPyCpq9X4aJvMOKc6Kgcx/E/ySPsKN7A3cNBUbmTZh8Q==
X-Received: by 2002:a05:600c:3b29:b0:3a3:1fa6:768 with SMTP id
 m41-20020a05600c3b2900b003a31fa60768mr2679418wms.193.1658920103474; 
 Wed, 27 Jul 2022 04:08:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfebc6000000b0021e8d205705sm7290413wrn.51.2022.07.27.04.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:23 -0700 (PDT)
Message-ID: <e66380e6-e840-45a8-662b-695f2829862d@mind.be>
Date: Wed, 27 Jul 2022 10:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Xuanhao Shi <x-shi@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-4-x-shi@ti.com> <20220726205820.0dfda49b@windsurf>
 <7d8fd7e7-34e6-e5ac-b272-6a4fb50329df@ti.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7d8fd7e7-34e6-e5ac-b272-6a4fb50329df@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OgPO0Nc+a/oq2SPu4aS6/SqUSjNnVLlZHScNixnJK3M=;
 b=JxhKkSrxQLQcNd9GXQ3urnypydUqLvKOqMTtPK8didDVNQJGRLRsSgB08hPTG83EmF
 nNlbsUMxQHBU18eUigPPN6QDHgBpDj6VUtSSDwpff7P8mKMGqIEwr1SqW88dzxvYvwA8
 VRBqf4rihESO205e95e9yBMmNULnDHrqUyQuz9b8Zm4547TpB7j+cZ8IOApsqn/Ni38a
 MNnx3gI/dS993xHqLfasndPi8Vf0mLC50utvPtFtFXmeoI5yTx03Xov8RgmJOJ/SlWXO
 8kwJY2/jI5pdwDaqfAPJbw2EVTMHXEjPs6gcFUgXctBW+2AsWFnQjINO40z4+x7f9AqP
 9lSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JxhKkSrx
Subject: Re: [Buildroot] [PATCH 3/4] board/am6x: add new board support
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
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/07/2022 23:08, Xuanhao Shi via buildroot wrote:
> On 7/26/22 13:58, Thomas Petazzoni wrote:
> 
>>>
>>> diff --git a/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig 
>>> b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
>>> new file mode 100644
>>> index 0000000000..7000ee1170
>>> --- /dev/null
>>> +++ b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
>>
>> Just board/am6x/am64x/linux.config
>>
>> Does your board have an actual name? Because am64x is just the name of
>> the SoC, no?
>>
> 
> Yes. The SoC is am64x, and the board's name is am64x_sk.
> 
> 
>>
>> [...]
>>
>> This is a huge config file, with obviously stuff that isn't needed for
>> your platform. Could you review it and strip it down to some reasonable
>> level? It enables zillions of drivers that make absolutely no sense for
>> a TI platform.
>>
>>
>>> +##################################################
>>> +# TI Baseport Config Options
>>> +##################################################
>>
>> Please do not manually edit the kernel configuration file.
>>
>>
> 
> Noted. We'll review the kernel config file.
> 
> 
>>> +Description
>>> +===========
>>> +
>>> +These configurations will build a complete image and
>>> +device tree blobs for the the TI AM6X boards.
>>
>> Which "boards" ? Normally, we have one readme.txt per board, as the
>> details are board-specific, such as where is the UART connector, how to
>> flash, etc.
> 
> I see. We are planning to add more k3 boards here in the future, so I think I 
> will make sub-directories in here for each board (for example, am64_sk, am62_sk, 
> etc.), and I will add more specific readme files for each of them.

  These are evaluation kits developed by TI itself, right? I think it's more 
appropriate to put them under board/ti, so board/ti/am64x_sk etc.

  (BTW, here you write am64_sk, above it's am64x_sk...)

  Regards,
  Arnout

> 
> Thanks!
> 
> Xuanhao
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
