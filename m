Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7177FC02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 06:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B084083F;
	Tue,  4 Feb 2025 06:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7F2VCcsWntl; Tue,  4 Feb 2025 06:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 936A840843
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 936A840843;
	Tue,  4 Feb 2025 06:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1055E12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87E34083F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzGEzDYfY1Iz for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 06:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98F1F4083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F1F4083E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F1F4083E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:19:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43618283dedso52990435e9.3
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 22:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738649965; x=1739254765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/VSVjmd1nBy27D9rk5Njwl4m1dj2HjZHzTT1IHYGEY=;
 b=vwuogAxqAe6OwfshVeMPZIqAb0bYzWW+zgFfcbvRhkGJrEsmlP5e/wseRvUQLT7i7u
 OuTlprViccsKxfmPPKQ/tlyWk7NEMoGXtz10ZxNbsUnbdK0E8695MqBOC/CEMoAZzgYu
 oIaP2+ppYQonN2dLGMjhnGqGc+HB2YIuiNb9dHXAaWONMSNS6v1am+oSrzYR32cWCu6Y
 XVgbe4IclJDL5Qf+eA7O2mN8C2JsdHGa/vSrP5yH8Eay6dwgLVd3WbJuWtptuc88D2LB
 q/Oe+WMSpLmZxPt7aj5Gj9/4NrZIyz46f3qBx90ucmXnQjo+B0wdrD4oLvN1hDwb6tbT
 KYqw==
X-Gm-Message-State: AOJu0YwjkNl7S4I/bmrhxv5kTsi5/VSE5OL3RSXmJfZNiAInYZJdwjTZ
 QqTlaThDjOqRpRhtkbhym54yaaZfsmK8+PdtaDV6Lel3DG+58Pj0SVZd+dmsQqWLoLZFj779Mqv
 NDhpdg/h5GsGfVWVjxqIZXG3Vzxs=
X-Gm-Gg: ASbGncuCeXSWw+gkVBaTuWs4CY2JB+C2EZBgx5Eevxr2Dk3UPFKxGsOSWL/UEJiZ7c4
 E7aE5uVnV3sWNADpPetNI4sOOGtWO1LC72kNxNvUsILiKli/KvD8arDR48YayfJTCXOx7huzSHe
 SSXdaeEuEQmXXFUuUeWtJuBcUEbWaGFw==
X-Google-Smtp-Source: AGHT+IGb5dbpL59GaxWK/ukkI+FKN9DmFFlf/MtcDkM4ZCjH8DNLkEylCyE02B9zHpXwbNBRs9lPWU3tBv/55kMYEzE=
X-Received: by 2002:a05:600c:3b9f:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-438dc3caa6cmr229085425e9.16.1738649965269; Mon, 03 Feb 2025
 22:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20250125211657.14994-1-peter.macleod.thompson@gmail.com>
 <deb392c270c7b7940ea16d8bc7521302@free.fr>
In-Reply-To: <deb392c270c7b7940ea16d8bc7521302@free.fr>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 3 Feb 2025 23:19:14 -0700
X-Gm-Features: AWEUYZmbMBNRsPgvCZ6Zexi0NubRD0NUkaOyeBVlzurwEq1ql8YDlEaTGYqG5B8
Message-ID: <CAGrGpJBd_g3eAe2YNyc2geJT4vB--NR4_iQ+w1B=RubjD6yNLA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738649965; x=1739254765; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B/VSVjmd1nBy27D9rk5Njwl4m1dj2HjZHzTT1IHYGEY=;
 b=BWSrjvLdXTEX6fodaoZnZalykq8mPLszltpEJgJ1bGxUpkGLdZdt8TtrIYP3RRW5D7
 e326TXw6XETQhIIU1ze8lHNRMbR5cDkoslUKAh4TLg/4j5xyN9DnAnvGkYqrOwmlxrsm
 OClHmrVRIGJrT02moKQCgY44qmYYuW8NsyFNf5rWvFke94Nn7EmJQlJhS4bq60QkIgsL
 Cn8tFRuhCrcJHwKMkw9rpmdInhPi6R/GCZZoa1psvvYrHkrt9UNGWkJiJHngWNdVH+FV
 m0krqzgV8Qk6A9/XCHrgNcPCzNaJyBLws8k3C2HNfD82j5pz53eFbA/NkN9mVaBTHrND
 JX0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BWSrjvLd
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.24.0
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
Content-Type: multipart/mixed; boundary="===============4316764120562206690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4316764120562206690==
Content-Type: multipart/alternative; boundary="000000000000919e24062d4afdb0"

