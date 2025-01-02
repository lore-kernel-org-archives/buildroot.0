Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED69E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 08:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B7F80BAE;
	Thu,  2 Jan 2025 08:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmEOaJkDLpKT; Thu,  2 Jan 2025 08:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D332680BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D332680BBC;
	Thu,  2 Jan 2025 08:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C212CF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A32B980BAE
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZ-UwAKMjCkO for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 08:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8566580BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8566580BB4
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8566580BB4
 for <buildroot@busybox.net>; Thu,  2 Jan 2025 08:58:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21683192bf9so150915525ad.3
 for <buildroot@busybox.net>; Thu, 02 Jan 2025 00:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735808295; x=1736413095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=plreXbeJEwYvmhf0RmGm2r8nbb5WX122f/+a9gw3Pqw=;
 b=WDmp/IG9ssB1DcfjOsKlTxIGsQZ69H+WQIoaeD17Y3t09SzURn1nxSw0EIiAhfOSp1
 A51cs24RaKrqk7ROp5BZWofmjh0KpHZBQzSjqjQDTLu4uyKtPK1vJF8rBrzWr8fM2nSu
 /HciT5NsQdqAuI/Ri5HVpi122zV6j+kSXtwxGY24Ao2MnyIublc+4yGA7PK53qoek3iZ
 eFs6UChaxgBybmNW6eUlfLlPNy27qjmOW3Ln2sHh+rC2npFYittozkoEYbXN7mW3DBRT
 qpasLpgvnPwtDo9br+ItQnD7kocFQSnVXmwjQ7biGg10ch/jdYB5pKXbtrXSt5vK3eMG
 h1WA==
X-Gm-Message-State: AOJu0YwLIS5eA6y3zKDip+FTyO6B17Eo9WjGPtuKY/CfyXh2bFm+pG06
 WgSAT7YRde/o8lJTvUALSKuSKKweSDwzQapHxKqab/MyA1f7MIvHKeqTq0PEsw4HS0/qN1uNOqb
 HHyiyRqiMPh/dxL/w7Sgv+AY6cKZyMMgddZm1CWD9Pq2iQoMWToY1
X-Gm-Gg: ASbGncuxGSjTFXnKjES+RU0YJj9OYhYMqhwV2OjLzpnaoHgd05iVtlOfB7ye8ze/Ik6
 Imwq/dwppCZjNdTUo2yVDyE/znsMpmWgV21U7KWOWIWWQr2DyMeF8+pIjujGBZMVNMHLngfo=
X-Google-Smtp-Source: AGHT+IH7iQjpmvSl/23S1uqqWP4SIJuSsrLgH49WM4or/YkeL17ZyzCsl4NnqoZBnBXctzzhppkBG7tlR3WvBLzN9ps=
X-Received: by 2002:a05:6a20:2d2a:b0:1e5:b0d6:5496 with SMTP id
 adf61e73a8af0-1e5e046ff38mr68504347637.15.1735808294544; Thu, 02 Jan 2025
 00:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20241001193355.3966100-1-francois.perrad@gadz.org>
 <20250101232226.7719f6ad@windsurf>
In-Reply-To: <20250101232226.7719f6ad@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 2 Jan 2025 09:58:03 +0100
Message-ID: <CAAE6iEW2Vsm2t5XJRHHi8hbvUuHA5nj6V0Ndh0P2UUp3gJ2g3A@mail.gmail.com>
To: buildroot@busybox.net
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1735808295; x=1736413095; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=plreXbeJEwYvmhf0RmGm2r8nbb5WX122f/+a9gw3Pqw=;
 b=JFdWUPDzxL1zcBp1Bw45SGfsjAsqgn29Sq6b+RxW1T/c+gOt2xqDeF2rJ+eBhA/Ora
 Kid7lQOn03Lxu426dnV8BqtyOOGZhToF7NQ/Zi8qo7omakfxenUSsNkHoT79Kh63nZ54
 A8sV8JN2eZDEIH73vRXcsfZSJv/V3BFjz71qHSlqvf3pN+exnPkqT63Ocvuk9XM3FGtj
 Zyej7S7N97St5dgHsz5GZt3R2gmxH5sWUCogo5uP1QnqkVbkG0fi1pJ+9di1+W1o2rR4
 bwxaGeFmpSnK7kn9y/8tLj3pHjtsDt/7Rt4jjPcteJPE+r2Devcnmn7cSAnvH/KXiGHl
 VtNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=JFdWUPDz
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.40.0
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
Content-Type: multipart/mixed; boundary="===============5994904183862951480=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5994904183862951480==
Content-Type: multipart/alternative; boundary="000000000000cbd904062ab55c3b"

