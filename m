Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1FFC32789
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 18:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BB1414C0;
	Tue, 23 Aug 2022 18:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0BB1414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYWO64CEvkL4; Tue, 23 Aug 2022 18:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37BD3410E8;
	Tue, 23 Aug 2022 18:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37BD3410E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8592A1BF417
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 18:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF438193E
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 18:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF438193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLEcyHxkgE8M for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 18:02:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4908581451
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4908581451
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 18:02:58 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id bf22so14682255pjb.4
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 11:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=aftmwp0vIx7SajYddyTVGpsBzuYTMEGn0LS6qtia+7A=;
 b=ciLBDcZlC5oybuhpI+PssvPV1Kie+BQxxPxRJWDsBecLUAuZMrmBWwc2JgQX2F2OVq
 St6Abl14ceH6MxdZwXlSMLwcrGq9Movrg/kuO4rIkou/oqkBE6h6lLEKqxlM5eug9n4g
 Mj4G01nI/Agp4iaCbYZAsKNEkqfKrWHGSYqNULBwhqRJXemvZVB+wv7EPP5fFTDUgNfu
 St9Q5yZcKXy3D5DwYtHrmhOLLUKR0wRzUsirOd0A1ObQKMjPhgfySB7/AaPMCnMKkPsf
 x20BG/1uApS/MCGBRQlie+bSAXp6iKq8ETAfyFwZppkrVmAp/GJ5B7BIfHgeNn6lNGRw
 ONWw==
X-Gm-Message-State: ACgBeo2mvY14XR/uSo/G9RgCsp4iWDhWNGx+PvC7euruuJVEWe1fleL3
 9YI0L7H6W7VlACbmOE/VX4cTEjkS0MoktDunuXN1/Ig8vVRa9g==
X-Google-Smtp-Source: AA6agR5lI8ntrINQP5bSj0DHMy9BG4BdwYWbC2atgmui3cfja2H2B/1OF9FnSZE1MAn1asijv1Zt6vzZs0QQdd3DUXc=
X-Received: by 2002:a17:90a:8911:b0:1fa:c8f7:1450 with SMTP id
 u17-20020a17090a891100b001fac8f71450mr4228121pjn.123.1661277777361; Tue, 23
 Aug 2022 11:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
 <20220823164611.GI2167049@scaer>
In-Reply-To: <20220823164611.GI2167049@scaer>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 23 Aug 2022 20:02:45 +0200
Message-ID: <CAB0FRssgdgs9E9aS2y7R407m_b2KNZ_RydMO6epGsVw-wof_yA@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH 0/3] portable services: another use case of
 BR
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
Content-Type: multipart/mixed; boundary="===============5269775432684429220=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5269775432684429220==
Content-Type: multipart/alternative; boundary="000000000000cb1a2f05e6ec5f7e"

--000000000000cb1a2f05e6ec5f7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 23 ao=C3=BBt 2022 =C3=A0 18:46, Yann E. MORIN <yann.morin.1998@free=
.fr> a
=C3=A9crit :

> Fran=C3=A7ois, All,
>
> On 2022-02-21 05:30 +0100, Francois Perrad spake thusly:
> > This series allows to build a rootfs suitable for portable services wit=
h
> systemd.
> >
> > A new value of "Init system" is introduced : BR2_INIT_PORTABLE.
> > BR2_INIT_PORTABLE is like BR2_INIT_NONE, but with all
> FOO_INSTALL_INIT_SYSTEMD executed.
> >
> > A new type of skeleton is required : BR2_PACKAGE_SKELETON_INIT_PORTABLE=
.
> >
> > see https://systemd.io/PORTABLE_SERVICES/
>
> Given the feedback on this series, and after discussing with the other
> maintainers, I've now marked this series as rejected. Sorry for that.
>
>
Thanks for these feedbacks.

Fran=C3=A7ois


> If you believe the use-case is really important, we can reconsider it in
> the light of a newer and more complete series that addresses the issues
> that were raised in this review.
>
> Thank you!
>
> Regards,
> Yann E. MORIN.
>
> > Francois Perrad (3):
> >   package/skeleton-init-portable: new skeleton
> >   portable: new init system
> >   portable: tweak some default values
> >
> >  DEVELOPERS                                    |  1 +
> >  fs/squashfs/Config.in                         |  1 +
> >  package/Config.in                             |  1 +
> >  package/ifupdown-scripts/Config.in            |  2 +-
> >  package/pkg-generic.mk                        |  2 ++
> >  package/skeleton-init-portable/Config.in      |  7 ++++++
> >  .../skeleton-init-portable.mk                 | 23 +++++++++++++++++++
> >  system/Config.in                              | 18 +++++++++++----
> >  8 files changed, 50 insertions(+), 5 deletions(-)
> >  create mode 100644 package/skeleton-init-portable/Config.in
> >  create mode 100644 package/skeleton-init-portable/
> skeleton-init-portable.mk
> >
> > --
> > 2.32.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000cb1a2f05e6ec5f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 23 ao=C3=BBt 2022 =C3=A0=
=C2=A018:46, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">y=
ann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Fran=C3=A7ois, All,<br>
<br>
On 2022-02-21 05:30 +0100, Francois Perrad spake thusly:<br>
&gt; This series allows to build a rootfs suitable for portable services wi=
th systemd.<br>
&gt; <br>
&gt; A new value of &quot;Init system&quot; is introduced : BR2_INIT_PORTAB=
LE.<br>
&gt; BR2_INIT_PORTABLE is like BR2_INIT_NONE, but with all FOO_INSTALL_INIT=
_SYSTEMD executed.<br>
&gt; <br>
&gt; A new type of skeleton is required : BR2_PACKAGE_SKELETON_INIT_PORTABL=
E.<br>
&gt; <br>
&gt; see <a href=3D"https://systemd.io/PORTABLE_SERVICES/" rel=3D"noreferre=
r" target=3D"_blank">https://systemd.io/PORTABLE_SERVICES/</a><br>
<br>
Given the feedback on this series, and after discussing with the other<br>
maintainers, I&#39;ve now marked this series as rejected. Sorry for that.<b=
r>
<br></blockquote><div><br></div><div>Thanks for these feedbacks.</div><div>=
<br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
If you believe the use-case is really important, we can reconsider it in<br=
>
the light of a newer and more complete series that addresses the issues<br>
that were raised in this review.<br>
<br>
Thank you!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Francois Perrad (3):<br>
&gt;=C2=A0 =C2=A0package/skeleton-init-portable: new skeleton<br>
&gt;=C2=A0 =C2=A0portable: new init system<br>
&gt;=C2=A0 =C2=A0portable: tweak some default values<br>
&gt; <br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 fs/squashfs/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/ifupdown-scripts/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" tar=
get=3D"_blank">pkg-generic.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 package/skeleton-init-portable/Config.in=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 7 ++++++<br>
&gt;=C2=A0 .../<a href=3D"http://skeleton-init-portable.mk" rel=3D"noreferr=
er" target=3D"_blank">skeleton-init-portable.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++++++++++++++++<br>
&gt;=C2=A0 system/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++--=
--<br>
&gt;=C2=A0 8 files changed, 50 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 package/skeleton-init-portable/Config.in<br>
&gt;=C2=A0 create mode 100644 package/skeleton-init-portable/<a href=3D"htt=
p://skeleton-init-portable.mk" rel=3D"noreferrer" target=3D"_blank">skeleto=
n-init-portable.mk</a><br>
&gt; <br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000cb1a2f05e6ec5f7e--

--===============5269775432684429220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5269775432684429220==--
