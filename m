Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511DBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9F8B60E55;
	Sat, 12 Mar 2022 16:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EMqE1urcJeH; Sat, 12 Mar 2022 16:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8DB60E4C;
	Sat, 12 Mar 2022 16:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 472FA1BF41A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FA5760E4C
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5V50TSwmFjO for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:00:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A586A600CD
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:00:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id p15so25175760ejc.7
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RF9lhTgy7kk72z2hSVF6qo3FkjnHNhYM/T4cLPyr/qw=;
 b=CXoBFEaAprD857phpybMPTesk5vq44OZ8eoeeupAonKGYln0WOkDlu8nPOVMzy7+u1
 s2wYBvRb9u/vvNzaRqv+lCA2hNPG2z5EJjOrzx+v21ZWslPzDwZtT8fhS1uExqK0TEpq
 8ROYKMGnbzODJ4VbLEfN6LOyHFNDtCsxVGZHbtKbQPpqwZoirKgADQTuBr1pOpfj9Xvu
 LzhPURAAar2ViC7v7zsXaYs7yaJe2aUf3Cj43A5pp5m9EQ28fq5zhb1l1vTgqPHF+13P
 om+dNh+1OJUhyaar5dG8viMtJFhlD5BeJGg5o8lV6m9hMxExFF7pqzxxOm7QERcq9pGc
 VP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RF9lhTgy7kk72z2hSVF6qo3FkjnHNhYM/T4cLPyr/qw=;
 b=BxNbITrjh1aMP4YY/cMBoxSqopv7eDAVzNJki/86YKwPlFWUijv+5YW2+VazySSZ1k
 9zZZVD5RcMde1nmjOj/475Eo8M8Ahmw5KPMim/8O/Kw0gcHI4El17WUxwI3tXd6F4LIL
 5xqZC4+tyBhndfLc+mWJOA7zJEMPuZlTLF54o5l7r2/5YXwe53rCVwLZL/2H6kEiPWuk
 GX25carWOo59rq1S7YbqpqLaOdgsKo0GMJnLhLGhUiNKcZ0sSnBVpmSnXX+7IFLDsj8E
 s0WuTI+AZe+lVFw7gea7bo0+Z+hNo3DAz+QvUtyMP+0riLeSHMB7ydYjkNZrOo2YnT/V
 2GOA==
X-Gm-Message-State: AOAM531lOQnnGrr2DGo5qRIPkIBaFc4ZJNhDfm4XzFqbWj9xBgZEUrR5
 VDYiKsvPwzqrkrv40JJC7J/BKtr+EZeWOA==
X-Google-Smtp-Source: ABdhPJw2Nm/GG+LPTAiV+AClquTgDOUaMLD3fd+71d3Zh+5Cb4EwBlw2SKUvKknZnjdldJP7NK0WcQ==
X-Received: by 2002:a17:906:bb01:b0:6a7:df9:d67c with SMTP id
 jz1-20020a170906bb0100b006a70df9d67cmr12393189ejb.733.1647100846559; 
 Sat, 12 Mar 2022 08:00:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gr14-20020a170906e2ce00b006da9ea6377bsm4451753ejb.116.2022.03.12.08.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:00:45 -0800 (PST)
Message-ID: <3ce1b58b-7721-a63a-4503-11e89fd55f22@mind.be>
Date: Sat, 12 Mar 2022 17:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>
References: <20220310140350.1955655-1-john@metanate.com>
 <20220310213840.32655ec7@gmx.net>
 <c5548e2e-8cd5-141e-3f8a-060127e43540@mind.be>
 <20220311082413.4bfe7465@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220311082413.4bfe7465@gmx.net>
