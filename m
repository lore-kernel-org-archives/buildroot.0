Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4942EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86E661090
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B86E661090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AE84405E2;
	Thu, 23 Sep 2021 21:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK-zyUiiP9kz; Thu, 23 Sep 2021 21:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC7D405E4;
	Thu, 23 Sep 2021 21:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEAFE1BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E356069E
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAD-ssNg4fHH for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:34:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D55605DE
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632432851;
 bh=3/ei/UYBwlQVXfb8+W4spZLhfkLtV7zdShiWFVBOh/Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=H3ZBArOoGx/jv1ZX+nvhFim34QqFOzW0PexCdIVYbL/14dw95x/u1YQl+6Rr/8Q/K
 EDlEJeJsU/Obf2W1X9HVtl67I8ZXjMKOMsj8kE8dZQUkqOsJY4tgQRVLEiqLpcCTmh
 K8dtC7IvxamcvYmO0hkDT7MnhT4FTqRYeFbvsBgQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1mxEzX4BSX-015aVe; Thu, 23
 Sep 2021 23:34:11 +0200
Date: Thu, 23 Sep 2021 23:34:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210923233409.50cba2f7@gmx.net>
In-Reply-To: <970f860f-a99b-71cb-6b4c-9920f5a5653c@mind.be>
References: <20210922210348.96B9A8CA2B@busybox.osuosl.org>
 <4348b4b5c0844714baffcfee40bfec1a@AcuMS.aculab.com>
 <970f860f-a99b-71cb-6b4c-9920f5a5653c@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:td4MkCJ62F0F8HUTF7eBWY7qrNZ/Us/gYO3plWFzYSjo8yTZd4l
 qAkZ40cedfA/7TQuGgR9dA4zO5pIOQbN+A/SGQMo+prTZA7Z8UcWmmA6Gc5VdozbOGbEEdD
 06WBUihENNXiRYHFSMVOGQrxlGGZPLlj02OHUSr6nao/8LjvaQ8b+6FWSJnfeKhzHCXyLfh
 pBl87RSSfJsBItHa2Ze3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UG8j/nc5nAk=:Xw+U6OCOeUliVu2jyYlPz+
 64fqdP9svLcyNJR+/i6KEdCk2NgQLNQkXvi5flEc57fpacZnfV/K6puwnd2RXie8GqWnjbTco
 3hyue9IlQ+Ap/z57f1MzdZ56BXZ7knxmRJ5zryBMYk4ZTfuGE56vBorzKpGc8FeibvKkt6bve
 y7UMIAUWwoCn47Xm+8HCBtNdvuljDXn2nEnjzBRf88/x9sdSBUXRVTr1zjOo3A4LMBlKkgoav
 zpNCQpW7l+27Hj/bHgw+DId62qkCUIOUDO3vOkyEi6g1TtpaQk152Tv2gVuf82jEU74Ziy3p0
 oVfjMrm+EPatoywstuITzdfXdMyQ9r+nwER+nxoea+jkcSqDQhetJaiORoWsgcx13+u1SyJWP
 Z8v7RjZZxmYg7QGNhVk0Rk0wbZNAIkU0ZwqlurZ0Nq+7C+R/jSMLsXC5T93uKpPB7HSK3F/CU
 hETR0CZ7685xEy67Wd2HTPJYsjurG2IFyqBLX9OtSwjW6ju7ho7IQTyyVMR2i5cIzkh0MNB4R
 YillW/R2QPqzwwaBfzsIciRyOXrXCmcsSNb7Q9PwXlrILY+8qoL2jna2otKapZmGTh8m9yww5
 5sqJDjkEBk0ChYX0CISGbee/ZaXbm2xytXhnstuAy+WYDaVM/jTUSC9LnKQXCSny4HFKVnfD3
 iAIU5tKT3o6TM3L4DJAqy+k755fgM/t5WuZ4CBOdl0JMrCPGCc3ASr0s73AlXwBrPnDzQhVgb
 jJWW0oNLCEW6NIOOjCjhE34BIwLMKeC+MNgapoX3fMjUztZn95g92pcPS+q79Bv3UofC3KNSu
 nwlzOFnJ2VP/c+eOJAmwFEtkyBalXEpIj0yYBkMtBtoJUCJqA0p289okbJDGRLOA1ubfsgr8Y
 TNFspM5FOFbTYoUlc+1l1f5IoG+jTX1DKfDJ67Tq7F/HPV7fFwf6XRsQ5ABhobT2PciOtWNIv
 IBUcIVUApCaPOw1llZecaTFDYdyoM5wztvmLKy1z9x2UfdSDehySbz6YxRaNaAievZ6ZwR5jP
 McZqk5yeKgs/Zc6rXoWxAAs9fXuBy9IVWqk0D2K66syfgE9GoziBm53rAsx4et8sZh3hlLI+Q
 hsm47siF3rmkjw=
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Arnout, David, all,

