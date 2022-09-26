Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C74BC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 08:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5E5E40492;
	Mon, 26 Sep 2022 08:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E5E40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRrc4qyOdlxI; Mon, 26 Sep 2022 08:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B6D401C9;
	Mon, 26 Sep 2022 08:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B6D401C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6BB81BF28B
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F6D981373
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6D981373
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dnud6sjlf4TJ for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 08:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 987E48136D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 987E48136D
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 08:08:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t14so8891879wrx.8
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 01:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nTOfUElrGthV3xYSbU8CJCtefDrGX/qNTtNp8WOW79M=;
 b=Iuc/jq6kXRcYHcgvY10nWnWPKjGcVh4TXX6CuxhXVvN+oBESCo7heBAQecqGNpiOw0
 JajYxmR01CWhhvR38/NmJxtNCK39i9Md8Ba92wehoKBLMVs77QQqGc/7lGafxAKdUYRp
 AFmWqfFuwMEqnkcg4rTS5OS2hR38ml+JujRa93QkojM9uxV+TkLL7iIzfVXF96qbchAb
 MqZYcZe0Yvzlm6m+q3RywhXAkztcdTwX0AOuyJI36qgRL5YisVncy8+xBuzynichiica
 RWRxy0sDLSYLcs2aO6B1UBiX2UV9Z1Q/pl92tCrLPrxFG90e5pfDqc27/Nx0UQTebnP+
 Oe5w==
X-Gm-Message-State: ACrzQf3nCf3F33gwskpAoTiJJQyiL5k6gQKVxu3s5NLNUZMRnH53jJj2
 EBNZvToQGAwwAXsn9/9wW+8x/ls81TPsKF3wQZY=
X-Google-Smtp-Source: AMsMyM6y4C7+iuli5BVJZW+KOlCLg7NGMH/9tjMBspEO8kbFA6wcQfIO7CF08/aG4YEDTtY2ZNUNPOAszUwEB05Kii0=
X-Received: by 2002:adf:eacc:0:b0:228:c256:3dc0 with SMTP id
 o12-20020adfeacc000000b00228c2563dc0mr13055026wrn.437.1664179725564; Mon, 26
 Sep 2022 01:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
 <20220925204030.1661583-2-thomas.petazzoni@bootlin.com>
 <CA+U=DsrR9+WK3gWR=N3FRiOokuLzLWt=mYeWMbRU-Pme=wJN_Q@mail.gmail.com>
 <20220926100552.212e0d83@windsurf>
In-Reply-To: <20220926100552.212e0d83@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 26 Sep 2022 11:08:34 +0300
Message-ID: <CA+U=Dsrz1ogqv2GVZAPyg39d4YpfYUgUjbxAYmscNBeHVpBiCg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nTOfUElrGthV3xYSbU8CJCtefDrGX/qNTtNp8WOW79M=;
 b=Yzhr6RfcHZF9cNmdFj/tVo5uCq4Uy/YYYKJ1GcTif7rMNSI/iFh/1KXWwMqazJ0Kg2
 kZq5HzFoqlgWNMrswTWqHiJxxD53SGVxhPKFfKieNXOOmYIZdt6KWojy2mFyKGwj0KzD
 6E0OtNBsngA54r4MHwcIQzE2zYEqxjrHM93YqaaUItG+rjN+t3V4v1PgCB8WE+sIalRm
 BEtd+MXLxsYslvUQ3yy4NyDGpYhYKC9km8YrMqWU8p2wfxzan98m3fuwqB5MQbZQs+t1
 +0rmgCKbDnKH4K7GbnI5b/LbHvm6Mpwe0XtMdUJh9bAJW5fd6i3ykRM1LXpfoPt5m49p
 jKTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yzhr6Rfc
Subject: Re: [Buildroot] [PATCH RFC 2/4] package/nodejs-bin: new package
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 26, 2022 at 11:05 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 26 Sep 2022 10:56:10 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > Silly question(s) from me.
> > This may go against some BR guidelines.
> >
> > But, what if you were to add a 'package/nodejs/version' file and
> > include it here like `include ../package/nodejs/version` ?
>
> We've not been doing this like this for now.
>
> > Another idea would be to maybe add a new folder sub-level like
> > 'package/nodejs/nodejs/<the current one>' &
> > 'package/nodejs/nodejs-bin/<this new one>' and have a
> > 'package/nodejs/nodejs.mk' which includes the mk files from the
> > sub-dirs.
>
> See the commit log for PATCH 3/4, which says:

Ah, apologies.
I missed that.

>
> """
> One possible alternate organization is to have package/nodejs/ contain
> all three packages: package/nodejs/nodejs/, package/nodejs/nodejs-src,
> package/nodejs/nodejs-bin, which would allow to more easily share a
> few common variables (version, license, license files, CPE ID, etc.).
> """
>
>  :-)
>
> BTW, did you confirm that with the latest master you can now build
> NodeJS correctly for your scenario?

The message is in my draft folder to be sent.

I confirm nodejs for ARM64 with external toolchain.

Running nodejs ARM with external toolchain now.
I wanted to send that message after ARM finishes.
Will send it when ARM finishes.

Thanks
Alexandru

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
