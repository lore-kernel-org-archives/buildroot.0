Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A27BC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 09:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E7C41B85;
	Wed, 29 Mar 2023 09:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E7C41B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9pzw2FepXG8; Wed, 29 Mar 2023 09:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA6D41C10;
	Wed, 29 Mar 2023 09:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA6D41C10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA3A11BF35D
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 09:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C34D41C10
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 09:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C34D41C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyzvpCFB6VOu for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 09:06:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF8E41B85
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CF8E41B85
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 09:06:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id er13so19391652edb.9
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 02:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680080810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5n3HBFqgxK84m2lO26U1iMjC/Ua8cmUM8OogXeKwlkk=;
 b=1Tn198OcgRTb0uVorJ1a3Pko6GxBP4q0w3gLYhtHwRmLzAFTDGDAhwSuZak89Yvm99
 8cDpay7+LCy4wAJO03KyLx79YqlxMi/zdBJF4jcF78WqPh0UDscCtxnQPQNiaP9L6x+G
 gpogzv7xO/8MdfNzMCBMknlgc8X5c/MV2GvHmLBBOu6xAzrHRuwm0cEAAgxOAON94erR
 hS/imt9zxc5NYNopYpkGQy1vy3sUjTVJiGxuA43oaWYA3lisokIC4ioDYBZtc4TmnT3x
 4xyL8g4rtyQ92l3gp9qzufZTuCB7RvJ3+B5Q0izKVk67DrdPk7Xzp9At2KtP1EQMXEgP
 ERHw==
X-Gm-Message-State: AAQBX9fc/3GeV4PA2o5nyEVtFPcDkb3uwVG74D9RHQS6IHe3v+MlLXL7
 YFA0qNQ/iJNilmE70fDwoEziQw==
X-Google-Smtp-Source: AKy350aFWhClR9ohGsnh3w2+RwfThXRMPLiUXrzbc21HJXQuxADNL4yGtQzOmLs+XPbHcNyPLT4sCA==
X-Received: by 2002:a05:6402:44b:b0:4fa:b05e:ced5 with SMTP id
 p11-20020a056402044b00b004fab05eced5mr17368161edw.36.1680080809950; 
 Wed, 29 Mar 2023 02:06:49 -0700 (PDT)
Received: from [10.1.0.169] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 i7-20020a50c3c7000000b005023a4b20dfsm5053209edf.2.2023.03.29.02.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 02:06:49 -0700 (PDT)
Message-ID: <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
Date: Wed, 29 Mar 2023 11:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230329105022.6137bf1a@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680080810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5n3HBFqgxK84m2lO26U1iMjC/Ua8cmUM8OogXeKwlkk=;
 b=UBOmU51GK3dPV5Z/oGjnG1H6W976agXXYSQZYP7JMeOpTmkFRgTX+gSlgwVI3DMuEY
 A7x/xqU5e65rxmy5gnz0BLwnhuIPZjntaanlkPMjUYwSaFO4+ZOlaQPVIXY0ANWHdKKS
 Wwuc4Qrg635Ab1CZhwomsWErCYUusJO/MtE5jHiGbNvqGSXz82BoNCtAK+LRP2qJgaTP
 Pn7IuacsSEeE4N/h7ij5hQBio9m3esmQ0p9PVHOGdYSe9Tz68sHg9wP5VRIC4eyVSQkJ
 plVKXz574DTHUhiQ7Mde6NMGaQfSjERjdg7qaiw78ExodcuAtwEr/z0VY65f0F+46IiK
 c6Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UBOmU51G
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/03/2023 10:50, Thomas Petazzoni wrote:
> On Wed, 29 Mar 2023 10:44:38 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> Note: if the path header has the upstream commit sha1 and applies as-is
>>> (possibly with just a bit of fuzz), then "backport from upstream" is
>>> enough. But if you had to rewrite the ptch, and the header does not have
>>> the upstream sha1, then add it to the note:
>>>
>>>       [yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]
>>
>>    So this would be
>>
>> Upstream: backport from 1234CDEF [yann.morin.1998@free.fr]
> 
> If we standardize in a format, then it should handle all common
> situations. A patch being a backport from an upstream commit is one
> situation. But here are several more situations:
> 
> - Patch taken from the upstream project, but not merged yet (from a
>    pull request, a mail on a mailing list, etc.)
> 
> - Patch taken from a downstream distribution (Debian, Gentoo, Alpine
>    Linux, etc.)
> 
> - Patch submitted upstream by us, but not merged yet (quite similar to
>    case 1 above)
> 
> - Patch not submitted upstream for reason XYZ

  Yeah, that's why I propose "Upstream:" - it's generic enough to cover all of 
these cases. The contents can be freeform I think, check-package should just 
check that the Upstream tag is present. And the documentation should give 
examples of the five cases you mention.

  The "patch taken from downstream" is the only one which doesn't fit in the 
"Upstream" thing. But it's also a situation we don't really like: we basically 
don't want local patches, and a patch taken from some other distro _is_ a local 
patch.

  Regards,
  Arnout


> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
