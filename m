Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797E9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCDF060F01
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCDF060F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ADBE40001;
	Tue,  3 Aug 2021 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jYrwf7L8Ua2; Tue,  3 Aug 2021 21:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6491D400C7;
	Tue,  3 Aug 2021 21:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7576E1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C174039B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gJZ_hRicLq2 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:00:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18C4240385
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:00:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id c25so546744ejb.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQnJFo2ESalq+nL8aw+W1kt1f948fft40iLv8x3RU9c=;
 b=cuEqVqL8mXnhwKBMuEijOIx7dWH0jx9MeSx5IZz8KuATNiF9o3R9VSrmBbr+Bs+4ly
 9+j3t+5TvmIzmPSYjWQXR3peNKcb0cg6kkOvBv8JVMME0V82azevG5WQ3ewfw6AzfUZ3
 pXs4ffQ01V5joIhr9MOAS9SNV5JIzPRzCfCFs+W/tGWdgmDfz5nt/mhfi6X5LCaX8wpr
 4/BJ3TkhOsmRUSkSW5gzEvLtamIO3fL/TB7x9EvqPetyLzpabIdpQNW3LXTfkDsTCt4D
 +3saYUAjoNwk/88xUFGZXo+vrnMNRBnydo8qIoANJ6ib8jIdHUnbc73asRvyQge+89xG
 CX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZQnJFo2ESalq+nL8aw+W1kt1f948fft40iLv8x3RU9c=;
 b=hTMJmxVZySLLIgqKZ/g5ofvq+rILqkCwfuEpAy3VWTXOyhT0IPvRRklIWkppBW332k
 bS0knxsrJzHu8GPSpbRTCX2/vDlf2gOdXcNBdCAjHk30OJqoJbkheKu5iyOt1PBCLRzQ
 uet918PEEWZm+nCiNQM8rkX6lbo91NssBLKaq5nhzZOLu4k09a4sAidWbJS6q3aWjkcR
 RfqjBNPv6hK2YFOr87e1UVuTllljS1N4unPTDK68btCK5bBEeOBdyyKROWSE2VRRu8iM
 StIzKTeo8fhlPRuRBEIx/0UQDvHkPQFMP7mO7x0xajqk1HqBkrGAp+ptjLC2d9nIoQke
 Ia6A==
X-Gm-Message-State: AOAM5326zy7yn7HCdy9h6GuFUUv9VqF/cmeMHf/djfFlzzXP0RmCX8oB
 zlRUKxIxWuLHJ3kqpNc/v3suUNqE7qpeCOnZeS8=
X-Google-Smtp-Source: ABdhPJzejcy3oHcUrqdma4TE0cB9dTQzXmxc8KS0XfsBAAx5oKc2AXp7GuF5Ffj463JbfjeQ5PSucQ==
X-Received: by 2002:a17:906:c08e:: with SMTP id
 f14mr22205370ejz.380.1628024424238; 
 Tue, 03 Aug 2021 14:00:24 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id h10sm25203edb.74.2021.08.03.14.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:00:23 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
 <YQhEuH0okQM/3P03@pevik> <20210802221341.760ffbf0@windsurf>
 <YQhsdkzd/vbHXA94@pevik> <20210803085745.6c7e4ce2@windsurf>
 <YQl6KMAf4XfXnfrG@pevik>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <aa6abbe9-7d0e-b273-9768-bf95ae408773@mind.be>
Date: Tue, 3 Aug 2021 23:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQl6KMAf4XfXnfrG@pevik>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 19:17, Petr Vorel wrote:
> Hi Thomas,
> 
>> On Tue, 3 Aug 2021 00:06:46 +0200
>> Petr Vorel <petr.vorel@gmail.com> wrote:
> 
>>> I believe all 3 patches (2 already merged + this one) should fix the problem.
>>> But I was not able to verify it, because ./utils/test-pkg didn't catch even
>>> this error (I tested all available toolchains), IMHO -Werror=format=2 and other
>>> -Werror are probably only on http://autobuild.buildroot.net/ (not in Buildroot
>>> config for users). It'd be great if ./utils/test-pkg had the same CFLAGS.
>>> Or have I (again) overlooked something?
> 
>> No, the autobuilders don't do anything specific with -Werror CFLAGS.
>> The configurations tested by the autobuilders are generated by
>> utils/genrandconfig in the Buildroot tree. Besides the obvious package
>> randomization, there is some randomization of "global" options:
> 
>>     # Per-package folder
>>     if randint(0, 15) == 0:
>>         configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")
> 
>>     # Amend the configuration with a few things.
>>     if randint(0, 20) == 0:
>>         configlines.append("BR2_ENABLE_DEBUG=y\n")
>>     if randint(0, 20) == 0:
>>         configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
>>     if randint(0, 1) == 0:
>>         configlines.append("BR2_INIT_BUSYBOX=y\n")
>>     elif randint(0, 15) == 0:
>>         configlines.append("BR2_INIT_SYSTEMD=y\n")
>>     elif randint(0, 10) == 0:
>>         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
>>     if randint(0, 20) == 0:
>>         configlines.append("BR2_STATIC_LIBS=y\n")
>>     if randint(0, 20) == 0:
>>         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
>>     if randint(0, 5) == 0:
>>         configlines.append("BR2_OPTIMIZE_2=y\n")
>>     if randint(0, 4) == 0:
>>         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
>>     if randint(0, 4) == 0:
>>         configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
> Thanks for valuable info!
> I need to have look into https://git.busybox.net/buildroot-test/.

 The genrandconfig script is in utils/ in the buildroot tree itself. The
buildroot-test script just calls genrandconfig, followed by make and make
legal-info. The only interesting thing for you in there is how reproducible
builds are handled.


> 
>> For example, did you test with BR2_FORTIFY_SOURCE_2=y ?
> 
>> Could you point me to the autobuilder failure that you had, but was not
>> able to reproduce with test-pkg ? We should be able to point out the
>> difference.
> Actually, I thought I submitted 0ce30de72f ("package/nfs-utils: bump to version
> 2.5.4"), but I didn't thus I did not run the verifies.
> 
> I now tested b2857786f1 ("package/nfs-utils: needs uuid") (which I also didn't

 The recent issues happen on basically any config and were introduced by
daa5459b6aaa which fixed it for riscv and broke it for all other 32-bit
platforms. Only, the two files concerned are only built if sqlite is enable
resp. if NFSv4 is enabled, so if you don't add those to your test config,
test-pkg won't catch it.

 Regards,
 Arnout

> submit thus didn't tested and all verifiers are OK. I believe that was the first
> build which failed due warning on printf format. And now:
> 
> grep ^BR2_FORTIFY_SOURCE_2 ~/br-test-pkg/*/.config
> # nothing
> 
> I'll try to test next time with snippet with BR2_FORTIFY_SOURCE_2=y.
> Anything else it's worth of enabling? E.g. BR2_STATIC_LIBS have at least some of
> them, also BR2_FORTIFY_SOURCE_1 (but that's not enough)
> 
>> The thing is that test-pkg cannot test all possibilities, it would take
>> way too much time.
> Understand. I just didn't know about the randomizer on autobuilders. I did
> noticed that sometimes error was reported even I was not able to spot it during
> test-pkg testing :).
> 
> Kind regards,
> Petr
> 
>> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