--000000000000919e24062d4afdb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,
Thanks for the note re error in the patch.   I will fix and send an updated
patch.

Peter


On Sun, Jan 26, 2025 at 3:33=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrote=
:

> Hi Peter,
>
> Thank you for the patch.
>
> On 25/01/2025 22:16, Peter Thompson wrote:
> > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> >
> > Signed-off-by: Peter Macleod Thompson
> > <peter.macleod.thompson@gmail.com>
> > ---
> >  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
> >  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/sdl2_ttf/sdl2_ttf.hash
> > b/package/sdl2_ttf/sdl2_ttf.hash
> > index 7693aeba6b..452dc82dbe 100644
> > --- a/package/sdl2_ttf/sdl2_ttf.hash
> > +++ b/package/sdl2_ttf/sdl2_ttf.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> > d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723
> > SDL2_ttf-2.22.0.tar.gz
> > -sha256
> > a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139
> > LICENSE.txt
> > +0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd
> > SDL2_ttf-2.24.0.tar.gz
> > +7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6
> > SDL2_ttf-2.24.0/LICENSE.txt
>
> The "sha256" hash type is missing here.
>
> Can you send an updated patch please?
>
> Best regards,
>
> Julien.
>

--000000000000919e24062d4afdb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien, <br></div><div>Thanks for the note re erro=
r in the patch.=C2=A0=C2=A0 I will fix and send an updated patch. <br></div=
><div><br></div><div>Peter</div><div><br></div></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, Jan 26, 2025 at 3:33=E2=80=AFAM Julien Olivain &lt;<a href=3D"mailto:ju.o=
@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi Peter,<br>
<br>
Thank you for the patch.<br>
<br>
On 25/01/2025 22:16, Peter Thompson wrote:<br>
&gt; From: Peter Macleod Thompson &lt;<a href=3D"mailto:peter.macleod.thomp=
son@gmail.com" target=3D"_blank">peter.macleod.thompson@gmail.com</a>&gt;<b=
r>
&gt; <br>
&gt; Signed-off-by: Peter Macleod Thompson <br>
&gt; &lt;<a href=3D"mailto:peter.macleod.thompson@gmail.com" target=3D"_bla=
nk">peter.macleod.thompson@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--<br>
&gt;=C2=A0 package/sdl2_ttf/<a href=3D"http://sdl2_ttf.mk" rel=3D"noreferre=
r" target=3D"_blank">sdl2_ttf.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/sdl2_ttf/sdl2_ttf.hash <br>
&gt; b/package/sdl2_ttf/sdl2_ttf.hash<br>
&gt; index 7693aeba6b..452dc82dbe 100644<br>
&gt; --- a/package/sdl2_ttf/sdl2_ttf.hash<br>
&gt; +++ b/package/sdl2_ttf/sdl2_ttf.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # Locally calculated<br>
&gt; -sha256=C2=A0 <br>
&gt; d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723=C2=A0=
 <br>
&gt; SDL2_ttf-2.22.0.tar.gz<br>
&gt; -sha256=C2=A0 <br>
&gt; a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139=C2=A0=
 <br>
&gt; LICENSE.txt<br>
&gt; +0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd=C2=
=A0 <br>
&gt; SDL2_ttf-2.24.0.tar.gz<br>
&gt; +7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6=C2=
=A0 <br>
&gt; SDL2_ttf-2.24.0/LICENSE.txt<br>
<br>
The &quot;sha256&quot; hash type is missing here.<br>
<br>
Can you send an updated patch please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000919e24062d4afdb0--

--===============4316764120562206690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4316764120562206690==--
