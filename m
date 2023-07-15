Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F66AC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 18:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCEAE40946;
	Sat, 15 Jul 2023 18:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEAE40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRarhH6uR3VY; Sat, 15 Jul 2023 18:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4F14094A;
	Sat, 15 Jul 2023 18:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4F14094A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1C51BF3F7
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55A594013F
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 18:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A594013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sssuM02OvVDy for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 18:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD21400E5
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BD21400E5
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 18:35:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so4946399e87.3
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 11:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689446152; x=1692038152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o2FMBPc2xm058vos6lw59eJ0cpZP+OamtxnaLeUeOtE=;
 b=BFxGL/cA0yDx3i4kNxrNitnhMoOnYkyJldL6fFn4uUZI74Qgkig6KR/P3Lrje9GcH/
 ctTjT9Hx5PBWvJc+zE4OHvxOOELybt2rr5zON3yTUOx4bnNYObTRpvBnRyd/RvvTx0Nd
 orXHnf1mQDo62BCjzUnSKbeF8Bz3cjcR6rEvmJPapRl1ZoortMQWZOwe8cDRgcgfReT/
 HbrIk/AUI0vjFk7NeLP6uYTD1xuzpE+xgt4Fs6C6IP9gJZ0KDAS7MPmMB8tuKIPHjmxa
 sxOo1mzMnGP17MOXqo3QwwurPLJdFc0pEM9em3osfwY0fuNQK4FZUZxTM0TMSx4GA8vs
 txkw==
X-Gm-Message-State: ABy/qLbS+JlgxyljOc6D0zlLtSAU+STzeEx27avuZ/TiJJYzJwDmPtkO
 MQBHTdDn33lxhpPNPvMxmp+EGSx4fEBKA1+AMz8=
X-Google-Smtp-Source: APBJJlHBWNbiTT/DPaLBGEV1WtiAQYUsS66yqpeHDV9vhHdv/Gtr3dNE/tNrhJwvlcV+LXisGdoQg3E6PWZBb14/DZ4=
X-Received: by 2002:a05:6512:3e2:b0:4fb:8c27:4def with SMTP id
 n2-20020a05651203e200b004fb8c274defmr5089742lfq.8.1689446151754; Sat, 15 Jul
 2023 11:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <877cr1f8il.fsf@48ers.dk>
In-Reply-To: <877cr1f8il.fsf@48ers.dk>
From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 15 Jul 2023 11:35:40 -0700
Message-ID: <CAFSsvmrKm3QVhiZYJRe-UBmX5TEkdrCKdHy+xJ242ng=wdQctw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689446152; x=1692038152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o2FMBPc2xm058vos6lw59eJ0cpZP+OamtxnaLeUeOtE=;
 b=fsDRQtIpYeIgr/YUFwEhl7sX9s1YnEmQ0mmBy4niitrNbG+t6w1goqzuN1QmNxKRyS
 7QpfMj7U93HFx4IlSfAaoyB0ArvdgOTyOuo+PQ0qg+ygHNOlJh0J+Je6lBpUBxjY1EoJ
 0vdkkRW1l9Vl+oI4jRyAym7VwXBrJBkTkIoDHvVX9FqKqY7+yUldvsUYCOS9L6zPi4Ui
 uIJv0Xy4B2amPp0j3c6jYEPseT0A8tsEo9cXssCBaHO2mdBbcEfi8Sgrm1tL9MDiW8ii
 4yr1/gVjGUNpVXjDAMDeUjmVtZkdgxU2htjnjjuB1oqy0SVDJN+nG67ns2GjfUiQH8CL
 19wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fsDRQtIp
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5650947855964220512=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5650947855964220512==
Content-Type: multipart/alternative; boundary="000000000000be1a3006008ad587"

--000000000000be1a3006008ad587
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Peter!

One thought I had that I didn=E2=80=99t bring up in the first email: Anothe=
r
possible solution is to create and upload a tarball to the buildroot
sources server, but each tarball is around 2.1GiB in size!

I have been using meta-flutter to port the package to Buildroot, but
haven=E2=80=99t quite got it to compile yet!

Adam
On Sat, Jul 15, 2023 at 9:24 AM Peter Korsgaard <peter@korsgaard.com> wrote=
:

> >>>>> "Adam" =3D=3D Adam Duskett <aduskett@gmail.com> writes:
>
>  > Hello! I have a task to port Flutter to Buildroot and to make the
> packages
>  > suitable for the master branch.
>
> [snip lots of details]
>
> Gaah, sounds like a big mess :/ Oh well, I guess that is life. Good luck
> with it ;)
>
> I take it that you have already looked at
> https://github.com/sony/flutter-embedded-linux and the meta-flutter
> layer? From a quick look it seems to largely do the same (but skip the
> reproducible tarball).
>
> I take it that you have already played around with Flutter? How useful
> (features, but also size and build time) is it in the context of
> Buildroot?
>
> --
> Bye, Peter Korsgaard
>

--000000000000be1a3006008ad587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Peter!</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">One thought I had that I didn=E2=80=99t bring up in the first email: A=
nother possible solution is to create and upload a tarball to the buildroot=
 sources server, but each tarball is around 2.1GiB in size!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have been using meta-flutter to por=
t the package to Buildroot, but haven=E2=80=99t quite got it to compile yet=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Adam</div><div dir=3D"=
auto"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Jul 15, 2023 at 9:24 AM Peter Korsgaard &lt;<a href=3D"mailto:peter@kor=
sgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
&gt;&gt;&gt;&gt;&gt; &quot;Adam&quot; =3D=3D Adam Duskett &lt;<a href=3D"ma=
ilto:aduskett@gmail.com" target=3D"_blank">aduskett@gmail.com</a>&gt; write=
s:<br>
<br>
=C2=A0&gt; Hello! I have a task to port Flutter to Buildroot and to make th=
e packages<br>
=C2=A0&gt; suitable for the master branch.<br>
<br>
[snip lots of details]<br>
<br>
Gaah, sounds like a big mess :/ Oh well, I guess that is life. Good luck<br=
>
with it ;)<br>
<br>
I take it that you have already looked at<br>
<a href=3D"https://github.com/sony/flutter-embedded-linux" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/sony/flutter-embedded-linux</a> and=
 the meta-flutter<br>
layer? From a quick look it seems to largely do the same (but skip the<br>
reproducible tarball).<br>
<br>
I take it that you have already played around with Flutter? How useful<br>
(features, but also size and build time) is it in the context of<br>
Buildroot?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--000000000000be1a3006008ad587--

--===============5650947855964220512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5650947855964220512==--