--000000000000cbd904062ab55c3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 1 janv. 2025 =C3=A0 23:22, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> On Tue,  1 Oct 2024 21:33:54 +0200
> Francois Perrad <francois.perrad@gadz.org> wrote:
>
> > remove merged patch
> >
> > diff README:
> >     -Perl is Copyright (C) 1993 - 2024 by Larry Wall and others.
> >     +Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  ...ixup-regex-engine-build-under-Uusedl.patch | 554 ------------------
> >  package/perl/perl.hash                        |  14 +-
> >  package/perl/perl.mk                          |   6 +-
> >  3 files changed, 10 insertions(+), 564 deletions(-)
> >  delete mode 100644
> package/perl/0001-regcomp-c-regexec-c-fixup-regex-engine-build-under-Uuse=
dl.patch
>
> This update breaks the build of perl for the target when
> BR2_STATIC_LIBS=3Dy:
>
>
> http://autobuild.buildroot.net/results/e07/e07fe8ba343b606ab4aa67e042c60c=
e1fb570c15/build-end.log
>
> Interestingly, in your version bump, you dropped a patch... which was
> merged upstream but seems related.
>
> Could you have a look?
>
>
Already done.
The problem doesn't come from this commit, but from a more recent one (also
including in 5.40.0).
See
https://patchwork.ozlabs.org/project/buildroot/patch/20241116182335.121470-=
1-francois.perrad@gadz.org/

Fran=C3=A7ois



> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000cbd904062ab55c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 1 =
janv. 2025 =C3=A0=C2=A023:22, Thomas Petazzoni &lt;<a href=3D"mailto:thomas=
.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fr=
an=C3=A7ois,<br>
<br>
On Tue,=C2=A0 1 Oct 2024 21:33:54 +0200<br>
Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_=
blank">francois.perrad@gadz.org</a>&gt; wrote:<br>
<br>
&gt; remove merged patch<br>
&gt; <br>
&gt; diff README:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Perl is Copyright (C) 1993 - 2024 by Larry Wall an=
d others.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Perl is Copyright (C) 1993 - 2023 by Larry Wall an=
d others.<br>
&gt; <br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ixup-regex-engine-build-under-Uusedl.patch | 554 ------------=
------<br>
&gt;=C2=A0 package/perl/perl.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 package/perl/<a href=3D"http://perl.mk" rel=3D"noreferrer" targe=
t=3D"_blank">perl.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 3 files changed, 10 insertions(+), 564 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/perl/0001-regcomp-c-regexec-c-fixup-r=
egex-engine-build-under-Uusedl.patch<br>
<br>
This update breaks the build of perl for the target when<br>
BR2_STATIC_LIBS=3Dy:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/results/e07/e07fe8ba343b60=
6ab4aa67e042c60ce1fb570c15/build-end.log" rel=3D"noreferrer" target=3D"_bla=
nk">http://autobuild.buildroot.net/results/e07/e07fe8ba343b606ab4aa67e042c6=
0ce1fb570c15/build-end.log</a><br>
<br>
Interestingly, in your version bump, you dropped a patch... which was<br>
merged upstream but seems related.<br>
<br>
Could you have a look?<br>
<br></blockquote><div><br></div><div>Already done.<br></div><div>The proble=
m doesn&#39;t come from this commit, but from a more recent one (also inclu=
ding in 5.40.0).</div><div>See <a href=3D"https://patchwork.ozlabs.org/proj=
ect/buildroot/patch/20241116182335.121470-1-francois.perrad@gadz.org/">http=
s://patchwork.ozlabs.org/project/buildroot/patch/20241116182335.121470-1-fr=
ancois.perrad@gadz.org/</a></div><div><br></div><div>Fran=C3=A7ois<br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000cbd904062ab55c3b--

--===============5994904183862951480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5994904183862951480==--
