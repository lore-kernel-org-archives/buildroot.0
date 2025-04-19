Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78CC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 16:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE04402DE;
	Sat, 19 Apr 2025 16:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3m9fCzB60k0; Sat, 19 Apr 2025 16:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E02A40471
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E02A40471;
	Sat, 19 Apr 2025 16:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C43D22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D289804EE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dH0tdH3PY-qe for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 16:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34604804EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34604804EF
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34604804EF
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:56:56 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e70a6ece644so377620276.0
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 09:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745081815; x=1745686615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvaggpwSlSVhmBgYlEdlBvZLQwWarvcbH4t6+FkxRzA=;
 b=XrRnb/19n+9kJBL92MIFk2PR/ZA/zODwCgD1DlCnblWa5BC0r08Y6nsASPOgFNSpJB
 S7ZLWOKvzj+BUOTlCe8qAg9GyDGNC96PXCXnbZCaP5SK0xUuFRaw74TFo5XAZ28uPlMN
 avi2eHoq2Fn0sjdhov6B4I3etDsQ6VWQUFL5L5T0eXmm/B9UNauIe8j0Bo5zY4kF0Jr9
 d0V4VrKMsZV+OBiO6gOo3uCFPJoTO8mirRfYnbyt3AY8hYXN0+Z5Ryxs2kC1wi5oaeiT
 jXEPwSAbql/Cd4pVgKyc9DzLo05ODyPsY29E+62pZA6Qjqg7A1inzIivcFeCvyCc+IVs
 ISUw==
X-Gm-Message-State: AOJu0YyuZi4idoKSaNh0xWBvd381Jx4AObKIfl47fIxWHh1p9eC5RiEm
 70yybWnhLM0KrU8yvhVyYKPnfev3j8X+15mRMpSd0CHyqYHHGLF7AkX5CqYno8C78Tfu8JTk2CM
 Bu7yf5bj4B1XsdTJnICPk8wtsRWJAosB+
X-Gm-Gg: ASbGncutrzGzv5uYIgHam5FKfPW+hOwbxwa1aB0DzfrY4GEsITyAUL01N6zeIcqZoFj
 Sk4I2ZVSsZVyk8FDLWDa6YyWnCA/kuoEkCtWkOviJ1eAwxquzNDsTTt+c2Wq/HT7oWaae9tsUo+
 6HBi4fBvb7X4QTGH9DOqpr
X-Google-Smtp-Source: AGHT+IFWl7rV2cBEh0tjtp+ZE0QScP2f+/LXDsittZ6NzGmNQoZX/Il5YFKsuJ45dH5gRNQuNjrxriSik4AnnTLSx1E=
X-Received: by 2002:a05:6902:140b:b0:e5d:afd7:643b with SMTP id
 3f1490d57ef6-e7297eae16dmr3279581276.5.1745081814859; Sat, 19 Apr 2025
 09:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
 <dfe20dbb0429ce970599a992005b9ffa@free.fr>
In-Reply-To: <dfe20dbb0429ce970599a992005b9ffa@free.fr>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Sat, 19 Apr 2025 19:56:42 +0300
X-Gm-Features: ATxdqUEQ0m3K30UsyMkNdlGnaTq1axhMmuzxd2kNgWxPpG0Q6RxSaG6nzgCF0PI
Message-ID: <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745081815; x=1745686615; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YvaggpwSlSVhmBgYlEdlBvZLQwWarvcbH4t6+FkxRzA=;
 b=XEuviPAYj6IfU7Ka/c6WoRVZNyRjySUf+RuWdC1MniYFR8emWBWNAYFEOnMPyPfdHG
 oz7IO5oTzoUafNlyW6iFHftMENR43WiX8K6WxQjkRPb8Ad5/Xf099mdoqhY8dAXEH6UB
 riQMQ5qYzFuQIxLesAJiBZ7pfSMu4TxSrcqqRapQ/ZBWD4g8zF0fJbRYYFS5fT2hF09D
 AB17MAnnPvEs/22Ttn4xOvOqU4PDL7DF/6x7NRwervNbJ50WPWk7qZ92aL2l+hdeJH/B
 xensKnIZZWd6eBmuChoO2bKRgmomt1ecUz5MLG0PuEQBkULzqEYq3kHomo02eDHzyaC8
 hMVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XEuviPAY
Subject: Re: [Buildroot] host-m4 build on Fedora 42 fails
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8069528490614796072=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8069528490614796072==
Content-Type: multipart/alternative; boundary="000000000000adc9ad06332485ca"

--000000000000adc9ad06332485ca
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

Thanks for the info and the workaround tip!

I updated my patch to use CFLAGS="$(HOST_CFLAGS) -std=gnu17" like you
suggested, but the build still fails with GCC 15 and m4 1.4.19 - same
errors as before. Strangely, if I build m4 outside the buildroot
environment with those flags, it works fine.

Any idea what else could be causing the workaround to fail in buildroot?
Are there other flags or tweaks I could try in m4.mk until the new m4
release is out?

Regards,
Joseph Zikusooka (ZIK)

On Sat, Apr 19, 2025, 3:29 PM Julien Olivain <ju.o@free.fr> wrote:

