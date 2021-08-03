Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACC5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7532C60525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7532C60525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40DFB82572;
	Tue,  3 Aug 2021 15:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Paidln66PueX; Tue,  3 Aug 2021 15:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2F882AEF;
	Tue,  3 Aug 2021 15:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1231BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE24E60890
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_yPGP2TL4dR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:18:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D675E6088D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:18:34 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y7so27202724eda.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/rX6epnTAqQhfi4kKKNnQxEjk0xwJZtDtX6CpuE9eY=;
 b=alRTIjkAIiJJm4efGqOp7ZKDpe7tacAfJoBlz9GHy5y2Cm2BGDOj0ABHhAjmcJY5kj
 ZizFspJtrLr4fstB8rhjORtEiF5fU3TzY4s+Do/zysqmJQycLrU3YoNL1b3rsiD64fDW
 0wdK0LGIl2w4cSmlIwhUt/+aToMR2ihAnHJ7EQMpa6xnB1loAypR2hTJ2ITNIimADCW7
 fQ45UHSA5yBbZD3XXljYttHfujzOtUocunFQKlie7iqV31eSaFEF4WLzWEx/UwX6WnT6
 AJVEhMemtXcYR7yBQkq3jmXDBgKvjT8ZclLuQ71uvOpd18OLJXcz1TVlAYiFlG0KsSfp
 DCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m/rX6epnTAqQhfi4kKKNnQxEjk0xwJZtDtX6CpuE9eY=;
 b=R8DQfrdjiUMMTOG8vNjo5x9LOuZexz1OslibqCNYuHzR2ZvSgbxAWnVlOIhbbPD62z
 yHkgXYz+3+I+rnoPatILjt6fMrZa0UBIg2loLTB7MsrYSvLoxdiMvA+vy4BMUxV7g51i
 XoBycCmyUG+zf4cJiw4BVSed+4cMx1BnkJYzCCGTwFJZfzVhBWsYVSDs6eU6V+akH9NM
 4ZpdtsuRvk+5Nj2o0AMfL+bX4Jpj9Lg5xwrMhJDo/otQLfZMzOsx9htkyz6i8BMJuSmH
 qiTT4akQ0hgWxSKXo0bnCgZwlmi/OowPPRTz1oQFLfxTJwl/G87mex80dnDO5p1BusiG
 P/ag==
X-Gm-Message-State: AOAM533VMJFers9UZ3cGHKHVwiXGoePEd58G3h2dYDy9GYkzVJoNUdKz
 skBbwLbjN4CXT5k4gziIsqbjOA==
X-Google-Smtp-Source: ABdhPJxuoj50G5omSar7LtkIbuL5kXtBi7j2O675bMOB6kMcAoNJL6n5vib/Ii9zyYn0ErnBY/y/4w==
X-Received: by 2002:a05:6402:60e:: with SMTP id
 n14mr10439511edv.142.1628003913053; 
 Tue, 03 Aug 2021 08:18:33 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id n26sm8268619eds.63.2021.08.03.08.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:18:32 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802205506.GE27036@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <05074f16-b64e-cedd-b40c-19b526c995c3@mind.be>
Date: Tue, 3 Aug 2021 17:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802205506.GE27036@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [RFC 1/2] docs/manual/migrating.txt: add section
 with general migrating tips
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



On 02/08/2021 22:55, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> This is based on Arnout's experience with migrating Buildroot.
> 
> Except for the details, this also quite closely matches my own
> experience.

 Excellent. I'll remove the RFC bit from v2 then.

> 
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  docs/manual/migrating.txt | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
>> index 92e487c71e..9fd7d7e676 100644
>> --- a/docs/manual/migrating.txt
>> +++ b/docs/manual/migrating.txt
>> @@ -8,6 +8,34 @@ Some versions have introduced backward incompatibilities. This section
>>  explains those incompatibilities, and for each explains what to do to
>>  complete the migration.
>>  
>> +[[migrating-approach]]
>> +=== General approach
>> +
>> +To migrate from an older Buildroot version, take the following steps.
>> +
>> +. For all your configurations, do a build in the old Buildroot
>> +  environment. Save the full +.config+ and
>> +  +build/packages-file-list.txt+.
> 
> (read my comment below first, then come back here)
> Maybe run 'make clean' here?

 Mentally I assumed there would be an "old" buildroot directory with its output
directory, and a "new" buildroot directory with its distinct output directory.
But I indeed didn't write that, and in fact I don't work like that myself. So
'make clean' it is!


>> +. Review the specific migration notes below and make the required
>> +  adaptations to external packages and custom build scripts.
>> +. In the new Buildroot environment, run +make menuconfig+ starting from
>> +  the existing +.config+.
>> +. If anything is enabled in the Legacy menu, check its help text,
>> +  unselect it, and save the configuration.
>> +. Review the CHANGES file to see if any of your packages and features
>> +  are affected by the changes.
>> +. Build in the new Buildroot environment.
> 
> Above, you said to start with a full build, so if folowing this sequence
> to the letter, we still have a full build. We need to run 'make clean'
> first (go back reading my comment, above).
> 
>> +. Fix build issues in external packages (usually due to updated
>> +  dependencies).
>> +. Compare the new +packages-file-list.txt+ with the original one, to
>> +  check if no required files have disappeared.
> 
> Maybe also suggest graph-size et al. about investigating size changes,
> too?

 Excellent idea. You can easily compare the csv files.


>> +. For configuration (and other) files in a custom overlay that overwrite
>> +  files created by Buildroot, check if there are changes in the
>> +  Buildroot-generated file that need to be propagated to your custom
>> +  file.
>> +. Run +make savedefconfig+ and verify that what is selected really is
>> +  what you intended to enable.
> 
> I am always wary instructing people to look at defconfig files; I always
> consider them to be artefacts of the configuration.

 I agree with the principle. Unfortunately, I know of no better way of getting
the "top-level" packages.


> Rather, I suggest people read the output of legal-info to check that all
> the packages there are acceptable, and see graph-depends to see how a
> package came to the build.

 Theoretically, graph-depends gives the top-level packages as well (i.e. the
packages that ALL points to). However, for a reasonably-sized project with about
50 top-level packages, the graph is pretty much unreadable. 'grep -w _all
graphs/graph-depends.dot' is an alternative but it's not exactly user-friendly -
and it doesn't show the selected sub-options like the defconfig does.

 The defconfig isn't great either, of course. For example, it doesn't show the
sub-options that default y, and also choices aren't expressed very clearly.

 Actually, the main reason I use the defconfig is that it comes for free: 'make
savedefconfig; git diff'. So maybe I should mention that instead.

 Since this is a bit controversial, however, I'll just drop this point.


 Regarding legal-info: if it's just about getting a list of packages, graph-size
already gives that, so I think I will talk about graph-size but not about
legal-info.


 Regards,
 Arnout



> 
> Regards,
> Yann E. MORIN.
> 
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
