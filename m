Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5972C636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5101882012;
	Thu,  9 Feb 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5101882012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20688hnMeqYd; Thu,  9 Feb 2023 20:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774EB8201E;
	Thu,  9 Feb 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 774EB8201E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55971BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548364063C
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548364063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 323l-CQmkpTf for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BCE4059C
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BCE4059C
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:44:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id c26so5399524ejz.10
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qrfwXtNw1B971SDABpBPpD1iFZ5sGjMqANoocXq+dWc=;
 b=3EnXijko+2C/LbW9VP7LfACrO1v2DgvzfDuxckZbL3uFKkvIYcgIkSFktoLc3qqqyX
 LNHYm6JulOzNuShtpjywxjsZnGjMyzBZnrH0k54Mqo+F3fnC1z/FPFmLKfIDwTuSvSQf
 Zi1KLFmort+y/Lroxwbt4MMJojW76oUCSSPEt/6ZekKkqQsHeRbOi9WYpzRmRj0HQJRf
 3ujfWc76Z/XxSjDD6emVO0wwNj7cqVwS/nML/kEWlAoK2ZDeTpRdTXh1UOATl+qA3RjA
 YYSKqbjSI5k2ophOmvznFpUEFBUO4IYAjNZiWei33T3d+46pZyN2FpuI2PyXY2Q8I/LZ
 Cdtw==
X-Gm-Message-State: AO0yUKXR9GVbQgOB+9nH0FYnGY1s/ZZ6+GMx/8G7sDyeGHqWCvSVo4Xq
 9ICK9p1LAxxLjXHcOO7Qc1c+VA==
X-Google-Smtp-Source: AK7set/yD0qkCa4/+MnvU6uDQic5nmjqjoHEyZSpl2gM1MOqvTQX0G173pnqhNGo1ynUeHFIcWQZBg==
X-Received: by 2002:a17:906:53c8:b0:883:b70b:c04e with SMTP id
 p8-20020a17090653c800b00883b70bc04emr13033486ejo.60.1675975449183; 
 Thu, 09 Feb 2023 12:44:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709060c0200b008786619684csm1328472ejf.125.2023.02.09.12.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:44:07 -0800 (PST)
Message-ID: <de1bf098-5cc1-90a1-8ac5-b4d5015ab6f0@mind.be>
Date: Thu, 9 Feb 2023 21:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220607231211.533086-1-james.hilliard1@gmail.com>
 <20230208161527.31a28b3b@windsurf>
 <CADvTj4rZZ-yewR2utW7r7++y7HziG5CE2=_beWgskS1XXL4PQg@mail.gmail.com>
 <eca0040f-d111-2b84-f086-a1f9f26b53da@mind.be>
 <CADvTj4qOOh89a1NOHD8mkNSBAdGPz3aOgvv_LOKgi8L1-LjE4A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4qOOh89a1NOHD8mkNSBAdGPz3aOgvv_LOKgi8L1-LjE4A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qrfwXtNw1B971SDABpBPpD1iFZ5sGjMqANoocXq+dWc=;
 b=ewkTgZHpDk4pVCyv7MLTgMZ60wOd45i3QRtpf1fJ3pEJWeImP8CHNUjwIE/dOjJzUL
 WushfX+2nUqVFcdhe2W/yCsIUetM9q56BFOjKKhe9NT5Bqw/UzrOAGj4dYXeOGK2ZuKq
 CSFxt188Dc6mInwgFKeVhm2weL6f7qMMAUmJ+TV7OBpZLfvgkVcf4lptIDUIGfHGBw44
 ePMFRn9KY/e5xxk0rusII5IggmWBKOu7/NLxy7BybPfBwa2QzlnWe3ZzOLP1WSibdR84
 5Crppl+4f4cRWXXuOGxj4nHC/R9WHtrI0gnhx5j8O8dvxA5p+PL65z7Ti1YPyO9btc22
 DBIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ewkTgZHp
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



On 09/02/2023 21:32, James Hilliard wrote:
> On Thu, Feb 9, 2023 at 1:19 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 08/02/2023 17:46, James Hilliard wrote:
>>> On Wed, Feb 8, 2023 at 8:15 AM Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> On Tue,  7 Jun 2022 17:12:11 -0600
>>>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>
>>>>> In some cases it only makes sense to run tests against a specific
>>>>> branch, such as when testing new genrandconfig flags.
>>>>>
>>>>> Add a config option to override the branch selection.
>>>>>
>>>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>>> ---
>>>>>    scripts/autobuild-run | 11 ++++++++++-
>>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> We looked at this with Arnout, and we don't really see what this would
>>>> be needed, and actually it could be annoying to have people test
>>>> "random" branches. If you need extensions to genrandconfig, then the
>>>> autobuild-run script should be backward compatible with older versions
>>>> of genrandconfig to be able to support older branches for a certain
>>>> while.
>>>
>>> There are a number of other reasons this is useful, for example some
>>> build hosts(for example my asahi-linux build host) have compatibility
>>> issues in older branches so it doesn't make sense to run autobuilders
>>
>>    If there are compatibility issues, the fixes should be backported to the
>> stable branches...
> 
> Some of the changes would be rather difficult to backport, for example
> the 2022.02.x branch doesn't have support for --no-toolchains-csv which
> is effectively required for supporting non-x86_64 autobuilders as we
> obviously can't use prebuilt toolchains that only run on x86_64 hosts on
> an aarch64 host.
> 
> There are many fixes related to various  --no-toolchains-csv build failures
> that would also need to be backported as well if even feasible.

  Even so, I'm much more inclined to rewrite the autobuild-run logic to 
dynamically test which options genrandconfig can take and adapt accordingly. 
That way you don't have to manually maintain those branches and update them on 
each autobuilder instance.

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>> on anything other than say master.
>>>
>>> To prevent testing of unwanted branches I could modify this to restrict
>>> the branch override to only allow selecting the branches listed in:
>>> http://autobuild.buildroot.org/branches
>>>
>>>>
>>>> Thanks!
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, CTO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
