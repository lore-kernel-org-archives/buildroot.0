Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E4C19F2B
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7079260E80;
	Wed, 27 Jul 2022 16:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7079260E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFSrm1gzqk9U; Wed, 27 Jul 2022 16:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FDD360E69;
	Wed, 27 Jul 2022 16:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDD360E69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4357D1BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B978176D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B978176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2dTvMdStftK for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:44:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 047AA8176C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 047AA8176C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:44:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l4so3701198wrm.13
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MoegZZUYNlunRGBICIupTrahGH4yYF0vOucdhh0uhB0=;
 b=oboZ/bn3+2K9AnwF+mB9F78FpBzIHI9Kuvr5hafNJISRGLMF/GTKxMsPxFrL1tNbIX
 3TqXXnZl8+28UEtNQ1aeT3tmBZEL7RKJcLyOgn+JDInomESrrSerMPxC276cUdT6JeeN
 4g9ha25QCbjoichW6nOWmoi2W9wwkmY6/qIGiXVaXl31KAAy/9IjUzRS4sdotdn7GXD1
 gvyhlyqFgIx+83E36UMiYy7pO4mCsMfpyDVWA87EM3Fx7mL8tMJe0o91K3eYBLmiV9Tz
 gdm+q3zQ9Z6IlHXl4WN8CDGHkK3ytR7KC5S0HfHLx/0fhVHDjGaWAYvgtWxJX1qIhb+q
 xj4A==
X-Gm-Message-State: AJIora9RoUD7n7zZ5rN1wYs3k2hnV1ZDLfDrbZxEZZ2ni0ayOu9HdBdH
 kODr3YSfhRrHcYdYpUmL00scyQ==
X-Google-Smtp-Source: AGRyM1uUu68/7Zq3GcldM/TG/VLD6Oz2S7s/TtiZyDAQmY3Q2w52aulrdzpdzM/hGLJbhnYz58T7gA==
X-Received: by 2002:a05:6000:2a8:b0:21e:4adc:83d5 with SMTP id
 l8-20020a05600002a800b0021e4adc83d5mr15527894wry.6.1658940239153; 
 Wed, 27 Jul 2022 09:43:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b0021d65e9d449sm17193672wrz.73.2022.07.27.09.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:43:58 -0700 (PDT)
Message-ID: <1d66703f-c4f1-7b76-db0c-e0bb94ec0d9c@mind.be>
Date: Wed, 27 Jul 2022 18:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220727150230.2529065-1-arnout@mind.be>
 <20220727162040.GE1134587@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220727162040.GE1134587@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MoegZZUYNlunRGBICIupTrahGH4yYF0vOucdhh0uhB0=;
 b=SDmcvxLLfshIJo0wutV7JBkvk3rvmVZJw8clay2tlHKqnjM18Lr7XP3n/CM27tDNnJ
 o4DQq0G+L0guv24UJA4LNrDNbDFmhspMgxcm6ZQ8SPEKYrCNAdkki3kY3sT6ABIxQBm/
 2llKlRrNo01ki+fLSf8f6Ib/bCLEbUikMlcCpRJy1vv8AymBu573rWQYIZm5xNS8plG5
 PAx9Y8ZsFYLXcNX2bq1hl7gi4a1hTK/5Jqvfx78ffVBmLISBz19tP6jIy55ZJWes2qC0
 SHR8mXyHqV2cP7reOVrQV2RCBV1MsXeS6duYxgCZg8X+brCB9LBcTNFeZuemUXfpN0wF
 oFPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SDmcvxLL
Subject: Re: [Buildroot] [PATCH] support/testing/run-tests: fix --testcases
 option
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2022 18:20, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-07-27 17:02 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> The --testcases option of run-tests says how many test cases to build in
>> parallel. It automatically derives a jlevel from it by dividing the
>> number of cores + 1 by the number of parallel testcases. However, this
>> will typically result in a fractional number. Make doesn't like
>> fractional numbers as argument to -j.
>>
>> Convert the number to integer (rounding up).
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   support/testing/run-tests | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/support/testing/run-tests b/support/testing/run-tests
>> index 022209b414..f9c0bebc48 100755
>> --- a/support/testing/run-tests
>> +++ b/support/testing/run-tests
>> @@ -87,7 +87,7 @@ def main():
>>               return 1
>>           # same default BR2_JLEVEL as package/Makefile.in
>>           br2_jlevel = 1 + multiprocessing.cpu_count()
>> -        each_testcase = br2_jlevel / args.testcases
>> +        each_testcase = int((br2_jlevel + args.testcases - 1) / args.testcases)
> 
> * br2_jlevel is an int, as multiprocessing.cpu_count() is an int, so it
>    will be always >=2  (cpu_count() raises an error if it can't determine
>    the number of CPU, so it will always return at least 1);
> 
> * args.testcases is an int, and is checked to be >=1
> 
> So, with the following, we're guaranteed to have an int that is >=1:
> 
>      int((br2_jlevel + args.testcases) / args.testcases)

  That way you're adding one if it is actually divisible. E.g.
testcases = 2, cpu_count == 3
  => br_jlevel = 4
  => each_testcase = (4 + 2) / 2 = 3
  => total cpu use = 3 * 2 = 6

  In practice though, num_cpus is almost always a multiple of 2, so the 
likelihood of it being divisible is very small. Also, in practice, it's probably 
better to have a total cpu use number that is higher than the actual number of 
cpus, since a lot of time time is spent on serial execution. So don't bother 
changing it again.

> Because br2_jlevel + args.testcases is guaranteed to always be bigger
> than or equal to args.testcases.
> 
>>           if each_testcase < 1:
>>               each_testcase = 1

  Yes, this is true even with the proper rounding, because br2_jlevel > 1 
(assuming you have at least one CPU).

  Regards,
  Arnout

> 
> So that test can be dropped now.
> 
> I've amended your change with the above. Please yell if my maths are
> wrong... ;-)
> 
> Regards,
> Yann E. MORIN.
> 
>>           BRConfigTest.jlevel = each_testcase
>> -- 
>> 2.35.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
