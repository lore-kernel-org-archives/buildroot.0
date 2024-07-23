Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AF6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 07:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A7160649;
	Tue, 23 Jul 2024 07:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSGJ70lAXI_9; Tue, 23 Jul 2024 07:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C38FA60720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38FA60720;
	Tue, 23 Jul 2024 07:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38F7A1BF2C8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C78811B7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFVCvltTxcgW for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 07:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D64CF80F82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64CF80F82
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D64CF80F82
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 07:09:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-59f9f59b827so4824010a12.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 00:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721718550; x=1722323350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udV3wQUB+ZrJg0dYEbeiCnmfPi9UPGjhA0Bjrms2ft0=;
 b=Aeo/DTgd+07dEg20FYinGvLbUXqGw/SqSl2qZkofUHM8HRqTnKLXpHAOl0a9VeBP2S
 KvhY1f7uQd+7SSlIPHfpJeWec89x5DdPXTtwjTUjpu+ceGLK49t8w5BxAWBoHwLKhOLh
 P7Yb0S7aKxfGVu+E4ohREBRVub4hXLoGPyoz5Ph5TmPOAapC9qdiOjG1LIYpcWYZLPck
 eOLdnlhdXETRyk5UbH3K0Y+yewgFXilD1ZKh2dg4E+zAPH5EKdJRwXsAdmTrVbWO3TNu
 feH6a2yPra8xfbjEVzNAB3sIJM1Yh6kS3bNzhpesNuXwFlTkqUwAklj4qzCv7OffY40G
 y5aA==
X-Gm-Message-State: AOJu0YyX/IsLdQtLOw5tQb+7HsvDfQO1QgLtmODBptUMK4S0wEvK6O76
 Fbuul2Twy2wzUojpoo6GXhRwyGSLBXkI6JOZkFdWPQ0pm/siogsANn1zig+bKCONr99Bu7jWkJD
 060qzfzKc307xUkwfO2o2wFiSp542OA==
X-Google-Smtp-Source: AGHT+IH1OmKr/CXToluv877aE7w7B4pn9TcSs1bDJ/Tr+EoNqAZqe3SKFYFUxMCD3m9g0HTwd1fWoM+7R5OsbDZZSDg=
X-Received: by 2002:a05:6402:3550:b0:5a7:d986:6e9 with SMTP id
 4fb4d7f45d1cf-5a7d986096cmr4119445a12.9.1721718549679; Tue, 23 Jul 2024
 00:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240721183223.2792367-1-kazemi.ms@gmail.com>
 <20240722141348.18756600@windsurf>
In-Reply-To: <20240722141348.18756600@windsurf>
From: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Tue, 23 Jul 2024 09:08:33 +0200
Message-ID: <CAM8b=FsCK0T3Z=3BNGku22cS29xZB1OOSxr9mnVeWGXLNGFYXA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721718550; x=1722323350; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=udV3wQUB+ZrJg0dYEbeiCnmfPi9UPGjhA0Bjrms2ft0=;
 b=NBGjwy5nF4FVbZLbuTE/WqEZHjdq3jB3wCPOT1ggh2ySOuHxoUy6Hs7NhUaOLycTgY
 vSfAwVnkpd2zsV6v1I84FC0vBJAwpg9QMwIRPCdGEea4B2a9ae4hOpKMoflpFQeVcHOi
 jSyaOFqkf1Ve8PG3RPbg4wiG5v82yW9OOlPIREP+h4gchXOH8wt36CV12XoNpSedbYxp
 SqxJTX1AKlGbdHxUIwezYYOJO3EXG1EoUOfqyAss2O3i+6GncuFqbFupRTIuILv4M/qd
 CXp2sSLqrbsNiFnyd4weSwXYjS4mcYzbbEUa8w435kJamnxu9MldfSWBs0OfC99rQIAA
 n12A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NBGjwy5n
