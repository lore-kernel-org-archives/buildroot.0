Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BEDC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 04:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DF160F25
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 04:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9DF160F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FED040139;
	Thu, 26 Aug 2021 04:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z25vBW_UY9HI; Thu, 26 Aug 2021 04:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFA0A4052E;
	Thu, 26 Aug 2021 04:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74D281BF97E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 04:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 618174052E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 04:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjImBur6yLaH for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 04:01:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B65C540139
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 04:01:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bt14so3157834ejb.3
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zjl74C+6YSrfKGGNrShn/4wB59pJISWIVe47tpUSbyg=;
 b=pOaxviJZGjJ62MPqMew7cQNVvU5QCX/N58dglIxGU8AicAC+7VNZPQ+GMRxS1/Ciz+
 s5KNNGbcnnd7jPmoMokUByNKhLz/wreLD0fUANF59IvhkIherjA9ndFVhlihKr/ln3fQ
 tGX4TKFDpv32hkvEjm/X+21TmHBD9Ol2s8GzTGKBRR6Siws0NeV7yN7joXYyCXeDd9ZV
 UHpNm3/xU20ivUZiNkOnENMs+C7PQ5uhNq4m507NsXrMMZgecHfg+XXJorad6kDif/mF
 U5osg9m22jb3smL5uBaXKOVPq3W9cfP55QYfyD36gvrim1WZCK0FeATx6GxJFRoBe4C+
 kTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zjl74C+6YSrfKGGNrShn/4wB59pJISWIVe47tpUSbyg=;
 b=cJB6c6Yo/z2ENd5rMc2DBaTR+WPzPXlpmqsui/IMiNzTjoB36n4vmHILEYUGuc9rlb
 N0YE4QdwskUCUpyVGKpQi85V7FuIKBwKLTSE+VI/5Dd3AF3VhC4AxDQWS4N4lxw6rKKA
 5PZHF39W4UnpGpYmFWOy/awlXtSejMbyEI+6GVixF1PuiXgI1OH9wmfPDlF6qyowHa2a
 UkTGPEmt2jTA4UoeBzNMEx99758pLimhItDuOECvW0tm4HLshzdNsVBA/LR2fQSa7Gic
 O67riVCC+LwB71MN6MSLlWF/P74t8viIJZiyp9hJ8JQ1Aey6uuAAyVQDTd6vGfa4rjPM
 sIow==
X-Gm-Message-State: AOAM532FHwEYXNMRgZGf3GMxEKq/8ZAVoaWUHBulWFo43fd+Tp0fPAC5
 tKDxbBumcc0M13+RZVeS54MVpswPdHlnswMdZso=
X-Google-Smtp-Source: ABdhPJyRXNRD+v7OWeNgsGm4RszX4acIcwdcWi1iZSFF8NoNgscAvFlp2aIkUr/qSIsf3v+CZIDpmXIrf6qAzpzlb/U=
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr2024132ejf.376.1629950479875; 
 Wed, 25 Aug 2021 21:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210825090243.30444-1-yegorslists@googlemail.com>
 <20210826002909.777698f8@windsurf>
In-Reply-To: <20210826002909.777698f8@windsurf>
Date: Thu, 26 Aug 2021 06:01:07 +0200
Message-ID: <CAGm1_kuW=EYjpXAL3g2mZhBxh4tAyB8633D+49Wiwij8-JbspA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3] package/libqmi: bump to version 1.30.0
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
From: Yegor Yefremov via buildroot <buildroot@busybox.net>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: yegorslists--- via buildroot <buildroot@busybox.net>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Thu, Aug 26, 2021 at 12:29 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 25 Aug 2021 11:02:43 +0200
> yegorslists--- via buildroot <buildroot@busybox.net> wrote:
>
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > This release introduces meson build system support that fixes
> > gobject-intorspection issue with autotools.
> >
> > As meson files are only available in git, switch the location to
> > https://gitlab.freedesktop.org.
> >
> > Add support for bash-completion.
> >
> > Add an upstream patch fixing the compilation without gobject-intorspection.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a
>
> Are you sure it is still fixing this issue ? I already made the same
> comment on v2, pointing other commits that fixed gobject-introspection
> issues.

OK. I'll remove this comment. Though in the context of the next
branch, it really fixes the compilation issue. The general fix is only
in the master branch. libqrtr-glib still fails in the next branch.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
