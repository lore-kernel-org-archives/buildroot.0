Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A92C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 04:27:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC8B6120D
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 04:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CC8B6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C00400DD;
	Sun, 22 Aug 2021 04:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQCHwMwxHfzD; Sun, 22 Aug 2021 04:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A7F440120;
	Sun, 22 Aug 2021 04:27:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70D731BF573
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 04:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A90440309
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 04:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYKI4hV6nPmJ for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 04:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0BD540252
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 04:27:23 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id 67so6169870uaq.4
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 21:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IfxEOTKpQu0dSX+1AF/Yvib04qgguFmIcynP1IlMHdU=;
 b=PHbqKMsXAWs400iq6t358EouTxhJkN+7dsQtSU6qOTd/mwws91/vhZjBrhzdemnq9H
 vE5udqIrosWCrUDJxoaVgXJfw1KSe0/fC/sHxPMLEERut94FuNySHTuewZX/lSHk6Obr
 Y12FQKAYG9Zr0CMPc1a6XgZ6v6yilz5oWoEmgNQ1M6N1rN69PIuVKnLgIMzAkN56N31l
 GxJ8FzW4bBZLqrgywBZJ+c1YEtkW2zyv/er9S/+oW9g5Gk22FrRER0AkAoRZehHsWwOx
 T4SMFt3cEeQRGijfOzvprfd/Zq6d09vqKmM6sX7WVw/0XKE4pe3hwQfgbwxpflavS8xp
 H2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfxEOTKpQu0dSX+1AF/Yvib04qgguFmIcynP1IlMHdU=;
 b=QPmRbIT++GumLoXYFxdbXzXhSoxr7yp8pL5oLj2vxjK8D9j3206wptgMSmgHhgexZM
 ZGSyRwqe3Nw+NFDVuDJcV97vfdm8pkRObWKa2UWOGyrJJeH49hhJek2rNq/vfy1555e0
 98upWUtck0AoiAE/B5udimjnEozf7uS0X/j2ShTuxrz+RbJT7jtkFINZQKrRPBEiAN9S
 vTDJwxEugTr4/0NHo9TUk4/Dp1k/3iuvNbG+CVGc0SNCP5/WzRPATGzyBx2JKJRx29Ub
 EVIl2J9ny3H22DpK4i+TZLolxM3KypFgYC93bFFuXL1nllmZcFNE90qi7X9KRSjsyQrC
 u+mg==
X-Gm-Message-State: AOAM533pN4Fmk2x0LpGXngJPY5cP9EXHevezfU3neAi9l0OVvxbWbxWR
 LWiLP53hD4cFtNld3KLiGbEfhSw4ztcu0ibbkdc=
X-Google-Smtp-Source: ABdhPJytg4eIvk66i8T0yhcK9iVllvVqBJe4xiRToG4VjzOAjNJt87yWYfMgZ79Wdy2w/IT8eCr9x5YMalVclaD9pw8=
X-Received: by 2002:ab0:42c6:: with SMTP id j64mr19044238uaj.51.1629606442320; 
 Sat, 21 Aug 2021 21:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210821194401.58992-1-bensuperpc@gmail.com>
 <20210821232703.2457edfb@windsurf>
In-Reply-To: <20210821232703.2457edfb@windsurf>
From: Bensuperpc <bensuperpc@gmail.com>
Date: Sun, 22 Aug 2021 06:26:46 +0200
Message-ID: <CAAV5jBd+Z2o-8unyXtNeWJgcbMGobANYbUss-rOm=+K_OVbNDQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] Enable quadmath on aarch64
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6538998523473849628=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6538998523473849628==
Content-Type: multipart/alternative; boundary="0000000000001e470b05ca1e51d2"

--0000000000001e470b05ca1e51d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some headers need quadmath to work (Ex: boost::multiprecision::float128),

I am getting following compile error on aarch64 without
*BR2_TOOLCHAIN_HAS_LIBQUADMATH=3Dy *:
*boost/multiprecision/float128.hpp:40:10: fatal error: 'quadmath.h' file
not found*
when I use float128 in boost.

