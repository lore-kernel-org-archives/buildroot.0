Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B65C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 18:11:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC7463480
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 18:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BC7463480
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D3F80D20;
	Mon, 15 Nov 2021 18:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ6HOEZJxIzf; Mon, 15 Nov 2021 18:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F6E280D11;
	Mon, 15 Nov 2021 18:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0A931BF475
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 18:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB83B40106
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 18:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoJPBLGiuNcg for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 18:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A92340223
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 18:11:10 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 1so37432544ljv.2
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJxotIZvyhTUXf6nDAzgXQZMWPMJyhdBdKuhKqKdJP8=;
 b=JCJenGL0FQAVhp1Q4UD6yltDwO0C27hpXvuAqACBlUQ/sIAjrOFrdj2YNMnjRe0t/3
 F8IcWlxCYTgIDbS6axppnyP8BAEXNCXSqOpG5f5zZFyDHEQ6QE4rJ7YEW9U3BRQCnJHz
 gWAxPX8ZvgNiyYBE8eyFpCDuGfWQsyD0ee2Sy/1KLYN/i+1E17sdJ7GpHYBHwR5rrXio
 hZ/K6I2XbWxkmVvZjL6J0jAKOsRYJZpCNCJYdCdeNijQRU+ucU8oMK5s9UwkMOXzvD6u
 zXaNF3ua/K8PcQ0JLd0SRaxu1Bp+UGnNioLgIw+MNpfW2hEUsglCGJT2Omi85cGZ5XHx
 e30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJxotIZvyhTUXf6nDAzgXQZMWPMJyhdBdKuhKqKdJP8=;
 b=OY+Phw7b/oDXCoEgUGJvQv4W5bZgx5/esugYp402U1yvvH1ZZ0+7m4uMtqRpPojtCH
 zSyAuC2KyQF+kh1c31TIZ/Z0ez0fnc4ADAnjLWnov3ROm1Q6uBTHG9FJoymVUp4B/mXp
 iZql08gPFD3znBhKx3Vt2B61O7eqPTgUybXaRaa/UZlP95zl533P1qr0uq9o5opVCDlt
 XiuuIm3FcKcufC4d9E5XdEX8B8NFnNNNPSkDyDHtVcmBsX7MJYqauBGOTku4RhYr+nBj
 9ebCMOP///xTM37W+LvsTFcmIVN9PdauAqI9y/yOIhKWor9PEsEp6fK67qqiIxO6Ti/z
 fQFw==
X-Gm-Message-State: AOAM530fG3gMlJe584GF0QruT6X208E8BgpR/HpN21dm32Ys0Q5dPZ9q
 xjuT21Og3W0ALqjZ/bdzva8kQWjvaXMumzvTV+EQkjO8
X-Google-Smtp-Source: ABdhPJy9DllEqmJEMnpldcMLTWmvqbcxqBKsc9oD2A9Leb8DiqmuaS7TwDmc0OzIxN/cp/VdPFcDE0qacDj27kDiTo0=
X-Received: by 2002:a2e:1510:: with SMTP id s16mr450771ljd.501.1636999868128; 
 Mon, 15 Nov 2021 10:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115134205.4176891-1-troglobit@gmail.com>
 <20211115161851.0897fb8b@gmx.net>
In-Reply-To: <20211115161851.0897fb8b@gmx.net>
From: Joachim Nilsson <troglobit@gmail.com>
Date: Mon, 15 Nov 2021 19:10:57 +0100
Message-ID: <CANP3Sck2vX1GV=T9+AUXLaQxE5bzMjoYp8pwSxh-oc4gx_qioQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to
 v5.15.0
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
Content-Type: multipart/mixed; boundary="===============8024383527378912054=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8024383527378912054==
Content-Type: multipart/alternative; boundary="000000000000a3235a05d0d7bbac"

--000000000000a3235a05d0d7bbac
Content-Type: text/plain; charset="UTF-8"

Ouch, sorry for the dupe!

How does next vs master work?

Regards
 /Joachim

