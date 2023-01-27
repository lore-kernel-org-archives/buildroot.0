Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B99C05027
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 00:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D48C41B5A;
	Fri, 27 Jan 2023 00:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D48C41B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOPPlnTqw_6N; Fri, 27 Jan 2023 00:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833B441B6B;
	Fri, 27 Jan 2023 00:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 833B441B6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6901BF2F3
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 00:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 536F940156
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 00:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 536F940156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4v-w3CFx2M4s for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 00:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A784059B
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A784059B
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 00:10:56 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d3so3380974plr.10
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 16:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KqYWbw3YoKRSD4+g1S22iltfv7YWRC4hgDK3hlytzEI=;
 b=ayXfd0uquaALaEPXVMzxNX+/IkDabdyGBKGmVYv8N+Mj81d4VBR0rnQPRO7Ul3Ya4/
 kDInoBfTb01fVyMWDyHz88lGHPH1ZlF+4bSOQTvcaoTlO/+UMKzc+p6oVY136nyg+U1t
 OCKRQuY00mMBWytm+ZsaF/DAQfQUP3OCLoDldh9Q+ctDHf19tdH/3g4Gs09b16tOeJF1
 MU6Q0mKf1uujCi3V6GhNgO4bWirqVqhffcdMTVWzs1ycqkh+Dfm8Uhc1z7I2cYQkKfsj
 sc0VdjkAQHZV30uSCxyQ8JGmml4DJjy0q8xrYd+f7+iNq1cRdIgH4kW3a4BCQK/rLSHl
 9OUg==
X-Gm-Message-State: AO0yUKWurwIBSAoo5I8mTHmMY8sDzRcHR0etiERPghDQZdRhd7E4baQD
 u3C02oWOOwFRsvpSRNPVFh8=
X-Google-Smtp-Source: AK7set+mSVn/fHjKTVKsuyKsuInNVe3a+NM85opYi6yOxkkStpYCakzOrLaN1IMhDxpCefYHZZpO3A==
X-Received: by 2002:a17:902:da8d:b0:196:3232:f496 with SMTP id
 j13-20020a170902da8d00b001963232f496mr7902460plx.4.1674778255749; 
 Thu, 26 Jan 2023 16:10:55 -0800 (PST)
Received: from [10.230.29.214] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 jk22-20020a170903331600b00194c82c2a7bsm1513816plb.224.2023.01.26.16.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:10:55 -0800 (PST)
Message-ID: <df9881bd-6067-898d-6755-67bfa7dfdb8c@gmail.com>
Date: Thu, 26 Jan 2023 16:10:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
 <7c025ff4-0e4f-111a-18c9-54441d322f93@gmail.com>
 <PH1P110MB1603D54206C56ED78C53B2769FCF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <PH1P110MB1603D54206C56ED78C53B2769FCF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KqYWbw3YoKRSD4+g1S22iltfv7YWRC4hgDK3hlytzEI=;
 b=LoGRUcLHabhiybAEePB0L7xeFL5AglosZL6bUYYDPb4qrn5rNmelFlYLqBbAQKDhxF
 0CZhKmS+9nrwjeSoqvV+oDalvHiNERACkSKHZJqWS1DpAIaIlnewT/aPoND44w6DfOxk
 WvF+nT1PcdflhuVaaPhJaNZwk+jVt6pJpKhe8wu6NP0s5/AW6t0nJ4wg8z6F1iZCx0sd
 JqGyizw1hHPmVjedbH7pMf3OHW3N7onLPDZ/RSUE1MueZZC9bn0KgOjjTNg68PxWi8QU
 wlJLT9icntK61BqkXK9VyR9DNUtGTCkCojJNd4wNxh9aErundGBfvQ8FR4Y63ScLUsJ9
 8Uyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LoGRUcLH
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] package/ethtool: fix
 builds for older toolchains
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 1/26/2023 3:12 PM, Vincent Fazio wrote:
> Florian
> 
>> -----Original Message-----
>> From: Florian Fainelli <f.fainelli@gmail.com>
>> Sent: Thursday, January 26, 2023 4:22 PM
>> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
>> Cc: Matt Weber <matthew.weber@collins.com>
>> Subject: [External] - Re: [Buildroot] [PATCH 1/1] package/ethtool: fix builds
>> for older toolchains
>>
>> Hi,
>>
>> On 1/26/2023 10:50 AM, Vincent Fazio wrote:
>>> Upstream commit 1fa60003a8b8 made a change to headers that broke
>>> compiles with toolchains using kernel headers prior to 4.11.
>>>
>>> Apply the patch slated to address the issue.
>>>
>>> Fixes:
>>>    -
>>> http://autobuild.buildroot.net/results/e69886deb6ff466db96043388b5dac7
>>> 271a5ec58
>>>
>>> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
>>
>> Why not also take patch #3 so we fix build issues with musl C libraries?
>> Thanks for doing this.
> 
> I can do this, but I was trying to keep the fixes as atomic as possible. I haven't seen any autobuild failures for musl yet.
> 
> Have you heard back from Michal about applying to upstream? I was debating holding off on this patch with the assumption that 6.2 may be released soon.

He said he was going to apply the backlog this week: 
https://lore.kernel.org/all/20230124083907.w7h6rbvh7fsq334y@lion.mk-sys.cz/
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
