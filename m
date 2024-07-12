Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54791C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0931941973;
	Fri, 12 Jul 2024 14:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QL8Y-yaGSjpZ; Fri, 12 Jul 2024 14:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD0F4198C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD0F4198C;
	Fri, 12 Jul 2024 14:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEC311BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC51661103
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCgWNJaQhXYc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D59D60EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D59D60EBB
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D59D60EBB
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:00:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so1714685f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720792838; x=1721397638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v13R6bD4Oz1ZNsDGbxUAqM9EZ1O0yHNF5xCZQOLKjXk=;
 b=Xt719YGYn5cNYkVCsp01MVjhnuiuDWsf+iKlBywN1TPG9ai3f4ZYwesd99IZHf3XdM
 mu91T0K6g9szQo6sdUVILxKUtSMJvMnXQf0R8yZzgLin5KDyM0AmcQSln8DaHJ3m1dC3
 7ZovlegZrPxoEOyspm4mYbFoBSXpjA6QMtUbZl5xr5rgP4XbArf/RimB22eaqOpP/rVi
 kL8BCXKYYC6tLVmBMGbusg/GQDvZwPYAsPFzVuXknttIaeKXBCQVi2vsAMW5UbY+OaFV
 0DDnpCY919KnblgCS+e9yceOUyolrM5RaJMozZJyMVHk2HdtjMmE5Rmod99ds+oSUr/C
 kRhA==
X-Gm-Message-State: AOJu0YzKuiAraUq1tPp3bBxGfYC42jtc4BZA57rvDA3V/cEO2Bk66knL
 uF2JpPVaWSZ0s02HLhrNgSdU3Mpd+xgkG45fB0E+QykubWaV3w6yNhbbXkr7RB7xQybRTf345kn
 aqDsMK1foeIfqCDmw5WdwYnEGA/I=
X-Google-Smtp-Source: AGHT+IE98h2b1bCkaMlZBpFWFQq/Bpe4ipLe8yJbcU6bm//YdRdChESgg8ak9XXPoOE/Urs1t4SRZ847vPFN5S/KexY=
X-Received: by 2002:a05:6000:4027:b0:368:654:9329 with SMTP id
 ffacd0b85a97d-3680654941emr1412084f8f.6.1720792838043; Fri, 12 Jul 2024
 07:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <bae05249-8ad9-4acc-90dc-15c783e8e921@mind.be>
In-Reply-To: <bae05249-8ad9-4acc-90dc-15c783e8e921@mind.be>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 12 Jul 2024 16:00:01 +0200
Message-ID: <CA+TH9V=ZHiZLdXFsgiShoA3Hzr0y2ZNPXiiCm1J0qOu+jy1mKg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720792838; x=1721397638; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v13R6bD4Oz1ZNsDGbxUAqM9EZ1O0yHNF5xCZQOLKjXk=;
 b=kbnSNwTSnFsP4c+vOnKcBexI7ksmxTmis1rR3K/Q2RqBZpInZLAGY3+wsSxjFR4iz8
 FGo32tSeT8xb6WpCvNUjgY4Au9UG9p71eD/DD5prOyCqji/DQ1KPnCnKxA4v+nlXHzpt
 NuRRzRbXvXtW/57wVWHH72llaLew3fwuXHb85pN6u3ppXOpA0GO00EzuOMRU79AXJwLN
 uOYsxkFmkIE2DRyPRjKRm2CYA7odfPs1/zyX50dM8oZJrj9gvkaKRNhQFHWCr5mIqlYI
 sOGDWJSHRA09lannWer46gAvCzbaN04uN9XxOG3DiDsJa9R4eDigudcoDwYKvoSgBkKS
 0FIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kbnSNwTS
Subject: Re: [Buildroot] [PATCH 0/2] Fix fail2ban
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
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1294753142161412930=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1294753142161412930==
Content-Type: multipart/alternative; boundary="000000000000d8047f061d0d4d45"

--000000000000d8047f061d0d4d45
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 12 lug 2024 alle ore 15:42 Arnout Vandecappelle <
arnout@mind.be> ha scritto:

