Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE18C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A0981E58;
	Sat, 28 Jan 2023 22:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A0981E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MXg6HGxEBlk; Sat, 28 Jan 2023 22:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A41D881DFA;
	Sat, 28 Jan 2023 22:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41D881DFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7351BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D194160D
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D194160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osZp9DQNX0fk for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C9E41608
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3C9E41608
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:27:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bk15so22498989ejb.9
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 14:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXR+gYNgEeGN4D2Vx622Wnoxj375iB2gF456TTE2AVg=;
 b=Eb9/KWPROxrDvRNjcLIROijGV8k7IVYhwald+5G9c63sYQolZUCm80mvRtWLnKlMpp
 lLuiBcOSt0CZM4A3s37Txz/7IbH26Pt/NzrY8qq0CEym3OGxnFUKBEo4XWt0KyVG0Q/h
 hEjNTbzeHbopYrwfqQhjaad2P3X0Cdg0KdHknDuYv5aAuB3JOKzpZ052oSp7PygzWc6k
 7QMN66lzJAZouLHtQ42+olFiWcWH+bBOq4ydkjtFkyKkh8zZeVZLfqyDYbcHew9Z5VL+
 pKBu/LWo7wpe5Fo62zwzOnCikS83rYs7IirNns2uuyoC6/uRjx4VWGBim8GkG5Mnc2DQ
 OJCg==
X-Gm-Message-State: AFqh2kpwV+1WsssMW6MTfYCXcqhvKy/2+ZP0qBeobQGF7XLTdNAnWqZe
 fkyWTEz46rhWLjUpAdES/W++0NcqgIhJKg9tdqM=
X-Google-Smtp-Source: AMrXdXu3JY8F4kptnfA0/0VXOICattpnndlgDBeHts9rjzDy5G7I6+VY+4KrbPo79WKLNSnaeQ7k99E172Dfdjyb8YE=
X-Received: by 2002:a17:906:5a54:b0:84c:4d1:5e9a with SMTP id
 my20-20020a1709065a5400b0084c04d15e9amr6077381ejc.297.1674944819963; Sat, 28
 Jan 2023 14:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20230127223256.132401-1-pevik@seznam.cz>
 <20230128225543.16657dc4@windsurf>
In-Reply-To: <20230128225543.16657dc4@windsurf>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 28 Jan 2023 23:26:48 +0100
Message-ID: <CAB1t1CzfK_L2EkumVBSRwtp-Bn+yWK95v17zJt0hQFXwT0nJVw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tXR+gYNgEeGN4D2Vx622Wnoxj375iB2gF456TTE2AVg=;
 b=GLS0i7xkuclY2o8GpHD2TxIUGekqgrvrUZz64WhqBQvPzs0dEyx0n/dNb84MjEeozE
 ED7mBxGr/sTViIalZe5PzKuWSqAdWzI3eIxK9piJHHTsTNBRGV62/qkGgcALTg+SWLq9
 slIJ1sPECxiPqNQscdHhW/6+4nwo2hQnttiOgKBD4OPMot78oS6ghTLZ2bWyoPcKbW3K
 Har/svMiZfPrbeFMrrFlMH1u55biMyaX9xhwwjecMksZdQNjStMmWW0VOXve3uI8QGeI
 UGv1kT26VXQwvw1u3RLlWUSK/9y2tCCwSkpVr+fU9dp8J99nDHVN6xL6T+/UStTi4SS7
 YSUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GLS0i7xk
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20230127
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
...
> > NOTE: I'd like to add /opt/ltp/runltp-ng (tools/runltp-ng/runltp-ng in
> > source, from [1]) symlink to /usr/bin (that should be trivial).
> > The tool should have only Python 3.6+ (no external modules so far)
> > and while we (LTP upstream developers) would recommend to not use it on
> > SUT (guest), where LTP is being run, but on host, we agreed to put
> > runltp-ng on both sides SUT (target package) and on host (host package).
> > But whole thing might take me more time thus posting updated package
> > without it.
>
> In the context of Buildroot, I guess it makes sense to be able to start
> the LTP test suite directly on the target, so indeed it would make
> sense to have runltp-ng on the target. However, you could also have a
> host package to install runltp-ng on the host for those who want to run
> it on their machine, and control the execution of the tests on their
> target.

Thank you for your input. Yes, that's why I add it to both target and host.

FYI runltp-ng supports running on target (that's the same as the old runltp
shell script) but also running via 1) ssh 2) qemu (supports qcow image or
rootfs + kernel - suitable for Buildroot).  The main advantage to run it on
host via ssh/qemu is that runltp-ng will support (not yet done, but intensively
developed) detection of crashed host (happens sometimes, mostly by CVE tests),
runltp-ng restarts it and continue with testing (really handy for automation -
experience from testing openSUSE with openQA framework, where we use this
approach).

Also having python on target might be limitation for minimalistic systems.
But OTOH for some quick testing it might be handy to have runltp-ng on target
(and people very likely ask for it).

But as I said, I'd prefer to add it as a separate effort.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
