Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D9CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 18:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F12D340297;
	Wed, 10 Apr 2024 18:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxrGx6ghkGk6; Wed, 10 Apr 2024 18:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1435F416FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1435F416FA;
	Wed, 10 Apr 2024 18:12:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D211BF5A2
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9F8405EF
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pygZT3X5L3dP for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 18:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41318405D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41318405D3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41318405D3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 18:12:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so664595e9.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 11:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712772720; x=1713377520;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LcUmIwIKWv0mOD34xEKaoZKXxd6iObPqj+MuF48/3sA=;
 b=MeY7TwlZMJDf1ffJAJ/5yE99EwJeL34SZdYYFSC/lOAT1L97Q1rAGTwP1QhZ4G30pr
 D1mycpNZlqzeu9FoWOTzuOx//0HtPqGVKo4Zk2T08uc+BaEmZJkydWCBJVGP99Ov52E1
 k2A5FEtOwsS0QX1N0nN5kqXjFAA5omD9AfQan3yAeMMDjxtwOYDRGOyrJir4KPWON0nL
 rWoeKODaeUzxUO9SeKI36K0c6f1ACgseVYo873ZZZfKyI1hgWXeVt4353850CGLcBrtj
 9DF0VOSHbiw5ce6ma1WNHP2Lw5+lyPQ4u7Qv9h7+koZqvuJnKZabd2Xs3DbJpN5WMIhv
 V1Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtA+eYdMrN/+Gb42KiqF3rz02jEHeHlp/MbvODsv1snV7/oBls+b2rO03+zXs9zySmIrplLi90iyoTfNQGNBqYQ5HfXyHFOg==
X-Gm-Message-State: AOJu0YxeRQ0vCLVmYsNN8TnS5QqdkDDIKP5GbqmMz3hnm8tO8CdQLHM9
 LxZIOEqy2oXEvr4IcyM+2yaAOYUAnZu2Y+LvbTC7msZ0T17l9Xai88UJrttI5dzKP6pW17VmrL/
 N
X-Google-Smtp-Source: AGHT+IG5OM60NZh+LPi3JJFBVSJxmy2MDB+xUeaTQxiK5vMmrZnlS8gxwhWUFYUjZ6SzTT9IrUNmjw==
X-Received: by 2002:a05:600c:310b:b0:416:1bff:ee23 with SMTP id
 g11-20020a05600c310b00b004161bffee23mr355395wmo.14.1712772720401; 
 Wed, 10 Apr 2024 11:12:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 he8-20020a05600c540800b00416a08788a5sm3011895wmb.27.2024.04.10.11.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 11:11:59 -0700 (PDT)
Message-ID: <9cdb6798-5170-4c9a-887e-6e0f74e8f7cf@mind.be>
Date: Wed, 10 Apr 2024 20:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Don <dterry_engineer@yahoo.com>, buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
Content-Language: en-GB
In-Reply-To: <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712772720; x=1713377520; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LcUmIwIKWv0mOD34xEKaoZKXxd6iObPqj+MuF48/3sA=;
 b=fLWMFxTTLWBfVun4BiPEWumc2Jr2yFNHkOC3maqSfUwZFIzv7vaODZ3l5dCLTSkiET
 jBTqb1C11frbNn48JnFWsRFhEaU15nQKmlec1XuTwapItfAtlG2bogayzgCMiyxKt/pw
 eLJbXzQYVeX/HFrWR4JsrIY19Z8zSLKFv7pKsF91u+IVEaH+bt0FAfLFNqL8IKmq1YVj
 v/cYADAGSC6uofSKmyiJPUp1187PZGuZWhBDAVDtUqEYmIGs5lzj341opya2LtZGiMuI
 3ddyJCEQ/I1Cg9MqBwkLfkNLs18t7Y0/YGbA7skCSslla4U/omRewzL+9GrgXXFvVi+A
 rguA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fLWMFxTT
Subject: Re: [Buildroot] Problem with device tree
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/04/2024 23:23, Don via buildroot wrote:
> This is my first time using buildroot. Following the instructions of 
> bootlin.com/doc/training/buildroot/buildroot-labs.pdf, building for Beaglebone 
> Black though not the wireless of the training pdf. Under Kernel - selected 
> device tree blob and in-tree device tree name I put am335x-boneblack. However I get
> 
> Device Tree Source (arch/arm/dts/am335x-.dtb) is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument

  This output comes from U-Boot, not from Linux. The file name am335x-.dtb seems 
wrong as well, so you must have set something wrong in Buildroot's config of U-Boot.

  Regards,
  Arnout

> 
> What does it want? Something is missing but I don't know what.
> 
> Thanks.
> 
> Have a Blessed day!
> 
> Don
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