Config file:
https://github.com/dockcross/dockcross/blob/master/linux-arm64-full/buildro=
ot.config

Bensuperpc,


Le sam. 21 ao=C3=BBt 2021 =C3=A0 23:27, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> On Sat, 21 Aug 2021 21:44:01 +0200
> Bensuperpc <bensuperpc@gmail.com> wrote:
>
> > Enable quadmath on aarch64
> >
> > Signed-off-by: Bensuperpc <bensuperpc@gmail.com>
>
> We do need a real name to accept contributions.
>
> > ---
> >  toolchain/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/toolchain/Config.in b/toolchain/Config.in
> > index 1d0469a13e..b4cd6d511f 100644
> > --- a/toolchain/Config.in
> > +++ b/toolchain/Config.in
> > @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
> >  # - When available, libquadmath requires wchar support.
> >  config BR2_TOOLCHAIN_HAS_LIBQUADMATH
> >       bool
> > -     default y if BR2_i386 || BR2_x86_64
> > +     default y if BR2_i386 || BR2_x86_64 || BR2_aarch64
>
> This option is not about "enabling" something, but about saying whether
> libquadmath is supported/available on a given CPU architecture. Since
> when is libquadmath available/supported by gcc?
>
> What was the motivation behind this change?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000001e470b05ca1e51d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Some headers need quadmath to work (Ex: boost::multiprecis=
ion::float128),=C2=A0<br><div><br></div><div>I am getting following compile=
 error on aarch64 without=C2=A0<span style=3D"color:rgb(80,0,80)"><i><b>BR2=
_TOOLCHAIN_HAS_LIBQUADMATH=3Dy</b>=C2=A0</i></span>:</div><div><i>boost/mul=
tiprecision/float128.hpp:40:10: fatal error: &#39;quadmath.h&#39; file not =
found</i><br></div><div>when I use=C2=A0<span style=3D"font-family:inherit;=
font-style:inherit;font-variant-ligatures:inherit;font-variant-caps:inherit=
;font-weight:inherit;background-color:transparent;white-space:inherit;font-=
size:13px">float128 in boost.</span></div><div><br></div><div>Config file:=
=C2=A0<a href=3D"https://github.com/dockcross/dockcross/blob/master/linux-a=
rm64-full/buildroot.config" target=3D"_blank">https://github.com/dockcross/=
dockcross/blob/master/linux-arm64-full/buildroot.config</a></div><div><br><=
/div><div>Bensuperpc,</div><div><b><br></b></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 21 ao=C3=BBt =
2021 =C3=A0=C2=A023:27, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petaz=
zoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Sat, 21 Aug 2021 21:44:01 +0200<br>
Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" target=3D"_blank">be=
nsuperpc@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Enable quadmath on aarch64<br>
&gt; <br>
&gt; Signed-off-by: Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" =
target=3D"_blank">bensuperpc@gmail.com</a>&gt;<br>
<br>
We do need a real name to accept contributions.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 toolchain/Config.in | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/toolchain/Config.in b/toolchain/Config.in<br>
&gt; index 1d0469a13e..b4cd6d511f 100644<br>
&gt; --- a/toolchain/Config.in<br>
&gt; +++ b/toolchain/Config.in<br>
&gt; @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC<br>
&gt;=C2=A0 # - When available, libquadmath requires wchar support.<br>
&gt;=C2=A0 config BR2_TOOLCHAIN_HAS_LIBQUADMATH<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default y if BR2_i386 || BR2_x86_64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y if BR2_i386 || BR2_x86_64 || BR2_aarch6=
4<br>
<br>
This option is not about &quot;enabling&quot; something, but about saying w=
hether<br>
libquadmath is supported/available on a given CPU architecture. Since<br>
when is libquadmath available/supported by gcc?<br>
<br>
What was the motivation behind this change?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001e470b05ca1e51d2--

--===============6538998523473849628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6538998523473849628==--
