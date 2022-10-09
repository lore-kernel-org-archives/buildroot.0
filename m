Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB3BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 09:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FB240906;
	Sun,  9 Oct 2022 09:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FB240906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2wlvmaOjBsH; Sun,  9 Oct 2022 09:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A30254091B;
	Sun,  9 Oct 2022 09:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A30254091B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C79311BF36F
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 09:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CC4D402E5
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 09:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC4D402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ver53AuxCGkW for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 09:37:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19904000B
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F19904000B
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 09:37:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id 13so19479909ejn.3
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 02:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LKxw2pHaI6IWWUNGo3cnlXk8FLy+huLcK4buX7KQrA=;
 b=A+nLiCEZ9FyB6HGsABkLgAfNFfQImcR0RVrkubEYbnWji+R3+IfSwFYgjvS6xvLO46
 6m8byJ5J2IwIvM5T0jtNDRw/8r3eeySKLrnoqatKCZ5x7w+PxKRiDDdcaEBwEpYVT7FY
 k9aXppE5ikVdwdhoILw2JowsckeKGm9KuaB8NTQk9HL9A80OiN+vnsAHuIFueOGQd4yl
 EaE5CHO0PSQ0IK+hD2imM8y+ZpM2zAkjxkEReFiXE7zGIXhkS1IBck4wWa1b6WcabMGn
 fZzLkhOtUsiEVoCxcQ3KxbYpLLZUSb0TmyE0v18az4yomUZSV0ycB7nSi6tYMHhbOruz
 O0VQ==
X-Gm-Message-State: ACrzQf0aMppN9loIhCSotrpsA1zQbk8s869G3SZMmlafJ9gCkb/qwieF
 w80+u4n8ftD4nhBM7w0Pt0XxKxLTMI3dCylxj6pCT8D4eVJV5A==
X-Google-Smtp-Source: AMsMyM57+t9fy1nAwjCc4YeM+70DmLA3IKzsVgaO9bi8kTJgu3KRG4mYYYP4Wgy+5n5f5t0v0HzSBcqe3QqD9Wnnouo=
X-Received: by 2002:a17:907:75ef:b0:78d:98a2:8380 with SMTP id
 jz15-20020a17090775ef00b0078d98a28380mr4718591ejc.752.1665308263308; Sun, 09
 Oct 2022 02:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
 <20221006215057.49eec773@windsurf>
 <20221006221340.45c07636@x230_1.trabucayre.com>
 <CAJe0E3dcuE6Dwe85x9yMoCtdmJi-qUsX_BCNjVe6oAU4QYvbkA@mail.gmail.com>
In-Reply-To: <CAJe0E3dcuE6Dwe85x9yMoCtdmJi-qUsX_BCNjVe6oAU4QYvbkA@mail.gmail.com>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sun, 9 Oct 2022 11:37:16 +0200
Message-ID: <CAJe0E3ds8BCDYctOnctXa=S1O9AiO16M3kj+Av_5oBvZ_qKjjw@mail.gmail.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LKxw2pHaI6IWWUNGo3cnlXk8FLy+huLcK4buX7KQrA=;
 b=Db6c1HSYox9rSygZK4PRgY97tXDudYGBO9Wagb56UoODpPssY1+xbHAMyhjwu8v1mq
 EQ3x5wFkAaX8GZ6aVZaaK32x/RsdhBJaPhTy8f4Z2Am46idotolXeMXTfoePLFDorEi3
 koFB4SdDbneldJ9eWMsWDXM4VdrTk4xfxTdByptA+EG65w9hStJYuA0yD6bEGPtOTFqy
 gBMYZ0IgSk3eKSfd69ACGzVaA4ZKCJW6+VjNv1YpPI8bn/bxz4d50/WH72rvH1/u+6j3
 wKlmdzsxy2Dww/WrPWiYzGDwwBSOoYjQeZqDOdiWL7aS2HrYS4ogI351M5nRNN71F+0b
 2i5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Db6c1HSY
