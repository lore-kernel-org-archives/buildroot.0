Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D00C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 21:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BA3240BD1;
	Mon, 23 May 2022 21:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N06qi1ZA2ncM; Mon, 23 May 2022 21:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6725540A9A;
	Mon, 23 May 2022 21:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBC01BF33E
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6892B827D9
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azHSedj3_WCX for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 21:50:30 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF777827C6
 for <buildroot@buildroot.org>; Mon, 23 May 2022 21:50:29 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tFpinxRBrbvrctFpinQhCR; Mon, 23 May 2022 23:43:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653342203; bh=aW29SyQs28GQ8q/F5HRuQa7J+aJnF8oi73HFoNTGxwA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MOKqI8LG6fSoDL5NFovtq4KP12cQmksyUvufY4mHu+TP7lpqWJzGd4YSvwacUvKqU
 Iec8Rm+I8V7rEOI7av0EyTkc0T8knm6i2tvgBw3y8/8Lsly2fXpRH1W9pENfMWmCIH
 PAhj8FYpVxkQCLR1WQiv3kkBFmunNJctlpm2Z9D2nPS8KMXtWIBC7mG6uTSyceh4Mr
 sRQWoArC5KszUEsy1ZJVZk3vbrpuL/YMquYkk/6igaHeeS6W5DCJ2GsGz+Nv92qH0r
 +l4EkloRlYLUQG1Ly6Pg+6zAJRl1dkIFv4N+JQOreyTWSGOzuBdq4xFClhbOqR4LNx
 aVGbsab3bFxLg==
Message-ID: <0886c6bf-316f-10c8-ba7f-7ba6d306478a@benettiengineering.com>
Date: Mon, 23 May 2022 23:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <b07a637a-9842-7852-61c1-b7ca549b0c42@benettiengineering.com>
 <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4puraDuVBrgA_wDGAcHsMTMbioDuoveZScziQ1A2WdTqw@mail.gmail.com>
X-CMAE-Envelope: MS4xfAyFyvm02OvC4pwioNfZauz3fsWbwiKKpN90bYdbwfZdH6QsWxGUh5sZA7bxuB5jp2e4L6r1+sh9zrpmsaewy/kpap9BqPvJRmT/j+I1iNhyf0Xd/WfT
 gbHw14dJlMZQGPL9DExP/c+BShnQjBK5m5Rmfl3SY/W9ppeF8Kv62eUN6afpukF2UgKxBlmHUcvoywJZZzE6oIOUHtoX54c8ShTaixyz99vIkgQGCOU0cgvN
 0+CNONAymJdMPs9e/cUnvRDhw7Fmca+27bWogfSztwA=
Subject: Re: [Buildroot] Can't reproduce libnss build failure
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 23/05/22 02:40, James Hilliard wrote:
> On Sun, May 22, 2022 at 5:58 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Hi James,
>>
>> I'm dealing with libnss build failure with host gcc on your asahi-mini
>> autobuilder, the host gcc doesn't
>> like -m64 option when linking [1].
>>
>> I've spent many hours trying to reproduce it on various dockers and
>> finally on a VM with Ubuntu 16.04
>> 32 bits but in the first cases I can't have any build failure, while
>> with the latter I have a different error.
> 
> It's an aarch64 host, not 32 bit x86.
> 
>>
>> Can you please tell me specifically which distribution and distribution
>> version you're using on asahi-mini?
>> I'm on it and I'd like to fix it.
> 
> As the name implies it's asahi linux(arch based) on a mac
> mini(https://asahilinux.org/).

Aah ok. Thank you, I'm now building a docker container with buildx based
on ubuntu 20.04 for linux/arm64, let's see if it behaves the same.
I've tried with archlinux:latest but arm64 is not available, while also
agners/archlinuxarm gives me problems.
Crossed fingers.

Kind regards
---
Giulio Benetti
Benetti Engineering sas

> 
>>
>> Thanks a lot
>> Best regards
>>
>> [1]:
>> http://autobuild.buildroot.net/results/dffa00b04f407715b04b1dfd8d9e5e4bc62b5ba2/
>>
>> ---
>> Giulio Benetti
>> Benetti Engineering sas
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
