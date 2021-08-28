Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19736C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7C960200
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF7C960200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F02360652;
	Sat, 28 Aug 2021 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDfggMId067n; Sat, 28 Aug 2021 15:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAAE60653;
	Sat, 28 Aug 2021 15:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E62571BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2FED8186A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05mmlLrzDckZ for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 333A081024
 for <buildroot@busybox.net>; Sat, 28 Aug 2021 15:50:02 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i21so20777868ejd.2
 for <buildroot@busybox.net>; Sat, 28 Aug 2021 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVN1wBh+SJd/IRwTi7/1DoOwPXLMVkT+oPxp/hCGLfw=;
 b=SmqpdGXFCCr53ZTjDOV4C1uO3oc2aZsPsaKZ4lqkWUTMa89AOlhDSHYr4xH4qcMw6S
 /VoecVj16xPWRc03Vo4b6OgvhtEMx3nDUm9zZZYyaR+LD7Gq/9xNSELPjbWD0HYPTcpD
 DxehuUe9/dE9YRmZ6QfR8p/EiyEulsB6J8Vzn3dV+hWyPZJ8KWDPFd87oJrwPv/PYhsg
 L9WPslfTpE7GQ0QkNA4zdpz3yANzOJ6UJj4MC6wShr2xfuUpxxmTbP4Xq+vib+WAGRrU
 N3nS5Rf7FLjVN7E2BN+OBZIs9morNiTOTwkfGYEZCpLwAu1bKU+x8XgW3p3143X1GsUh
 wdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVN1wBh+SJd/IRwTi7/1DoOwPXLMVkT+oPxp/hCGLfw=;
 b=e04WBygvG8cW1ZBpUgZP+EEbStB0CCR7+Bm+b5E446NlF22pr6tJ8jUqpGyv7KwhJA
 JyHvwv4XKn0Ls/uIPs83dXT7Jd0awJGgjl3PoIHEl7e6/8uglQoiYb+v1AH0WKl69uCN
 zsDueKxmA4k3Jp56RYb2YwxY5q2B80HQwYHfTEGR9x411ftZ8hdTacE3C73EpMBxxo8+
 QhzJuwancbSCqAhuf0BS50y6g+RIGGb31eiZKyQAyY8uJ32C2M2q9fdE0v73qN054YrK
 nBMsjnRjruLxdZQwMPtK+GqvFgwG2gbqLHZ1sdeizAb+xMASAySXiYzSum/Zs4AG1748
 cXLQ==
X-Gm-Message-State: AOAM530GeWh21w/4Z3Ye/nE6Q0//n7huFt8ceLprkExMdC2hTUS74mFx
 nIAMy8DA/BYP5j/458pwOvGro4JCyUXXq34PrLlW8RYv
X-Google-Smtp-Source: ABdhPJxnOKL5XmCQ0CGEk30oOkNeFJKDkV+oJQnAzi3JhV9FlkrsvU4MhzKZh79LO0Pj9STPYIEKF8Of8sLWcTEdcuc=
X-Received: by 2002:a17:906:6d85:: with SMTP id
 h5mr15828376ejt.305.1630165800383; 
 Sat, 28 Aug 2021 08:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <46c6bccb-adc0-1e0b-3d2e-5e86ad5f40a1@grenoble.cnrs.fr>
 <20210827194930.GA2661@scaer>
In-Reply-To: <20210827194930.GA2661@scaer>
From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Sat, 28 Aug 2021 17:49:49 +0200
Message-ID: <CAJkBjxEWrPC+mSN5fFs94PRDiVBNe+pfs8S1dXz_aeijqy1ZbA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] board/acmesystems/{aria,
 arietta}-g25: fix genimage.cfg
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
Cc: buildroot mailing list <buildroot@busybox.net>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: multipart/mixed; boundary="===============1121098025198418187=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1121098025198418187==
Content-Type: multipart/alternative; boundary="00000000000074f7e005caa08db6"

--00000000000074f7e005caa08db6
Content-Type: text/plain; charset="UTF-8"

Edgar,
many thanks for your patch.
I have successfully tested it on my Arietta G25.

Regards,
Biagio.

Il giorno ven 27 ago 2021 alle ore 21:49 Yann E. MORIN <
yann.morin.1998@free.fr> ha scritto:

