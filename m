Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9E0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 17:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEE860F6B
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 17:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FEE860F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BE083FC7;
	Fri,  8 Oct 2021 17:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fq3yWO1DVBhK; Fri,  8 Oct 2021 17:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BE483FC4;
	Fri,  8 Oct 2021 17:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFFDE1BF2C5
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 17:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8BB60896
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 17:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNLwwCIpJMsX for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 17:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58822607D0
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633713956;
 bh=M8jQGfP+DSSMzsPxAtDtj82PEiv3KhpeWxBn7wlcjSQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JQGEmUBjsBM3dM8ibX+14eB1v156D2EfZFQFpp9sxWDVT3PMqyXmpE4v0h6vt9p5d
 O6Q/0MU1E8wY0AMvADmaCj+3mt29DWtioQjEWtgCvS1sYoF8YfxNXA2EeDUmwTaFa2
 5dFjxb04R+MH7AJmIREWxpBaZ4bcZCcmhSyIjDAU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1nFLzi0eb4-00gV6m; Fri, 08
 Oct 2021 19:25:56 +0200
Date: Fri, 8 Oct 2021 19:25:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
Message-ID: <20211008192555.6dbd67d2@gmx.net>
In-Reply-To: <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:LrOZmJHtGHgc407lphQFcmrhXg7s7yGBELI66OXtoN1w7x9UJ8O
 4VatfkYfUpt07HtUTfJskDhb+KH8fHXQgyKrm0BsWmRfFHw7sBGZCvGZym8RKQckm6FQSK1
 yxAwRobt1FwloFRDbLSYrA8PINq7pO2vU+R2T31voYbZuR0oCUbC4Px+3cRxSRufRqL7Nb3
 muyzA/6/dmCOhYqI6t5VA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iYHcdKvlCco=:fQoQHUYpLTPg41avSMtbrc
 X0EAslx2kLbJA8JdiLLs8a3oUWOUJDVJNkFtphtF4ggzpr8majKYeNjpK8Fis5vBlz7fk9CkF
 R5ClhV6caCGAZlAP1+ITGHOKQE4laVdz7gVcMlG1nG+Jyf4DCcGpgWZEfqBl5N/WeHETr9vCz
 EZPXLboUaOlfvDwCqsxgAJ5EroHqkk8wrjJFNF8YdaqHyOJZQKC9MfFfd2JcnQeU8R2SqShw1
 /fE8yE1pOPTKaDLfkuoVOd/Rfg6HAyP0fqGZCqCoyDwi5pBPXN9/sf4wJnAhrhnJwoU1xdMTS
 jtf83eCAskF81DmsnJWYyc7zzoJIKzswvChXOBv2HwG144Yd3KinJylt2BLyaHqb1KvaLdceo
 gr8zgQhuwZe/RHnz5Ah+vlQZxQMKUs0CY1eq7ipKxkqDEShJ8QgIIdg4fXgXN+YL0RJAeIxCP
 CpNVPIZTZ56Gb8TLUu9BCbei74M8yNVB664dAAOD66g0E49FPbTOp5MRXBVbrg5uPDceDy3tS
 IZiuqA40BFznZ2qE16CZaNA3Qgcdi2AC/MhpyFKzWjSxaYsOp6uoltNNVpqnOiNJ0/rZbT0wF
 JMDtWm1H1/KoL16ogM2ajAOf8+srD7xu144Vyb0FSiwqDVIUEzUcQ7azx/8olAd4ryAV/YPjj
 llQQGyAgCMv8vp+cVPGCleA18+MlPNhRqsJX064oXRia5ueecnejUSMr8B4Or32JkZJl/LP2K
 rj5iC49IWutu+WfgMWDwaO01s2HJnL7FjhEsKYNK6jrQM7hVwIQUgVrgU5eJVNG4MNj2YhAVb
 OHUK9hj9PQY1NhrNjlzVZ5WFlxUgpw4hYe1HO1i7Q+9z5dbpY6QOBfrFKKqFb7Zxq5Nlu+u3Z
 lHeLbcdcfvLAdQ7800dKsd462jSdx6EmWrQq2BqQ9Ts/CE0FPWwJ09E3gXwvleMET7n+Ncyob
 5PD82yr5Pm8U+e0KiCwTZX5OC3Jhiu4CC75tE61tEx7wNV3AMo3JR08xWDimDO+HX7K53bSC0
 ndhq0ROgirTfveHi2KJZkxlayVpLAhMUH2WV6pqVsbQZwUjHvEq3WRXkkMkuu/X8cHo5o3Pb+
 YNr7oXQEZIpBhg=
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Walter,

On Fri, 8 Oct 2021 14:27:35 +0000, "Walter, Stefan" <stefan.walter@iml.fraunhofer.de> wrote:

> Hi Peter,
>
> > Von: Peter Seiderer <ps.report@gmx.net>
> > Betreff: Re: [Buildroot] Boot process stuck at "GRUB loading.." since 2021.02.1
> >
> > > Does anyone have any idea what's going wrong here since 2021.02.1?
> >
> > Only known issue was 'Bug 13586 - grub failure with BR2_OPTIMIZE_3' (see
> > [1]), but should be fixed by commit 'boot/grub2: workaround breakage with -O2,
> > -O3 build' (see [2])
> > [1] https://bugs.busybox.net/show_bug.cgi?id=13586
> > [2] https://git.buildroot.net/buildroot/commit/?id=7cb51d4843caaa9144270d92f86e60d8b5a2a1ec
>
> I was aware of this issue, and I had hoped that it would fix the problem. Unfortunately, it did not. I even explicitly built all of Buildroot with "-Os" instead of "-O2" once, but that didn't help, either.

That's sad...

>
> Is anyone able to boot (an i386 machine) with a setup like the one I have described?

I have on running config with grub/i386, buildroot-2021.02.4 based...

Maybe try to 'bisect' the problem as you mentioned it worked before 2021.02.1 (did
you test 2021.02.0?), not much grub related patches in between...

  1fcdfbfb8a Update for 2019.08
  ea7ec41cf6 boot/grub2: bump to verson 2.04
  836b84a774 Update for 2019.11
  5f5477b0ab Update for 2020.02
  7e64a050fb boot/grub2: Fix GRUB i386-pc build with Ubuntu gcc
  2f7a8021b5 boot/grub2: Backport Boothole securify fixes
  2766f34619 Update for 2020.08
  9624a001f9 Update for 2020.11
  e2fba6457b Update for 2021.02
  e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes
  300c8d20b5 boot/grub2: ignore the last 3 remaining CVEs
  6668381363 CHANGES: Add last minute 2021.02.1 updates
  76b4f9e9b6 Update for 2021.02.2
  5293208a57 Update for 2021.02.3
  860c15087d boot/grub2: workaround breakage with -O2, -O3 build
  004a792dcf Update for 2021.02.4
  6d9e38c427 package/swupdate: don't require website for services

Start with reverting 'e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes'...

Regards,
Peter

>
> Best regards,
> Stefan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
