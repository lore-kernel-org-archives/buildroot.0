Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EC3FA1FD6
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B21961B99;
	Wed, 22 Apr 2026 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_h8CQanaNZM; Wed, 22 Apr 2026 16:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B7860E4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776875453;
	bh=WmhDixRY9UokOz/FLrOqs3vFIxPMNHqkp0k/Mz1139Q=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=tIkHWKGrm2WTBaoJnNG5+7W5fc54oGS5jJ+wZy0OXmjfzYHxkyIb+VIkxDWcnl0VU
	 ScLNysbwOsujf0VfcZq8Th4QNfFjfUVdHznCXeepRy1r2v09JgUOH34XgeGAPAvB8E
	 NeE82FZbNPrFBb9E4l9/EKmkGsncggKeUiyV5RNHHBQGMdMYkJyi9nOhH6rUWRzAQR
	 hS11Dv/uXCbJ6/ALj7qOD7Clt1NEdKaz7xYK6GcCbKJQv/2gCeIrmFAi4YAt7jjIAF
	 kPgiXYhMaDVtU5cwN8kCkvGvScJKZKc9fgikx1ojIUfi9iq/EvtHdBGsnMYV6+NcLT
	 UwSvIGvEFw0Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B7860E4A;
	Wed, 22 Apr 2026 16:30:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A727183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C4F184452
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iNPBOAWNd3G for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 221DA84451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221DA84451
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 221DA84451
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 16:30:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5a2c9c5ff87so6405217e87.0
 for <buildroot@busybox.net>; Wed, 22 Apr 2026 09:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776875449; cv=none;
 d=google.com; s=arc-20240605;
 b=N+QRBMmh77ASxLEPTUI2jlXIg7F1A+6JBtPDTxfd/AOOotw67ICQcluzT9e99QANF6
 RoKtAK2z2ki0WZBkseLkQz6ECx72WF/mQN8QyyLwWDU3xUORyQ1gb6iROQQM+glBmoq2
 ps7k6x9mfdOLrYuvk6nHBQTWsbQ1s0o9XUL7hk6EsutTxJMzm+CKoOl1uHKRml6ADPx8
 5czQLFEbZr/M9EUs4y4/5wlkGKWVjpSQoO2nJPBCa8mOf3hB75xU6aln1zzv6YDAehRl
 DnXw2fOOcomyB5CfRSx1nK5AZbiVZkYpgC5xwdq8z4WOiaHGCQ9G7x9HEVa5PxYBrCbC
 LNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=h78KXleUIpvASVtPIfJOS4UaTUYCiMrWm86XaCfslmE=;
 fh=g8UPoC+sEPmvhKBCt/UcXW50BjsqW8pSSNGmSXagIyI=;
 b=Gk/Hw2eY0DRmR6rMlmZSCXwE8DE6L3+HmXxNtWN9nrqdWZ/s+sywRoM5LCZ46yv4Hb
 rGzqfTY2CHfy/mRh/Q5apEnvzjV0QCYU+j94G+m5UVjGuOTmsJhnv9hrAxFB2GqKgYfr
 PVIJbxbvurqM0xGjjOsuGElt9ROet6Vex3EaVANRVJAY7MTT8Idqu6MKyjKhHgTG0pLK
 Tzlif672STK0grvyKkySzQCB6tCexsjYFNrGSQZZ2oYUDRErQu4h9+TMc1rdM5Qb6mrT
 kKp4QxQmaEaNw1xxlSXykNJLUmmLyHQy9hsZFbpqhmFNtk0HbBEnGnH2nttdRlR/BS//
 5zqw==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776875449; x=1777480249;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h78KXleUIpvASVtPIfJOS4UaTUYCiMrWm86XaCfslmE=;
 b=P7kDQM5C8bKTxcauHMyPRdRsHLseI+Rr1A+OKz8I5bOlAZBoZdP9vhf/p0GxI3Y1IA
 6u9HPQkcQzH2Wliu128JbyIOgFvAugrUnZelWs9t9YiKl3egt+8gXaKIVtgQ8FaV4xrj
 XoSULOvElIoMvtR5lsXodu6Txi/rJjWG5tyRmeFNBXT+MLnA2FM8KCZh7WwHn977j4GC
 NkLcsAmP4A/U02UhOd+9CWaCofaLuSMWj9vgRp4lOk+axLiB7AMIxnmxd5G8g0sGUfl4
 fMnLBQyQPpR8q6nM5qIJQwyFH3uWsTiJ0Cu4axK424fVCkG7xOV6DUdewVVI/4nJGbUU
 mvig==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sj96jxN6tTmhba8X1ADe4zkJbEzG4m3918VdBulrA5EuMKpHntXqcRJdX2vYSaGfzQNrUDAHpLWk=@busybox.net
