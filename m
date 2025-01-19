Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D79C02187
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 15:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A2340CCF;
	Sun, 19 Jan 2025 15:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYthTAjb8c6s; Sun, 19 Jan 2025 15:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4156410D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4156410D8;
	Sun, 19 Jan 2025 15:31:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A83AD69
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94E4683A7F
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYMbz_vTruIb for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 15:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F515804F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F515804F6
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F515804F6
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 15:30:59 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e3a26de697fso5745822276.3
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 07:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737300658; x=1737905458;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BloS76ytv7dF8D6GuKRs1pM1evyXDy2B88TgqmfF/bc=;
 b=M6r7OkOpcnttC1y9dtu+EUu5f/f9IfVJX1j9hZ6h8/7P+4XYIlcZ9eV0JW0iVGP8Xi
 b7Kxz+Y4iOY92mrh5Nfs6Gkg0PHyBWfv0m1XeJp/CSIzxktH/K7lEvBY7VWtpYTeMJfU
 VwAGbqPcOMMyyrc8msAiC47+5u8tjl3R8ayTOq4JhnPZ2a9zD6f8HB9g+xKUZAAEa6EZ
 NxwMUofUZ5HsBrgNgZB15gr0qxDbM8jPOlYOnkEBYO/z+JMcED7G9NbiFQ9jh6l7LKWn
 BK3wEj1Hqv0+ED+giKJ0is7CHIvfQ/Scx5UXw1TvYmsH9q7HN4YTHQ5V1xbC+XgaAMdh
 5XGg==
X-Gm-Message-State: AOJu0YxmO/MS9+rgB0wHC9d468cv5HgSZTNW2ChJDD4cdzUU1LunUeCl
 GxfQHmKIBM3iajiizUyYDlq+vA7ZrV4NprxOq79OIkSluMc2qWxY8tn571sE0V9E7u87sxYMxN1
 TjDe336w3eDZuyMc8C3Ggap8qGXU=
X-Gm-Gg: ASbGncvPgEfUyAK2Dsfy4MzkfJmVcYO4882mdNPm7jX5ScslKWg30jYDjGu+kSRaPcg
 Atoat9Fjxc/qVBb7mc+qdi5dPB+d/JCCBr77Fk8FzhEbGrVUbgJeH
X-Google-Smtp-Source: AGHT+IGpM0RHL4Pb9aEW+RdOyvoD1MJ9p0cJtiLZWW4KBzdGBan0z/vrC391MZKX1vx7gHWpWbwFcaVwlbqz1vM0740=
X-Received: by 2002:a05:690c:74c7:b0:6ea:5da9:34cc with SMTP id
 00721157ae682-6f6eb64e5c2mr73781917b3.7.1737300658172; Sun, 19 Jan 2025
 07:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
 <34f896724511c7867f8beb0058c55b18@free.fr>
In-Reply-To: <34f896724511c7867f8beb0058c55b18@free.fr>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 19 Jan 2025 16:30:46 +0100
X-Gm-Features: AbW1kvYKOfJrV1ZRoSyMYiwe0H_JcHjUJpb4ZHjAIW8VHvqVH_12cn9w8YxiRBc
Message-ID: <CA+R_deqo6KLQFypUNB5EOvnFj6AagwzPzkqaO+J_CGkGfD+q_g@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737300658; x=1737905458; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BloS76ytv7dF8D6GuKRs1pM1evyXDy2B88TgqmfF/bc=;
 b=PXonPiNNtnGE+wlx/U9oCT9nYLQHUC4g4yNJZWCRh8Ijw9zlGy33Y/BejPZaL+l0sE
 sfrP78kdq6P6i6c8CwoaMVwRFy7Yz955Oqy/MoNmnIQ6gfZeSAvQi+BkRdzpr8GoAj8v
 VshMAHyWrGxwPDzSMc7288MZBcMHP9FkangaG6irZxb8x/fBWm6g03AiM/gjfIMUxEep
 h+wsCFfu9fG+p2Pu9PHoI08cNM1zllWWqOQeivysDIhVBxXhZ5MpV4VG1B2v+wlS/Ub5
 8Udy7dYkp31FTsHWDa7N9xMeqY7skzYainoLu/ARoPl4AKT86mIlNkbwoapm6e7XZs2O
 +pFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PXonPiNN
