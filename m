Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF2C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 09:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1138B84915;
	Fri, 22 Jul 2022 09:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1138B84915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ywo97X5ITvmY; Fri, 22 Jul 2022 09:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1937484912;
	Fri, 22 Jul 2022 09:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1937484912
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98881BF852
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 09:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8354B415D2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 09:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8354B415D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgJXcoob4lqX for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 09:25:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77EE740187
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77EE740187
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 09:25:42 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id 125so3809740vsx.7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 02:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGcHvV6jU2Tz2r1/8ma+vbql3KK0i/0+WRJug8p0xa4=;
 b=7zxllmfndr9x96StEsRWwrokTUU1OLKkmTXfkuFU/oQjO5IsRxQAZ0X4WbphUOf+XF
 zik5cwrhMj3C2wJWPuVgha8njs4Su0/GbGtHoZfYcfMsOSI5+zlzC3RInc3fvNpcrOMH
 awLKh0OzrJkn6PYO1MPQkfVhGv9caoSLuEcsRGreiPviB+ZPKAtYf7WOzfJSI89NMsJN
 hXFp0g9NazzNKx3UvgaiSec/6uRsE9QR/TR3FXl7TLAwH2N7Zhd4OUgGPpZG9zebJ/uk
 KJJZBADFwqcaMAkyrEzLSgoVwXkuVnGK9ERRLkofQMvrOzcIxjCCjVoXWKZaWJ0pTKos
 +8DQ==
X-Gm-Message-State: AJIora9LQ0D08wScYHgzJDDa2o5EC4RlQCzuUpSXh1KHd7YVmSc1WnZm
 1IwTJyaSeQLuUAUrqsA4YLr7cBIbi5lg/BktogQ=
X-Google-Smtp-Source: AGRyM1tEWIwVZ9BfQq8j503KcLIugbiXB2Yo2cQHGh4EoO+hdggVOhSyOrAXJ1HZn97Av8ozVwMzZmiO+daqXzouCpQ=
X-Received: by 2002:a05:6102:5345:b0:358:405b:d804 with SMTP id
 bq5-20020a056102534500b00358405bd804mr353345vsb.32.1658481941194; Fri, 22 Jul
 2022 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220721151907.212216-1-nolange79@gmail.com>
 <CADvTj4rXWb=_3kTFCdbmJ2hjNZ_GEGq3O+f-VP=_u6tK5D4o4w@mail.gmail.com>
In-Reply-To: <CADvTj4rXWb=_3kTFCdbmJ2hjNZ_GEGq3O+f-VP=_u6tK5D4o4w@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 22 Jul 2022 11:25:30 +0200
Message-ID: <CADYdroP7heqppp8ye20rv9ovgDG=NmVn8N3zi-Ln1KvU_DEwuQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JGcHvV6jU2Tz2r1/8ma+vbql3KK0i/0+WRJug8p0xa4=;
 b=FkfQD7BUwvFA3V/wH2IJgKD4rhrqRG38dzOSZvIgjgDLz8xvgzXR4EhY5YIdRbnmwR
 ajRgq8RjAaFaeFGs8RLazE5AnuIbkJf6l2Z041zJbSL6uqcn3xTVDOyY+qaJwOdgHU0T
 +h2zhx9P4wzuhac71CF0sM8pCarSif+9+AMWonRqyISkfVbPDAITzh/0AZ3r7+PmVmYq
 G32OFSBJ25xt5fzkNRjj5PKzywz81mk87RhHR2lpB5ZQQ+iQMdQf0dY1JKm2r0przewW
 Xj3p4NcoOQ/opNH6QMaoc36fm2rXdUVsrDVtyyXn6Xdrhp/DkRsSv/gTsViFsbMUOce+
 9+bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FkfQD7BU
Subject: Re: [Buildroot] [PATCH v3 1/3] package/systemd: bump to version
 251.3
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Do., 21. Juli 2022 um 21:32 Uhr schrieb James Hilliard
<james.hilliard1@gmail.com>:
>
> On Thu, Jul 21, 2022 at 9:20 AM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > LICENSES/README.md hash updated, this line got added in
> > regards to files covered by CC0-1.0:
> >
> > >   -config files and examples under /network
> >
> > Add config option for the new sysupdate feature.
> >
> > Remove upstreamed patch.
> >
> > Update options: set new options to their default,
> > remove option not available anymore.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> >
> > ---
> > v1->v2:
> > *   note about changed LICENSES/README.md
> > *   always set default-user-shell to /bin/sh
> > *   always set default-locale to C-UTF-8
> > *   fix typos in commit message
>
> You're missing a few things still, take a look at my patch here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/

Sorry, missed that line before.

>
> Make sure you pick up the following changes from my patch:
>  - dbus config option settings(to prevent dbus from becoming a build
> time dependency)

Ok.

>  - dnssec changes(so that we pull in new dnssec backends properly)

I don't understand those options, but I will bake them into lines ~510 following
"ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)"

>  - kernel headers minimum version bump

The minimum it 3.15 (up from 3.13) according to the README,
4.15 is highly recommended.
Probably better to flash a warning in kconfig for now, would make a
seperate commit.

Expect a v4 shortly.

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
