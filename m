Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FAC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 20:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4580B40292;
	Tue, 13 Aug 2024 20:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xV2hZucNEYQP; Tue, 13 Aug 2024 20:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F166340AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F166340AD1;
	Tue, 13 Aug 2024 20:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AECF1BF5EA
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0793060629
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eF4JaUAfRPqe for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 20:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D39860619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D39860619
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D39860619
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 20:42:04 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2cd46049d2bso1088117a91.3
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 13:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723581724; x=1724186524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7JqPgiuGvpVyPtW/rBDiVaJ6RDAkEZ3JOmpS7khAtls=;
 b=dqZBo7P+FIatttwsZXxwI1nuxtQrAm34jfWnEuD2lMgNxC+a+X1WNIFObzDg+kqqUw
 FRfBkFUWS5SXdZF206HKbYWnFn7V3Tl20xiU71LVQiNkyVyAQKeTHmcMeTnNBKSXzo+M
 pgZ4rKa47tGZ8nktDkuSQhOw0cSCEmVSU/AVgNFFfpdJbp2BGxShCuK++sg2Vdq4QxOl
 qE90GM8MrSWkIJTSDVDjDI24hIIRV8/8hgxF4I0FDdTiQpOQf5JMRwP8tdQuE46zAztf
 HE7vAQEMIzAaYZLGsp82rXjxTHD/j1gwH0+cVatQ73H0kiKsIcHv7ZevZJVF6lunaGIn
 ohKg==
X-Gm-Message-State: AOJu0YwworF1KmQ93fS4q0E95cz8cpP3f7mTecxu6vvvYvQ+JqtYcDNI
 uNPZeQFLcq+rB6MIKU54VenwZbE0J04y+y/jKpHwO8UEV/+juGKVM1nod6Qn5NHOtvWIwr+QMAG
 24vdn9WGAneoUEsRQEjNg+i1RDWtSKJtVV7mkG7SJJiun1XTZKg==
X-Google-Smtp-Source: AGHT+IGAvKU+1yKCaO83Qv8pwCcW4vbUbstQ5oyc2h3vITwkHaaLMnZxrhb9Mb5Pzwwgjzk99BdJ4czVWHbY+t+ppLo=
X-Received: by 2002:a17:90a:ce16:b0:2cf:def2:fc92 with SMTP id
 98e67ed59e1d1-2d3aaba8e56mr445680a91.4.1723581724243; Tue, 13 Aug 2024
 13:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tNuugDABr-goDwU2csVNOAaKp=GqS9B-3KZcMjmaxKYA@mail.gmail.com>
 <Zru-cKO4R3cz1NRF@landeda>
In-Reply-To: <Zru-cKO4R3cz1NRF@landeda>
Date: Tue, 13 Aug 2024 13:41:50 -0700
Message-ID: <CAGt4E5uHdqDHnNHrvuwe18tozRq8B3M5TTaShqRaWqfAOpn_eg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723581724; x=1724186524; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7JqPgiuGvpVyPtW/rBDiVaJ6RDAkEZ3JOmpS7khAtls=;
 b=Me9cDCS7OJ7/JdNibNwxKgUBmsNf8h8bNxEthY/2hoa8MrYYLVW5ze8Jf3xVpaj8ze
 pv6mT26mBSj6vM4uhCxpT3BYkLkMmMLAp1RxSlK7PPdXmDubv03738418yAnjydKgezO
 IAeX08bVUUA3hfQPN537SYJjqWlZHZq/6fXqQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=Me9cDCS7
Subject: Re: [Buildroot] LLVM builds broken by "-z text" (3a39e706a91a)
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 at 13:13, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> On 2024-08-13 13:02 -0700, Markus Mayer via buildroot spake thusly:
> > It looks like I am always the one finding corner case build problems.
>
> Oh no, you're not alone! ;-)

Phew! That's reassuring. *LOL*

> -ztext, the gift that keeps on giving...

It would seem like it.

> [--SNIP--]
> > The problem stems from an incompatibility between clang and GCC in how
> > they treat "-ztext" vs. "-z text". GCC doesn't care, but clang only
> > works if there is a space.
>
> Damned, it was not fine afterall...
>
> [--SNIP--]
> > What is the best way to address this without breaking other things as
> > this seems to be quite finicky?
>
> My @work alter-ego just sent a series that would hopefully help in this
> case:
>
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=419144
>
> It would be nice if you could have a look and test it, if possible.
> Otherwise, please send him a defconfig, he might be able to spin a build
> tomorrow...

Tell your alter ego I'll be taking a look. My work day is far from
over, so I should have something for him when he gets to work
tomorrow. ;-) I'll fetch that series into my tree and see what
happens.

Regards,
-Markus

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
