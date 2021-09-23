Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DC0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E674561242
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E674561242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D5583EB8;
	Thu, 23 Sep 2021 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id deFnCHcdOmEU; Thu, 23 Sep 2021 09:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A000C8438E;
	Thu, 23 Sep 2021 09:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E45E1BF318
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12F360B25
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7VAFfoQzHgG for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 09:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD122608A2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 09:26:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y89so10454392ede.2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=b/ZVNvjFJGiipfYi1EEXDKtAAdILlDxK/ZbUrTzqaSw=;
 b=CeJW+x1PQwK6BhgIJNB3n4mWhIbOdB6x0ApKFjViatHmWNR5DzrbdsRpmiXZbvLDYk
 8neZU9ERWGNi35ecJe+RKW22uBMyUIfB1zCmWmU35GcQ8d/CZT9/lcDLCAdNpfASEIgg
 8BJWDPSWXXmf68rC+Z6YKFsxd2QTlFJAtxit4ufhb3eGDuStfkEBc0Cy9iZ0AvQVma8S
 Y1IhI6coNys3yl1q9h7a5JZZCg5Cg30IFG6hszIG1pm+b0EJ1Bpxwmd3WdOqtooHTuZS
 1v1m2v+3qmcM9zj9umLgPROdmKqcZ8AgsdRnPCQZpiTFAd4YbIFl3fmH9oWA3zzpHbay
 ncpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b/ZVNvjFJGiipfYi1EEXDKtAAdILlDxK/ZbUrTzqaSw=;
 b=liuEX4i4UdNatYdwjlmABUOisQJvhOuNcIbEBu7J6j6b9DFrUN4gd45M95F78Oqg7O
 vYelzDmI6zrd8E2weyftH1HGGEaO2ISakpmNua4jWtlE1cbnp47ZBAaaJhg86QWIZ1gA
 +8Mt2AIUvX9owz9tOydWS7k7qy552q4NAmIm4eZCvCc121f2LEj4VYN7X6ppM4G+8WCs
 aoMEUlwSlRNXYE+WmVD6sLXoCCWuedCJCAqbPsNkOyEGN8AY/ImC0vawckvmlSkebyC7
 zRyAmtTKCkX/E+Jdyy+6ouzrszj3EUh3IF/+vxIKVBPDagKT6GDQEH7cOY5mDDyLfOK3
 KyWg==
X-Gm-Message-State: AOAM531utIySXKe5vMqNxIK6jcc76pMvr5Q9GpvPppJ8QSDuAgnZvYNy
 IbTM/NqRllrEtc8uIlJHIgBxXA==
X-Google-Smtp-Source: ABdhPJywZStvSg/o7C0zIH9SA6FcYEVI6xbyQ4zrL5XbqM6PGv59TluPOMOAEL2VJt+r868NEFGGAA==
X-Received: by 2002:a50:cf0d:: with SMTP id c13mr4156137edk.269.1632389179008; 
 Thu, 23 Sep 2021 02:26:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u16sm2723623ejy.14.2021.09.23.02.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:26:18 -0700 (PDT)
Message-ID: <970f860f-a99b-71cb-6b4c-9920f5a5653c@mind.be>
Date: Thu, 23 Sep 2021 11:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: David Laight <David.Laight@ACULAB.COM>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20210922210348.96B9A8CA2B@busybox.osuosl.org>
 <4348b4b5c0844714baffcfee40bfec1a@AcuMS.aculab.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4348b4b5c0844714baffcfee40bfec1a@AcuMS.aculab.com>
Subject: Re: [Buildroot] [git commit] package/ntp: Fix building with glibc
 2.34+
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 23/09/2021 10:23, David Laight wrote:
> From: Arnout Vandecappelle
>> Sent: 22 September 2021 21:13
> ...
>> On attempt to build ntp with glibc 2.34 the following error happens:
>> -------------------------------->8------------------------------
>> In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-
>> fixed/pthread.h:42,
>>                   from work_thread.c:13:
>> work_thread.c:45:57: error: missing binary operator before token "("
>>     45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
>>        |                                                         ^~~~~~~~~~~~~~~~~
>> -------------------------------->8------------------------------
>>
>> That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
>> dynamically in runtime via sysconf(), see [1].
> ...
>> +In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
>> +could mean different stack sizes at runtime on different architectures
>> +and it also causes compile failure. Default glibc thread stack size
>> +or 64Kb set by ntp should be good in glibc these days.
> ...
>> + #ifndef THREAD_MINSTACKSIZE
>> + # define THREAD_MINSTACKSIZE	(64U * 1024)
>> + #endif
>> +-#ifndef __sun
>> ++#if !defined(__sun) && !defined(__GLIBC__)
>> + #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
>> + # undef THREAD_MINSTACKSIZE
>> + # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
> 
> I'm not convinced that is the correct fix.
> The same issues apply to the thread stack as they do to the signal stack.
> Albeit the sizes are larger.
> 
> The very reason that PTHREAD_STACK_MIN isn't a compile-time constant
> is that the value cannot be determined at compile time.
> While 64k may seem ok for now, there is no reason for it to be enough.
> 
> Possibly something like:
> #ifndef PTHREAD_STACK_MIN
> #define THREAD_MINSTACKSIZE	(64U * 1024)
> #else
> #define THREAD_MINSTACKSIZE	(PTHREAD_STACK_MIN > 64U * 1024 ? PTHREAD_STACK_MIN : 64U * 1024)
> #endif
> would be better.
> Although a form that only evaluates PTHREAD_STACK_MIN once may be better.

  It really doesn't matter that much. The only place where THREAD_MINSTACKSIZE 
is used is in the code leading up to this:

                 if (nstacksize != ostacksize)
                         rc = pthread_attr_setstacksize(&thr_attr, nstacksize);
                 if (0 != rc)
                         msyslog(LOG_ERR,
                                 "start_blocking_thread: 
pthread_attr_setstacksize(0x%lx -> 0x%lx) -> %s",
                                 (u_long)ostacksize, (u_long)nstacksize,
                                 strerror(rc));

  Note that there's no error handling other than printing an error message. So, 
if PTHREAD_STACK_MIN turns out to be less than 64K (which is very, very unlikely 
to be the case), then the only thing that will happen is that 
pthread_attr_setstacksize will fail to set the stack size to a lower value and 
we keep the default stack size (and print an error message).

  I do agree however that your alternative fix is better (though Id keep the 
existing __sun ifdeffery, just to make the change minimal). So feel free to send 
a patch that changes the existing patch.


> Quite why ntp is setting the thread stack size is any bodies guess though.

  I guess because there are some threads that need more than 4K stack (which is 
minstacksize on some platforms), and on the other hand they don't want to waste 
stack space on threads that really don't need that much.

> It can only get it wrong in a different way!

  For relatively small code, it's not that hard to measure or calculate the 
amount of stack you need.

> Although ISTR one version of ntp thinking itself so important
> that it locked all its memory.
> So maybe it is just trying to reduce that locked memory footprint.

  I do indeed see an mlockall() in ntpd.c, but I don't see any code doing any 
prefaulting of the stack, so it doesn't seem to be very effective :-)


> Given that it's pretty much impossible for ntp to accurately set
> the time to less than the RTT to the server (it can't tell whether
> the RTT delays are on the tx or rx side) I can't see that it matters.

  Yeah, it looks like ntp is a pretty dead-end project...

  Regards,
  Arnout

> 
> Anyone who needs sub-ms time sync has bigger problems.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
