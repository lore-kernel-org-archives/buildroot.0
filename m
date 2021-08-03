Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25530C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E7C60240
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7E7C60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75983608BC;
	Tue,  3 Aug 2021 15:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYuBNaHpchKy; Tue,  3 Aug 2021 15:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C619360890;
	Tue,  3 Aug 2021 15:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6E721BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C36F9832B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfC1Ek0T3h4v for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7236C83294
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:19:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d6so21815774edt.7
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5adXhoxc8e/fetS7ofWK0MPS5wcrKBwCWQ8JZa1eJ6A=;
 b=CSQDkSmep9EbKCUuCsh5XaFkb/A1d6nskExerEWK7SDN6NWYsV7BjZfo2P4eh9G02z
 PwoobR0S5fayz3atQ1sAfQkbFdI23GrNqZpuQ5hoI7gv4IrJHWiyHMZhNs9FplmB1EE+
 oMdnZUPeLVgZ7+WoEDhYbRYT54I4J0Bm1ZU9lX4/+FgfT722/KAnPIdykInxV7mHYyaP
 0I26Moa6uh8Pxg0ochEQ7TGMSU/uu2+RR4xUrIT4pUodeRLGOBoxzwuim86Jqm9Yrc6p
 KO2/n6Y/u8D4zGvvWa/XRmCqVIQ03K6CWSxjzYcgMDkP0FZGqLn7BdXIoWhKBXwPuD2z
 aKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5adXhoxc8e/fetS7ofWK0MPS5wcrKBwCWQ8JZa1eJ6A=;
 b=ZtCPIVjZ2brAZqBI5vVdwmjlLCodRnEJIaHTbyVIK+Q62uGvqyDJ6+wfefPpKRIe9z
 aQWm4N+EcWFa9xTx0BMNjlXFsQ82BFoi17ITtJ18BqIVqPWGX7NZZ1J4MRwZ/PA3vJ8J
 nVTqtb0iRrI6EDZ5dttzdqK4QpECP3+0q90W/NOTfei/zTbDxj/EiBSySuGYLPKyIxrx
 r0zq47xPFj6K3eKOrjuXq3GLchZnGc3MCwal/4f8qaeWqwNzxkWgM36Exd//DAUyb/66
 8wtJDq2Mn+T/tHX5wv+BLneCNEPv0ZUgrUQLLorJiwDfmPiDgSqzIVD2lpMYgyPLvXh2
 aSgw==
X-Gm-Message-State: AOAM530jnUY49QsLbzyF6AY7TKWqVCVM3/aHtyv38XbEDOr6fvK48OyN
 S422scp8MNCuGVhYQCnMC/RSRg==
X-Google-Smtp-Source: ABdhPJzSiotyH0iUUdfwxbv65gQk508D3DIEh+kB4xqvVMeau9PF6OlNsgdPgc2KZnYuZoNooRYKBQ==
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr26785350edd.293.1628003997609; 
 Tue, 03 Aug 2021 08:19:57 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id q8sm8302220edv.95.2021.08.03.08.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:19:57 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802162244.620782-2-arnout@mind.be> <20210803054842.GF27036@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4b68e8fc-81ce-d0f9-9337-df95eb3715ea@mind.be>
Date: Tue, 3 Aug 2021 17:19:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803054842.GF27036@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add
 "individual packages" section
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 07:48, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Add a section to the migrating documentation to explain what changed in
>> individual packages and how it may affect your build.
>>
>> This section is organised per package, not per Buildroot release,
>> because in general it's easier to check package per package if anything
>> changed than to check release per release for all your packages.
>>
>> The idea is that every time a package is changed in a way that is not
>> immediately obvious (mainly: affects runtime but not build time), it is
>> mentioned in this section. This may include:
>>
>> - a new version of the package got a new name due to API
>>   incompatibilities;
>> - the default behaviour or config optoins of the package changed;
>> - the Buildroot integration (e.g. configuration file, init script) of
>>   the package changed;
>> - what is installed by the package is changed (e.g. executable is
>>   renamed or removed).
> 
> No. Please, no.
> 
> We already have two locations were changes in packages are identified:
> 
>   - git commit logs, the authoritative reference,
> 
>   - the CHANGES files
> 
> I do not want to have to maintain yet a third, ever-growing and
> never-trimmed list. Also, we will always have to bikeshed whther such a
> change is disruptive enough or not to warrant being on that list...
> 
> Instead, I would just suggest that people run "git log --oneline" or
> "git log -p --stat" on the packages they are interested in.

 That's good advice as well. Simple "git log" should be sufficient though, if
the commit log is OK. "git log --oneline" is definitely not OK, because
important changes during a version bump will not appear in the oneline.

 I'm going to add a bullet point for this and merge it into the first patch.

 Regards,
 Arnout

> 
> And of course, that means we *need* well-written commit logs (but we're
> already pretty good I believe).
> 
> Having a section about the core internals, like the br2-defconfig stuff
> that is not obvious, or about the RPATH of host packages, is acceptable,
> because it is not easily discoverable.
> 
> Regards,
> Yann E. MORIN.
> 
>> To start with, add the recent changes of the installation defaults of
>> bluez5_utils.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  docs/manual/migrating.txt | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
>> index 9fd7d7e676..36e4aa4724 100644
>> --- a/docs/manual/migrating.txt
>> +++ b/docs/manual/migrating.txt
>> @@ -22,8 +22,8 @@ To migrate from an older Buildroot version, take the following steps.
>>    the existing +.config+.
>>  . If anything is enabled in the Legacy menu, check its help text,
>>    unselect it, and save the configuration.
>> -. Review the CHANGES file to see if any of your packages and features
>> -  are affected by the changes.
>> +. Review the individual packages section below to see if any of your
>> +  packages are affected by the changes.
>>  . Build in the new Buildroot environment.
>>  . Fix build issues in external packages (usually due to updated
>>    dependencies).
>> @@ -36,6 +36,17 @@ To migrate from an older Buildroot version, take the following steps.
>>  . Run +make savedefconfig+ and verify that what is selected really is
>>    what you intended to enable.
>>  
>> +[[migrating-packages]]
>> +=== Individual packages
>> +
>> +This section describes changes to individual packages. For all packages
>> +that are built in your configuration, check below if changes are needed.
>> +
>> +==== bluez5_utils
>> +
>> +Since 2021.08, the tools and all plugins are optional and default off.
>> +Make sure to enable the plugins you require.
>> +
>>  [[br2-external-converting]]
>>  === Migrating to 2016.11
>>  
>> -- 
>> 2.31.1
>>
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
