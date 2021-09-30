Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB20C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:16:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA0161A35
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA0161A35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59FE7400C6;
	Thu, 30 Sep 2021 20:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Lc_VuzGIkqC; Thu, 30 Sep 2021 20:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66A3C400D5;
	Thu, 30 Sep 2021 20:16:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66C9B1BF947
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56161841C1
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLRzaqANF11J for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 20:16:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4985B83F2A
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 20:16:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l7so2933137edq.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=dllN8Rcp3hnAsbfucCvxJyQUT62+0z6Ca4nhaBelEqo=;
 b=AHEuvHYb8I4GSqq4Z3vYZfTVs+jSKtPfO43hPqNoAcVciM4UciaEHNUxWkCr3oopSp
 DhyHDZMMyVfs6UBgp4Q37gJn+Re8x4rbDEvcUSoTLnOnqA5AGfRBwWEI6Pu8YImqABgt
 qva2hWbJtRL0U8AY2wF5eNrnMwJFd1Fz337RBDJO5XAHm6X0700kSarY7cqEdsnXmMs2
 pNFjP7eYvPGAT/nfqZpI/PpzoIPxA0PF9uZpqX2ny9h4GsxE+5/FMgskG6iG8cpgpAbA
 /41hWFyHCfGJMneecEZhzueEJATdjcN/+PySDDeMHMLTWKiYDUvBawh14i7RbtD+fLRB
 bnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=dllN8Rcp3hnAsbfucCvxJyQUT62+0z6Ca4nhaBelEqo=;
 b=HwrX9YPsqEEaBRv8wI626f10te46vf0JHFm7E9zAXJEqHbZGZKTXdqWVMmTLIkDyl8
 feMoB+X4DvNRiUnNredxc3EwxXh3pcVr1++TTgykk7tnzDakUZ7rQFpYHBdZwQ8q8EQi
 KSi2fdbD/+R+Dt7xgpbKn/JO5wKtOb0497520CJEnqEQ5PDjOAyNfNGzlI6jZC6EbITO
 EPyyGLsAbppCJcUybhhpbDN0Cju+BIEVq/rK64ox7bh7KT/OxM3y5SwNg4hte3uOVV5g
 FoZTYBwxLX9yYq+LHPMCEPsxwHmLHDXj82E0TvRJBxzrKe5KiCkcw+4ZRtSmYDd36QGG
 VkVw==
X-Gm-Message-State: AOAM531VCLagiiL9S7QTh4JoKRU+K+memjfvK7ezJJUBntALFF8PFzZ+
 tO0G4u/MdegqQ0dyoX4wrdo=
X-Google-Smtp-Source: ABdhPJx9dHhMuzaL06pCLf7mQ9BBUXNBZkvp7bUO6R9i4iOuTnFZVV63bKpU5VDe8QbYp7fRiVhy3Q==
X-Received: by 2002:a17:906:39cb:: with SMTP id
 i11mr1534739eje.168.1633032968100; 
 Thu, 30 Sep 2021 13:16:08 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id d10sm1900300eja.81.2021.09.30.13.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 13:16:07 -0700 (PDT)
Date: Thu, 30 Sep 2021 22:16:03 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YVYbAxgEomvMo5IQ@pevik>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
 <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
 <20210930200402.GO1504958@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930200402.GO1504958@scaer>
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all,

> Petr, Arnout, All,

> On 2021-09-26 23:32 +0200, Arnout Vandecappelle spake thusly:
> > On 21/09/2021 22:51, Petr Vorel wrote:
> > >I've tested the patchset on dash as the default shell. But it certainly
> > >deserve more people to have look and test.

> >  Well, as the commit message says: it's POSIX so it should be supported by
> > everything. which has a much smaller chance of being supported.

> This is causing quite some issues.

> First, 'command -v' does not behave the same way 'which' used to, when
> passed more than one parameter, because some shells are not compliant to
> POSIX (this might be a bug, but nonetheless it affects the most widely
> used shell out there, bash) [0].
Yes, there has been a proposal, how to fix this.

> Second, this is causing a lot of error messages:

>     $ make defconfig
>     [...]
>     $ make help
>     make[1]: command: Command not found
>     [...]
New error. But I was not able to reproduce it on x86_64 on current master
(5916cc5011). What am I missing to reproduce it?

> The original commit reports that 'which' is broken in Debian, but I was
> not able to reproduce in Bullseye, where 'which' still works as expected
> and does not emit any extra warning.
Yes, the waring is in debianutils 5.x, which is still in Debian unstable (not
even in the testing) [1].

> So, we are trying to fix something that is broken on a development
> version of Debian, but that still works in all known released
> distributions.
'command -v' and 'type' has been here quite long time as well.

> I usually am quite in favour of sticking to POSIX tools, but which has
> been ubiquitous in the past 30 years or so, and I would consider that
> Debian's which *is* broken for reporting such deprecation warnings.

> So, I suggest that we do revert this patch, and work on a better
> transition away from which, if at all. One very quick solution would be
> to bundle our own which in Buildroot and then we'd have a quick way out
> of that Debian's mess...
Sure, if it causes problems which are not easily fixed, I'm not against
reverting it. But I don't think that problem is that complex, that we'd need to
compile which. But I apologize for causing troubles.

Kind regards,
Petr

> Anyway, I'd vote "revert".

> Regards,
> Yann E. MORIN.

> [0] https://lore.kernel.org/buildroot/YVTIghzHs82uFBIe@pevik/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e
[1] https://tracker.debian.org/pkg/debianutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
