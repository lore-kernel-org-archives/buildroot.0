Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E28C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 16:22:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF9C60EE9
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 16:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FF9C60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D88883BBE;
	Fri,  6 Aug 2021 16:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeW01rvr0zDV; Fri,  6 Aug 2021 16:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE4A83BBC;
	Fri,  6 Aug 2021 16:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 905931BF2F7
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 16:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B55B83BBC
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 16:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRjTx4F2PGyx for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 16:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CE583B42
 for <buildroot@busybox.net>; Fri,  6 Aug 2021 16:22:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id c16so19008136lfc.2
 for <buildroot@busybox.net>; Fri, 06 Aug 2021 09:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDDfKpMEBqoYbBwxYaKdCtUT/G4G7XLD1Yg5jPQYXY4=;
 b=esVye3zxcLMUDvSpmoWBUkHDWFr44gZF0+UXTBgpBjlHis4qIhHp5nzjZZSzg7S4o2
 P1SvuUCazkywKRGbfk9pIwURY/+wWJBztp1R8Ie3MfizBv3QC+KrRrGLk0BsHp+Ec88C
 utKlFhVLxeWYaKZYZRIqvC09/kH2JkXbxy1ME2fiWhB5Kuug9XT2f9OVgCvi79sMK1Ey
 xWhMo1LLdy1BsIHtv/yLPsRZFgABaIKfNRNjgInlX2irFlFxrrfE04EARL4ZZn4FtnCq
 MJ9NL5PCG77ddaxn9a2YMTbV0Wtm/LvIkV1xfSRzH7f7mwYHpF4aE0/TggtAv8eY9CXB
 nd7A==
X-Gm-Message-State: AOAM531gWB653KXbMRDOv1D3AnlduGUbQ8wnfL4uV6KTGVcJQLcUdbsN
 1Od25zhuie0OWdcvz0UsWTHaTF2TwpYsTApaMPzDNrSuRvE=
X-Google-Smtp-Source: ABdhPJyL4X3KNYqw0Jg8xtbEVmbA4qq4YUYqrFhbi/16OkfSU2oSgJtjQLgHRdjeuWNte+l8qnw5ckJ7PCbDOsAfRhQ=
X-Received: by 2002:ac2:5bd0:: with SMTP id u16mr7945298lfn.172.1628266936946; 
 Fri, 06 Aug 2021 09:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210802180616.3304814-1-francois.perrad@gadz.org>
 <20210805201338.GQ27036@scaer>
In-Reply-To: <20210805201338.GQ27036@scaer>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 6 Aug 2021 18:22:05 +0200
Message-ID: <CAB0FRstKr3jeVN7veHMjXLCf_0MkbLk=+83hZ47DroKRTm+tSQ@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH] package/libcap: bump to version 2.52
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============7591166192952904050=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7591166192952904050==
Content-Type: multipart/alternative; boundary="00000000000060647005c8e6701c"

--00000000000060647005c8e6701c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 ao=C3=BBt 2021 =C3=A0 22:13, Yann E. MORIN <yann.morin.1998@free.=
fr> a
=C3=A9crit :

> Fran=C3=A7ois, All,
>
> On 2021-08-02 20:06 +0200, Francois Perrad spake thusly:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/libcap/libcap.hash | 2 +-
> >  package/libcap/libcap.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> > index ec87a38df..eb8fe43f6 100644
> > --- a/package/libcap/libcap.hash
> > +++ b/package/libcap/libcap.hash
> > @@ -1,5 +1,5 @@
> >  #
> https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256=
sums.asc
> > -sha256
> 6609f3ab7aebcc8f9277f53a577c657d9f3056d1352ea623da7fd7c0f00890f9
> libcap-2.51.tar.xz
> > +sha256
> a2faacd55ae5959db1b0c695f91f256ac4c5e6b10acaeaeaf508ea1ee887fa97
> libcap-2.52.tar.xz
> >
> >  # Hash for license file:
> >  sha256
> f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
> > diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> > index 3dc09bd55..45700e56e 100644
> > --- a/package/libcap/libcap.mk
> > +++ b/package/libcap/libcap.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -LIBCAP_VERSION =3D 2.51
> > +LIBCAP_VERSION =3D 2.52
>
> How did you test this bump? The patches we had in Buildroot did not even
> apply anymore:
>
>
Tested in a wrong branch.