Subject: Re: [Buildroot] [PATCH 1/1] package/parsec: new package
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
Content-Type: multipart/mixed; boundary="===============3361095975189953816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3361095975189953816==
Content-Type: multipart/alternative; boundary="0000000000008e9643061de4d663"

--0000000000008e9643061de4d663
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Indeed, fixed in a new patch.
In the github page the last release is 1.3.0, and I didn't notice there are
new tags.

Thanks,
Saeed

On Mon, Jul 22, 2024 at 2:13=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Saaed,
>
> On Sun, 21 Jul 2024 20:32:23 +0200
> Saeed Kazemi <kazemi.ms@gmail.com> wrote:
>
> > Hardware/platform abstraction service for TPMs, HSMs, and Root of Trust
> >
> > https://github.com/parallaxsecond/parsec.git
> >
> > Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
>
> Thanks for this patch. Two questions below.
>
> > +Subject: [PATCH] Fix compile errors with latest Rust version
> > +
> > +Upstream: N/A not applicable directly but based on:
> > +
> https://github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191=
151c78fc5648693
>
> Why are you saying N/A (not applicable), if in fact your change is a
> partial backport of an upstream commit? If it's a partial backport,
> just state it so:
>
> Upstream: partial backport
> of
> https://github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191=
151c78fc5648693
>
> > +PARSEC_VERSION =3D 1.3.0
>
> Why 1.3.0 and not 1.4.0 or 1.4.1 that contain the
> 82320d345e08fe6310b684191151c78fc5648693 fix already ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000008e9643061de4d663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Hello Thomas,</div><div class=3D"gmail_default" style=3D"font-fa=
mily:tahoma,sans-serif"><br>Indeed, fixed in a new patch.<br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:tahoma,sans-serif">In the github=
=C2=A0page the last release is 1.3.0, and I didn&#39;t notice there are new=
 tags.</div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-s=
erif"><br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sa=
ns-serif">Thanks,</div><div class=3D"gmail_default" style=3D"font-family:ta=
homa,sans-serif">Saeed</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 2:13=E2=80=AFPM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Saaed,<br>
<br>
On Sun, 21 Jul 2024 20:32:23 +0200<br>
Saeed Kazemi &lt;<a href=3D"mailto:kazemi.ms@gmail.com" target=3D"_blank">k=
azemi.ms@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hardware/platform abstraction service for TPMs, HSMs, and Root of Trus=
t<br>
&gt; <br>
&gt; <a href=3D"https://github.com/parallaxsecond/parsec.git" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/parallaxsecond/parsec.git</a><br=
>
&gt; <br>
&gt; Signed-off-by: Saeed Kazemi &lt;<a href=3D"mailto:kazemi.ms@gmail.com"=
 target=3D"_blank">kazemi.ms@gmail.com</a>&gt;<br>
<br>
Thanks for this patch. Two questions below.<br>
<br>
&gt; +Subject: [PATCH] Fix compile errors with latest Rust version<br>
&gt; +<br>
&gt; +Upstream: N/A not applicable directly but based on:<br>
&gt; +<a href=3D"https://github.com/parallaxsecond/parsec/commit/82320d345e=
08fe6310b684191151c78fc5648693" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191151c78fc=
5648693</a><br>
<br>
Why are you saying N/A (not applicable), if in fact your change is a<br>
partial backport of an upstream commit? If it&#39;s a partial backport,<br>
just state it so:<br>
<br>
Upstream: partial backport<br>
of <a href=3D"https://github.com/parallaxsecond/parsec/commit/82320d345e08f=
e6310b684191151c78fc5648693" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191151c78fc564=
8693</a><br>
<br>
&gt; +PARSEC_VERSION =3D 1.3.0<br>
<br>
Why 1.3.0 and not 1.4.0 or 1.4.1 that contain the<br>
82320d345e08fe6310b684191151c78fc5648693 fix already ?<br>
<br>
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000008e9643061de4d663--

--===============3361095975189953816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3361095975189953816==--
