Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FA1C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A2EC81F6D;
	Wed, 15 Feb 2023 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2EC81F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZbF2AFXI4BH; Wed, 15 Feb 2023 20:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C711581F7D;
	Wed, 15 Feb 2023 20:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C711581F7D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF1E31BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95EA06116D
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95EA06116D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knoim0qBW9-8 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24E9060A8A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24E9060A8A
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:19:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2484169wmo.3
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 12:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYLBxgtPb+wuShTrDfK0jLb8s2oHvW3hW6m7MFlve2I=;
 b=6jlWK9HPu/Ha/PAqt5hwKW1ATupHXZjrxAjxaQY02euJRTmW+7Q3yenj8lqtOHwGJQ
 D01DDgYOabG70VdPn0NjEQ3ivfg68wO2Lb7lSyCiv+ndGEPcPotFkz1tmYd/eJ2Pjy+B
 pAwskzt+UYoxdaBecL3BRhmpcmfXVca5Rlaw+Yua20cxmy1vqgcVblNaCy1L5H8BKV02
 LtZEk17cRLT1SmjAjc2v6A785x0IU6FXYjEekv8Ekt7172uOhKrfoFAKtPalYElCyt5B
 ++6A9DKHW/Lgh6jab9u7G2g/2ff+Sg2MPVkEaY7CLRVzIr8cDIzQ5EbXjSo0iGU2Ay0T
 z6rQ==
X-Gm-Message-State: AO0yUKXkpgBCCqQM488bFTLJxKa0m0ePto4FZrO6CKSZ7N10ltFKOsbg
 X6H7YLuHzUUIWGrhf2djG9ZNqQ==
X-Google-Smtp-Source: AK7set9avnMiTdViJMEjv7j+LQS3sBi0fyAcAs5lcG5QjH9iWq3/PN7Rkx/iGVRIuLLx9gRv1O43Vg==
X-Received: by 2002:a05:600c:13c3:b0:3e2:40e:6d70 with SMTP id
 e3-20020a05600c13c300b003e2040e6d70mr2238816wmg.36.1676492396175; 
 Wed, 15 Feb 2023 12:19:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df7b40f99fsm3136715wma.11.2023.02.15.12.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:19:55 -0800 (PST)
Message-ID: <abcdda8c-6353-13c3-b516-bd6f7e8278ad@mind.be>
Date: Wed, 15 Feb 2023 21:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
 <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
 <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
 <CADvTj4qOOh89a1NOHD8mkNSBAdGPz3aOgvv_LOKgi8L1-LjE4A@mail.gmail.com>
 <de1bf098-5cc1-90a1-8ac5-b4d5015ab6f0@mind.be>
 <CADvTj4p8vB20X_eUzTu1SVfzpb03XUoO+FMX7RqcHe3F2+z7cQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4p8vB20X_eUzTu1SVfzpb03XUoO+FMX7RqcHe3F2+z7cQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYLBxgtPb+wuShTrDfK0jLb8s2oHvW3hW6m7MFlve2I=;
 b=RK42SLQjPv7D4/hSOD/NJbw+8g6HhdDYEpimrke5VfoFaQnCef9FknmrXC0rITpW9k
 9x4ALydSBWjJKrReVUeyehLXZAB0oiNbvfTmi5D3WOIL1oAe3TsxLE0Rxdm/I6fTcuUu
 ERXcDGJjr/Q2Kz1c93tc+2mNWPrueYs/EZUXfArDipA46Sk0+PBNUQppU9jZ8nLfJwjE
 5ZQN6iQJnxn6ejRSGQfEwPAgo9iPsUM8tJTAvYilHqHo207CjyJg1/ozNsXzW/Fn2C9b
 E14Jj8R/iC/uCrcNx8BwReLmqCxLGH8lkawYczzNaii/sXjFFwIakpYjRZHP176AJelN
 OXPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RK42SLQj
Subject: Re: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run:
 add support for --branch option
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



On 09/02/2023 22:42, James Hilliard wrote:
> On Thu, Feb 9, 2023 at 1:44 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 09/02/2023 21:32, James Hilliard wrote:
[snip]
>>> There are many fixes related to various  --no-toolchains-csv build failures
>>> that would also need to be backported as well if even feasible.
>>
>>    Even so, I'm much more inclined to rewrite the autobuild-run logic to
>> dynamically test which options genrandconfig can take and adapt accordingly.
> 
> The genrandconfig issue is only one of a number of issues that I've
> seen come up,
> there's been a rather long tail of lingering aarch64 compatibility
> issues that sometimes
> require major package updates. For example some systemd fixes for aarch64 build
> hosts aren't really feasible to backport due to requiring major refactoring.

  If aarch64 build hosts are broken on the stable branches, that should be 
fixed, right? At the very least adding BR2_HOSTARCH dependencies...

  Anyway, with 2022.02 EOL in a bit more than a month, it probably doesn't 
matter any more...


  Regards,
  Arnout

> What we probably eventually want is the ability to identify issues as build host
> environment specific by rerunning failed builds on different hosts
> automatically,
> but that would probably require some infrastructure changes.
> 
>> That way you don't have to manually maintain those branches and update them on
>> each autobuilder instance.
> 
> I'm pretty much just using this to restrict my autobuilders to master
> branch when there
> are known compatibility issues with older branches for a particular
> host configuration.
> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>>>
>>>>     Regards,
>>>>     Arnout
>>>>
>>>>> on anything other than say master.
>>>>>
>>>>> To prevent testing of unwanted branches I could modify this to restrict
>>>>> the branch override to only allow selecting the branches listed in:
>>>>> http://autobuild.buildroot.org/branches
>>>>>
>>>>>>
>>>>>> Thanks!
>>>>>>
>>>>>> Thomas
>>>>>> --
>>>>>> Thomas Petazzoni, CTO, Bootlin
>>>>>> Embedded Linux and Kernel engineering
>>>>>> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
