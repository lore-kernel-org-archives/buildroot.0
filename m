Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CABCA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 06:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9EB4077F;
	Tue, 19 Aug 2025 06:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nq1URb0cNjkz; Tue, 19 Aug 2025 06:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63E140782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63E140782;
	Tue, 19 Aug 2025 06:13:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0452FDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 06:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE9024077F
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 06:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Clf9XryrPSDQ for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 06:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 088C840784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 088C840784
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 088C840784
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 06:13:08 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3e584a51a3fso16007435ab.2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 23:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755583988; x=1756188788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ApBEwqUUgtjGygtRbiGe5G7ZMKS9TpCwd4vLEtqV5sU=;
 b=wRzRkZVSxViRjTbVWHGFj8xijD0m1aHmx+iloK92f6hhCcOG+2cjrSUV+2V/Zx4jze
 28vcif63M8XJ8Xgx+VX3KVrqvBhvAoMvWBjZdCINPNEYoX2vuQQD0JoxoyxjGTQNDEOk
 ECk/TATmfGms2J14PpFJNtkTbEGhtuU6R0PQ7JWcYuqLEm2A9dU4fDdTE4r0xEzNtywh
 j0/HdEDYVuWiQxSVVZv8YxM5H7HrQFRrphXRTK5FaFayUew0hV5qPx9F+wdlNIhhdzY2
 ZmqEM8J04JFYUZSToVc4PiDMVn6GWFYddMe729imvGBb6kah7DT9gB87OntUWXe+MsMS
 hP+Q==
X-Gm-Message-State: AOJu0YydN5uATg+V273PxxbnMYzXbPVzrh/fU1OEPL9fr53GPdssH+NR
 KF9RLP698/TBp+uWKF0hHMiqLl7WIC6O3FgBhLv/fr5oYhnpcSVFUWuB9el6pUmTAg/E/GGtPNT
 TbcfTV6r32Rfuo7WXu/Knh800DuqiOi4InatN
X-Gm-Gg: ASbGncsGo5bARm3UZVjxNkvUG7wAYMJSem8nMjVu2qu1GQLERJ2XVJgpNfQcVCPfKQt
 BbRQvqpUu7e5u+DOvq4dWVhAaK8Z8RunTEG0dR04mpdu8RYt3F8jhgA1wBBGL7z3xnmEM6L6sUQ
 LG7KnF4lYLeOwu7jECu0geffBP5X0SPpZbxxEffwv7gJdvHTSkoY9Seb2dxP+p/sm+zWKuLz8jP
 H5cz3x3xGnj4FUA6A==
X-Google-Smtp-Source: AGHT+IGEqLykZvLx2wZDkdY+05avuGakPj2k6V8TNWfcqQwrKcM9PcAEcvVhhp8bB0FIzy8ai1GRl2Rw+2pmRFdnMn0=
X-Received: by 2002:a05:6602:340e:b0:87c:1cc3:c0fa with SMTP id
 ca18e2360f4ac-88467dc9d94mr249871639f.0.1755583987891; Mon, 18 Aug 2025
 23:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250818140518.964728-1-angelo.compagnucci@gmail.com>
 <20250818183349.6373d330@windsurf>
In-Reply-To: <20250818183349.6373d330@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 08:12:55 +0200
X-Gm-Features: Ac12FXz3LN2TsU_XDYipFKnlWTwJ2MibxCqPdrCLQJyhz1K0fZegsuJSrowE0iY
Message-ID: <CA+TH9VkUgn3y2VthqiKfejas0Fx47yqvVGbgjch3MPyHS4u_2A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755583988; x=1756188788; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ApBEwqUUgtjGygtRbiGe5G7ZMKS9TpCwd4vLEtqV5sU=;
 b=Lui5yRJy7H3Zm2Ms2jiSk7+gXhvzzGZQGKPVGUfrJPwtu+tSlWMsotiDOqtdxtNglF
 9H6WjrvbesB2Nn0LgBzA4TQB6OFhJlRbnrj+lQOJXbASJ1dp6cFP1n1GHth2SQhTnxd5
 OSgvu1MgNlXYIAyh/2OQZ3fKXJ3beF2af/JZ0/n5g+F4GhzvzPcLg/GJQpkzjrkV7PlX
 3AH87/CVdipIkEwK+W4ZWAUAAOEWBXuojWm+5jAyaId0iuy1w/YcUnmi0bgqkbOAOMow
 qjzv+DW0pkcbJMMYL9IOKbSPhCwpJgAnSs61blqFy48++2NBjaIE38UbxDxyKRc/c3ub
 3IrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lui5yRJy
Subject: Re: [Buildroot] [PATCH] package/mono: remove mono and related
 packages
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
Content-Type: multipart/mixed; boundary="===============5983828228595438122=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5983828228595438122==
Content-Type: multipart/alternative; boundary="000000000000f8c324063cb1bfda"

--000000000000f8c324063cb1bfda
Content-Type: text/plain; charset="UTF-8"

Il lun 18 ago 2025, 18:33 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
ha scritto:

> Hello Angelo,
>
> On Mon, 18 Aug 2025 16:05:18 +0200
> Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
>
> > Microsoft maintains a modern fork of Mono runtime in the dotnet/runtime
> repo and
> > has been progressively moving workloads to that fork. That work is now
> complete,
> > and we recommend that active Mono users and maintainers of Mono-based app
> > frameworks migrate to .NET which includes work from this fork.
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Thanks for this patch. But do we have the Buildroot packages for .NET,
> which would replace these Mono packages?
>
> Or should I read your patch as "This mono stuff is no longer
> maintained, and if anyone wants to use .NET with Buildroot, they should
> package .NET instead of using this unmaintained mono stuff" ?
>

I added the note about the .NET Giulio's patch exactly for that reason.

Technically speaking, while having an infra in builroot to build .NET
packages, it's not strictly required: mono can cross compile and produce a
self contained executable to deploy on the target without any third party
tool.


> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000f8c324063cb1bfda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><br><div class=3D"gmail_quote=
 gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=
Il lun 18 ago 2025, 18:33 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pet=
azzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hello Angelo,<br>
<br>
On Mon, 18 Aug 2025 16:05:18 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagnucci@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">angelo.compagnucci@gmail.com</a>&gt; wrote=
:<br>
<br>
&gt; Microsoft maintains a modern fork of Mono runtime in the dotnet/runtim=
e repo and<br>
&gt; has been progressively moving workloads to that fork. That work is now=
 complete,<br>
&gt; and we recommend that active Mono users and maintainers of Mono-based =
app<br>
&gt; frameworks migrate to .NET which includes work from this fork.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank" rel=3D"noreferrer">angelo.compagnucci@gma=
il.com</a>&gt;<br>
<br>
Thanks for this patch. But do we have the Buildroot packages for .NET,<br>
which would replace these Mono packages?<br>
<br>
Or should I read your patch as &quot;This mono stuff is no longer<br>
maintained, and if anyone wants to use .NET with Buildroot, they should<br>
package .NET instead of using this unmaintained mono stuff&quot; ?<br></blo=
ckquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">I added the not=
e about the .NET Giulio&#39;s patch exactly for that reason.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Technically speaking, while having an=
 infra in builroot to build .NET packages, it&#39;s not strictly required: =
mono can cross compile and produce a self contained executable to deploy on=
 the target without any third party tool.</div><div dir=3D"auto"><br></div>=
<div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div>

--000000000000f8c324063cb1bfda--

--===============5983828228595438122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5983828228595438122==--
