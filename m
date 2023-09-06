Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56147EE14D0
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBD482183;
	Wed,  6 Sep 2023 20:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBD482183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzAJ-r5b8BQv; Wed,  6 Sep 2023 20:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281DF82158;
	Wed,  6 Sep 2023 20:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281DF82158
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 437AB1BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29C9782158
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29C9782158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ik0TtqMm7vkd for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:13:11 +0000 (UTC)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE4482004
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE4482004
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7a0254de2fdso51301241.1
 for <buildroot@buildroot.org>; Wed, 06 Sep 2023 13:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694031190; x=1694635990;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sER8zUQ5qteq2+8BdY8PUJQI/M2r0oTdwfYiKdEW9Bg=;
 b=Cd45XLa9/YATrDKnqWxCpB36B5Nelon2QUjdZ+VzDzP0vbQXExemZsvEmQ/iwiguih
 u3ZGgBgQvU2oq+s1gZZgib7oTPDH9uyVrfzIVpCcwETOF+Rms3AUCC/H0FqbyUwWeZNF
 kpm4IM22EpE1M3kUYvFMELdgoawJMXYtTk+UENR8RcDGjHSte2fE3S/+8i1AbMhITK5x
 jG9ZedPv33TbOihQyiQAF1egejkmkmGpqdosDBuCHxPNCq4VCicwlZp2GIIoGq6MVrvl
 pfq9mdE7useYUbpUwlkjkTjxFc93wNwu4qyunkJ+rqhvO9HhpknGOU/JygX745HKON7T
 2+GQ==
X-Gm-Message-State: AOJu0YzP33+fvRICZjsn36nATmgrZdgNdXBtavLK0YQQdrM0idTpkuxP
 CvlJN/xBcm75CP3s26Y5Jur91FQyHnbR4mLxKzgv3MiAoCQ=
X-Google-Smtp-Source: AGHT+IF9pX9uVoKLYY9EqIz69RSBAmCsUHQ3ZAyq9kf/pXGcREGS1/IAz6n2ayhsRiluiWS5NrTn3E0KaHThBPGLsjs=
X-Received: by 2002:a67:fe97:0:b0:44d:4196:f374 with SMTP id
 b23-20020a67fe97000000b0044d4196f374mr4098815vsr.14.1694031190430; Wed, 06
 Sep 2023 13:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230904124551.94741-1-nolange79@gmail.com>
 <CADYdroOi_QjoOorN6wji5Y4_sUMUe_=YSK42Eik0S8mqHiTosA@mail.gmail.com>
 <8734zri5aa.fsf@48ers.dk> <87ledjglh6.fsf@48ers.dk>
In-Reply-To: <87ledjglh6.fsf@48ers.dk>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 6 Sep 2023 22:12:59 +0200
Message-ID: <CADYdroMetuwfJt3g5OUKyjUBx-535nfPczeHCE_qKRBnyz5QPA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694031190; x=1694635990; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sER8zUQ5qteq2+8BdY8PUJQI/M2r0oTdwfYiKdEW9Bg=;
 b=WTRyILNXtnCxU9xLyO82aOmKf1x7bZ2WwZed++8ZnDt4G8UayU1NREC4WOwRF58j+/
 wP2OW4BCiHqzVgf2WuuzNOMKpdrpeq1+Tr1Rua2r1d94+O4A9L97zJBGBXBFbicgD34Q
 cr60Mim7RrXF5oF7UI9g1smPtJTOYkqCjr+8IJa1j94q4FPH9MtpSenbXRVA+gV0UmWE
 p5WY7D96Dx5mvsZZ0zGfiUpA/2SNppofQt5y8SvYlCLL3ZiyENBSPh/MaVPNGnXmPHJg
 1pmceHcVNhPmILTdJX7FkzICyX1nP/36yU6bB297xnAWFgmoBf2wahch01Y04g5M9qQ1
 Hopg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WTRyILNX
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix build with old glibc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mi., 6. Sept. 2023 um 21:17 Uhr schrieb Peter Korsgaard
<peter@korsgaard.com>:
>
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
> Hi,
>
>  >> I think this, together with the version bugfix bump to 2.39.2 should
>  >> end up in BR 2023.08.
>
>  > Can you give some more details about why? Is this a fix for a new issue
>  > in 2.39.2 or already in 2.39.1? What is the relation between this and
>  > commit 898bdbca1f11f (package/util-linux: fix compile issue with older
>  > kernel headers)?

The problem persists in 2.39.1 and 2.39.2 (atleast), has a few attempts to
solve it. Both BR master/next would not compile if the kernel-headers
statx struct
disagrees with the one from glibc (misses some newer members).

This patch is for 2.39.2 / next and should finally solve it completely,
I don't see the value in hacking together a solution for 2.39.1 so
I would highly recommend picking the commits from next into master,
and this patch on top.

You have a few autobuild failures related to it, like
b1933b2dabea1fb49e9fce8e19f0532857d3b4c7


>
> Apparently not in 2.39.1?
>
> >>> util-linux 2.39.1 Patching
>
> Applying 0001-libmount-fix-statx-includes.patch using patch:
> patching file configure.ac
> Hunk #1 succeeded at 315 (offset -11 lines).
> Hunk #2 FAILED at 517.
> Hunk #3 FAILED at 526.
> 2 out of 3 hunks FAILED -- saving rejects to file configure.ac.rej
> patching file include/fileutils.h
> Hunk #1 FAILED at 94.
> 1 out of 1 hunk FAILED -- saving rejects to file include/fileutils.h.rej
> patching file libmount/src/hook_mount.c
> Hunk #1 FAILED at 294.
> 1 out of 1 hunk FAILED -- saving rejects to file libmount/src/hook_mount.c.rej
> patching file libmount/src/utils.c
> Hunk #1 FAILED at 111.
> 1 out of 1 hunk FAILED -- saving rejects to file libmount/src/utils.c.rej
> patching file meson.build
> Hunk #1 FAILED at 79.
> Hunk #2 succeeded at 175 with fuzz 2 (offset -2 lines).
> Hunk #3 FAILED at 639.
> 2 out of 3 hunks FAILED -- saving rejects to file meson.build.rej
>
> --
> Bye, Peter Korsgaard

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