X-Gm-Message-State: AOJu0YwoTYSv70AvxXm2mZVZlzXy7YkAWy53Tin0tuU3kijnrabWgGSt
 MciTzeKR05d7ugqLCMZxb/QbY8mSjWNCv2Yb4e0xQaRayCWH23mRsGqcC4ZlifmLuQVwz5nrj6G
 uEnb1lMHtmiMgLme6tGvC/IMh+mUXPwwqmYasrGWS
X-Gm-Gg: AeBDieu/rryowlhGJW6kpNrlr8SIb4Vogv0ClntLlYlmWExY6omOxp1m+lLz4gso9At
 YzmGKWvM9A3DqciBihCABQevnwsASNC/+4hueJ8UgYtG8OwoLMi/30bt4qqPn/cGlYwrZ/wgxr3
 Rs2Yqan/foCMHIOwFzXdSde5LYDwvi+m8L1jxKOxraJTtSeiqnX0XbsUc9O8/nPuE68bglN3uUI
 EqCShCTjhgTaUin9Jmv3n1f42BZY5D7aCKYf+XsAMxtPLmyNxvZrr57PhVXlGFedgCnMLCfh18d
 OMpzCheMmVwZpxWtzFt+larkviIpnM1rLQK8L29rpeW+xd4R9qZ2Fmfmc3nIo2E=
X-Received: by 2002:a05:6512:1189:b0:5a4:ce9:11e with SMTP id
 2adb3069b0e04-5a4172e7aeamr8143980e87.32.1776875447776; Wed, 22 Apr 2026
 09:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260308150650.48948-1-francois.perrad@gadz.org>
 <20260308150650.48948-3-francois.perrad@gadz.org>
 <f729111f87eafb3bbc02cc86213f7c2a@free.fr>
In-Reply-To: <f729111f87eafb3bbc02cc86213f7c2a@free.fr>
Date: Wed, 22 Apr 2026 18:30:36 +0200
X-Gm-Features: AQROBzCQVEuUyanYbUTdCbrLOAcXWzBmKEaGWOHzaKl-XKtHPmbeBMIaXepla3Y
Message-ID: <CAAE6iEVaxitQB8g0nb45S1bBkWzUwK7UBFak_jCfnT45RtkJig@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>, buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1776875449; x=1777480249; darn=busybox.net;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h78KXleUIpvASVtPIfJOS4UaTUYCiMrWm86XaCfslmE=;
 b=ZdbgA6dPljZiWdE5gDhJww4Hgqcgk6YP0jMQntYwEus62tn1rlo12xe/M99tCqTCut
 Ebo8ItJYRQO6o+0GsDv4HnOLLdytaTTxblWgMyiZ4z23qpMUE+IGFoiY21mFkT1XXY2O
 7v4lk+k2msMLkA6O/K6bmq6QFm+m+SgjWi2DISXwXbcxoxyeT9gMON2aALxU7RU7tqdK
 43fGgZlt0ybZc/mnzFMzfJ3ydZrNCYOnD20hfh48135cJ/vlnhF+etQtC5CZYHYsuYS2
 Zqf71UYK46jUoggjzqrzMRz1acDL2/zBQGtGCxKOfGNJS69Qv5aTNc+q86kzArOaV6RW
 NX7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ZdbgA6dP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/ficl: bump to version 3.05
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
From: =?utf-8?q?Fran=C3=A7ois_Perrad_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Content-Type: multipart/mixed; boundary="===============7519673612255935651=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7519673612255935651==
Content-Type: multipart/alternative; boundary="000000000000e07c8206500f0d74"

--000000000000e07c8206500f0d74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 9 mars 2026 =C3=A0 22:26, Julien Olivain <ju.o@free.fr> a =C3=A9cri=
t :

