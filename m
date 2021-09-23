Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B89C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 08:25:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A3F6124C
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 08:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33A3F6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D493C83F36;
	Thu, 23 Sep 2021 08:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6H6zorGw7aw; Thu, 23 Sep 2021 08:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A6483F16;
	Thu, 23 Sep 2021 08:25:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2901BF325
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 08:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD545415D0
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 08:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl06AUooZX-2 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 08:25:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 128F441599
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 08:25:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-186-OK4I--owMTGhDeyZ-fTY5w-1; Thu, 23 Sep 2021 09:23:20 +0100
X-MC-Unique: OK4I--owMTGhDeyZ-fTY5w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 23 Sep 2021 09:23:19 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 23 Sep 2021 09:23:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnout Vandecappelle' <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [git commit] package/ntp: Fix building with glibc
 2.34+
Thread-Index: AQHXr/WzPN2BF0rh2EmhGN6DSK+i3auxQ2TA
Date: Thu, 23 Sep 2021 08:23:19 +0000
Message-ID: <4348b4b5c0844714baffcfee40bfec1a@AcuMS.aculab.com>
References: <20210922210348.96B9A8CA2B@busybox.osuosl.org>
In-Reply-To: <20210922210348.96B9A8CA2B@busybox.osuosl.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Arnout Vandecappelle
> Sent: 22 September 2021 21:13
...
> On attempt to build ntp with glibc 2.34 the following error happens:
> -------------------------------->8------------------------------
> In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-
> fixed/pthread.h:42,
>                  from work_thread.c:13:
> work_thread.c:45:57: error: missing binary operator before token "("
>    45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
>       |                                                         ^~~~~~~~~~~~~~~~~
> -------------------------------->8------------------------------
> 
> That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
> dynamically in runtime via sysconf(), see [1].
...
> +In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
> +could mean different stack sizes at runtime on different architectures
> +and it also causes compile failure. Default glibc thread stack size
> +or 64Kb set by ntp should be good in glibc these days.
...
> + #ifndef THREAD_MINSTACKSIZE
> + # define THREAD_MINSTACKSIZE	(64U * 1024)
> + #endif
> +-#ifndef __sun
> ++#if !defined(__sun) && !defined(__GLIBC__)
> + #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
> + # undef THREAD_MINSTACKSIZE
> + # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN

I'm not convinced that is the correct fix.
The same issues apply to the thread stack as they do to the signal stack.
Albeit the sizes are larger.

The very reason that PTHREAD_STACK_MIN isn't a compile-time constant
is that the value cannot be determined at compile time.
While 64k may seem ok for now, there is no reason for it to be enough.

Possibly something like:
#ifndef PTHREAD_STACK_MIN
#define THREAD_MINSTACKSIZE	(64U * 1024)
#else
#define THREAD_MINSTACKSIZE	(PTHREAD_STACK_MIN > 64U * 1024 ? PTHREAD_STACK_MIN : 64U * 1024)
#endif
would be better.
Although a form that only evaluates PTHREAD_STACK_MIN once may be better.

Quite why ntp is setting the thread stack size is any bodies guess though.
It can only get it wrong in a different way!
Although ISTR one version of ntp thinking itself so important
that it locked all its memory.
So maybe it is just trying to reduce that locked memory footprint.

Given that it's pretty much impossible for ntp to accurately set
the time to less than the RTT to the server (it can't tell whether
the RTT delays are on the tx or rx side) I can't see that it matters.

Anyone who needs sub-ms time sync has bigger problems.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