Fran=C3=A7ois


>
> http://autobuild.buildroot.org/results/2f619b233e2cfb4d7eeb3cc178c849c74d=
11f2ca/
>
> This has been fixed in next, now:
>
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20210805161653.22136=
89-1-illia.bitkov@mind.be/
>
> Regards,
> Yann E. MORIN.
>
> >  LIBCAP_SITE =3D
> https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
> >  LIBCAP_SOURCE =3D libcap-$(LIBCAP_VERSION).tar.xz
> >  LIBCAP_LICENSE =3D GPL-2.0 or BSD-3-Clause
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
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
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--00000000000060647005c8e6701c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 5 ao=C3=BBt 2021 =C3=A0=
=C2=A022:13, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">y=
ann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Fran=C3=A7ois, All,<br>
<br>
On 2021-08-02 20:06 +0200, Francois Perrad spake thusly:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/libcap/libcap.hash | 2 +-<br>
&gt;=C2=A0 package/libcap/<a href=3D"http://libcap.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libcap.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash<b=
r>
&gt; index ec87a38df..eb8fe43f6 100644<br>
&gt; --- a/package/libcap/libcap.hash<br>
&gt; +++ b/package/libcap/libcap.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # <a href=3D"https://www.kernel.org/pub/linux/libs/security/linu=
x-privs/libcap2/sha256sums.asc" rel=3D"noreferrer" target=3D"_blank">https:=
//www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc=
</a><br>
&gt; -sha256=C2=A0 6609f3ab7aebcc8f9277f53a577c657d9f3056d1352ea623da7fd7c0=
f00890f9=C2=A0 libcap-2.51.tar.xz<br>
&gt; +sha256=C2=A0 a2faacd55ae5959db1b0c695f91f256ac4c5e6b10acaeaeaf508ea1e=
e887fa97=C2=A0 libcap-2.52.tar.xz<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Hash for license file:<br>
&gt;=C2=A0 sha256=C2=A0 f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c=
38056d38fa59b=C2=A0 License<br>
&gt; diff --git a/package/libcap/<a href=3D"http://libcap.mk" rel=3D"norefe=
rrer" target=3D"_blank">libcap.mk</a> b/package/libcap/<a href=3D"http://li=
bcap.mk" rel=3D"noreferrer" target=3D"_blank">libcap.mk</a><br>
&gt; index 3dc09bd55..45700e56e 100644<br>
&gt; --- a/package/libcap/<a href=3D"http://libcap.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libcap.mk</a><br>
&gt; +++ b/package/libcap/<a href=3D"http://libcap.mk" rel=3D"noreferrer" t=
arget=3D"_blank">libcap.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -LIBCAP_VERSION =3D 2.51<br>
&gt; +LIBCAP_VERSION =3D 2.52<br>
<br>
How did you test this bump? The patches we had in Buildroot did not even<br=
>
apply anymore:<br>
<br></blockquote><div><br></div><div>Tested in a wrong branch.<br></div><di=
v><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 <a href=3D"http://autobuild.buildroot.org/results/2f619b233e2=
cfb4d7eeb3cc178c849c74d11f2ca/" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.org/results/2f619b233e2cfb4d7eeb3cc178c849c74d11f2ca/<=
/a><br>
<br>
This has been fixed in next, now:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/pat=
ch/20210805161653.2213689-1-illia.bitkov@mind.be/" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/202108051=
61653.2213689-1-illia.bitkov@mind.be/</a><br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 LIBCAP_SITE =3D <a href=3D"https://www.kernel.org/pub/linux/libs=
/security/linux-privs/libcap2" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.kernel.org/pub/linux/libs/security/linux-privs/libcap2</a><br>
&gt;=C2=A0 LIBCAP_SOURCE =3D libcap-$(LIBCAP_VERSION).tar.xz<br>
&gt;=C2=A0 LIBCAP_LICENSE =3D GPL-2.0 or BSD-3-Clause<br>
&gt; -- <br>
&gt; 2.30.2<br>
&gt; <br>
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
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busybo=
x.net</a><br>
<a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D"nore=
ferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/buildro=
ot</a><br>
</blockquote></div></div>

--00000000000060647005c8e6701c--

--===============7591166192952904050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7591166192952904050==--