Subject: Re: [Buildroot] [PATCH v4] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6303636640499756077=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6303636640499756077==
Content-Type: multipart/alternative; boundary="00000000000079e19605ea96cb13"

--00000000000079e19605ea96cb13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it makes sense when you think about the header only case.
When a package like gnuradio or scipy (which is being cross-compiled) is
trying to locate the headers it needs, the search pool is the sysroot
naturally.
Which only contains cross-compiled binaries.
So basically, a header only package does not produce binaries but readable
things. We "cross-compile" them (mostly producing nothing), but the install
step points to the correction destination: the sysroot search pool.

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le dim. 9 oct. 2022 =C3=A0 11:29, Guillaume Bres <guillaume.bressaix@gmail.=
com>
a =C3=A9crit :

> Hello guys,
>
> sorry for the delayed answer, no access to personal emails for a bit
>
> > I am sorry, but this still doesn't make any sense, and will in fact
> > cause build failures. A package cannot have a target package in its
> > <pkg>_DEPENDENCIES variable without selecting it.
> I agree with Thomas. Basically "gnuradio" is now becoming similar to
> "scipy" which already exists.
> And we do select "python-pybind" when enabling "scipy".
>
> > If python-pybind is needed at build time on the host, then
> > GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
> > needs to be done in Config.in.
> I disagree with Thomas on this and agree with the proposal. But that's
> only due to the weird nature of pybind.
> The current setup/description of pybind is a Header only package, it is
> not a host-package but the only difference *to me*, is where the headers
> are installed to.
> I scrolled the pybind emails history. The only justification for this, *t=
o
> me*, is Yann's:
> "As I explained in my previous review, headers are supposed to be in
> $(STAGING_DIR)/usr/include/pybind11/. That's at least where they are in
> Debian-based distributions;"
>
> So pybind got reworked to match those expectations regarding how to
> properly manage a header only library.
> For us, this did not help because the pybind setup script is tedious. But
> we got it to work.
> On the other hand, there are plenty of header only packages existing in B=
R
> so we had examples to rely on.
>
> For information, "gnuradio" and "scipy" are now the only two packages
> relying on "pybind".
> But two other candidates would be "kmsxx" and "zeek"; my understanding is=
,
> these two currently have a build context that embeds a pybind itself.
> Maybe in a not so far future, they would get incremented to rely on the
> pybind we provide
>
>
> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix@gmail.com>
>
>
> Le jeu. 6 oct. 2022 =C3=A0 22:13, Gwenhael Goavec-Merou <gwenj@trabucayre=
.com>
> a =C3=A9crit :
>
>> Hello,
>> On Thu, 6 Oct 2022 21:50:57 +0200
>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>> > Hello,
>> >
>> > On Thu,  6 Oct 2022 10:27:57 +0200
>> > Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
>> >
>> > > - Since gnuradio 3.10 swig was replaced by pybind. Now python
>> libraries,
>> > >   bindings and python wrappers are produces using pybind: this why
>> > > python-pybind is a buildtime dependency. This one is a stagging only
>> > > package (nothing installed into target directory -> no select
>> > > BR2_PACKAGE_PYTHON_PYBIND added to Config.in but
>> GNURADIO_DEPENDENCIES is
>> > > updated with python-pybind).
>> >
>> > I am sorry, but this still doesn't make any sense, and will in fact
>> > cause build failures. A package cannot have a target package in its
>> > <pkg>_DEPENDENCIES variable without selecting it.
>> >
>> > If python-pybind is needed at build time on the host, then
>> > GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
>> > needs to be done in Config.in.
>> >
>> > If python-pybind is needed on the target, then two options:
>> >
>> >  (1) It's needed only at runtime =3D> it should be selected in Config.=
in.
>> >
>> >  (2) It's needed at build-time =3D> it should be selected in Config.in
>> >  *and* and added as a dependency in GNURADIO_DEPENDENCIES. However, I'=
d
>> >  like to see a serious justification, because it is really uncommon to
>> >  have target Python packages be build-time dependencies.
>> >
>> I'm totally agree: gnuradio needs host-python-pybind.
>> In fact pybind package is not really clear to me:
>> - there is no host-python-pybind
>> - python-pybind is used to populate staging
>> (PYTHON_PYBIND_INSTALL_STAGING =3D
>>   YES) but nothing is installed into target (PYTHON_PYBIND_INSTALL_TARGE=
T
>> =3D NO)
>>
>> If I remember well (but unable to find thread) one of previous bump has
>> required a long discussion with as result this status: maybe guillaume
>> (in CC)
>> could help to clarify situation.
>> > Best regards,
>> >
>> > Thomas
>> > --
>> > Thomas Petazzoni, co-owner and CEO, Bootlin
>> > Embedded Linux and Kernel engineering and training
>> > https://bootlin.com
>> Regards,
>>
>> Gwenhael
>>
>

