Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03918E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 07:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A225D8113F;
	Wed, 11 Dec 2024 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jACPIZYUPiJz; Wed, 11 Dec 2024 07:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37B981146
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37B981146;
	Wed, 11 Dec 2024 07:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD4A6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 953A240605
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYYZGoP4S2jB for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 07:39:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59FBC405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59FBC405D8
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59FBC405D8
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:39:47 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6ef6ffcc2dcso2636827b3.1
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733902786; x=1734507586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z1KgS7RlRqk8UPM7jg0IAJvZnuPDhYqmZFa48PaGQoE=;
 b=DghQq99uj/aJmDNV9pQVCfXqbWBAmN2qS1KFaTftBtWlr8jr5T8raj52sLWA6Adc0z
 2EEDGGWLAbscGeqmj6ntLHt1iVJVcKh+R1OqvJTf7OdKpgj71mir8H7ZWf9zchQQLpKi
 aEBx7AupN3F30zD4/F560bJyvi17pjaXh5XEah1Xi1fmS1cvImHcXff+ZutbkVgEijtt
 FvoRcDICeQi+gq7KMB4C1zbS1iBIZ1g6QWmAl/n60NMWEYqu3ubqYVehdpJAt8zlTk7S
 O4n5vNHYjBhiv0TkJY8X3lDHG+oyNu77n/BA01OSWFgAM6dl1YCEJvrCtBdffAtXGtvN
 NyRw==
X-Gm-Message-State: AOJu0YyE4y/Q/82CzEfRY2SsPPZvsPn55CQAEAJFzPJLVfpTKdCBGveQ
 Q000rpVQA61xWqjeXf8CgsZ2tCY7JuzxUjXvdmcZGcRgAIqd7Q9e8gYwIO4RJhN7+cfja/n7nEZ
 0KL9toDn5j7aF4gcZbwlrMzh4aE7ZMTAA3jrapQ==
X-Gm-Gg: ASbGncsecku2hugzY3dWgQBA+1ZcsmtJEakaiofYNLNUkeXX4LqtVMWu42ZfG08U0qs
 hl+0l5yi35/3o5v6192wD44crcrWZTgRoe4mWJg==
X-Google-Smtp-Source: AGHT+IHwdjqvWKLJxuknok57wfvuoy50TWDz2hHzsk+a+rurl5KvMXgtfiA4e0eB3E2Ix0TcOQkmisjHmulyPP+LgG0=
X-Received: by 2002:a05:6902:4c4:b0:e38:c8bd:e31f with SMTP id
 3f1490d57ef6-e3c8fa29dd1mr1724556276.17.1733902785984; Tue, 10 Dec 2024
 23:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20241211004940.14204-1-christian@aperture.us>
 <878qsm7lwt.fsf@tarshish>
In-Reply-To: <878qsm7lwt.fsf@tarshish>
Date: Tue, 10 Dec 2024 23:39:35 -0800
Message-ID: <CAEpB38Ma9TR+Saf8zmHOWNKA0AODR23DG4Mi2B_yPp444B7p_A@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1733902786; x=1734507586; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z1KgS7RlRqk8UPM7jg0IAJvZnuPDhYqmZFa48PaGQoE=;
 b=WFkPyPC4wiqHawPgk1ZxxHlA7E+w0+mNcJ6wiNsBEbqFLhgKXbLGUeADVbP6W1ePuO
 UZT7/gvgvI18Nqnx88UdtpnXJFs7hmtnaxcUJoGcA26micu5/bGcc9oHG4tVUKS4OZsC
 leLGG4ZCI3QrHLfg/XtoLLtGJwUEgbdD4A0U5Zg1ji302QE50xypinX/nbQcv/J0YywU
 sV8UDa2J/+wSuzc9MfL9gHuUSlZcC/1nMvpRNvDdUXSrHaAbKhJGyNgrGEj+knTumxxA
 1VAFOW9f5d6EiI0PKZuQtKO/lx7UMVZIlsuDEc0JudTvmZOu/XBe/USEIPSeAzprRsJJ
 wwOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=WFkPyPC4
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mmc-utils: fix hash mismatch
 for readme file
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
Content-Type: multipart/mixed; boundary="===============2508042735822354287=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2508042735822354287==
Content-Type: multipart/alternative; boundary="000000000000a258c00628f9b378"

--000000000000a258c00628f9b378
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baruch,

On Tue, Dec 10, 2024 at 10:51=E2=80=AFPM Baruch Siach <baruch@tkos.co.il> w=
rote:

> Hi Christian,
>
> On Tue, Dec 10 2024, Christian Stewart via buildroot wrote:
> > Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21
> >
> > The README hash changed causing a build failure:
> >
> >
> https://github.com/skiffos/SkiffOS/actions/runs/12266361526/job/342243448=
38#step:8:60617
> >
> > Update the hash for the README.md file to fix the issue.
>
> The patch updates README hash. Is that a typo?
>

Yes.

--000000000000a258c00628f9b378
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Baruch,<br></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Dec 10, 2024 at 10:51=E2=80=AFPM Baruch Siach &lt;<a href=3D"mailto:baru=
ch@tkos.co.il">baruch@tkos.co.il</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
ba(45,45,45,1);padding-left:1ex">Hi Christian,<br>
<br>
On Tue, Dec 10 2024, Christian Stewart via buildroot wrote:<br>
&gt; Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21<br>
&gt;<br>
&gt; The README hash changed causing a build failure:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/skiffos/SkiffOS/actions/runs/12266361526=
/job/34224344838#step:8:60617" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/skiffos/SkiffOS/actions/runs/12266361526/job/34224344838#step:8=
:60617</a><br>
&gt;<br>
&gt; Update the hash for the README.md file to fix the issue.<br>
<br>
The patch updates README hash. Is that a typo?<br></blockquote><div><br></d=
iv><div>Yes.</div><br></div></div>

--000000000000a258c00628f9b378--

--===============2508042735822354287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2508042735822354287==--
