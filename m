Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9395AC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDED4181E;
	Tue,  7 Feb 2023 17:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDED4181E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-L94sdCk61A; Tue,  7 Feb 2023 17:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CB241810;
	Tue,  7 Feb 2023 17:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CB241810
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3202D1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181E460E43
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 181E460E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0St2zePXTuJ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D411B60BDC
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D411B60BDC
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:56:55 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id pj3so15828740pjb.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T9VvPCI+hqIBbzmYuSFYoSsvKcj//BwPwoqB2j+EQr8=;
 b=skKTiFRiSopzP8FdGqQ2trdE3tjY3V2E6cstSda2G82q5DSVJHtpHNo9q0HvM4wZGH
 AjANz/96rfIRT5t7QCRFoLPwesK4oaAPgwJud0EcuTKGPhqCamb0oL9h+G8Y+9YhmtvA
 H32dXWsm/tgQCXtoJ03HiRkXdKSn4zr7Kked0DzwjJu5Pkle75M2G2ZLcCoWB6q0QorG
 XVpXM3KLLILsJzyiCKHqh6oOVe0mT5rPVutE2bKairXbpHX+eScWugGLfVDP4Igwi+8s
 kam3/5T4Q7pDYSn5PqHgSuLy06qgFbrho0P+gnob4+yLGRClZ4xqncwdhZQk7H4coi9B
 8tHA==
X-Gm-Message-State: AO0yUKXx/1sx5iBnfxBbWvCBg13dJOUlFnTzaZnDmzgdi3B05gMkAc2S
 Yuag5aAX8R/sWp5idTV8kVXdehPbt74/KU4j
X-Google-Smtp-Source: AK7set9GXYFI0fJNykJCZpIDEWjWcgQ66QUcIT19WVrbymel+TH2Yo+dylSnIMl7wt3Nv4DLc1DAUA==
X-Received: by 2002:a05:6a20:7da6:b0:c2:fab0:3cac with SMTP id
 v38-20020a056a207da600b000c2fab03cacmr197540pzj.0.1675792615336; 
 Tue, 07 Feb 2023 09:56:55 -0800 (PST)
Received: from [192.168.0.164] (S0106f875a4344b41.gv.shawcable.net.
 [70.67.112.211]) by smtp.gmail.com with ESMTPSA id
 p4-20020a63ab04000000b00499a90cce5bsm7986086pgf.50.2023.02.07.09.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:56:54 -0800 (PST)
Message-ID: <f107d7d9-d3a1-a06e-1e13-701fb359db97@threespeedlogic.com>
Date: Tue, 7 Feb 2023 09:56:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
 <20220519160214.214701-1-gsmecher@threespeedlogic.com>
 <20230207163803.GI4124@scaer>
 <aa2d5bd6-f826-1dec-2286-d66838419690@threespeedlogic.com>
 <20230207172902.GO4124@scaer>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20230207172902.GO4124@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T9VvPCI+hqIBbzmYuSFYoSsvKcj//BwPwoqB2j+EQr8=;
 b=G0k43r0uu+habxlw59jnBckkVV65EtabTona9aTCi9QUKmsKX5GgriH168gkQlAgr3
 MkmIAgDgrewGgjaRBGAn6UnqteSbmG9U2dw3pSOM+qhSY4e5Ic7O8kFnBfUaCR2s53XN
 ufr3YMn7QN/mGvf6aHErVH0E508iqOXrqOtCOXpqGJQik44UkjW5Wz5ZrbXXOC9LbQVT
 bj8AjoKim5uRqWMoSQ5+M12EitTCSPnrlQqCi3XWrjsxuLqj0CqfxEj0ibgRfA+d4mJX
 /54JS/KtRxS3dOgEizpKuaRk/4yeuLNno31v/ny0ld4WYqzk84WyTt0dzAWFA/FJYnWC
 ejEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20210112.gappssmtp.com
 header.i=@threespeedlogic-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=G0k43r0u
Subject: Re: [Buildroot] [PATCH v2] package/python-orjson: disallow build
 when using musl.
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 2023-02-07 09:29, Yann E. MORIN wrote:
> Graeme, All,
> 
> On 2023-02-07 09:14 -0800, Graeme Smecher spake thusly:
>> On 2023-02-07 08:38, Yann E. MORIN wrote:
>>> On 2022-05-19 09:02 -0700, Graeme Smecher spake thusly:
>>>> The python-orjson build bails as follows when using musl libc:
>>> I could not reproduce such an error wit the following defconfig:
> [--SNIP--]
>> This patch is obsolete. I used to receive orjson build failures
>> associated with musl on a regular basis - they have tapered off since
>> mid-2022.
> 
> In the meantime, Thomas has bisected the resolution to that commit from
> James:
> 
>      2cbf1e4d3a1a package/python-orjson: convert to use the python-package infrastructure
> 
> The commit before, it fails to build; with that commit, the build
> succeeds.

Excellent - two birds, one stone. Thanks again for all your work.

best,
Graeme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