On Thu, 23 Sep 2021 11:26:18 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 23/09/2021 10:23, David Laight wrote:
> > From: Arnout Vandecappelle
> >> Sent: 22 September 2021 21:13
> > ...
> >> On attempt to build ntp with glibc 2.34 the following error happens:
> >> -------------------------------->8------------------------------
> >> In file included from .../output/host/lib/gcc/i586-buildroot-linux-gnu/10.3.0/include-
> >> fixed/pthread.h:42,
> >>                   from work_thread.c:13:
> >> work_thread.c:45:57: error: missing binary operator before token "("
> >>     45 | #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
> >>        |                                                         ^~~~~~~~~~~~~~~~~
> >> -------------------------------->8------------------------------
> >>
> >> That's because starting from glibc 2.34 PTHREAD_STACK_MIN gets determined
> >> dynamically in runtime via sysconf(), see [1].
> > ...
> >> +In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
> >> +could mean different stack sizes at runtime on different architectures
> >> +and it also causes compile failure. Default glibc thread stack size
> >> +or 64Kb set by ntp should be good in glibc these days.
> > ...
> >> + #ifndef THREAD_MINSTACKSIZE
> >> + # define THREAD_MINSTACKSIZE	(64U * 1024)
> >> + #endif
> >> +-#ifndef __sun
> >> ++#if !defined(__sun) && !defined(__GLIBC__)
> >> + #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
> >> + # undef THREAD_MINSTACKSIZE
> >> + # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
> >
> > I'm not convinced that is the correct fix.
> > The same issues apply to the thread stack as they do to the signal stack.
> > Albeit the sizes are larger.
> >
> > The very reason that PTHREAD_STACK_MIN isn't a compile-time constant
> > is that the value cannot be determined at compile time.
> > While 64k may seem ok for now, there is no reason for it to be enough.
> >
> > Possibly something like:
> > #ifndef PTHREAD_STACK_MIN
> > #define THREAD_MINSTACKSIZE	(64U * 1024)
> > #else
> > #define THREAD_MINSTACKSIZE	(PTHREAD_STACK_MIN > 64U * 1024 ? PTHREAD_STACK_MIN : 64U * 1024)
> > #endif
> > would be better.
> > Although a form that only evaluates PTHREAD_STACK_MIN once may be better.
>
>   It really doesn't matter that much. The only place where THREAD_MINSTACKSIZE
> is used is in the code leading up to this:
>
>                  if (nstacksize != ostacksize)
>                          rc = pthread_attr_setstacksize(&thr_attr, nstacksize);
>                  if (0 != rc)
>                          msyslog(LOG_ERR,
>                                  "start_blocking_thread:
> pthread_attr_setstacksize(0x%lx -> 0x%lx) -> %s",
>                                  (u_long)ostacksize, (u_long)nstacksize,
>                                  strerror(rc));
>
>   Note that there's no error handling other than printing an error message. So,
> if PTHREAD_STACK_MIN turns out to be less than 64K (which is very, very unlikely
> to be the case), then the only thing that will happen is that
> pthread_attr_setstacksize will fail to set the stack size to a lower value and
> we keep the default stack size (and print an error message).
>
>   I do agree however that your alternative fix is better (though Id keep the
> existing __sun ifdeffery, just to make the change minimal). So feel free to send
> a patch that changes the existing patch.
>
>
> > Quite why ntp is setting the thread stack size is any bodies guess though.
>
>   I guess because there are some threads that need more than 4K stack (which is
> minstacksize on some platforms), and on the other hand they don't want to waste
> stack space on threads that really don't need that much.
>
> > It can only get it wrong in a different way!
>
>   For relatively small code, it's not that hard to measure or calculate the
> amount of stack you need.
>
> > Although ISTR one version of ntp thinking itself so important
> > that it locked all its memory.
> > So maybe it is just trying to reduce that locked memory footprint.
>
>   I do indeed see an mlockall() in ntpd.c, but I don't see any code doing any
> prefaulting of the stack, so it doesn't seem to be very effective :-)
>
>
> > Given that it's pretty much impossible for ntp to accurately set
> > the time to less than the RTT to the server (it can't tell whether
> > the RTT delays are on the tx or rx side) I can't see that it matters.
>
>   Yeah, it looks like ntp is a pretty dead-end project...

Maybe time to provide NTPsec [1] as alternative...

Regards,
Peter

[1] https://www.ntpsec.org/

>
>   Regards,
>   Arnout
>
> >
> > Anyone who needs sub-ms time sync has bigger problems.
> >
> > 	David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> > Registration No: 1397386 (Wales)
> >
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