--00000000000079e19605ea96cb13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>it makes sense when you think about the header only c=
ase.</div><div>When a package like gnuradio or scipy (which is being cross-=
compiled) is
 trying to locate the headers it needs, the search pool is the=20
sysroot naturally. <br></div><div>Which only contains cross-compiled binari=
es.<br></div><div>So basically, a header only package does not produce bina=
ries but readable things. We &quot;cross-compile&quot; them (mostly produci=
ng nothing), but the install step points to the correction destination: the=
 sysroot search pool.<br></div><br clear=3D"all"><div><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font=
 face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div><fon=
t face=3D"arial,helvetica,sans-serif">Software engineer</font><br></div><fo=
nt face=3D"arial,helvetica,sans-serif"></font></div><font face=3D"arial,hel=
vetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" targ=
et=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div></=
div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 9 oct. 2022 =C3=A0=C2=A011:29,=
 Guillaume Bres &lt;<a href=3D"mailto:guillaume.bressaix@gmail.com">guillau=
me.bressaix@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div><div><div><div=
><div>Hello guys,<br><br></div>sorry for the delayed answer, no access to p=
ersonal emails for a bit<br><br>&gt; I am sorry, but this still doesn&#39;t=
 make any sense, and will in fact<br>
&gt; cause build failures. A package cannot have a target package in its<br=
>
&gt; &lt;pkg&gt;_DEPENDENCIES variable without selecting it.<br></div>I agr=
ee with Thomas. Basically &quot;gnuradio&quot; is now becoming similar to &=
quot;scipy&quot; which already exists.<br></div>And we do select &quot;pyth=
on-pybind&quot; when enabling &quot;scipy&quot;.<br><br>
&gt; If python-pybind is needed at build time on the host, then<br>
&gt; GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing<br>
&gt; needs to be done in Config.in.<br></div>I disagree with Thomas on this=
 and agree with the proposal. But that&#39;s only due to the weird nature o=
f pybind.<br></div>The current setup/description of pybind is a Header only=
 package, it is not a host-package but the only difference *to me*, is wher=
e the headers are installed to.<br></div>I scrolled the pybind emails histo=
ry. The only justification for this, *to me*, is Yann&#39;s: <br><div><div>=
<div><div>&quot;As I explained in my previous review, headers are supposed =
to be in<br>
$(STAGING_DIR)/usr/include/pybind11/. That&#39;s at least where they are in=
<br>
Debian-based distributions;&quot;</div><div><div><div><br></div><div>So pyb=
ind got reworked to match those expectations regarding how to properly mana=
ge a header only library.<br></div><div>For us, this did not help because t=
he pybind setup script is tedious. But we got it to work.<br></div><div>On =
the other hand, there are plenty of header only packages existing in BR so =
we had examples to rely on.<br><br></div><div>For information, &quot;gnurad=
io&quot; and &quot;scipy&quot; are now the only two packages relying on &qu=
ot;pybind&quot;.<br></div><div>But two other candidates would be &quot;kmsx=
x&quot; and &quot;zeek&quot;; my understanding is, these two currently have=
 a build context that embeds a pybind itself.<br></div><div>Maybe in a not =