> Edgar, All,
>
> On 2021-08-27 20:22 +0200, Edgar Bonet spake thusly:
> > On the Aria and the Arietta AT91Bootstrap builds, the file name of the
> > bootloader embeds its version number, and the genimage configuration
> > needs this filename in order to build the boot filesystem image. Commit
> > 0614f435a09e99c33f418a646eaa7647944c2f4c bumped the AT91Bootstrap
> > version of all acmesystems' boards but failed to update genimage.cfg
> > accordingly, which broke the builds. The Acqua board is not affected
> > by this issue.
> >
> > Update the affected genimage.cfg with the correct filenames.
> >
> > Fixes:
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521690
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521691
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521692
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1515521694
> >
> > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  board/acmesystems/aria-g25/genimage.cfg    | 2 +-
> >  board/acmesystems/arietta-g25/genimage.cfg | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > Note: I tested the builds but did not test the generated images, for
> > lack of the appropriate hardware.
> >
> > diff --git a/board/acmesystems/aria-g25/genimage.cfg
> b/board/acmesystems/aria-g25/genimage.cfg
> > index b40ad9edf3..fd7b9557c6 100644
> > --- a/board/acmesystems/aria-g25/genimage.cfg
> > +++ b/board/acmesystems/aria-g25/genimage.cfg
> > @@ -11,7 +11,7 @@ image boot.vfat {
> >               }
> >
> >               file boot.bin {
> > -                     image =
> "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bin"
> > +                     image =
> "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
> >               }
> >       }
> >       size = 16M
> > diff --git a/board/acmesystems/arietta-g25/genimage.cfg
> b/board/acmesystems/arietta-g25/genimage.cfg
> > index 7c3112dd56..9ab8a6aff5 100644
> > --- a/board/acmesystems/arietta-g25/genimage.cfg
> > +++ b/board/acmesystems/arietta-g25/genimage.cfg
> > @@ -11,7 +11,7 @@ image boot.vfat {
> >               }
> >
> >               file boot.bin {
> > -                     image =
> "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13.bin"
> > +                     image =
> "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
> >               }
> >       }
> >       size = 16M
> > --
> > 2.25.1
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--00000000000074f7e005caa08db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Edgar,</div><div>many thanks for your patch.<br></div=
><div>I have successfully tested it on my Arietta G25.<br></div><div><br></=
div><div>Regards,</div><div>Biagio.<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 27 ago 2021 alle=
 ore 21:49 Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" tar=
get=3D"_blank">yann.morin.1998@free.fr</a>&gt; ha scritto:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Edgar, All,<br>
<br>
On 2021-08-27 20:22 +0200, Edgar Bonet spake thusly:<br>
&gt; On the Aria and the Arietta AT91Bootstrap builds, the file name of the=
<br>
&gt; bootloader embeds its version number, and the genimage configuration<b=
r>
&gt; needs this filename in order to build the boot filesystem image. Commi=
t<br>
&gt; 0614f435a09e99c33f418a646eaa7647944c2f4c bumped the AT91Bootstrap<br>
&gt; version of all acmesystems&#39; boards but failed to update genimage.c=
fg<br>
&gt; accordingly, which broke the builds. The Acqua board is not affected<b=
r>
&gt; by this issue.<br>
&gt; <br>
&gt; Update the affected genimage.cfg with the correct filenames.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/151552169=
0" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bu=
ildroot/-/jobs/1515521690</a><br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/151552169=
1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bu=
ildroot/-/jobs/1515521691</a><br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/151552169=
2" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bu=
ildroot/-/jobs/1515521692</a><br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/151552169=
4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bu=
ildroot/-/jobs/1515521694</a><br>
&gt; <br>
&gt; Signed-off-by: Edgar Bonet &lt;<a href=3D"mailto:bonet@grenoble.cnrs.f=
r" target=3D"_blank">bonet@grenoble.cnrs.fr</a>&gt;<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 board/acmesystems/aria-g25/genimage.cfg=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 board/acmesystems/arietta-g25/genimage.cfg | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; Note: I tested the builds but did not test the generated images, for<b=
r>
&gt; lack of the appropriate hardware.<br>
&gt; <br>
&gt; diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesyste=
ms/aria-g25/genimage.cfg<br>
&gt; index b40ad9edf3..fd7b9557c6 100644<br>
&gt; --- a/board/acmesystems/aria-g25/genimage.cfg<br>
&gt; +++ b/board/acmesystems/aria-g25/genimage.cfg<br>
&gt; @@ -11,7 +11,7 @@ image boot.vfat {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file boot.bin {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0image =3D &quot;at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.13.bi=
n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0image =3D &quot;at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bi=
n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
&gt; diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesy=
stems/arietta-g25/genimage.cfg<br>
&gt; index 7c3112dd56..9ab8a6aff5 100644<br>
&gt; --- a/board/acmesystems/arietta-g25/genimage.cfg<br>
&gt; +++ b/board/acmesystems/arietta-g25/genimage.cfg<br>
&gt; @@ -11,7 +11,7 @@ image boot.vfat {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file boot.bin {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0image =3D &quot;at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.8.13=
.bin&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0image =3D &quot;at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3=
.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@b=
usybox.net</a><br>
&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/bu=
ildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--00000000000074f7e005caa08db6--

--===============1121098025198418187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1121098025198418187==--
