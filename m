Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC416C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 03:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581FF4150F;
	Wed, 15 Jan 2025 03:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDJwc5KOibcx; Wed, 15 Jan 2025 03:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21334077C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C21334077C;
	Wed, 15 Jan 2025 03:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE29B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874DA41057
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxV06boWAVuR for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 03:48:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA94F41025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA94F41025
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA94F41025
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 03:48:53 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so8747607276.0
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736912932; x=1737517732;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROf/7tAccI3mgIbZjvaRtnp6+uPcod2xudvuCVkCmZ4=;
 b=A/MPSdGygpZKERvoQiY+VbeqRG1wlMqIl+RsNizfucl8VeII+OKWu1UT387ZPI1JCU
 qF7hjY3W9czpeTxmijRuV0dg5CruM4tCpn2WPmRMgiu7NEWWPFpQMnFIgdAzTEGOfsPU
 JdgX/mkU2OPaL7C+1xLs8vWWCqvqd4bs2MbNAon8CmRJE0NOh4A+V45oXLcTTxtj15tW
 elLC+2ba3UiY6LGbxtJxK7XBaZMfi8Or9noSlQyeuEYuga3KwBIR1zJH6CrxoN7xHMV9
 WfZMOIiq5wZszn0a4RxXQ1KbpKmLkpK7K98S6z9ednVunW7VUu4azdIgwuQ1Zni8Dnqi
 skOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeAQdAsK/HxZfH5h4Td6bYQVc8Zc6AdaaY61RfBiNF5tDuPhyRIb12aK5T1efQmX483lKfg4JlFps=@buildroot.org
X-Gm-Message-State: AOJu0Yxjpzg166q6Kel/2FYadavegwGQTzFsYFX2pzUyPdluJsJhn5bx
 mFmFbZnxlujjpi8nD62uAjak1Dih4HzqDF8ghiTv6Cw17MbJDPVAnwaEyXIVM3fJaob2wd/PUwg
 6Ox24Ao8RwM+B3sWQQvSJgRV50ww=
X-Gm-Gg: ASbGncvT6WCaJ3BQIj0dSFZJr5a6bndGdJGGGdNFudvP1zCC5ECaQHRwQINENacVEJV
 dS8vIOmqfOUeVkAZCJeVJweZowpbZYsXibiG98Q==
X-Google-Smtp-Source: AGHT+IFc4LHtF52pP7rld5f6P0ZCUPvYlWWNqWzS2uUK9j4hBPy8yWElE88roIdlNRTKj6j3oPchGZpaoHivJ9uWqjY=
X-Received: by 2002:a25:1ec2:0:b0:e4a:c0bb:7b25 with SMTP id
 3f1490d57ef6-e54ee1daa87mr15289306276.41.1736912932320; Tue, 14 Jan 2025
 19:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20250112223142.770914-1-nemaakhilesh@gmail.com>
 <20250113153412.51ff0e04@windsurf> <fcaf9348ede608925bad155bdbd2bf53@free.fr>
In-Reply-To: <fcaf9348ede608925bad155bdbd2bf53@free.fr>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 14 Jan 2025 19:48:26 -0800
X-Gm-Features: AbW1kvZ9_-cVDXKgqpxwP10XiwdVmoct-ixRTWqzhFoWg_D3976BeKgpA2iZVkU
Message-ID: <CAMV0Ro9is6f9xu3Z4sEeHPt9+1m3=88Kz=_gTD4wboU+sfauaQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736912932; x=1737517732; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ROf/7tAccI3mgIbZjvaRtnp6+uPcod2xudvuCVkCmZ4=;
 b=GUItPP7GOPwsEUHx2MxouZnyRt/Tr2UB6u20CF+CLeZTWfL8oOhigiq1VSarm4x/0z
 Uu/WiR+H72zB3TAZhx58HBak1UeAqWr9DJ9AsfFmD6vrzRi4L/TUmKhb+qk/KaN6sszR
 H1gFGDGu0WZSiqiNUT1hb9LTDKqW+20eEqtoOMP1qPsKTOmVRCJ9LVAT5eBzkpU7HKb1
 K88HvXqoACSJ8ECR48zRSJ2ms042qSFDqWNKPUX48LuJGBmFsD7fdHS0g7EJIORkfjkU
 qD3pXlXNdM3r2o8R3DC+dRXRfTEZpv+/vb6pK+bqMXMmIZDSMBF0FPrifK85qhG/+JEw
 xixw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GUItPP7G
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to
 4.4.37
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
Content-Type: multipart/mixed; boundary="===============5603662514934330184=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5603662514934330184==
Content-Type: multipart/alternative; boundary="00000000000056411f062bb68e72"

--00000000000056411f062bb68e72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

On Tue, Jan 14, 2025 at 10:18=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrot=
e:

