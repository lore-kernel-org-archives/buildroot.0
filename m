Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BB1E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B704181FBA;
	Wed, 11 Dec 2024 19:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwgwX6Bx6MDR; Wed, 11 Dec 2024 19:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B9581FE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B9581FE8;
	Wed, 11 Dec 2024 19:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C391ED7
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC22842F45
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvGJN7NQUYXc for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=tommyclee101908sun@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A194342F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A194342F6B
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A194342F6B
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:29:54 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-85ba92b3acfso1889920241.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733945393; x=1734550193;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+0P27TNVvpt+tfnLcBIhIE2icqZ6SgqmJVglYHZcT2g=;
 b=gGpnttFA4GdsGzcq3kP91CZCTyAptubG3v3Xe9BaHnL8AeZIS59LYx+k/6tGQDmLZK
 TEOnvfApInUiVtNu5e6hgDDUWGebpXjH17klOyv7qWGq8d3nxMgAayGzF5E8DwQvtCsq
 aP3Ztj6Vsz8nPq4xtUjWFjE8l99LhzngUZNElLZKxH06ODvrZmgN3CI1Uha6xE5W0+DE
 9p7eR70fALViai2ljyf+klob9wucOvU06jfikkFCluz9jbIVzufBdFire4HwtNYgLOeb
 UpHF9+KRsXr24NHLnAdVt89C9mG1ar1juEKBmLP8Si99vyjShR5o+Soe5JzHy1yzG9sX
 t20w==
X-Gm-Message-State: AOJu0YzUb3ggV5PbzGdNDQtl09+ayBYshQbEZ7GCJWyinGdRSsS+qNnf
 NMx6GVWQOznoJNfe+zxE5WAZvkNy4DpysC6iEfafUg6xp2CbqwhB+P7MS7Rg+tBZUDZjvm7o2/X
 IN245U74dqmYsgHEjnsF5tg+uE372qOQr
X-Gm-Gg: ASbGncsWSspznq0wgFEqjsi913sEvMIujnTkRF4gC2PXvTHrNUH8Ey8w+XfVJ/Bkjm6
 vyrckJD4wwymxP44eQXf7kyQvNh0UUp9DhVhA
X-Google-Smtp-Source: AGHT+IGOfFUYDj6Wn5ZOjtEzlfcJtCivKZCCw6pcYzW/PQcv4n6CDvojpa5bqZsPD8yFH0RFRAPF0vXVjT3+1Gy7uZc=
X-Received: by 2002:a05:6122:169b:b0:518:79f2:9345 with SMTP id
 71dfb90a1353d-518b5cf9e60mr746705e0c.4.1733945393233; Wed, 11 Dec 2024
 11:29:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGJPcGYG2eOTcC8XeKmj30KcVc1PbpN7GpkmotJd-WZQkEG_8g@mail.gmail.com>
In-Reply-To: <CAGJPcGYG2eOTcC8XeKmj30KcVc1PbpN7GpkmotJd-WZQkEG_8g@mail.gmail.com>
From: Tommy Lee <tommyclee101908sun@gmail.com>
Date: Wed, 11 Dec 2024 11:29:42 -0800
Message-ID: <CAGJPcGazLoNez3O8y5i5MhjLyG2+2k9u-FhdaDKqLW6cJx-osA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733945393; x=1734550193; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+0P27TNVvpt+tfnLcBIhIE2icqZ6SgqmJVglYHZcT2g=;
 b=BjcRrBflr+M2ZKL52Oc5DBjSsy0rGL6lgf+vS7RnXA5Fu9Jv0vJMw3UvlUuUFikB3Q
 wIw57Q9Y5a4W2kkP37UyXKOjr8R7wy6skcvMNLyPCMoK87igF1LG08E4s49bpYH6ZG6y
 lRymY6wUQGkson31oeEH3tsy53CBENn2RB/1uj2x3UuaTFXzS1wAWm0Eyb6AGJU/OIpU
 zEC+ASPaTKy8TWi5boCICZs3FYUUFhveDJ8wDZLkjA2/johwdHJfJ+kuXGd1Vw+l5PhF
 OMjaRQQJUewMROZ6SJXEcLMjH/HvLr35xF4h9END03yc7KpvoFd8Y/KldJdPU0xGbYPP
 /lxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BjcRrBfl
Subject: Re: [Buildroot] The buildroot release which has the gdbserver
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
Content-Type: multipart/mixed; boundary="===============5440371121128859763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5440371121128859763==
Content-Type: multipart/alternative; boundary="0000000000003946a10629039fb8"

--0000000000003946a10629039fb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Buildroot,
I am trying to succeed in enabling Buildroot remote debugging. My host
is Ubuntu 24.04.1 LTS running buildroot 2021.05.x; my target is rpi3mb.
In "make menuconfig", I just figured out BR2_TOOLCHAIN_HAS_THREADS=3Dy can
enable BR2_PACKAGE_GDB=3Dy & BR2_PACKAGE_GDB_SERVER=3Dy
Once I succeed in the make process, I will try to see gdbserver on my
rpi3mb.
Comment please...
Thanks,
Tommy


On Wed, Dec 11, 2024 at 9:27=E2=80=AFAM Tommy Lee <tommyclee101908sun@gmail=
.com>
wrote:

> Hi Buildroot,
> I am glad to be a new member on the Buildroot list.
> Please tell me whether I should send my buildroot technical issue to
> buildroot@buildroot.org.
> Thanks,
> Tommy
>

--0000000000003946a10629039fb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D"">Hi Buildroot,=
</div><div class=3D"gmail_default" style=3D"">I am trying to succeed in ena=
bling Buildroot remote debugging. My host is=C2=A0Ubuntu 24.04.1 LTS runnin=
g buildroot 2021.05.x; my target is rpi3mb.</div><div class=3D"gmail_defaul=
t" style=3D"">In &quot;make menuconfig&quot;, I just figured=C2=A0out BR2_T=
OOLCHAIN_HAS_THREADS=3Dy can enable BR2_PACKAGE_GDB=3Dy &amp; BR2_PACKAGE_G=
DB_SERVER=3Dy</div><div class=3D"gmail_default" style=3D"">Once I succeed i=
n the make process, I will try to see gdbserver on my rpi3mb.</div><div cla=
ss=3D"gmail_default" style=3D"">Comment please...</div><div class=3D"gmail_=
default" style=3D"">Thanks,</div></div><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Tommy<br></div></div></div></div></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 11, 2024=
 at 9:27=E2=80=AFAM Tommy Lee &lt;<a href=3D"mailto:tommyclee101908sun@gmai=
l.com" target=3D"_blank">tommyclee101908sun@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
<div class=3D"gmail_default"><span style=3D"font-size:xx-large"></span>Hi B=
uildroot,</div><div class=3D"gmail_default">I am glad to be a new member on=
 the Buildroot list.=C2=A0</div><div class=3D"gmail_default">Please tell me=
 whether I should=C2=A0send my buildroot technical issue to=C2=A0</div><spa=
n style=3D"color:rgba(0,0,0,0.87);font-family:Roboto,RobotoDraft,Helvetica,=
Arial,sans-serif;background-color:rgb(248,250,253)">buildroot@buildroot.o<s=
pan class=3D"gmail_default">rg.</span></span></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Thanks,=
</div><div>Tommy<br></div></div></div></div></div></div></div>
</blockquote></div>

--0000000000003946a10629039fb8--

--===============5440371121128859763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5440371121128859763==--
