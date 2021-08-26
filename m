Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CDDC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 04:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2809B610CF
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 04:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2809B610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D318248F;
	Thu, 26 Aug 2021 04:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jApwxopYkHp1; Thu, 26 Aug 2021 04:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79DDF82457;
	Thu, 26 Aug 2021 04:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806F31C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 04:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F23C82457
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 04:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJIAjPkikv-2 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 04:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4D5181911
 for <buildroot@busybox.net>; Thu, 26 Aug 2021 04:01:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id h9so3150989ejs.4
 for <buildroot@busybox.net>; Wed, 25 Aug 2021 21:01:21 -0700 (PDT)
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
 b=s1l96pkYTyQj/b/zew2lTdNmnkhVlQVcRChMKOtXCKSX8+15zFK4PUcxNGOkrm/Pvw
 ER+9R+soFvolmkqSwwjf8SLWza84e9oUxEvn2EbhdapZ0TqH2PASLbwuxRaVixeqQPE6
 rQufM2Y1ygckEIlQHrjoS49jaz19+zkRQ/9Mkv0tpJoJy56Sn1C6v5D4Li1FFEynEg88
 dCj4htiz6yN8rNSoCXaSTaoszPnjy/02g27qzethdQnhru/DwLdRMRK/1RxbKD0KJis+
 NzDw92Ov9aWiu1somF2LJA+95JcHoig6RiXY1cGQvhXMTEQTslAbQaD65NJLdW3tMnsB
 ML5g==
X-Gm-Message-State: AOAM533SdV7IBpgpQSn7cPrq2qCHwB39F/gWPoLHhot/f4FIdDp1+CnB
 fisYOIc7Yl4VlN8DoYecF4ejGBbXpvuLoJCjJ00=
X-Google-Smtp-Source: ABdhPJyRXNRD+v7OWeNgsGm4RszX4acIcwdcWi1iZSFF8NoNgscAvFlp2aIkUr/qSIsf3v+CZIDpmXIrf6qAzpzlb/U=
X-Received: by 2002:a17:906:a0c:: with SMTP id
 w12mr2024132ejf.376.1629950479875; 
 Wed, 25 Aug 2021 21:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210825090243.30444-1-yegorslists@googlemail.com>
 <20210826002909.777698f8@windsurf>
In-Reply-To: <20210826002909.777698f8@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
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
Cc: yegorslists--- via buildroot <buildroot@busybox.net>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210826040107.PE2W4-5a8YaEppeGodV_9Ubs0InqS959I3uf0HV182w@z>

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