On Mon, 15 Nov 2021 at 16:18, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Joachim,
>
>
> On Mon, 15 Nov 2021 14:42:05 +0100, Joachim Wiberg <troglobit@gmail.com>
> wrote:
>
> > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> > ---
> >  package/iproute2/iproute2.hash | 2 +-
> >  package/iproute2/iproute2.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/iproute2/iproute2.hash
> b/package/iproute2/iproute2.hash
> > index 2837edb09d..d8d619cbda 100644
> > --- a/package/iproute2/iproute2.hash
> > +++ b/package/iproute2/iproute2.hash
> > @@ -1,3 +1,3 @@
> >  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> > -sha256
> 210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4
> iproute2-5.14.0.tar.xz
> > +sha256
> 38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff
> iproute2-5.15.0.tar.xz
> >  sha256
> e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> > diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> > index fdf442a429..4162e38eb7 100644
> > --- a/package/iproute2/iproute2.mk
> > +++ b/package/iproute2/iproute2.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> ################################################################################
> >
> > -IPROUTE2_VERSION = 5.14.0
> > +IPROUTE2_VERSION = 5.15.0
> >  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
> >  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
> >  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
>
>
> Sorry, its a duplicate...., iproute2 version bump already suggested and
> applied to the next branch, see:
>
>
> https://git.buildroot.net/buildroot/commit/?h=next&id=bd06a3b9b507b14f3cf69f45ed165d132790ad75
>
> Regards,
> Peter
>

--000000000000a3235a05d0d7bbac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ouch, sorry for the dupe!</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">How does next vs master work?=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">=C2=A0/Joach=
im</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 15 Nov 2021 at 16:18, Peter Seiderer &lt;<a href=3D"mailto:p=
s.report@gmx.net">ps.report@gmx.net</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
">Hello Joachim,<br>
<br>
<br>
On Mon, 15 Nov 2021 14:42:05 +0100, Joachim Wiberg &lt;<a href=3D"mailto:tr=
oglobit@gmail.com" target=3D"_blank">troglobit@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Joachim Wiberg &lt;<a href=3D"mailto:troglobit@gmail.co=
m" target=3D"_blank">troglobit@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/iproute2/iproute2.hash | 2 +-<br>
&gt;=C2=A0 package/iproute2/<a href=3D"http://iproute2.mk" rel=3D"noreferre=
r" target=3D"_blank">iproute2.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute=
2.hash<br>
&gt; index 2837edb09d..d8d619cbda 100644<br>
&gt; --- a/package/iproute2/iproute2.hash<br>
&gt; +++ b/package/iproute2/iproute2.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # From <a href=3D"https://kernel.org/pub/linux/utils/net/iproute=
2/sha256sums.asc" rel=3D"noreferrer" target=3D"_blank">https://kernel.org/p=
ub/linux/utils/net/iproute2/sha256sums.asc</a><br>
&gt; -sha256=C2=A0 210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383=
bb7591d4=C2=A0 iproute2-5.14.0.tar.xz<br>
&gt; +sha256=C2=A0 38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b=
35b291ff=C2=A0 iproute2-5.15.0.tar.xz<br>
&gt;=C2=A0 sha256=C2=A0 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de1=
02ab66b722cb4=C2=A0 COPYING<br>
&gt; diff --git a/package/iproute2/<a href=3D"http://iproute2.mk" rel=3D"no=
referrer" target=3D"_blank">iproute2.mk</a> b/package/iproute2/<a href=3D"h=
ttp://iproute2.mk" rel=3D"noreferrer" target=3D"_blank">iproute2.mk</a><br>
&gt; index fdf442a429..4162e38eb7 100644<br>
&gt; --- a/package/iproute2/<a href=3D"http://iproute2.mk" rel=3D"noreferre=
r" target=3D"_blank">iproute2.mk</a><br>
&gt; +++ b/package/iproute2/<a href=3D"http://iproute2.mk" rel=3D"noreferre=
r" target=3D"_blank">iproute2.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;<br>
&gt; -IPROUTE2_VERSION =3D 5.14.0<br>
&gt; +IPROUTE2_VERSION =3D 5.15.0<br>
&gt;=C2=A0 IPROUTE2_SOURCE =3D iproute2-$(IPROUTE2_VERSION).tar.xz<br>
&gt;=C2=A0 IPROUTE2_SITE =3D $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2<=
br>
&gt;=C2=A0 IPROUTE2_DEPENDENCIES =3D host-bison host-flex host-pkgconf \<br=
>
<br>
<br>
Sorry, its a duplicate...., iproute2 version bump already suggested and<br>
applied to the next branch, see:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://git.buildroot.net/buildroot/=
commit/?h=3Dnext&amp;id=3Dbd06a3b9b507b14f3cf69f45ed165d132790ad75" rel=3D"=
noreferrer" target=3D"_blank">https://git.buildroot.net/buildroot/commit/?h=
=3Dnext&amp;id=3Dbd06a3b9b507b14f3cf69f45ed165d132790ad75</a><br>
<br>
Regards,<br>
Peter<br>
</blockquote></div></div>

--000000000000a3235a05d0d7bbac--

--===============8024383527378912054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8024383527378912054==--
