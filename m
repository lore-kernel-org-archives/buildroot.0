Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 04:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91F440363;
	Mon, 29 Jul 2024 04:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX36Bsbqtgke; Mon, 29 Jul 2024 04:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C184032F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C184032F;
	Mon, 29 Jul 2024 04:00:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 042121BF95C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F28DE60775
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53Q3qQ2ZlPM2 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 04:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEE546059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE546059F
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEE546059F
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:00:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5af2329d5e1so236293a12.3
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 21:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722225645; x=1722830445;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DEIsDW3GiCJjqzEQRDpEG+bzL3Q4vaMxEctQgP+LtgQ=;
 b=PfNTcgd7yIfbR8PTgGXR8g7zztp935xP4PPM4H7aDTb1fPVfXDLCBM6GTBNqED23PX
 GvqJJ2sBENm/ZJYukAUyNn/y8haSXrI9iXliQPndiQtVgdrS9bnm6FS/VcPfcjjzqfPu
 CO1SgNKVjAOGFyhbvwxsICOEBcIoQf/U3gbV1yEGYh5DYZ8ECKiOAOqJkEpYiA77aQSX
 CyvAQNq2RdwLayT26meDmffeqQJHgootNpbLWdlSlAHMbeV/+i9vczQU0GTXrdpOq3p8
 iPJmAPpMudR3Lkr7Oh+3vEzCWIZTms10NbluN7TLvQMpEIfQp57V9DhT+4vsYjbKF7j4
 +FHQ==
X-Gm-Message-State: AOJu0Yyo68r6TVOAGrDS08ShjLFzAnAfnDKZ4xS9yGRJSHb4Vq6FdNXS
 sQGeY6zj9GxUIPylMoqyKT4cu4ebc2xs5fqVjGaeL4YzAUwruscFKtjbQnGbH7p3ebG9u8kdBSh
 oHid1gbayKWWthTdbIfEuqQIspu8=
X-Google-Smtp-Source: AGHT+IG/a3yo8KpoxsElURYV0m11gYfWvmg1raazEYR/KwxwLmLA5pkxxYaRyG+OaOcYNhHDrNV/yjd/7mdqpp82b0g=
X-Received: by 2002:a17:907:3fa8:b0:a7a:acae:341b with SMTP id
 a640c23a62f3a-a7ac5a9dcd0mr570340566b.9.1722225645224; Sun, 28 Jul 2024
 21:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
In-Reply-To: <20240728221140.01aa7ed1@windsurf>
From: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Date: Mon, 29 Jul 2024 07:00:33 +0300
Message-ID: <CA+RUeSojm7AejLN5c94ErGNdNkvs-P9jsnyQnR1fBwKoNeJc=w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722225645; x=1722830445; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DEIsDW3GiCJjqzEQRDpEG+bzL3Q4vaMxEctQgP+LtgQ=;
 b=eKnEa9qEueECBxc4YdzOw07iHj022GrBZWzggE8LbbXSTeHbyyac23jm228vCIzMG+
 V3gNOdWZfMQMyNOeROsWbnwYQLHhZWflyJ/I6/mkdzcI2X7zrs0/alwVAUQ6jIR4IJfA
 OT3U+pYamm8f2AGee1QJ93IoBoWwxarGoo0qX4HclY3wB3tH8v9YhG6ogwUewAFHVf5y
 0H/aoL+5FFYSGZGH/UKQzoDb2TX1qca/TuRU2PcQHUHGOLKumHq06o3s09gmsRxTNnOs
 z7Icw7XlfonuVZ/9DpLnHrZFMP0opJAq3i7mwa6h5TauXYlLemzs61cZ1kjdp/sjchU1
 88Qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eKnEa9qE
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Content-Type: multipart/mixed; boundary="===============3660132885244927840=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3660132885244927840==
Content-Type: multipart/alternative; boundary="000000000000ce8892061e5ae78a"

--000000000000ce8892061e5ae78a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will take a look :)

=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3., 23:11 Thomas Pet=
azzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sun, 28 Jul 2024 19:21:20 +0300
> Dmitriy Chestnykh <dm.chestnykh@gmail.com> wrote:
>
> > Hello Thomas
> > The SuperH4 issue has already been fixed by patch number 0002 (
> >
> https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce=
113bfbbc03d4b8e4df7
> > )
>
> Indeed, thanks!
>
> I still have an issue with SuperH 4 though.. it doesn't boot in Qemu:
>
>
> https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/139114678=
2
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ce8892061e5ae78a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I will take a look :)</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB.=
 2024=E2=80=AF=D0=B3., 23:11 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.=
petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hello,<br>
<br>
On Sun, 28 Jul 2024 19:21:20 +0300<br>
Dmitriy Chestnykh &lt;<a href=3D"mailto:dm.chestnykh@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">dm.chestnykh@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello Thomas<br>
&gt; The SuperH4 issue has already been fixed by patch number 0002 (<br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/f463a49=
53534df13397ce113bfbbc03d4b8e4df7" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df1=
3397ce113bfbbc03d4b8e4df7</a><br>
&gt; )<br>
<br>
Indeed, thanks!<br>
<br>
I still have an issue with SuperH 4 though.. it doesn&#39;t boot in Qemu:<b=
r>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/toolchains-builder/-/pip=
elines/1391146782" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1391146782</a><br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000ce8892061e5ae78a--

--===============3660132885244927840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3660132885244927840==--
