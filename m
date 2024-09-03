Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D53CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9F2402A6;
	Tue,  3 Sep 2024 21:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEyfD7QKMqMj; Tue,  3 Sep 2024 21:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D754C402A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D754C402A9;
	Tue,  3 Sep 2024 21:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA5B01BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D80764010C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mT_x0tkPx5nb for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.179;
 helo=mail-yw1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46DBD40198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46DBD40198
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46DBD40198
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:26:22 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6d74ff7216eso22701677b3.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398780; x=1726003580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9EgRY4c1OZlGHB0Vc4QdHecjonB1Mh2c8mF7eK26fmI=;
 b=oCF4N3ZnmkIwM/hIhuvk6U5d8q0q/HMALtSHeBb1u9PRmT75857V+FVODpwfkv5g8Y
 0p845MWtiyoqG3bXUgkkidXpPTuoY+ZibXuwzmVZwe9v18aQ/mB+cVsdEXlyWD7z+nFB
 BRWPBy6a1n0oAFdCBlehIpApO/Ex3C1a+g+y6aRvIfk23GqxzDkURM/iyKr9dyORVgmq
 QN5aqAT/jTOowEmhlng28Y4YQkGKAMF0xlOzZexDkKZD7xiYwiBCMC/ju2cC1KkgTXl6
 5IZJ2u+bJixQ6zGw/WltbHHBCGCKM/61zmmuqRyaexTq9ULW0YUY7LCIsv1h8Y59b4XB
 BM0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIvnr7t+0jX1wtl7zf+J5eer/MBrCIL9j0cCst4FwFtX2BF27h1OdyPvnm5dfTs1ZmOqeN327eqoQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw6Xk2l3wPF2c5Sc8G6fECPNeb6irCEl+RPEnTatiSnenyklA0W
 cr60gkNRlFfGeqdVg+0fJ7PRwWPhRJ57aG7Ez/lBgEUQX2VRjMTdilezqmJTyXU=
X-Google-Smtp-Source: AGHT+IGju7/SWPQuHw0gBtnya4tcy4P266zBGNarQgL0QzmM8FZeJ45rYFFUJ6cHIBd5n8LbRiAWvA==
X-Received: by 2002:a05:690c:6b82:b0:627:778f:b0a8 with SMTP id
 00721157ae682-6d411199db8mr182484697b3.42.1725398779872; 
 Tue, 03 Sep 2024 14:26:19 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6d74d9c616asm9207127b3.123.2024.09.03.14.26.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:26:18 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-690aabe2600so48082857b3.0
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 14:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPP76QhOD7z2+U04oq9EA77TSa8dPyLU6KuDS3BMYf6eB6OatLCHDQelT9pzRRI56JgzI/pIh1/l4=@buildroot.org
X-Received: by 2002:a05:690c:660f:b0:6b3:a6ff:769b with SMTP id
 00721157ae682-6d40b0f8db8mr194703867b3.0.1725398778296; Tue, 03 Sep 2024
 14:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240829131232.2132854-1-thomas@devoogdt.com>
 <20240829131232.2132854-3-thomas@devoogdt.com>
 <20240903231453.2fc15914@windsurf>
In-Reply-To: <20240903231453.2fc15914@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 3 Sep 2024 23:26:04 +0200
X-Gmail-Original-Message-ID: <CACXRmJgb8U6pjaiUYi_oKXu=fHeCOcC+Uvmyn03etCvb+_BmEg@mail.gmail.com>
Message-ID: <CACXRmJgb8U6pjaiUYi_oKXu=fHeCOcC+Uvmyn03etCvb+_BmEg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/libgtk4: fix cairo-pdf compile
 error
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6321725921948742927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6321725921948742927==
Content-Type: multipart/alternative; boundary="00000000000046d40606213db55b"

--00000000000046d40606213db55b
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

I will report this issue when I have time for it again. I can update the
patch message once this is done.

Kr,

Thomas Devoogdt

Op di 3 sep. 2024 23:14 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> On Thu, 29 Aug 2024 15:12:30 +0200
> Thomas Devoogdt <thomas@devoogdt.com> wrote:
>
> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> >
> > ../gtk/print/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No
> such file or directory
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> >  package/libgtk4/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> > index af7f57b80e..2fcae311d7 100644
> > --- a/package/libgtk4/Config.in
> > +++ b/package/libgtk4/Config.in
> > @@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4
> >       # https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
> >       depends on BR2_PACKAGE_HAS_LIBEGL
> >       select BR2_PACKAGE_CAIRO
> > +     select BR2_PACKAGE_CAIRO_ZLIB
>
> We had a previous patch somewhat similar to this (but not exactly), and
> I made this reply:
>
> https://lore.kernel.org/buildroot/20240815000358.6887f1bf@windsurf/
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>

--00000000000046d40606213db55b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Thomas,</p>
<p dir=3D"ltr">I will report this issue when I have time for it again. I ca=
n update the patch message once this is done.</p>
<p dir=3D"ltr">Kr,</p>
<p dir=3D"ltr">Thomas Devoogdt </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op di =
3 sep. 2024 23:14 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pet=
azzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Thu, 29 Aug 2024 15:12:30 +0200<br>
Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" target=3D"_blank=
" rel=3D"noreferrer">thomas@devoogdt.com</a>&gt; wrote:<br>
<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco.com"=
 target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; <br>
&gt; ../gtk/print/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No s=
uch file or directory<br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/libgtk4/Config.in | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in<br>
&gt; index af7f57b80e..2fcae311d7 100644<br>
&gt; --- a/package/libgtk4/Config.in<br>
&gt; +++ b/package/libgtk4/Config.in<br>
&gt; @@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://gitlab.gnome.org/GNOME/=
gtk/-/issues/6866" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
gitlab.gnome.org/GNOME/gtk/-/issues/6866</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO_ZLIB<br>
<br>
We had a previous patch somewhat similar to this (but not exactly), and<br>
I made this reply:<br>
<br>
<a href=3D"https://lore.kernel.org/buildroot/20240815000358.6887f1bf@windsu=
rf/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kernel.or=
g/buildroot/20240815000358.6887f1bf@windsurf/</a><br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000046d40606213db55b--

--===============6321725921948742927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6321725921948742927==--