>
>
> On 19/04/2024 23:32, Angelo Compagnucci wrote:
> > This series fixes fail2ban not installing configuration files in /etc
> anymore.
> > While fixing the problem, I discovered a bug in the way we invoke the
> > pyinstaller.py in pep517 compatibility.
> > Basically, pyinstaller.py will install data_files defined in setup.py
> > and tarballed in the wheel inside the directory pointed by the --data
> parameter,
> > which is nowadays pointing to /usr of TARGET/STAGING directory.
> >
> > I consider this wrong, because the data folder shall point to the
> > TARGET_DIR/STAGING_DIR to be correct and we shall trust the destination
> path
> > expressed in the setup.py.
> >
> > In the case of fail2ban, configuration files end up being installed in
> > /usr/etc/fail2ban instead of /etc/fail2ban.
> >
> > v1 -> v2:
> > Fix signed off with correct email.
> > v2 -> v3:
> > Fix commit author too
> >
> >
> > Angelo Compagnucci (2):
> >    package/fail2ban: fix data_files installation path
> >    package/pkg-python: fix pep517 data files installation
>
>   Applied both to master, thanks.
>
>   I added the Upstream: tag as suggested by Fiona. Still, I think it would
> be
> good to report the issue upstream, so they can take it into account when
> they
> eventually get around to migrating to a pep517 build system.
>
>   I also changed the order of the two commits, and removed the Fixes entry
> from
> the one in pkg-python.
>
>   Do you know if this issue also occurs on 2024.02.x and 2024.05.x?
>

I sent the patch on April 19 to silence the numerous package failings I was
already receiving. Not sure for the 2024.05, but surely the 2024.05 is
affected.

>
>   Regards,
>   Arnout
>
> >
> >   ...001-setup.py-fix-data-relative-paths.patch | 73 +++++++++++++++++++
> >   package/pkg-python.mk                         |  4 +-
> >   2 files changed, 75 insertions(+), 2 deletions(-)
> >   create mode 100644
> package/fail2ban/0001-setup.py-fix-data-relative-paths.patch
> >
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000d8047f061d0d4d45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 12 lug 2024 alle ore 15=
:42 Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.=
be</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
On 19/04/2024 23:32, Angelo Compagnucci wrote:<br>
&gt; This series fixes fail2ban not installing configuration files in /etc =
anymore.<br>
&gt; While fixing the problem, I discovered a bug in the way we invoke the<=
br>
&gt; pyinstaller.py in pep517 compatibility.<br>
&gt; Basically, pyinstaller.py will install data_files defined in setup.py<=
br>
&gt; and tarballed in the wheel inside the directory pointed by the --data =
parameter,<br>
&gt; which is nowadays pointing to /usr of TARGET/STAGING directory.<br>
&gt; <br>
&gt; I consider this wrong, because the data folder shall point to the<br>
&gt; TARGET_DIR/STAGING_DIR to be correct and we shall trust the destinatio=
n path<br>
&gt; expressed in the setup.py.<br>
&gt; <br>
&gt; In the case of fail2ban, configuration files end up being installed in=
<br>
&gt; /usr/etc/fail2ban instead of /etc/fail2ban.<br>
&gt; <br>
&gt; v1 -&gt; v2:<br>
&gt; Fix signed off with correct email.<br>
&gt; v2 -&gt; v3:<br>
&gt; Fix commit author too<br>
&gt; <br>
&gt; <br>
&gt; Angelo Compagnucci (2):<br>
&gt;=C2=A0 =C2=A0 package/fail2ban: fix data_files installation path<br>
&gt;=C2=A0 =C2=A0 package/pkg-python: fix pep517 data files installation<br=
>
<br>
=C2=A0 Applied both to master, thanks.<br>
<br>
=C2=A0 I added the Upstream: tag as suggested by Fiona. Still, I think it w=
ould be <br>
good to report the issue upstream, so they can take it into account when th=
ey <br>
eventually get around to migrating to a pep517 build system.<br>
<br>
=C2=A0 I also changed the order of the two commits, and removed the Fixes e=
ntry from <br>
the one in pkg-python.<br>
<br>
=C2=A0 Do you know if this issue also occurs on 2024.02.x and 2024.05.x?<br=
></blockquote><div><br></div><div>I sent the patch on=C2=A0<span></span><sp=
an class=3D"gmail-pull-right">April 19</span> to silence the numerous packa=
ge failings I was already receiving. Not sure for the 2024.05, but surely t=
he 2024.05 is affected.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0...001-setup.py-fix-data-relative-paths.patch | 73 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer=
" target=3D"_blank">pkg-python.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 75 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/fail2ban/0001-setup.py-fix-data=
-relative-paths.patch<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Profile: <a h=
ref=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_blank">http:=
//it.linkedin.com/in/compagnucciangelo</a></div></div>

--000000000000d8047f061d0d4d45--

--===============1294753142161412930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1294753142161412930==--
