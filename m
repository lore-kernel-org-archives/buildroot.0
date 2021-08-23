Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49042C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0BA613D2
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A0BA613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4191C401B2;
	Mon, 23 Aug 2021 20:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jk-NsHjGd4rG; Mon, 23 Aug 2021 20:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E3A40274;
	Mon, 23 Aug 2021 20:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4D91BF321
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7889C60746
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E00B4J3AV5sn for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 20:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9645B606DB
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 20:55:33 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id q17so6320897edv.2
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DFkF2Qjwi6zg9A36RZaGJ+T3BtcRiozyhQ6EAUOUy/g=;
 b=Fgv8RRQbB/RVCGn3CFvWzF7rlvhaIGYDyzISi/ZHlbST8r0UzkguJoIGmOqNYEiz4F
 ZsADoiQysgQ6j9QubuWmCfREmtylx8/lICvYYHgKP7wxj2AYsVZHQX1waYIf7HmpjHMk
 SHaax77C7A+50MsUncl2egkPu4YjD8kUfDZ7bFG002siajxvmW/snHJcSsayBI7eA5lj
 g0YS5XixVuMAsj7VoHxfWg+Xmo3yW4fAbxT+JIqfnMbj55OaWnYquJD3kDIXAt7b+JG1
 jYdpIWCkETOs3r6mCTRqcKpML9UoCCPYrmvz4YqATTrU8HhY+DbmdfkrHG8CuVxWMMFF
 ByQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DFkF2Qjwi6zg9A36RZaGJ+T3BtcRiozyhQ6EAUOUy/g=;
 b=ZTyen9TVnXKAuJbEIMrPvUtcCduTIeNP8wc2wirUMybVr/U1yeNxfqnFYjw2dS3IEI
 Im0czC+G0U9iYwzGvvg4e0QQPMurVnVuqptKejmSbXyDZyCqPERo+YstU1ncZaqgZCgZ
 X4OfkfeJGIpWEfMEZ9dbn+XmiomSyB7W+LYEMwWQ4g1QnQL7uX+3oyM1X3DJNWw/spR/
 ZSlrDLoz0Qy0/AloyndPRKpWc/SOC4pQs/oSXmmhRKPLEd3OeYV+6vrN/YlEzZbtBt3A
 2HPkKSl8FXt1Ivi4deB1MAeHPfw2lyL6fuDIoUSkRoXT0/rqT5VzvO14WzjgsU8lOApS
 xjPA==
X-Gm-Message-State: AOAM533dUI4uj4AinCmIL9yCp60BoLJoJDSNlZ6jxGTOaD2QaoAk6zCL
 84/7zXt3yy7ZdNJ2iYTwcjU0C/1iWcWNSw==
X-Google-Smtp-Source: ABdhPJx1vvBy9h50MZq6/rEBPPrCHbXeV9FhWLubni9DQAzfmDQYuX5FJkhUqb0BFWr0ACOSCAmxIQ==
X-Received: by 2002:a05:6402:184a:: with SMTP id
 v10mr38615817edy.324.1629752131713; 
 Mon, 23 Aug 2021 13:55:31 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l9sm10158698edt.55.2021.08.23.13.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 13:55:31 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf> <20210818110558.GY27036@scaer>
 <20210818221842.5926641d@windsurf> <20210818210431.GZ27036@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <cd13188c-9e4b-635d-e582-ec10285c922d@mind.be>
Date: Mon, 23 Aug 2021 22:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818210431.GZ27036@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 18/08/2021 23:04, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-08-18 22:18 +0200, Thomas Petazzoni spake thusly:
>> On Wed, 18 Aug 2021 13:05:58 +0200
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>> Not sure the exact reason, but notice that the failures occur at install
>>> time, not build time.
>> I did try with "make host-libcap", which includes the installation
>> step, and I even tried to do a full build of one of the failing
>> defconfigs. The build failed, but much much later, on a completely
>> unrelated package. And manually checking the RPATH of the host-libcap
>> binaries: they are correct.
> 
> Here too.

 Here too. I do notice a big difference however: in my local build, there's no
rebuild of the executables at installation time.

[snip]
> So, the first properly gets our LDFLAGS, the second, not. Pasing
> TARGET_CONFIGURE_OPTS at install time would solve^whide the issue,
> though.
> 
> But OK, what are the dependencies of cap_magic.o?
> 
>     cap_magic.o: execable.h execable.c loader.txt
> 
> execable.h and .c are not generated, so they are terminal dependencies.
> 
> loader.txt is generated. And it is generated twice (still form the same
> build):
> 
>     make[3]: Entering directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
>     gcc -o empty empty.c
>     objcopy --dump-section .interp=/dev/stdout empty > loader.txt
>     [...]
>     make[3]: Leaving directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
>     /usr/bin/make libpsx.so
>     make[3]: Entering directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
>     objcopy --dump-section .interp=/dev/stdout empty > loader.txt
>     [...]

 In my local build, it is *not* generated twice. Note that in (at least one of)
the failing build(s), it is in fact generated 4 times: twice at build time and
twice at install time.

> 
> Wha?
> 
> So, it believes loader.txt is out of date wrt a file named 'empty'
> (which is generated from a trivial C file empty.c)

 Note that 'empty' is not regenerated, only 'loader' is...


> So, becasue loader.txt is re-generated a second time, some files are
> re-built at install time. Which explains why we get an issue.
> 
> But then, why is it out of date, at all? I really got stuck there...

 I have a theory, but it's a bit far out... We basically have this:

gcc -o empty empty.c
objcopy --dump-section .interp=/dev/stdout empty > loader.txt

The timestamp of 'empty' is going to be near the end of the gcc run. The
timestamp of 'loader.txt', on the other hand, is going to be all the way at the
beginning of the shell run. So, if the filesystem doesn't have nanosecond
precision, it's possible that 'empty' and 'loader.txt' have the same timestamp.

 It's not a good theory, though, because make shouldn't consider 'loader.txt'
older than 'empty' if they have exactly the same timestamp.



 Ooh, I just discovered something nasty! Apparently, objcopy updates the
modification time of its input file...

$ touch empty; ls -l --full-time empty loader.txt; make SHARED=yes loader.txt;
ls -l --full-time empty loader.txt
-rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.450172624 +0200 empty*
-rw-r--r-- 1 arnout arnout  28 2021-08-23 22:52:57.949935937 +0200 loader.txt
objcopy --dump-section .interp=/dev/stdout empty > loader.txt
-rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.563173530 +0200 empty*
-rw-r--r-- 1 arnout arnout  28 2021-08-23 22:53:27.563173530 +0200 loader.txt

I guess this way there is some chance that loader.txt gets a modification time
just before the updated mtime of empty...

So the solution would be to touch loader.txt just after creating it. We could
patch it like that, give it a go in the autobuilders, then send the patch upstream?

 Regards,
 Arnout



> Could it be that this is a parallel build issue? I doubt it, though...
> 
> I'm out of clues now, so I'll let a godd night's sleep try to solve
> this....
> 
> Regards,
> Yann E. MORIN.
> 
>>> Also, notice spurious errors from ldconfig:
>>>
>>>     /sbin/ldconfig
>>>     /sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
>>>     make[5]: [Makefile:162: install-shared-psx] Error 1 (ignored)
>>>
>>> (ldconfig is a wrapper around ldconfig.real, specific to debian and.or
>>> ubuntu I guess)
>>
>> Right, but the absence/presence of the RPATH should normally not be
>> affected by this, I believe.
> 
> Nope, nope.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