> Hi Joseph,
>
> Thanks for reporting the issue.
>
> On 18/04/2025 16:14, Joseph Zikusooka wrote:
> > Recently upgraded to Fedora 42 and since then I am unable to compile
> > buildroot.  Make fails at the host-m4 package.
> > I looked up several sources and found this:
> > https://lists.gnu.org/archive/html/m4-discuss/2025-02/msg00000.html
> >
> > The work around on Fedora 42 was to build m4 with the environment
> > flags as follows:
> > CFLAGS='-std=gnu17' ./configure && make
> >
> > I tried to patch m4.mk as follows, but the build is still failing.  Any
> > ideas?
> >
> > --- a/m4.mk     2025-04-18 17:02:01.174923317 +0300
> > +++ b/m4.mk     2025-04-18 17:03:29.285694673 +0300
> > @@ -10,4 +10,7 @@
> >  M4_LICENSE = GPL-3.0+
> >  M4_LICENSE_FILES = COPYING
> >
> > +M4_CONF_ENV = CFLAGS="-std=gnu17"
> > +M4_MAKE_ENV = CFLAGS="-std=gnu17"
> > +
>
> To workaround this gcc15 issue with the current m4
> version 1.4.19, you should probably pass the CFLAGS as:
>
> HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
>
> Also, there is an upcoming m4 release which will fix
> this gcc 15 issue. See:
>
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
>
> More specifically:
> "
> ** Update to comply with newer C standards, and inherit portability
>     improvements from gnulib.
> "
>
> If this new m4 release is not published in the coming days/weeks
> please submit an updated version of this patch to fix this issue.
> Please also add a comment that this CFLAGS modification is needed
> for m4-1.4.19 and host-gcc15 and should be removed in the next
> bump to 1.4.20.
>
> Best regards,
>
> Julien.
>

--000000000000adc9ad06332485ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p dir=3D"ltr">Hi Julien,</p>
<p dir=3D"ltr">Thanks for the info and the workaround tip! </p>
<p dir=3D"ltr">I updated my patch to use CFLAGS=3D&quot;$(HOST_CFLAGS) -std=
=3Dgnu17&quot; like you suggested, but the build still fails with GCC 15 an=
d m4 1.4.19 - same errors as before. Strangely, if I build m4 outside the b=
uildroot environment with those flags, it works fine.</p>
<p dir=3D"ltr">Any idea what else could be causing the workaround to fail i=
n buildroot? Are there other flags or tweaks I could try in <a href=3D"http=
://m4.mk" target=3D"_blank" rel=3D"noreferrer">m4.mk</a> until the new m4 r=
elease is out?</p><p dir=3D"ltr">Regards,</p><div data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr">Joseph Zikusooka (ZIK)</div></div></div>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, Apr 19, 2025, 3:29 PM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" =
target=3D"_blank" rel=3D"noreferrer">ju.o@free.fr</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi Joseph,<br>
<br>
Thanks for reporting the issue.<br>
<br>
On 18/04/2025 16:14, Joseph Zikusooka wrote:<br>
&gt; Recently upgraded to Fedora 42 and since then I am unable to compile<b=
r>
&gt; buildroot.=C2=A0 Make fails at the host-m4 package.<br>
&gt; I looked up several sources and found this:<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/m4-discuss/2025-02/msg00=
000.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//lists.gnu.org/archive/html/m4-discuss/2025-02/msg00000.html</a><br>
&gt; <br>
&gt; The work around on Fedora 42 was to build m4 with the environment<br>
&gt; flags as follows:<br>
&gt; CFLAGS=3D&#39;-std=3Dgnu17&#39; ./configure &amp;&amp; make<br>
&gt; <br>
&gt; I tried to patch <a href=3D"http://m4.mk" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">m4.mk</a> as follows, but the build is still=
 failing.=C2=A0 Any <br>
&gt; ideas?<br>
&gt; <br>
&gt; --- a/<a href=3D"http://m4.mk" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">m4.mk</a>=C2=A0 =C2=A0 =C2=A02025-04-18 17:02:01.174923=
317 +0300<br>
&gt; +++ b/<a href=3D"http://m4.mk" rel=3D"noreferrer noreferrer noreferrer=
" target=3D"_blank">m4.mk</a>=C2=A0 =C2=A0 =C2=A02025-04-18 17:03:29.285694=
673 +0300<br>
&gt; @@ -10,4 +10,7 @@<br>
&gt;=C2=A0 M4_LICENSE =3D GPL-3.0+<br>
&gt;=C2=A0 M4_LICENSE_FILES =3D COPYING<br>
&gt; <br>
&gt; +M4_CONF_ENV =3D CFLAGS=3D&quot;-std=3Dgnu17&quot;<br>
&gt; +M4_MAKE_ENV =3D CFLAGS=3D&quot;-std=3Dgnu17&quot;<br>
&gt; +<br>
<br>
To workaround this gcc15 issue with the current m4<br>
version 1.4.19, you should probably pass the CFLAGS as:<br>
<br>
HOST_M4_CONF_ENV =3D CFLAGS=3D&quot;$(HOST_CFLAGS) -std=3Dgnu17&quot;<br>
<br>
Also, there is an upcoming m4 release which will fix<br>
this gcc 15 issue. See:<br>
<a href=3D"https://git.savannah.gnu.org/cgit/m4.git/commit/?h=3Dbranch-1.4&=
amp;id=3Da22c9802dd7e724eaefb21dc21d84ac2d3a49c89" rel=3D"noreferrer norefe=
rrer noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/m4.git=
/commit/?h=3Dbranch-1.4&amp;id=3Da22c9802dd7e724eaefb21dc21d84ac2d3a49c89</=
a><br>
<br>
More specifically:<br>
&quot;<br>
** Update to comply with newer C standards, and inherit portability<br>
=C2=A0 =C2=A0 improvements from gnulib.<br>
&quot;<br>
<br>
If this new m4 release is not published in the coming days/weeks<br>
please submit an updated version of this patch to fix this issue.<br>
Please also add a comment that this CFLAGS modification is needed<br>
for m4-1.4.19 and host-gcc15 and should be removed in the next<br>
bump to 1.4.20.<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000adc9ad06332485ca--

--===============8069528490614796072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8069528490614796072==--
