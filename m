Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3008C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938BE60EB2
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 938BE60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57BEC40158;
	Tue, 27 Jul 2021 21:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivw_LHFZNmYa; Tue, 27 Jul 2021 21:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9701400E9;
	Tue, 27 Jul 2021 21:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 351D71BF2B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3149383A05
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jr3lyM0wEMYW for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:38:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F542838AB
 for <buildroot@busybox.net>; Tue, 27 Jul 2021 21:38:49 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso14143483ota.13
 for <buildroot@busybox.net>; Tue, 27 Jul 2021 14:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRJeWu51jk8FqqrWFaZMkpox9g+I0fXyady3uJTSdhs=;
 b=kRPYWtZXnOvxaePUBk84c1zndHvpDpHCYK3DKsEoPE1O/K8e28xwQeMHWjOPHhRCX4
 Jf6t6imKuzLelu5hYuG5uxX5PMdEiqP2xpd7JJSK5sGcql0BdllOF443tUK3uqixU+qN
 MImtKwWXoTTRaqtIC703n7VkordaAGYMBA76hb46I+F+l1sH3VcqY3KmOcvSpDBATmUP
 uj+V1Hhv4ArH8uxdXji81/aJJO5O32CkQ23DtaMohkjLUAwuTRv5H+wtw6vMRtj2y64M
 bVb9OwIkACoSeuUn9KivCAttzCg0wGiUsHy2koxOeMT4MPzKzakjQwqozHF+dJ+aFxBw
 zmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRJeWu51jk8FqqrWFaZMkpox9g+I0fXyady3uJTSdhs=;
 b=W+Nx38hoI6TLnAwY1x4NcHYo4EQkdrLKjzr/oVanhK8ajb6YX39lBSeePiIbLArhUw
 uEFIrYBQR6A7HMZgcYldXXLRLGzjPhzhOZJZNF5+rSLgpWh41nPQO84EdKfqswYSJQ0b
 d+tJyCnym8X0mbOlJkQd6jPAf2q2u91UPHsT4nNcRM6Cxp+khM1ztFlZQphr5YuwymmW
 QBe8u2pXyLhAeyIfo3KpJJ8WdwkoVjhiGox3DmaeYXs+7z9vkdRgFiO1MKcK2wesdgks
 DK4pfVY4s0mpuExx+BvvgdLW2UDhA+BGqcuMtZk7peW31Lb4XhvWd4DVmSPRAB/DjiBL
 TraA==
X-Gm-Message-State: AOAM531CEll+JlpqtqY3dl8htuLtLKBW3M17W6MzFsYw1wrZHYCU4M2V
 xNmR7aUntV1IMoeZsQsY44hNlOpMf6NL36RFBVXJ6QTFzSC5lA==
X-Google-Smtp-Source: ABdhPJyWNAQOv0UBcmK3VTJBRdahNAZ5MRB+RL7HWuL/3K3uhOZ2izNF4YkIl7O+y3RwTUB83wfOK5kgn4Kc+/vA7aA=
X-Received: by 2002:a05:6830:40c4:: with SMTP id
 h4mr17109177otu.75.1627421928373; 
 Tue, 27 Jul 2021 14:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210331185001.24790-1-ps.report@gmx.net>
 <20210725233859.723427e2@windsurf>
 <20210727230351.2e49eddf@gmx.net>
In-Reply-To: <20210727230351.2e49eddf@gmx.net>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 27 Jul 2021 23:38:37 +0200
Message-ID: <CADYdroPtTk0b7ECgLDVUQnoYi1O4jtcnzxUGHEj0DqgxV=HnKQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Pierre-Jean Texier <texier.pj2@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am Di., 27. Juli 2021 um 23:03 Uhr schrieb Peter Seiderer <ps.report@gmx.net>:
>
> Hello Thomas,
>
> On Sun, 25 Jul 2021 23:38:59 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > On Wed, 31 Mar 2021 20:50:01 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > - change clock_gettime option from yes/no style to disable/enable one
> > >   (still omitting the explicit disable to keep the configure logic
> > >   defaulting to yes in case no rdtsc is available)
> > >
> > > - change to set all available configure options:
> > >
> > >   * '--enable-daemon': previous default
> > >
> > >   * '--disable-diagnostic': previous default
> > >
> > >   * '-disable-init': do not install init files as buildroot ships its
> > >     own sysv/systemd init files
> > >
> > >   * '--disable-nistest': disable tests, previous default
> > >
> > >   * '--disable-enttest': new option, disable tests
> > >
> > >   * '--disable-olt': previous default was yes, disable builtin test
> > >
> > >   * '--enable-tune': previous default
> > >
> > > - add patch to fix uclibc compile (disable dependency on sys/auxv.h
> > >   introduced with upstream commit [1])
> > >
> > > Changelog ([2]):
> > >
> > >   - made enttest configurable
> > >   - havegecmd.c - new command added to close the communication socket
> > >     [Werner Fink]
> > >
> > > [1] https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00
> > > [2] https://github.com/jirka-h/haveged/releases/tag/v1.9.14
> > >
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >
> > Thanks, I have applied to master.
> >
> > > +# '--disable-init' as buildroot ships its own sysv/systemd init files
> >
> > For the systemd case, we actually prefer to use upstream-provided unit
> > files in general. Do you think you could have a look at using
> > --enable-init in the systemd case ?
>
> The buildroot systemd file is carefully handcrafted (see e.g. [1] and [2]),
> I do not feel empowered enough to do changes to it ;-), maybe Norbert?
>

Well, there is not one but 3 upstream unit files. The rationale for
using a special
unit file is simply that alot of the isolation options from the unit
file I used as
reference [2] either need kernel-support or other subsystems running.
(as noted in the commit message [1])

In other words, I did cut stuff down until I got no warnings/errors in the
system log while running a pretty minimalist kernel.

Norbert

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/587067.html
[2] https://github.com/jirka-h/haveged/commits/master/init.d/service.fedora
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