Subject: Re: [Buildroot] [PATCH 01/19] package/qt6/qt6multimedia: new package
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
Content-Type: multipart/mixed; boundary="===============4771416853879962292=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4771416853879962292==
Content-Type: multipart/alternative; boundary="000000000000993a32062c10d4fa"

--000000000000993a32062c10d4fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I squashed my commits into baxishe su's original patch.

I did not squash my commits in v4 since that would make the review more
difficult.

If I instead had marked the patch-set as RFC, then there wouldn't have be a
problem, right?

Regards,
Roy



s=C3=B8n. 19. jan. 2025 kl. 12:49 skrev Julien Olivain <ju.o@free.fr>:

> Hi Roy, All,
>
> On 17/01/2025 11:53, Roy Kollen Svendsen wrote:
> > From: baxiche su <baxiche@gmail.com>
> >
> > Signed-off-by: baxiche su <baxiche@gmail.com>
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Thank you for the patches!
>
> I think it would be better to squash this whole series in a single
> patch entitled "package/qt6/qt6multimedia: new package".
>
> While it might be interesting for you to keep track of all your
> intermediate improvement steps, for the Buildroot project, it will be
> more convenient to keep a single patch, since it is the introduction
> of a new package.
>
> See:
>
> https://buildroot.org/downloads/manual/manual.html#_the_formatting_of_a_p=
atch
>
> For example, the patch 1/19 has "make check-package" errors which are
> fixed later in the series. We try to avoid merging commits with known
> issues.
>
> I understand this series is a joint work with the original Baxiche Su
> submission. So you can explain in the commit log from where you started,
> for example:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20240920160500.18551=
-1-baxiche@gmail.com/
> and all the improvements you made on top of it.
>
> So, you can use this series as an intermediate step to collect
> comments from Baxiche and others, if any. I'll wait for a squashed
> version to apply it.
>
> Best regards,
>
> Julien.
>

--000000000000993a32062c10d4fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I squashed my commits into baxishe su&#39;s original =
patch.</div><div><br></div><div>I did not squash my commits in v4 since tha=
t would make the review more difficult.</div><div><br></div><div>If I inste=
ad had marked the patch-set as RFC, then there wouldn&#39;t have be a probl=
em, right?</div><div><br></div><div>Regards,<br></div><div>Roy<br></div><di=
v><br></div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">s=C3=B8n. 19. jan. 2025 kl=
. 12:49 skrev Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.=
fr</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi R=
oy, All,<br>
<br>
On 17/01/2025 11:53, Roy Kollen Svendsen wrote:<br>
&gt; From: baxiche su &lt;<a href=3D"mailto:baxiche@gmail.com" target=3D"_b=
lank">baxiche@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: baxiche su &lt;<a href=3D"mailto:baxiche@gmail.com" tar=
get=3D"_blank">baxiche@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
<br>
Thank you for the patches!<br>
<br>
I think it would be better to squash this whole series in a single<br>
patch entitled &quot;package/qt6/qt6multimedia: new package&quot;.<br>
<br>
While it might be interesting for you to keep track of all your<br>
intermediate improvement steps, for the Buildroot project, it will be<br>
more convenient to keep a single patch, since it is the introduction<br>
of a new package.<br>
<br>
See:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_the_formatti=
ng_of_a_patch" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/d=
ownloads/manual/manual.html#_the_formatting_of_a_patch</a><br>
<br>
For example, the patch 1/19 has &quot;make check-package&quot; errors which=
 are<br>
fixed later in the series. We try to avoid merging commits with known<br>
issues.<br>
<br>
I understand this series is a joint work with the original Baxiche Su<br>
submission. So you can explain in the commit log from where you started,<br=
>
for example:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20240920160=
500.18551-1-baxiche@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https:=
//patchwork.ozlabs.org/project/buildroot/patch/20240920160500.18551-1-baxic=
he@gmail.com/</a><br>
and all the improvements you made on top of it.<br>
<br>
So, you can use this series as an intermediate step to collect<br>
comments from Baxiche and others, if any. I&#39;ll wait for a squashed<br>
version to apply it.<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000993a32062c10d4fa--

--===============4771416853879962292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4771416853879962292==--