so far future, they would get incremented to rely on the pybind we provide<=
br><br></div><div><br clear=3D"all"></div><div><div><div><div><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br>=
</font></div><font face=3D"arial,helvetica,sans-serif">Software engineer</f=
ont><br></div><font face=3D"arial,helvetica,sans-serif"></font></div><font =
face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressai=
x@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></fo=
nt></div></div></div></div></div></div><br></div></div></div></div></div></=
div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0jeu. 6 oct. 2022 =C3=A0=C2=A022:13, Gwenhael Goavec=
-Merou &lt;<a href=3D"mailto:gwenj@trabucayre.com" target=3D"_blank">gwenj@=
trabucayre.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello,<br>
On Thu, 6 Oct 2022 21:50:57 +0200<br>
Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=
=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Thu,=C2=A0 6 Oct 2022 10:27:57 +0200<br>
&gt; Gwenhael Goavec-Merou &lt;<a href=3D"mailto:gwenj@trabucayre.com" targ=
et=3D"_blank">gwenj@trabucayre.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; - Since gnuradio 3.10 swig was replaced by pybind. Now python lib=
raries,<br>
&gt; &gt;=C2=A0 =C2=A0bindings and python wrappers are produces using pybin=
d: this why<br>
&gt; &gt; python-pybind is a buildtime dependency. This one is a stagging o=
nly<br>
&gt; &gt; package (nothing installed into target directory -&gt; no select<=
br>
&gt; &gt; BR2_PACKAGE_PYTHON_PYBIND added to Config.in but GNURADIO_DEPENDE=
NCIES is<br>
&gt; &gt; updated with python-pybind).=C2=A0 <br>
&gt; <br>
&gt; I am sorry, but this still doesn&#39;t make any sense, and will in fac=
t<br>
&gt; cause build failures. A package cannot have a target package in its<br=
>
&gt; &lt;pkg&gt;_DEPENDENCIES variable without selecting it.<br>
&gt; <br>
&gt; If python-pybind is needed at build time on the host, then<br>
&gt; GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing<br>
&gt; needs to be done in Config.in.<br>
&gt; <br>
&gt; If python-pybind is needed on the target, then two options:<br>
&gt; <br>
&gt;=C2=A0 (1) It&#39;s needed only at runtime =3D&gt; it should be selecte=
d in Config.in.<br>
&gt; <br>
&gt;=C2=A0 (2) It&#39;s needed at build-time =3D&gt; it should be selected =
in Config.in<br>
&gt;=C2=A0 *and* and added as a dependency in GNURADIO_DEPENDENCIES. Howeve=
r, I&#39;d<br>
&gt;=C2=A0 like to see a serious justification, because it is really uncomm=
on to<br>
&gt;=C2=A0 have target Python packages be build-time dependencies.<br>
&gt; <br>
I&#39;m totally agree: gnuradio needs host-python-pybind.<br>
In fact pybind package is not really clear to me:<br>
- there is no host-python-pybind<br>
- python-pybind is used to populate staging (PYTHON_PYBIND_INSTALL_STAGING =
=3D<br>
=C2=A0 YES) but nothing is installed into target (PYTHON_PYBIND_INSTALL_TAR=
GET =3D NO)<br>
<br>
If I remember well (but unable to find thread) one of previous bump has<br>
required a long discussion with as result this status: maybe guillaume (in =
CC)<br>
could help to clarify situation.<br>
&gt; Best regards,<br>
&gt; <br>
&gt; Thomas<br>
&gt; -- <br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
Regards,<br>
<br>
Gwenhael<br>
</blockquote></div>
</blockquote></div>

--00000000000079e19605ea96cb13--

--===============6303636640499756077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6303636640499756077==--
