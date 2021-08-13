Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC2AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:46:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF5D610A5
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BF5D610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 364D74035C;
	Fri, 13 Aug 2021 04:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTiM3T2DryOa; Fri, 13 Aug 2021 04:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98DB840363;
	Fri, 13 Aug 2021 04:46:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 337F01BF302
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2363B80E36
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luoUOo3a-xDs for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 04:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7504980E15
 for <buildroot@busybox.net>; Fri, 13 Aug 2021 04:46:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x14so13434638edr.12
 for <buildroot@busybox.net>; Thu, 12 Aug 2021 21:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1TVNdD/f97prg9CPG0FZ+Qs5Be31uyga0fZ5JazJb8=;
 b=g600OnLsUEbLxOeeUFqMxMWaj/NaSGYmEHk7klJBuJUP7dhHl+LqD96aN/sHUus9JI
 t7u3RE0ygDCw7KNiijtVd4XFFL2bUG2A/CMH7fkbCgqr4+vJRjHYAcAlWwFhsap4NZWn
 dohth0u62bRhRVXdBjyx2jgCqYwJwI6bvcY7v237yW0RwsNQg1NrsDqOAduCOqpmrkL5
 zdOgZVrrqVvINo/dSfUatbB/6s9Ou0rTdsP2Zv6A5Xb7L0B34CzcA8k2GDnan3236BYx
 OOwlNiugPp2EbMPfGT1OR+f3l/yKoncO9aeajCrBOA04/97SzuFZCwkqqLK9Of4GNJ/2
 l5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1TVNdD/f97prg9CPG0FZ+Qs5Be31uyga0fZ5JazJb8=;
 b=jXLrDk++LiNvMfewVtIURh5xneWyxHfKkE1PWF6RuFDQ42ek+Uj/M0jsdtuEiQzVZa
 S9Y/d/0IUzDFKMhveFaKrn5xQ1uq1hOWi4sesxhtnb3CVL+sCZm5FbPXL0Ne/yNsaf2v
 0uPiOWq2D8cSA1+cxleqJHRcEdzYzogGbh8bzsAbXdQ8nEuEdk5knpp84zOie9vuUYpu
 mf2UEiI5fraKrSKBeiTP8d2k94U8Agz/mdB7jegVy7cAPV0ZSvo36HUTwwz1Tm6U12Pu
 HEZu6etivEa9QQN1bavyXrBBJnr5YVhpRQIyqIgVbOCuTMPfPARulgdK+ey0UW+bzQOX
 W0YQ==
X-Gm-Message-State: AOAM532tptGCyTDexrCa1NjokyKzDYba4xOFuvEZ63xhSKmACXUSXwbq
 nzfXr6XaadE7zSVjTA8YfpG6rHekd/Qs6+8bl58=
X-Google-Smtp-Source: ABdhPJyNG0E9yfxpgq4ODqvj3RzQjVvt33pqs13rDkP1KkIAY6Zi0G4ekizos7GDJ0DQVoKkyt6TVXuVSGvlcdZ9Ek0=
X-Received: by 2002:a05:6402:35d4:: with SMTP id
 z20mr650287edc.106.1628829986529; 
 Thu, 12 Aug 2021 21:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210806100144.12444-1-yegorslists@googlemail.com>
 <20210812235350.1dce1d70@windsurf>
In-Reply-To: <20210812235350.1dce1d70@windsurf>
Date: Fri, 13 Aug 2021 06:46:15 +0200
Message-ID: <CAGm1_kt48F8vf-rpK44AC-mSCOSin4Cg2zhCC6dzvqmRVFtgfA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] package/libqmi: bump to version 1.30.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>,
 yegorslists--- via buildroot <buildroot@busybox.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Thu, Aug 12, 2021 at 11:53 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Yegor,
>
> +Fabrice and Adam in Cc.
>
> On Fri,  6 Aug 2021 12:01:44 +0200
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
> It seems like this gobject-introspection issue was not specific to
> libqmi, but was actually affecting a number of other packages as well,
> and Fabrice fixed the issue in the recently committed
> https://git.buildroot.org/buildroot/commit/?id=34da8f96141f14abd98bc4cab3fa05c0b7a0a895.
> Could you check if that indeed fixes the issue with the current version
> of libqmi in Buildroot master?
>
> Indeed, as we're past 2021.08-rc1, we'd prefer not to bump libqmi at
> this point in the master branch.

No problem. This can go into the next branch. The
gobject-introspection patch fixes the issue for libqmi.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
