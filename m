Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95145C46CD3
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 22:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB6942D4D;
	Thu, 21 Dec 2023 22:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB6942D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOVrMCLXHOUF; Thu, 21 Dec 2023 22:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F1EF42D0D;
	Thu, 21 Dec 2023 22:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1EF42D0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3011BF329
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 22:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB9E942D0D
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 22:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB9E942D0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYQ5gh6f7mfS for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 22:41:35 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9D1B42CC0
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 22:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D1B42CC0
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5e734d6cbe4so12531827b3.3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 14:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703198494; x=1703803294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BnHCoHipsCeUAWaE0FFIGbP9YE8txgUjns6FHOICWII=;
 b=luN8yG0XvKvlyrSl6bVGM59Y84xFGGDgs/YJ+Pxp1mzCC/P/0IrfZW/5cm/kQCwysB
 ENZ7Y2Lh7kmrrNeUPPDjRtQvyKCogfgG/U2/ryZ5zokkTC61QPvi9+A8zOa+TvzP212Q
 AvxhaHqvIMbt0yOdAk7UsJQ1NJzLAH9g46xdaPOG+zSeCtCswJcjSvO1my+41jHbWgJ+
 GGLXfSD0cl3GelpskXICVm0K+mpLwytjJSptPsUlD65P6n1WApcWVvx3zHv772LftXrK
 5tucILvg2T4MKun5VDMzwln8C0xjviO3dkUA5svaJYk//427WBk60nwhHW57It1zTwJu
 99OA==
X-Gm-Message-State: AOJu0Yy0ejo/ge30schJEUeV/8/fl/A+qCGmh8RtcRhiUYZWp501wshz
 XktIY9mRCuRuO4CES+j7fXTIV1rkLA8RfOYIUnM=
X-Google-Smtp-Source: AGHT+IFZ3ZbM+LNCKjwSEH0JvHclAdu2yRKuzxIymSo3aFpWxHw+p7iGFBzRh9fGRjAaCzD1Muuo0qLbLvKEwLsaTy8=
X-Received: by 2002:a0d:e60f:0:b0:5e7:731f:cbfd with SMTP id
 p15-20020a0de60f000000b005e7731fcbfdmr577805ywe.42.1703198494115; Thu, 21 Dec
 2023 14:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20231218183230.1899-1-davikovs@gmail.com>
 <20231220212445.16494c0f@windsurf>
 <CAHQn7pKn5-Ss+zVkEzGow6TNm8xc2kmfkWMEXe2zZbYmFOmQPw@mail.gmail.com>
 <20231221084252.287ba580@windsurf>
In-Reply-To: <20231221084252.287ba580@windsurf>
From: Davis <davikovs@gmail.com>
Date: Fri, 22 Dec 2023 00:41:23 +0200
Message-ID: <CAHQn7pKD3HBJ96Pe90+gvsNehuALXGbXarqLDDcn8_M5hSKDrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703198494; x=1703803294; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BnHCoHipsCeUAWaE0FFIGbP9YE8txgUjns6FHOICWII=;
 b=U9JvZ+Pjc5lNKlhVCLceSlE2DDZgN760gKEvtpv6gqftmr6SeKNNYltybOBR44i7lj
 jhvJQYkhJoZCW7HM6pgXQPV1og9ahLBkbvbYL/2xoDtwsnuCyE761/jJUKjbDt2FVHYD
 jqJP+ViXGD0fpqBFl7BvRWo8Nr64TUCTdsNt3n/p1Jjdy4Fu9h+c1Nu6CJjswK63edav
 rZaPRwP6aOLh3kCHGc3xhuLMueSmIuGxMr+ZNv2cJWh3xbTIrUKGUACYizxVvJ2d9EgA
 w+NGvY41q1PVOciF9qJSHhyaRo3K/ZRDYguYGbSpLXG57KyMt09tZ+nkfj9AWq80J+eO
 6TtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U9JvZ+Pj
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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
Content-Type: multipart/mixed; boundary="===============7997174714528695690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7997174714528695690==
Content-Type: multipart/alternative; boundary="000000000000394c6d060d0ccd27"

--000000000000394c6d060d0ccd27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you!

Just one more question, BlueZ itself is covered by a license that allows
persons not affiliated with BlueZ or Buildroot to bump the package version,
correct?

Best regards,
Davis

ceturtd., 2023. g. 21. dec., plkst. 09:42 =E2=80=94 lietot=C4=81js Thomas P=
etazzoni (<
thomas.petazzoni@bootlin.com>) rakst=C4=ABja:

> Hello Davis,
>
> On Thu, 21 Dec 2023 01:31:28 +0200
> Davis <davikovs@gmail.com> wrote:
>
> > Can somebody who understands the legal side better sign off this change=
?
> > I sent the patch as discussed here
> >
> https://lists.buildroot.org/pipermail/buildroot/2023-December/681118.html
> > The patch itself (the few build configuration lines it adds) was
> > created by me in my spare time and I submit it under Buildroot's
> > license (GPL 2 or later).
>
> Then, you are able to add your Signed-off-by at the end of your commit
> message, and resubmit the patch, that's all what's needed.
>
> Look at all other patches posted to the list, it will show you an
> example of what the Signed-off-by line should look like.
>
> There is also a great deal of information on how to submit patches to
> Buildroot in our documentation at:
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000394c6d060d0ccd27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Thank you!</div><div><br>=
</div><div>Just one more=C2=A0question, BlueZ itself is covered by a licens=
e that allows persons not affiliated with BlueZ or Buildroot to bump the pa=
ckage version, correct?</div><div><br></div><div>Best regards,</div><div>Da=
vis</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">ceturtd., 2023. g. 21. dec., plkst.=C2=A009:42=C2=A0=E2=80=94 liet=
ot=C4=81js Thomas Petazzoni (&lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt;) rakst=C4=ABja:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello Davis,<br>
<br>
On Thu, 21 Dec 2023 01:31:28 +0200<br>
Davis &lt;<a href=3D"mailto:davikovs@gmail.com" target=3D"_blank">davikovs@=
gmail.com</a>&gt; wrote:<br>
<br>
&gt; Can somebody who understands the legal side better sign off this chang=
e?<br>
&gt; I sent the patch as discussed here<br>
&gt; <a href=3D"https://lists.buildroot.org/pipermail/buildroot/2023-Decemb=
er/681118.html" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroo=
t.org/pipermail/buildroot/2023-December/681118.html</a><br>
&gt; The patch itself (the few build configuration lines it adds) was<br>
&gt; created by me in my spare time and I submit it under Buildroot&#39;s<b=
r>
&gt; license (GPL 2 or later).<br>
<br>
Then, you are able to add your Signed-off-by at the end of your commit<br>
message, and resubmit the patch, that&#39;s all what&#39;s needed.<br>
<br>
Look at all other patches posted to the list, it will show you an<br>
example of what the Signed-off-by line should look like.<br>
<br>
There is also a great deal of information on how to submit patches to<br>
Buildroot in our documentation at:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#submitting-pa=
tches" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads=
/manual/manual.html#submitting-patches</a><br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000394c6d060d0ccd27--

--===============7997174714528695690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7997174714528695690==--