> Hi Francois,
>
> Thanks for the update.
>
> On 08/03/2026 16:06, Francois Perrad via buildroot wrote:
> > - sources are now hosted on Github
> > - ficl have its own LICENSE file
> > - remove one upstreamed patch
> > - support only static lib
> > - requires C11
> > ---
> [...]
> > diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> > index da9a9a33f..6ef94f11e 100644
> > --- a/package/ficl/ficl.mk
> > +++ b/package/ficl/ficl.mk
> > @@ -4,55 +4,27 @@
> >  #
> >
> >
> #########################################################################=
#######
> >
> > -FICL_VERSION =3D 303
> > -FICL_VERSION_SO =3D 3.0.1
> > +FICL_VERSION =3D 305
>
> This new version does not resolve the issue on my side. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2374011153
>
> Those build failures seems related to older uclibc. You might
> need to do something like this:
>
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/util-li=
nux/util-linux.mk#L124
>
> Also, your v2 also misses the "Signed-off-by:".
>
> Did you considered my other comments in my last review?
> https://lore.kernel.org/buildroot/907a398121ce011ac302cf4ff78de312@free.f=
r/
> - squashing those two commits into a single one,
>

with versions 4.1 & 3.03, there are 2 patches.
with versions 3.05 & 3.065 (final state), there is only 1 patch.


> - updating to 3.06
>

I was waiting for a newer version (3.065)

Fran=C3=A7ois


>
> You can test your patches with the command:
>
> utils/test-pkg -a -p ficl
>
> Best regards,
>
> Julien.
>

--000000000000e07c8206500f0d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 9 =
mars 2026 =C3=A0=C2=A022:26, Julien Olivain &lt;<a href=3D"mailto:ju.o@free=
.fr">ju.o@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Francois,<br>
<br>
Thanks for the update.<br>
<br>
On 08/03/2026 16:06, Francois Perrad via buildroot wrote:<br>
&gt; - sources are now hosted on Github<br>
&gt; - ficl have its own LICENSE file<br>
&gt; - remove one upstreamed patch<br>
&gt; - support only static lib<br>
&gt; - requires C11<br>
&gt; ---<br>
[...]<br>
&gt; diff --git a/package/ficl/<a href=3D"http://ficl.mk" rel=3D"noreferrer=
" target=3D"_blank">ficl.mk</a> b/package/ficl/<a href=3D"http://ficl.mk" r=
el=3D"noreferrer" target=3D"_blank">ficl.mk</a><br>
&gt; index da9a9a33f..6ef94f11e 100644<br>
&gt; --- a/package/ficl/<a href=3D"http://ficl.mk" rel=3D"noreferrer" targe=
t=3D"_blank">ficl.mk</a><br>
&gt; +++ b/package/ficl/<a href=3D"http://ficl.mk" rel=3D"noreferrer" targe=
t=3D"_blank">ficl.mk</a><br>
&gt; @@ -4,55 +4,27 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 <br>
&gt; ######################################################################=
##########<br>
&gt; <br>
&gt; -FICL_VERSION =3D 303<br>
&gt; -FICL_VERSION_SO =3D 3.0.1<br>
&gt; +FICL_VERSION =3D 305<br>
<br>
This new version does not resolve the issue on my side. See:<br>
<a href=3D"https://gitlab.com/jolivain/buildroot/-/pipelines/2374011153" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jolivain/buildroot/-/=
pipelines/2374011153</a><br>
<br>
Those build failures seems related to older uclibc. You might<br>
need to do something like this:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/packag=
e/util-linux/util-linux.mk#L124" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/util-linux/uti=
l-linux.mk#L124</a><br>
<br>
Also, your v2 also misses the &quot;Signed-off-by:&quot;.<br>
<br>
Did you considered my other comments in my last review?<br>
<a href=3D"https://lore.kernel.org/buildroot/907a398121ce011ac302cf4ff78de3=
12@free.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/b=
uildroot/907a398121ce011ac302cf4ff78de312@free.fr/</a><br>
- squashing those two commits into a single one,<br></blockquote><div><br><=
/div><div>with versions 4.1 &amp; 3.03, there are 2 patches.</div><div>with=
 versions 3.05 &amp; 3.065 (final state), there is only 1 patch.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- updating to 3.06<br></blockquote><div><br></div><div>I was waiting for a =
newer version (3.065)</div><div><br></div><div>Fran=C3=A7ois</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
You can test your patches with the command:<br>
<br>
utils/test-pkg -a -p ficl<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div></div>

--000000000000e07c8206500f0d74--

--===============7519673612255935651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7519673612255935651==--
