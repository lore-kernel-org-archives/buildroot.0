Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB09C5AE59
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 01:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4968422A;
	Sun,  1 Jun 2025 01:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGjFHfye-iet; Sun,  1 Jun 2025 01:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3B08421E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3B08421E;
	Sun,  1 Jun 2025 01:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5392A127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 01:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39D7A84229
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 01:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSSfAvczcE9x for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 01:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BCD48421D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCD48421D
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BCD48421D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 01:32:35 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e812a32abfdso547415276.3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 18:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748741554; x=1749346354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vI3j8/WDkWi6sfYSqIx2+RFI7AoceHc176poXfDj4yA=;
 b=CIz9/EIrvckLZ4yZ4cVOGLs36q1h2QVb2gswD3p6u0EJb9b5A1uiMcpIPBc/ub8GWu
 /kMz03wLBVtGRH98rSCyO/KplaRxxX/b+A30HLyxvgHDMKgtQj7ulb6G23oA8nYKoGwX
 77O5cqp+WHoIh+ft9oyEYVBsC6F3Yr2TDZ8hSW/JG8nKmJxXgRQDQF6a1WSvIo1pGr4c
 WhMq6otdm03l7UxRgY2w+p1odInE66CBz24Ji02YinH+ILH3Hc5S8dmIToi3aMbw4sMO
 Zvi0XATiw6KjhQ7lEnTwdkISIKq6exKWOAtZtZE+9skMhoTxMn9M4E0l4mGkjIjfH4Jv
 GJHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2nsa/WjzCJsFMG/JDdNMtnvZ634enNHRu86At3Ry0UL7YGL/aPXda/43oP2/oOdlJGowPl2ynekY=@buildroot.org
X-Gm-Message-State: AOJu0YwHnbJunQ6ENpWs439A7e6xxO2xYojaCRkj2eRT1OB0ibZQznva
 0w++M1T8zhDGbEELcCRlHxNGMXgNkDfiycgRw0BXKcL4vIyQBxdMlG54T2m5wpOwscEopTlSeY/
 NtoMF
X-Gm-Gg: ASbGncty01n8OcMlQHec8UFiXV20aAqKFS/DIDCeS7ESmaHKcjUJVzRYnrFaq3rqbrp
 yyGx6QfVVzaCxfX97W1k9S4kQoohGIWBwPyoEMMSYdmw7DXTFj94qCptjLNST9nKW+zxZfCU4N5
 0czDCP5BnJ7RP4tDGC8OvJGht03+EfJSoFOX1ZtePee4X59lTzJwDQcBqdup/olrPi05jA1ga+A
 obGtLidFk8tKeWQYMwE6F78nnY3urJkLPXl9IslDU/v9lA6kO9QDVCjRPotAeNKbSP+gbKLupK9
 nSCVCY8F29ROuigG2A2pWezruGGaV8ndKNhUhu3OD6VtYNt2HwTWvEqB2sprwGADXqvmvNWrwf2
 1rb/Kf/2Y+o021jZZE0s=
X-Google-Smtp-Source: AGHT+IFwtXfC4HfK6xgbhHAN5VxUnb+5w5sZ9NxgLSfLHh2pRFiIMjjPT9DkvHFvG9c6g/2y7rM9Ng==
X-Received: by 2002:a05:6902:5412:b0:e72:95cb:8c96 with SMTP id
 3f1490d57ef6-e7f8209e7b8mr10108965276.26.1748741553863; 
 Sat, 31 May 2025 18:32:33 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7f735228d6sm1524106276.52.2025.05.31.18.32.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 May 2025 18:32:33 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-70e5599b795so31764457b3.3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 18:32:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1esuvFZZadi3zvis5kI6UrFEqGoAvnNN5XYnz5H9Ir1aAmAKNZRf83nOdU7dUlM9uKU4/zmJIDk8=@buildroot.org
X-Received: by 2002:a05:690c:fd6:b0:70c:a41f:8ac3 with SMTP id
 00721157ae682-70f980110c1mr128177567b3.37.1748741552682; Sat, 31 May 2025
 18:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250404182407.45244-1-christian@aperture.us>
 <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
 <20250531165014.2npnkjv763aecffp@n621.de>
In-Reply-To: <20250531165014.2npnkjv763aecffp@n621.de>
Date: Sat, 31 May 2025 18:32:21 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
X-Gm-Features: AX0GCFt7CvoHpdaLVO8K51ic20wmWvTj7fYg7e7bOVgoh9DDhzkzd6FNny2cbLI
Message-ID: <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
To: Florian Larysch <fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1748741554; x=1749346354; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vI3j8/WDkWi6sfYSqIx2+RFI7AoceHc176poXfDj4yA=;
 b=BhqYP9Fc7gFa9fwOK/2MjtbhjHfkLhTayupSJou8UjkdBtaqUNLo2UA9aNzyE8MoAB
 ewrPLiKJ6Kx5lF+M20CuRyQxoFijzyFL6x4Jz6AIV+bWmfK0jyFwGzwMrZoDLKUJ3jXj
 jkhldmiaQ8caCFbII0AAVE10uP11cwgixDygPawlc+XWO3Cg02h3AALrbWylft3uFA+Q
 pzKMqWLAQYbkRhaCZCeljNbWRVzV50ZDkXOPq7PbjYwdTr5f7iCm16DbDWtRwLM89D7F
 p5Ll7gxJzN3fEJoGa2tm+tGCKcIJnX8TkUvzap0Gy1QbZEe4PPyu7/KKB+CwpWucXY83
 ChyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=BhqYP9Fc
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Olivain <ju.o@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============0023031472461335570=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0023031472461335570==
Content-Type: multipart/alternative; boundary="0000000000000d3f190636789fbc"

--0000000000000d3f190636789fbc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



On Sat, May 31, 2025, 9:50=E2=80=AFAM Florian Larysch <fl@n621.de> wrote:

> On 04/04/2025 20:24, Christian Stewart via buildroot wrote:
> >    -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5
>
> I've only noticed this patch just now. Doesn't this have the potential
> to silently alter the behavior of packages since it effectively will
> flip a bunch of CMake policies without anybody having reviewed the
> specific CMakeLists.txt? This seems quite dangerous.
>

How could that be dangerous? You mean dangerous from a security
perspective? How so? Is there any known reason this would be the case? Fwiw
these packages would not compile at all without this flag. As far as I know
most packages already are >3.5 anyway, it was just a few that had the issue
after a cmake update.

Christian

>

--0000000000000d3f190636789fbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<div dir=3D"auto"><br></div><br><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, May 31, 2025, 9:50=E2=80=AFAM Florian Larysch &lt;<a href=3D"mailto:=
fl@n621.de">fl@n621.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 04/04/2025 20:24, Christian Stewart via buildroot wrote:<br>
&gt;=C2=A0 =C2=A0 -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5<br>
<br>
I&#39;ve only noticed this patch just now. Doesn&#39;t this have the potent=
ial<br>
to silently alter the behavior of packages since it effectively will<br>
flip a bunch of CMake policies without anybody having reviewed the<br>
specific CMakeLists.txt? This seems quite dangerous.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">How could that be dange=
rous? You mean dangerous from a security perspective? How so? Is there any =
known reason this would be the case? Fwiw these packages would not compile =
at all without this flag. As far as I know most packages already are &gt;3.=
5 anyway, it was just a few that had the issue after a cmake update.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Christian</div><div dir=3D"aut=
o"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
</blockquote></div></div></div>

--0000000000000d3f190636789fbc--

--===============0023031472461335570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0023031472461335570==--
