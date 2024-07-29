Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB3C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 04:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F0AB607BC;
	Mon, 29 Jul 2024 04:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7FeYMC7RbWv; Mon, 29 Jul 2024 04:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0536607B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0536607B2;
	Mon, 29 Jul 2024 04:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068331BF30C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E73074016D
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmt5NqURLcVO for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 04:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64085400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64085400C5
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64085400C5
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:35:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5b1a00750a4so114368a12.2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 21:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722227753; x=1722832553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qic5Xb3ioa55pdUfJDd64Lb+V5FtmhRv9UHhxstchp0=;
 b=Xe6l6JSL92Z3+74X75uKlmkmxcXj9vS9g358xuGKAUcTFR/i0Strb2lXKZV8xNEwnN
 xS44EDPeC47712awoRMHfJh64BpphYA1Mde7POOVfY7cIWSxOfuBu6LN09W2zWJG96Wp
 3u99pV8d4gdIIaNI/H9YHjb3zCU+ZTQufqOnBjKIo/SRuUhsybruiLwXzphaTBlxVVAO
 sqeciYszu97uFELWjHkuFCp3W8l6rWZA9Uq/o5vAOq0rH0JTv6Jl9JncieiQv92h24uO
 ZdZ6Efc+PTr+tNAi7U888sPW9/9n4zClPOQ0QOH/n2h4WER00yPeYzIMCBeALbLml7Ed
 jcKQ==
X-Gm-Message-State: AOJu0YzuLu+Yso3PTdZvsP/4ujQKkD+FTGH30pYmev64ATXaxKJTCavp
 Tp0Sd4zTWm/QvmpYidFFIRt7dOPSJKkQUvJ27Qe1YLt4hObX6RxWXwnd8uEQHXqa5kR+YU+fR/q
 yuZmtTovS7iRiC7zds5TQmCW/DlE=
X-Google-Smtp-Source: AGHT+IHEMdD4Ts0H4DdVyGMMJkmAPeGd6BxUZqYrgPd5DpSGaKDQpkE/Fs67TFVZjds1nf5slPY34GFCdUIuDuEhKHU=
X-Received: by 2002:a17:906:6a1d:b0:a7a:a763:842a with SMTP id
 a640c23a62f3a-a7ac5a5b78emr554880066b.8.1722227752477; Sun, 28 Jul 2024
 21:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
In-Reply-To: <20240728221140.01aa7ed1@windsurf>
From: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Date: Mon, 29 Jul 2024 07:38:12 +0300
Message-ID: <CA+RUeSpHZdf5uMFQi37xum67Ro7w6TJZRF-oeYc1ma8CtWfwWg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722227753; x=1722832553; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qic5Xb3ioa55pdUfJDd64Lb+V5FtmhRv9UHhxstchp0=;
 b=BsNmDhhJCB7tCyYO0HWxvlEvDenq6H6vsVVQJ031uTbP6gTo1pdz29lpp94qgR4EbU
 SCfyC87Kv/feYy3zGkUNwcCZhqTiBxB7tZAgBlrqf6DmfhgoO3H5OIH3Ah5+6tWaYBan
 TtKu/EM5rSnD6yNEDOckJIQz2X8Zx2SQYzRI4oP6hzzvSzz2/jiYSfIR4DLII0DIo97R
 +1N8X4gbstUEIptHhaBz2S3RQ/fmxjKhr+MzMJMutaCSfVzEAOjYXUajz1pRdKryYuwm
 dnxc13Vd7/ka5wEe/esW5iW9+TE9tFkWGiDpu2hwnreA9vs7A0ROVWP+0IGAMzjeaH6W
 vqww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BsNmDhhJ
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
Content-Type: multipart/mixed; boundary="===============2076087376897903022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2076087376897903022==
Content-Type: multipart/alternative; boundary="00000000000068ac24061e5b6536"

--00000000000068ac24061e5b6536
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which version of QEMU do you use? Recently Waldemar sent a patch where he
noticed that QEMU 9.x has an issue with SH4 emulation and the system
doesn't boot

=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2 23:11, Tho=
mas Petazzoni <thomas.petazzoni@bootlin.com
>:

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

--00000000000068ac24061e5b6536
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Which version of QEMU do you use? Recently Waldemar sent a=
 patch where he noticed that QEMU 9.x has an issue with SH4 emulation and t=
he system doesn&#39;t boot<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB. 2024=E2=
=80=AF=D0=B3. =D0=B2 23:11, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.p=
etazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Sun, 28 Jul 2024 19:21:20 +0300<br>
Dmitriy Chestnykh &lt;<a href=3D"mailto:dm.chestnykh@gmail.com" target=3D"_=
blank">dm.chestnykh@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello Thomas<br>
&gt; The SuperH4 issue has already been fixed by patch number 0002 (<br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/f463a49=
53534df13397ce113bfbbc03d4b8e4df7" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce113bf=
bbc03d4b8e4df7</a><br>
&gt; )<br>
<br>
Indeed, thanks!<br>
<br>
I still have an issue with SuperH 4 though.. it doesn&#39;t boot in Qemu:<b=
r>
<br>
=C2=A0 <a href=3D"https://gitlab.com/buildroot.org/toolchains-builder/-/pip=
elines/1391146782" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/=
buildroot.org/toolchains-builder/-/pipelines/1391146782</a><br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000068ac24061e5b6536--

--===============2076087376897903022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2076087376897903022==--
