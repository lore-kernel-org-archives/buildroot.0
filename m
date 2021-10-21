Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04A8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 00:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0AA611C7
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 00:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A0AA611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B718082404;
	Thu, 21 Oct 2021 00:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68qaL2m4DeSg; Thu, 21 Oct 2021 00:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CEA80EF9;
	Thu, 21 Oct 2021 00:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 155EF1BF947
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 00:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00726605FC
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 00:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xD1oeaUKk80o for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 00:09:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1013605D6
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 00:08:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j21so1168066lfe.0
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+6UmgvfjCWy3v9unkrfpfCtyxrDcBM3/DYfT6XRUsk=;
 b=PsAvJp2DcFftUfJKm6pbyR4KExfxq6veAIoBq9ndZCnId4b6Ewr+3N3sjkWp9X84cm
 U6bmG0jEsGbz19j5WxaHLKxQ8JkDPISugHIG2lfKXiZV5VanbubU9usfm0fd0pu5lf0t
 L0RITud7Wm7L1hUbpMo+sos6w98+WHosq+ohlKjzvnsDFHyOpj/P2fOnv0/wuZhbRaHa
 vSA2OJD94tLdTWjvm87cQC2MnqmLf26oWWPF6refXlishhQhVolpCtgUmAgLCvoFnJMz
 5xyWc8TXZlq0Wl3jKJ+mPL/zNa2Ccm4wN+g8fB+bq27WJlQWJViX38O6h0/uzCNcQpTk
 VwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+6UmgvfjCWy3v9unkrfpfCtyxrDcBM3/DYfT6XRUsk=;
 b=xF4YLr6mYyxn2Qw/gUm71iuoTso2GEZF58WHhSfSkxE2ILqqvlXYgFD7aO4PVt5RNH
 IYXEdcSIvsndmqIeu9e8bLe1rPwZlT+910aVIc2PjbD1LWU5FTEw2XFIdtuyofktSbnO
 tw87q9LMvLAPaI/Dp9ZWCe82b0xujoGchlQMg/6PD5x4CsX7wqASPZFEEmScYUotedr9
 rUBLXsdyIXFphshSG/HwTaKIc0h0rZ4PTbbZsrS+xEz8pgVDJjEatU2W7NElZMRSyCTR
 I0qY8cu+Vy3QG8/bVEXm092pIUiivlxl57NEx6bBKDcSoHeUbr3rx7Jub+9lYc0qDgwQ
 OXvA==
X-Gm-Message-State: AOAM5305T2syDx2tBw92+azujmI8iNLVwOn0li0GCBapUR8qS02MH/pq
 kujitE5808qwlK6Rxbl3QXk22mMtpRTYzbduPC4=
X-Google-Smtp-Source: ABdhPJzaA52mHcXQI7gEbqpKRpY/hkdsTjbzvPYd5KEKmk/tPslSWNuXOyEGWJW9943XXd7gG5PRJeqhx6ADEkgKF4w=
X-Received: by 2002:a05:6512:3393:: with SMTP id
 h19mr2264132lfg.363.1634774937629; 
 Wed, 20 Oct 2021 17:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211011210241.396390-1-glex.spb@gmail.com>
 <20211011212125.402086-1-glex.spb@gmail.com>
 <20211011212125.402086-3-glex.spb@gmail.com>
 <20211017113717.3f642315@windsurf>
 <CADjhFRBrddV3BCrC7FOEaBjzzvpWDshvO3SCA8Cq1uXby4at1Q@mail.gmail.com>
 <20211020223457.29d301e3@windsurf>
In-Reply-To: <20211020223457.29d301e3@windsurf>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Wed, 20 Oct 2021 19:08:45 -0500
Message-ID: <CADjhFRDiRxSp1=6i-5yffDYrfm5mnJ=z9k08TGnsjmtHmcQ8=Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v4 2/2] package: add smpq
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1046380243436304299=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1046380243436304299==
Content-Type: multipart/alternative; boundary="00000000000071fae905ced1b342"

--00000000000071fae905ced1b342
Content-Type: text/plain; charset="UTF-8"

I can certainly submit devilutionx to buildroot if you want me to!

On Wed, 20 Oct 2021 at 15:34, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Gleb,
>
> On Sun, 17 Oct 2021 09:05:34 -0500
> Gleb Mazovetskiy <glex.spb@gmail.com> wrote:
>
> > The use case for me is to build DevilutionX (Diablo 1 source port) in a
> > gaming-oriented buildroot-based distro (batocera.linux).
> >
> > DevilutionX produces an MPQ archive during the build process using smpq,
> so
> > smpq needs to be a host package.
>
> OK. But are you going to submit DevilutionX as a Buildroot package? My
> only concern is that just by itself, smpg is not very useful. So having
> that in Buildroot without having any of the packages that use it and
> that provide some "useful" functionality is not very interesting from a
> Buildroot maintenance point of view.
>
> > I'm not near a computer for the next few days so I'd appreciate if you
> > could adjust the commit message and DEVELOPERS when merging.
>
> No worries about the timing, we're not in a hurry. There might be other
> aspects in your patches to review, but I'd like first to understand
> whether we want these packages in Buildroot in the first place.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000071fae905ced1b342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I can certainly submit devilutionx to buildroot if you wa=
nt me to!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 20 Oct 2021 at 15:34, Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">Hello Gleb,<br>
<br>
On Sun, 17 Oct 2021 09:05:34 -0500<br>
Gleb Mazovetskiy &lt;<a href=3D"mailto:glex.spb@gmail.com" target=3D"_blank=
">glex.spb@gmail.com</a>&gt; wrote:<br>
<br>
&gt; The use case for me is to build DevilutionX (Diablo 1 source port) in =
a<br>
&gt; gaming-oriented buildroot-based distro (batocera.linux).<br>
&gt; <br>
&gt; DevilutionX produces an MPQ archive during the build process using smp=
q, so<br>
&gt; smpq needs to be a host package.<br>
<br>
OK. But are you going to submit DevilutionX as a Buildroot package? My<br>
only concern is that just by itself, smpg is not very useful. So having<br>
that in Buildroot without having any of the packages that use it and<br>
that provide some &quot;useful&quot; functionality is not very interesting =
from a<br>
Buildroot maintenance point of view.<br>
<br>
&gt; I&#39;m not near a computer for the next few days so I&#39;d appreciat=
e if you<br>
&gt; could adjust the commit message and DEVELOPERS when merging.<br>
<br>
No worries about the timing, we&#39;re not in a hurry. There might be other=
<br>
aspects in your patches to review, but I&#39;d like first to understand<br>
whether we want these packages in Buildroot in the first place.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000071fae905ced1b342--

--===============1046380243436304299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1046380243436304299==--
