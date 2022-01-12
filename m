Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6528CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 09:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22D960A92;
	Wed, 12 Jan 2022 09:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLwQQUyUozM0; Wed, 12 Jan 2022 09:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A30F60593;
	Wed, 12 Jan 2022 09:48:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22A8B1BF86D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB7783F16
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2yarj3VCkSa for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 09:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D97D83EE3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 09:48:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w188so2587537oiw.13
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 01:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/Zz5hChAcqL8zFHUt2usitLbKCXM11yj5gntqAZJFY=;
 b=fuHZ2eY6Fgnkp7MCdaUK3EVCdTLmZ5xgtJYR9zsrbkRF5Mpb4F31vUtD2n9sdm35Ya
 VbdJeFHMg5sYrPVIV4OOLdFrEaFscZS+t+lKBl3fjIT0GARCRJJ++cZ7UZwgzo5L7vxB
 SDRhYrZAinlX2oDbyTmLddnc+iTMiRtIi885PJ/GzJwSjkYMgP3lM1yi4E5qJhB++1t1
 FbHC6o5GJvOv2l+bCp5WqtrNOtwDqccc+WgGbEmxPxBGU3rQ+ybv8f7yW5GasJ2MiDts
 dy7wsQk8MZSlWZ10Vmp10wEVMI5SsVFJWrF+y3+kG3m+nRRj8MToosSvgBHy7nEnJvn6
 xAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/Zz5hChAcqL8zFHUt2usitLbKCXM11yj5gntqAZJFY=;
 b=GAfykh8eXYiVf63vV5OWpIXtcJctgHVt7EwhZoOsSEZnhpUBgECGXhcFmRMqg/KL33
 +rDoFuV7RTyIQDdu8NTPr834FITAQ4DRuxGp7Xwu7Bv+yhcpXtsXbY4e2O6BAGUYtLaJ
 Rpwb2FGQsJNwc8MhkoI3Ras8OnbGHisWDga4YNzBwmc5Ii8WK32Q4YQf5LhxHyCI+RA7
 ssSWDnvg5tf/Mh3zRKCEVtYw7XjHbIB2FmFPuiw2RnXKWOx7qI4vPD12vF0A9rSfH2Ru
 uvlfZyWI9138u4JVzaG/RNZOdFFHdskRzmTwDq12qhK3UoqRX17zMnOEv9JbmI04WB6g
 FKXw==
X-Gm-Message-State: AOAM530lz4ILcpnAzpgDGytHBEGbJ2TAyQkMd8krHSRoK0aInpZkM1sd
 BD5RXIwiAm+//zAGFEtxrt5my6KPxKGjD1MWDmk=
X-Google-Smtp-Source: ABdhPJwx0XGPFm9OuzxLtIwhRSrTDXs5SlpZO40QaV3gEJw9DhflnjJQ8H1EWnuhguY45Xe3WymU7Ql8GveWI8FrICw=
X-Received: by 2002:a05:6808:f8d:: with SMTP id
 o13mr3517448oiw.67.1641980923150; 
 Wed, 12 Jan 2022 01:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20220110211323.1828141-1-james.hilliard1@gmail.com>
 <20220112091058.76318df8@windsurf>
In-Reply-To: <20220112091058.76318df8@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Jan 2022 02:48:32 -0700
Message-ID: <CADvTj4r1U0hd=dy-bQBpXaiz9+mt_W6Wr7+kA+7ybi2uWLR=aw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 12, 2022 at 1:11 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Mon, 10 Jan 2022 14:13:23 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/meson/meson.hash | 4 ++--
> >  package/meson/meson.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> I am wondering if this update hasn't broken some meson packages:
>
>  * polkit
>    http://autobuild.buildroot.net/results/b2d/b2d2b27844b32b3609e11005966d85dc0dfb7a9f/build-end.log
>
>    ../output-1/build/polkit-0.120/actions/meson.build:3:5: ERROR: Function does not take positional arguments.

Yeah, this should fix that bug:
https://patchwork.ozlabs.org/project/buildroot/patch/20220112094731.2117910-1-james.hilliard1@gmail.com/

>
>  * host-gobject-introspection
>    http://autobuild.buildroot.net/results/95e/95e4a23c16f6bd96566dc497663f38a0858c5a6e/build-end.log
>
>    ../output-1/build/host-gobject-introspection-1.68.0/giscanner/meson.build:51:0: ERROR: File doctemplates does not exist.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