Subject: Re: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: John Keeping <john@metanate.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/03/2022 08:24, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Thu, 10 Mar 2022 22:03:23 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 10/03/2022 21:38, Peter Seiderer wrote:
>>> Hello John,
>>>
>>> thanks for the patch, some minor nitpicks...
>>>
>>> Better patch subject would be:
>>>
>>> 	package/openssh: add upstream patch to add seccomp ppoll_time64 support
>>
>>    Applied to master with this changed.
>>
>>>
>>> On Thu, 10 Mar 2022 14:03:50 +0000, John Keeping <john@metanate.com> wrote:
>>>
>>>> sshd is broken on 32-bit systems because ppoll_time64 is used by the
>>>> application although it is not allowed by the seccomp filter.
>>>>
>>>> Apply the upstream patch to fix this.
>>>
>>> Better:
>>>
>>>     -add upstream patch ([1] to add seccomp ppoll_time64 support
>>
>>    Since the subject now already says that it adds seccomp ppoll_time64 support,
>> this is redundant. Since I'm lazy :-), I didn't change this.
>>
>>>
>>> [1] https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch
>>
>>    There's already a reference to the upstream commit in the patch itself, so
>> this is not really needed.
>>
>>>
>>>>
>>>> Signed-off-by: John Keeping <john@metanate.com>
>>>> ---
>>>>    ...llow-ppoll_time64-in-seccomp-sandbox.patch | 31 +++++++++++++++++++
>>>>    1 file changed, 31 insertions(+)
>>>>    create mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>>>>
>>>> diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>>>> new file mode 100644
>>>> index 0000000000..34b309bd9a
>>>> --- /dev/null
>>>> +++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>>>> @@ -0,0 +1,31 @@
>>>> +From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
>>>> +From: Darren Tucker <dtucker@dtucker.net>
>>>> +Date: Sat, 26 Feb 2022 14:06:14 +1100
>>>> +Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
>>>> +
>>>> +Should fix sandbox violations on (some? at least i386 and armhf) 32bit
>>>> +Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
>>>> +debian.org via bz#3396.
>>>> +
>>>
>>> Missing:
>>>
>>> [Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
>>
>>    Except for the signoff, the patch is literally the upstream patch, including
>> the sha1 in the From line. So an upstream reference is not really needed. Still,
>> it's useful so I overcame my laziness and added it.
> 
> But the sha1 alone does not tell to which git repo it belongs to, but the explicit
> upstream link does (and has the nice effect to gain a one-click link to the
> corresponding patch/merge-request etc.) and is a prominent remainder in case
> of package version bump where the patch comes from...

  I don't know about you, but the normal way that I generate patches is to clone 
the repo and do 'git format-patch -1 <sha1>', and then add my SoB. And if it 
doesn't apply cleanly, I first do 'git cherry-pick -x -s'.

  Obviously it's helpful to have a link there. However, requiring contributors 
to go and find the upstream web frontend and construct a URL is IMHO asking a 
lot, especially since chances are that no one is ever going to actually look at 
that link. There's already plenty of steps a contributor has to go through, I 
don't want to increase the threshold even more.

  Regards,
  Arnout

> 
> Regards,
> Peter
> 
>>
>>    Regards,
>>    Arnout
>>
>>
>>>> +Signed-off-by: John Keeping <john@metanate.com>
>>>> +---
>>>> + sandbox-seccomp-filter.c | 3 +++
>>>> + 1 file changed, 3 insertions(+)
>>>> +
>>>> +diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
>>>> +index 2e065ba3..4ce80cb2 100644
>>>> +--- a/sandbox-seccomp-filter.c
>>>> ++++ b/sandbox-seccomp-filter.c
>>>> +@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
>>>> + #ifdef __NR_ppoll
>>>> + 	SC_ALLOW(__NR_ppoll),
>>>> + #endif
>>>> ++#ifdef __NR_ppoll_time64
>>>> ++	SC_ALLOW(__NR_ppoll_time64),
>>>> ++#endif
>>>> + #ifdef __NR_poll
>>>> + 	SC_ALLOW(__NR_poll),
>>>> + #endif
>>>> +--
>>>> +2.35.1
>>>> +
>>>
>>> With this fixed you can add my
>>>
>>> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>>>
>>> Regards,
>>> Peter
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
