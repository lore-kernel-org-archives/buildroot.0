Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D489C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAEA7613E7;
	Tue,  5 Dec 2023 21:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAEA7613E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obLl7kIIyMBb; Tue,  5 Dec 2023 21:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC9A613DD;
	Tue,  5 Dec 2023 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC9A613DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF7D1BF35E
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B38613DD
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B38613DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nj1QaACuqqba for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 21:19:26 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B249E61396
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 21:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B249E61396
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso3945677e87.0
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 13:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701811163; x=1702415963;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7A2yJNHadSpdqcRlDpvynGvbV4rWdYzjCF+XFFxPHg=;
 b=RA5Huj5AGu5AgcaYmM48mp4LkBho8PTmIGzFUwRzwWSgeQX0itY9EgFAs5Eb3cqEM8
 XfRnA7gi1YPnIag/051XMxPVJPxxLTtllGVKLTY/9lfc+RJAXUJhP4IX6lc37VczdbuD
 4NzcbzVikRzji39XM3REuSJJ8nAjBdtJGd9WzCDwSr4+POjAj2aMZLfZMBdd89VqhGyu
 lauCg9sajOp55Im5p+ISE0aKO93AFXBQeZ7eog8DTpzRe1A6Hd7kSOLIXLTJFad3/4mm
 wGXaVotIfRmhnpqF/I/Qj1MnVyAG2aTjmDSevzpLYluPj9K5RjoPtycGWLD7dcnAKCJG
 Fstw==
X-Gm-Message-State: AOJu0YyZfnJ2K4VJv50g5nEeIq8OZemFbGoZfuxvGR1LZvbx9Hr+y5j1
 OuCS/vnBy4z9Q1hHQSK4vN0=
X-Google-Smtp-Source: AGHT+IEzIccFMRjGU+3uZJBCOrC6B7BD/yrZ+6vWW2fTrBGzvmZmagqHBEFCkyXA9yyqgMB2Dwa1GA==
X-Received: by 2002:a05:6512:1044:b0:50b:d764:76d8 with SMTP id
 c4-20020a056512104400b0050bd76476d8mr5828089lfb.103.1701811163454; 
 Tue, 05 Dec 2023 13:19:23 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056402180600b0054c76d0f755sm1560305edy.42.2023.12.05.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 13:19:23 -0800 (PST)
Date: Tue, 5 Dec 2023 22:19:20 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231205211920.GA133652@pevik>
References: <20231205203938.131558-1-petr.vorel@gmail.com>
 <27710fa6-7ff9-4775-8a20-4cb9ad7b5dc4@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27710fa6-7ff9-4775-8a20-4cb9ad7b5dc4@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701811163; x=1702415963; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7A2yJNHadSpdqcRlDpvynGvbV4rWdYzjCF+XFFxPHg=;
 b=JlB1QGKdJlatM9w6jRGpF3mHUClwQbyTa4NDtGnr479OlmXh4nm230sNHV5cQxCKkc
 OeKrWGgYp4EgXXVnthFGb3cISGjtDTVn6woIWa6p4mL4IuAkh3Mar9/Lc4XihI1mmY44
 kQa+DAk9rrC+G1BxyLZtkK7CVxkd1K/XPSOSwziEXfZUTKD0Q/0+WrpEOntf/yH4cAD8
 +N5OKwDd8r8BHBpC2BUz75ycv6tKWgcBLUHHaxPjRz0a2UsKXHC+D7eD67ZBw3GQhPw2
 1taNtyhOj4FX12GovuI3uCynyBLVdZaSR0VUt/TmhucOT0ewEZAFEcCoLw3SdhRNc3GJ
 ADtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JlB1QGKd
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.6.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> Hi Petr,

> On 05/12/23 21:39, Petr Vorel wrote:
> > Remove patches backported from this release.
> > Backport patch from upstream ML needed for uClibc-ng.

> > Require kernel 3.17 due getrandom() dependency.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi Giulio, Yann,

> > I'm sorry, while I was able to reproduce the problem on nfs-utils master
> > Giulio reported [2], I'm not able to reproduce it on this patch due
> > failure on libressl (nfs-utils dependency):

> > buildroot/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/output/build/libressl-3.8.2/crypto/bn/bn_add.c:65:21: fatal error: bn_arch.h: No such file or directory
> >   #include "bn_arch.h"

> I can't honestly find out this build failure, can you point the autobuilder
> link?

This is when I try to reproduce the problem with this patch (nfs-utils updated
to 2.6.4).

> If sometimes you can't

I guess you wanted to write something.

> I've tried to apply and buildroot/utils/test-pkg -p nfs-utils
Thanks for testing! Hm, strange, I tested this. I'm going to retest it.

> but it fails due to missing uuid.h that has become mandatory during
> the building of host-nfs-utils. This is fixed by adding host-utils-linux
> to host-util-linux to HOST_NFS_UTILS_DEPENDENCIES.

I suppose you mean to add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES.
I'll send v2 shortly.

> You can check host dependency issues while building using
> buildroot/utils/docker-run
> That way you have the minimum possible host libraries. Probably you have
> uuid lib installed in your system and you don't see the bug.

Yes, I have (I do nfs-utils compilations on my workstations), that will be the
problem.
I'll try this (I see utils/docker-run mentioned in docs).

Kind regards,
Petr

> Can you please add this fix to the patch?

> Thank you!

> Best regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