> Hi Thomas, Akhilesh,
>
> On 13/01/2025 15:34, Thomas Petazzoni via buildroot wrote:
> > On Sun, 12 Jan 2025 14:31:42 -0800
> > Akhilesh Nema <nemaakhilesh@gmail.com> wrote:
> >
> >> diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
> >> index 38c75b5e63..508e1a43cd 100644
> >> --- a/package/libxcrypt/Config.in
> >> +++ b/package/libxcrypt/Config.in
> >> @@ -1,6 +1,7 @@
> >>  config BR2_PACKAGE_LIBXCRYPT
> >>      bool "libxcrypt"
> >>      depends on BR2_TOOLCHAIN_USES_GLIBC
> >> +    select BR2_PACKAGE_HOST_PKGCONF
> >
> > We really don't enforce selecting this option, so I'd rather see it not
> > done, than done inconsistently between packages.
> >
> >> +LIBXCRYPT_DEPENDENCIES =3D host-pkgconf
> >> +HOST_LIBXCRYPT_DEPENDENCIES =3D host-pkgconf
> >
> > I'm actually surprised by the dependency on host-pkgconf. host-pkgconf
> > is normally used to detect dependencies, but libxcrypt has no
> > dependencies other than the toolchain. So why is it needed now?
> > Explanations in your commit log would be very useful.
>
> As Akhilesh pointed out in the v1 thread, this was an upstream issue:
> https://github.com/besser82/libxcrypt/issues/198
>
> Hopefully, this was quickly fixed upstream. There is already a
> new version:
> https://github.com/besser82/libxcrypt/releases/tag/v4.4.38
>
> So we could just skip this 4.4.37 version, and bump directly
> to 4.4.38 (and not add the dependencies).
>
> Akhilesh: could make sure to test this new bump with at least
> a "utils/test-pkg -a -p libxcrypt" please? (or add in a comment
> the test you did).
>
> Best regards,
>
> Julien.
>

Thank you so much for the review.  I have submitted a 4.4.38 bump patch
along with the test-pkg results.
-
https://patchwork.ozlabs.org/project/buildroot/patch/20250115034020.792083-=
1-nemaakhilesh@gmail.com/

Thanks
Akhilesh

--00000000000056411f062bb68e72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Everyone,</div><div></div><div><br></div><div></di=
v><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 14, 2025 at 10:18=E2=80=AFAM Julien Olivain &lt=
;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Thomas, Akhilesh,<br>
<br>
On 13/01/2025 15:34, Thomas Petazzoni via buildroot wrote:<br>
&gt; On Sun, 12 Jan 2025 14:31:42 -0800<br>
&gt; Akhilesh Nema &lt;<a href=3D"mailto:nemaakhilesh@gmail.com" target=3D"=
_blank">nemaakhilesh@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Confi=
g.in<br>
&gt;&gt; index 38c75b5e63..508e1a43cd 100644<br>
&gt;&gt; --- a/package/libxcrypt/Config.in<br>
&gt;&gt; +++ b/package/libxcrypt/Config.in<br>
&gt;&gt; @@ -1,6 +1,7 @@<br>
&gt;&gt;=C2=A0 config BR2_PACKAGE_LIBXCRYPT<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool &quot;libxcrypt&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_USES_GLIBC<br>
&gt;&gt; +=C2=A0 =C2=A0 select BR2_PACKAGE_HOST_PKGCONF<br>
&gt; <br>
&gt; We really don&#39;t enforce selecting this option, so I&#39;d rather s=
ee it not<br>
&gt; done, than done inconsistently between packages.<br>
&gt; <br>
&gt;&gt; +LIBXCRYPT_DEPENDENCIES =3D host-pkgconf<br>
&gt;&gt; +HOST_LIBXCRYPT_DEPENDENCIES =3D host-pkgconf<br>
&gt; <br>
&gt; I&#39;m actually surprised by the dependency on host-pkgconf. host-pkg=
conf<br>
&gt; is normally used to detect dependencies, but libxcrypt has no<br>
&gt; dependencies other than the toolchain. So why is it needed now?<br>
&gt; Explanations in your commit log would be very useful.<br>
<br>
As Akhilesh pointed out in the v1 thread, this was an upstream issue:<br>
<a href=3D"https://github.com/besser82/libxcrypt/issues/198" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/besser82/libxcrypt/issues/198</a>=
<br>
<br>
Hopefully, this was quickly fixed upstream. There is already a<br>
new version:<br>
<a href=3D"https://github.com/besser82/libxcrypt/releases/tag/v4.4.38" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/besser82/libxcrypt/rel=
eases/tag/v4.4.38</a><br>
<br>
So we could just skip this 4.4.37 version, and bump directly<br>
to 4.4.38 (and not add the dependencies).<br>
<br>
Akhilesh: could make sure to test this new bump with at least<br>
a &quot;utils/test-pkg -a -p libxcrypt&quot; please? (or add in a comment<b=
r>
the test you did).<br>
<br>
Best regards,<br>
<br>
Julien.<br></blockquote><div><br></div><div>Thank you so much for the revie=
w.=C2=A0 I have submitted a 4.4.38 bump patch along with the test-pkg resul=
ts.<br></div><div><div dir=3D"ltr">- <a href=3D"https://patchwork.ozlabs.or=
g/project/buildroot/patch/20250115034020.792083-1-nemaakhilesh@gmail.com/">=
https://patchwork.ozlabs.org/project/buildroot/patch/20250115034020.792083-=
1-nemaakhilesh@gmail.com/</a></div><div><br></div><div>Thanks</div><div>Akh=
ilesh</div>=C2=A0</div></div></div>

--00000000000056411f062bb68e72--

--===============5603662514934330184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5603662514934330184==--
