Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E50EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 22:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2834960E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 22:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2834960E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD483834FE;
	Wed,  4 Aug 2021 22:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKjPeIKf0FM3; Wed,  4 Aug 2021 22:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3922382668;
	Wed,  4 Aug 2021 22:51:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4351BF573
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 22:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 099E182668
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 22:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yo25uFyfno3c for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 22:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3CB4825E8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 22:51:08 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id z24so4426542qkz.7
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xGX/pZ35ciUl2GFC9XZbryF2UWuGMjAHaDCphAttozs=;
 b=Vkd9+G/+x2SOHfCZ3geEg9prZj8PzRSc4tNemLbCqpwGgX7/TAHC4k7lfoCzMbvxZc
 vCnhlf794Jm6nxksew0nCLvIzV/eAvYos9sIXOE53YacLaSgeOHTEUh/p47BptM68YNe
 GsvgURRAY8Qj00c/Wm+mur5zI9j57YL1AdRRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGX/pZ35ciUl2GFC9XZbryF2UWuGMjAHaDCphAttozs=;
 b=H9fj76dXg4IKofZ0GNU3pLzRjWdUwmjkghRQ8PmPZEMMwOZynaw/7c0CUn8IMqGoF4
 N6SQxt2PSjv8hzuvFE9h5yUTpHoITi8ymwAmkFVsx9GDprmpiS6VFrxoEZ/CBqoW1sSl
 jAbdGaPVoSckZ/7HG3Zli98Yp8rcH5mCX2lbH50HjfHH7EP7REs//dm5dP5NavHQAWD4
 Wi5198s1kAVktATmBeoqARfjZ01aTDluC54lSSMMIgI1p5xJqcX5SKXhZZtr3pNABhEH
 xPXywoF4j3d+e8P9OvhW2lmtDQaM/PGVMxQla6X+/ce1sUA8bIk54YC7LWAIVjJYSr67
 PYHA==
X-Gm-Message-State: AOAM533XcinF2RJSOim7mB8UJ8DUkrsA6aRYj8cF4C7DH/QoEYf1Pmc8
 /OeF7+nEbhsWpfFFIHKE/xSZwlSusd1nnvG5kh0=
X-Google-Smtp-Source: ABdhPJxxQdEo5ZqLN0p2yRaIyXBp0mnmK/dedXGiv6aaRlrE6WzBqYr0nuTzzPRa3Jw4dqB3PTd1BQeQIUO6KUBBmSQ=
X-Received: by 2002:a37:9f0c:: with SMTP id i12mr1781764qke.273.1628117467539; 
 Wed, 04 Aug 2021 15:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210803081615.879069-1-joel@jms.id.au>
 <a67de0fb-78da-bbe6-e2f7-a58c126ee43c@mind.be>
In-Reply-To: <a67de0fb-78da-bbe6-e2f7-a58c126ee43c@mind.be>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Aug 2021 22:50:54 +0000
Message-ID: <CACPK8Xf9-KOSRourfGbqjFLciO4oVazz4Hv2Cf-bO8phhrcSug@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/pdbg: Fix alignment error on
 autobuilder
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 4 Aug 2021 at 20:46, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 03/08/2021 10:16, Joel Stanley wrote:
> > The autobuilder fails when building for sh because of an alignment issue
> > in assembly that includes an external data file.
> >
> >  http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/
> >
> > This fix has been submitted upstream.
>
>  Has it? I'm looking at the PRs and issues on github and can't find anything. Is
> there some other upstream that I can't find?

The project development happens on a mailing list, like all sensible projects:

 https://lists.ozlabs.org/pipermail/pdbg/2021-August/002373.html

 http://patchwork.ozlabs.org/project/pdbg/patch/20210803080305.866765-1-joel@jms.id.au/

We ended up with a slightly different fix upstream, but I think it's
fine to carry the version we have in buildroot.

>  Applied to master regardless, thanks.

Thanks!
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
