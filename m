Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EC7C636CC
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577B040937;
	Thu,  9 Feb 2023 03:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 577B040937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1S1ztmRcvA3; Thu,  9 Feb 2023 03:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5BD408F1;
	Thu,  9 Feb 2023 03:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5BD408F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 246251BF3C5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F018A61190
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F018A61190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPeJrUTz7eoS for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:30:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9828761183
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9828761183
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:30:51 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id 23so851971ybf.10
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0eqfBHYavYXFGbHEKRtU6ntEhxGwd3/0BWDFzQBahy0=;
 b=mSx5bfbEGCVM1XltP2ustgwsMkLDkO9QCtCq7CO4fPkk793xebJJld1aT2RW0UsieP
 dVlJwWBX1RES83L+u7mRW2I+e/CFv06dNf3JLgYaMM9m9D8Wj6ETy1sFS/lc2yQ+MeBg
 Z3kzvxXyWl5RRMLZlAlNyWuxZCs+3QMuHy2Vjwmh2N21g7fx+5BA14mz/u1jHl1ZirRX
 kLzhFOFdEXBZ2xxUb26S0ZZmRZBAggE4u4lXnFtRn7INOIcvYt5M+hVJKEI8emHM9ovt
 L0TUM6Diix+9XEXlCuEdjGXcKAKsrUMMYdMtGym1Acf8dL0jP3bq8GI1aHzXz4bgAdKc
 lwjg==
X-Gm-Message-State: AO0yUKWVH/VL8hkiJvdV5No7VcouZqxUfbTBYjAx41ScbCMlf0jhI4Mu
 X3i0VJ2blG7+BA8PBWGGkzL+ZzvlJUmIqcDnV2I=
X-Google-Smtp-Source: AK7set9tzhhn9CtFyn3KEINhlx0DwVxQTCppLgAi5lemWI0Xv6lsXFJ29EbMLkrSoo662QIo8cwBXyNAdo1dLZv6ruE=
X-Received: by 2002:a5b:748:0:b0:8b9:333b:479d with SMTP id
 s8-20020a5b0748000000b008b9333b479dmr655556ybq.643.1675913450332; Wed, 08 Feb
 2023 19:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20221127002135.12134-1-peter.macleod.thompson@gmail.com>
 <20230208165756.5d8dd14f@windsurf>
In-Reply-To: <20230208165756.5d8dd14f@windsurf>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Wed, 8 Feb 2023 20:30:38 -0700
Message-ID: <CAGrGpJAnJh_gimfgG31PJBeXy-r8oZnpGe=nWUPTokw1j+TBiQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0eqfBHYavYXFGbHEKRtU6ntEhxGwd3/0BWDFzQBahy0=;
 b=V5hp2OoqbVl4jpA2hYYNYsqgy0t7tXcG05wgDypeeuifKXKZVTmHhaYR73WiR8fsdc
 prC1Hdpk4r5sgaPsnxlLDTT+RckdfnzTlnuDx6SPmGKhQ5uHHSW2unL7oyLSQb0jnQRp
 8XXQ5Ef6VbY5rqDYseKGVc7C0FutT5JOvNDXx7YP9rCwbqPUaMmbiDC4sQcZ3Vwh+z9Z
 yh3P6m1NvR4b7vyR9KwEoa/b7T05ETdX7zfvOQ6UNBMX5P2T7atWVrD17qoLbt7r/LAH
 CrunY+eUHhei67FrMm20Ou6OtzPMcOwGllOdYxN1Cprvt+dDc+guCAQBK3viR7ol8QVu
 DfWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V5hp2Ooq
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.1
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
Content-Type: multipart/mixed; boundary="===============4836889521488410546=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4836889521488410546==
Content-Type: multipart/alternative; boundary="000000000000e1a87705f43c0136"

--000000000000e1a87705f43c0136
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,
Apologies.  I had thought there was a problem with the LICENSE_FILES in my
update.  Hence my subsequent change.    Glad everything is now ok.

Peter

On Wed, Feb 8, 2023 at 8:57 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Peter
>
> On Sat, 26 Nov 2022 17:21:35 -0700
> Peter Thompson <peter.macleod.thompson@gmail.com> wrote:
>
> > LICENSE_FILES changed to LICENSE.txt for version 2.20.1.
> > Previous versions used COPYING.txt.
> >
> > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> > ---
> >  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
> >  package/sdl2_ttf/sdl2_ttf.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Sorry for the long delay, but you had already sent this patch on
> November 19, 2022 and it was applied on November 21, 2022, so it was
> too late for a new version.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000e1a87705f43c0136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div>Apologies.=C2=A0 I had thought t=
here was a problem with the LICENSE_FILES in my update.=C2=A0 Hence my subs=
equent change.=C2=A0=C2=A0=C2=A0 Glad everything is now ok. <br></div><div>=
<br></div><div>Peter<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 8:57 AM Thomas Petazzo=
ni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boo=
tlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello Peter<br>
<br>
On Sat, 26 Nov 2022 17:21:35 -0700<br>
Peter Thompson &lt;<a href=3D"mailto:peter.macleod.thompson@gmail.com" targ=
et=3D"_blank">peter.macleod.thompson@gmail.com</a>&gt; wrote:<br>
<br>
&gt; LICENSE_FILES changed to LICENSE.txt for version 2.20.1.<br>
&gt; Previous versions used COPYING.txt.<br>
&gt; <br>
&gt; Signed-off-by: Peter Thompson &lt;<a href=3D"mailto:peter.macleod.thom=
pson@gmail.com" target=3D"_blank">peter.macleod.thompson@gmail.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--<br>
&gt;=C2=A0 package/sdl2_ttf/<a href=3D"http://sdl2_ttf.mk" rel=3D"noreferre=
r" target=3D"_blank">sdl2_ttf.mk</a>=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
Sorry for the long delay, but you had already sent this patch on<br>
November 19, 2022 and it was applied on November 21, 2022, so it was<br>
too late for a new version.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000e1a87705f43c0136--

--===============4836889521488410546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4836889521488410546==--
