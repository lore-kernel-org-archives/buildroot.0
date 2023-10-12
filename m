Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E94ACDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 07:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BCC8228E;
	Thu, 12 Oct 2023 07:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80BCC8228E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3_dypB3gOs3; Thu, 12 Oct 2023 07:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B089D82289;
	Thu, 12 Oct 2023 07:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B089D82289
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C30FF1BF95C
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 07:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A85C41909
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 07:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A85C41909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4L-fE_Hcft0 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 07:53:24 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79659418B6
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 07:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79659418B6
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-418201cb9e9so4306161cf.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 00:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097203; x=1697702003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nl6xsVyb+gwHMB/1VFO0vORlrwIbVwpET2qBZrmUE2k=;
 b=djTVPmByEmxl/u3o2d9pb+5SouCJHj/GE4qiMWz9g8Qplra6N0Qw98dfOk6IdOdqp0
 yiMjC9HTspvMlvjpw5/3JfINOSyXG6xQgF5gwHTTDInfZZj13zI8YVh/p+FInpS82JJj
 i3O3OblyfVw5IJ59iw17jo+0qOLm73DcK2hZToaBZwqjdppDGZaYRyJVCmAOCCD3G2dL
 2NRtK7CCDuJJ03yeQeM3tWokPRnc92SzEEsn7SP/SP3+t2dGSi/cnDYCarSfqls5x1iJ
 SshGwK2e6UL/a7QFm+JQOYUtehZHyDCOhloChf5xJk+B+87vDH0Moj+J6H+4ZcVsaVtE
 nFUA==
X-Gm-Message-State: AOJu0YzeTiNn24C/Mx9/R2e8MhdZ0L7L7A3OTAc730gXEpYJDfK5aC+h
 tgHvSoPjGiHJUp5UG9C25c1TWCNPZ0kVpkbipeY=
X-Google-Smtp-Source: AGHT+IG+4Eqwbcn+KPPKG7P3vy4r6eveY6smmJb4M0V2prK7iujsuSYk2o9jV6dFskglYSbppQryk5fcsWWdBRI0UJU=
X-Received: by 2002:ac8:59ce:0:b0:417:b901:98ff with SMTP id
 f14-20020ac859ce000000b00417b90198ffmr29028307qtf.54.1697097203144; Thu, 12
 Oct 2023 00:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230115125253.280257-1-nolange79@gmail.com>
 <20230115125253.280257-4-nolange79@gmail.com>
 <42d44a84-66e8-65f5-8e06-92f95b381291@mind.be>
In-Reply-To: <42d44a84-66e8-65f5-8e06-92f95b381291@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 12 Oct 2023 09:53:12 +0200
Message-ID: <CADYdroNrwWX59uF11nXN=81GAM0nKWd=E1LQqY1ZMuBkkyWjLw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697097203; x=1697702003; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nl6xsVyb+gwHMB/1VFO0vORlrwIbVwpET2qBZrmUE2k=;
 b=HRPwOnGbrGeUOXKaPC4DlOXOne7E49SGXYPjCtL80ygh6uNrY/6DhwnWc/2ok14D9o
 zuW1zCes3UP21bO+iaEsowq8xtZHQA0MiSlUPNf+FQs8H/2JOUtrNMec8ilNDVkDLpvA
 1+FxxmAsduxmW0XAv4nlEt3yfmC1jbcqvi8zahMQpHC6aJKaxI4fai2oW4/Yl4ShZCzr
 dtItON8VTe0RnHiJ/CqfrYNCARB1Xx3vn8qCRkXmAhK2M66JHwmdhxhNlzqbWYv4JPNC
 09Xm4MUHoq5VZkISYSTBY1YWvzWk6cuR90Qy1Ymz4e5rBbXu1Q3ADhJSZUiPxKzMgOV0
 10Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HRPwOnGb
Subject: Re: [Buildroot] [PATCH 3/7] package/skeleton-init-systemd: force
 permissions for buildroot runtime dirs
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Di., 10. Okt. 2023 um 21:32 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>   Hi Norbert,
>
>   Obviously, this doesn't apply any more because I committed a different tree.
> However...
>
> On 15/01/2023 13:52, Norbert Lange wrote:
> > A previous commit introduced /run/.br and /tmp/.br and a few
> > subdirectories.
> > Add a tmpfile to ensure the existance, ownership and permissions.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >   package/skeleton-init-systemd/00-buildroot.conf        | 7 +++++++
> >   package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
> >   2 files changed, 8 insertions(+)
> >   create mode 100644 package/skeleton-init-systemd/00-buildroot.conf
> >
> > diff --git a/package/skeleton-init-systemd/00-buildroot.conf b/package/skeleton-init-systemd/00-buildroot.conf
> > new file mode 100644
> > index 0000000000..a4c7bf0576
> > --- /dev/null
> > +++ b/package/skeleton-init-systemd/00-buildroot.conf
> > @@ -0,0 +1,7 @@
> > +# Create buildroot API directories and fix permissions
> > +
> > +d /run/.br 0755 root root -
> > +d /tmp/.br 0755 root root -
>
>   I don't think this tmp directory is used anywhere?

Not yet, these would reserve the paths. One usage would
be to use /tmp/.br as base for overlay "upper" dirs, reusing
the /tmp filesystem instead of mounting an extra tmpfs.
Using /run for anything else but small files is a bad idea,
as I mentioned in response to the commit
"package/skeleton-init-systemd: add option to use overlayfs on /var".

>
> > +z /run/.br/bnd 0700 root root -
> > +z /run/.br/ovl 0700 root root -
>
>   What's the point of doing this? These directories are created by the overlay
> service file. systemd-tmpfiles is started after local-fs.target and the /var
> overlay mount comes before, so it's the overlay service file that has to create
> them. You could say "hey maybe there's some other service that makes use of
> those directories" - but if so, that's another service that is going to come
> before local-fs.target, so it _also_ has to create those directories itself...

Not all overlays/services have to be enabled, you generally should use
tmpfiles.d
to ensure owner/mode of some sort of protected files.
Prevents hijacking.

Think of mounting an overlay on-demand, running an system update,
testing said update then "commiting" the (merged) overlay to a blockdevice.
if anything breaks, you reboot and you are running the unmodified working
system.

>
>   There's a bit of a problem with systemd-tmpfiles, that it doesn't allow to
> specify dependencies/ordering. That's in fact one of the reasons the factory
> approach doesn't work so well. systemd-tmpfiles only works for services after
> sysinit.target, really - and therefore doesn't work for anything related to
> local filesystems.
>
>   IMHO it would have been better to put tmpfile blocks in service definitions.
> But that's not the world we live in :-)

That's not what they are for. tmpfiles.d should set up the filesystem whether
services are enabled or not. Erases a whole set of problems.

>
>   So, I've marked as Rejected, but feel free to argue my points.

The argument would be to create & protect paths buildroot services could be
using.

>
>   Regards,
>   Arnout
>

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
