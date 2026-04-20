Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410E2EA71B4
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 01:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022BA61013;
	Mon, 20 Apr 2026 01:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqQqe3hekM5A; Mon, 20 Apr 2026 01:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EECC461014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776647961;
	bh=IRTiv+xnSpPj8dc25Y2OqdG33nPuiteasQ0fKU2Dr9M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2tDhyBFLgIZeoJIsJELR3C3jb6sXXuYJwJtDHGKGzPzD4OOL6ruvWZDL84eIkbwM
	 txJBFQWOUKaaecG4Y0yzR4dJehSBSY8/l+VD9uUWPBFUQ0O6ypdIv+5m601xMlIC3V
	 4H9/sCiQVBZ1V9zR8E3dblVZQ070BPDdZWUdOZX7U3n1PwCjg2soxy1Lo2j5nH9JT+
	 45anQSuVC9u/IpK1jaRQpjQq8L6nCP4XBhuVBSQ374kASOtkW6vOThiyRP8RSvLb2V
	 AmI6Y299ZAhDMd96TZBmiuUGNy83OguBJDZwxAD6ylQyxc3MkkA4Z7jgFMfx6EA4rN
	 QMqXnzHWeRghg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECC461014;
	Mon, 20 Apr 2026 01:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4910E24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A55F8232F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIF7i6FJrYik for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 01:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D79A822EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D79A822EC
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D79A822EC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:19:17 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-79a535e7c00so24548797b3.3
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776647957; cv=none;
 d=google.com; s=arc-20240605;
 b=MFW27mSn7S4140YEBlcSYDEGOSYRlfBQXAt/y3OX5K/ltiqCuitH8u2XbIcGdgUEqg
 H0KIk8WuPHPb9D9jTlVmpBqu71Y5xPZBwJlx6nDR/+ez3Dm9LqWxq5xuQqLxazbvJ7/z
 EQt9/q7M51JyHl/F+ES/hAPsVJ6gbD6wDbpPO53sbVa2kt5CDTNxoYa68Wb7UNgirYgv
 4aIFEsgMUhfncGBxLvZCgr0QAmtJarkLpcopC2zZGpI1SKedkbey9v8rnkIefYRxbfw2
 3QxmUEdImBEmie1BDoTZY5j+rwLkHf1i+YVGAzceDpBuEjbm+u3uvtBSFJGMf9dHi6JO
 gcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KZI2O5xCOnEB5CyETqI6+LpD+IyyQ2PNXxmfbl2juBI=;
 fh=+f3U4CSVE/IxKOJklstpZrq+i19ILBslJ/jGhl6HbT4=;
 b=S0jWTPEVb/m+N8MLl3wR01IfwI2BXMuvjosMQZQTBWT8tHIO1dA1pAM6FCnCjrR+ij
 7UGgu2D3cUSb/SXD1fE36D0iwJomwoMhNdui3BvWOtj6+x7LVMqBT35EO9/kWpKsQVBz
 fwNNMgtz1ZxS5I+13/15XmgIpSEn8NmpHfLdogaVogwVSxAUn3Ocm/0WjQpgKul0g1lG
 HEY4QgtCTKQpODedzaIVMlNcLTR9eILhy+mewgjAH14uH/WDRQElzv+IaZiRfahvSUDe
 RYs6toERETi43Jga8VbyO2hijdukJ4nW0BLWa4oeP41vMVTqC7xD2zLljcmfVNoVBFBu
 XHTQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776647957; x=1777252757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZI2O5xCOnEB5CyETqI6+LpD+IyyQ2PNXxmfbl2juBI=;
 b=Z/ZWuLlXRW/wNxz/e5IwG7h20bF8gdCrckXMDI1pZLINXWWuDOabfZLLYycb0KkuCA
 tLuqMh2bdCSHVyAPza1Hsae44rY656vakkVxOzAgmuSJ5BCxAERV331vXjV88NXqzEW4
 X5OLc90T1p+6e3us963ILz/tCI/0cpVogMuOpYRwV68CE/fk9YRAQurKUUJkkaPDG7Qz
 +tpjJFkK8pJKcePdjlsUDDG6/AGwtELOjmi8beio96YsgzRmdwzlyuMFUD5cR5FbTu80
 T1flaZdXK1c5FGrQRkq15FbYSNsEg28mpntsYDhRKODa41UqS6MudNv+vwePElXvxtYZ
 wFlg==
X-Gm-Message-State: AOJu0YxbDDuNuoWUXOmECiIqIfqZZhhDSiMCihrX3YZYZ0jHzUH8oXkk
 b6zqF3g41tCzAC8wZp4jI0qN61AYnnx6daiVXmXTOMjRF/xTBacOoHC/mNXZgYWKn5VNkYZzT+S
 m3MlfJ1EYdtK4el+E7XM2LgxGSWzS7fDI/1DfgXQ=
X-Gm-Gg: AeBDietdVhvN8g0MwgPqN7nxMMrPLEa6Exur/ROQmyc1D74j4WlENaAudjutYTIYAT3
 b3SpmL4VNaqaAvDPHvN4rb+ZcMhUKol47M12h5YKMcaIkp/jfdecHHL/6G6UQxW1XmcG0ycE4wf
 puhxsZQX3MM9WvIoA+778/FufusokoGGZ2FpLoQSEDLN4xjtohBbsDXC9ruthjYB96as2H6/VoU
 BGRTO3I1KHpBsVU+/GNY4q24E5uBvVODzFWcWIpW/QLOCpek3QXFTPcSnWzuFU8ihr9ijRNGphV
 l59E+hmJLm6F8HBq
X-Received: by 2002:a05:690c:c50e:b0:7b8:926e:3ef1 with SMTP id
 00721157ae682-7b9ece7715cmr115879127b3.9.1776647956707; Sun, 19 Apr 2026
 18:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260419173016.53785-1-chakrabortyshubham66@gmail.com>
 <0a5de70e-cac1-4932-b4e2-40deb3c18e1a@bubu1.eu>
In-Reply-To: <0a5de70e-cac1-4932-b4e2-40deb3c18e1a@bubu1.eu>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 20 Apr 2026 06:49:04 +0530
X-Gm-Features: AQROBzDexId1BCoImYUqMV5rI7l9ShF6PQ00zE56py1qNl2Jo0OOGJqBNNaXilU
Message-ID: <CABvxkszi3CQCmnphwAgvvxUSoLkBME0dHU324az8PznuysTPrA@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776647957; x=1777252757; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KZI2O5xCOnEB5CyETqI6+LpD+IyyQ2PNXxmfbl2juBI=;
 b=MYdqJb3eyO9bjfnOjq80KJpCfNlYPvAODSoYeQ//TLuSa+YwZgIQNHsanRqCX7cKf4
 N3xdfZ4y9IrGYnLzaIi5ADC2Y/sqIpctrdFZUKXddukU+6y3OwQbZsnDJkScK755itAd
 iOdYWi8Ht5+nXc0nMaMKK40DPP600J9UKhzdwbIdNMcofJkNfJVXfqIc8+xIFY5Vghl+
 0SIyvvdPR4Tq+77p4uocDqEuGVfnEYcBWiNQLjEvjM5UZMhQUNlrVXQd3k3uqZHo0gG9
 7Gggrp/EeO29/1byeHK8BJ657sZU6Hfb2xSHI7b9/5W2ruseoiPCZ1x8U1kQZM3sFseX
 gM8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MYdqJb3e
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.37.2
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
Content-Type: multipart/mixed; boundary="===============8655708240400911529=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8655708240400911529==
Content-Type: multipart/alternative; boundary="00000000000059bdb2064fda16b8"

--00000000000059bdb2064fda16b8
Content-Type: text/plain; charset="UTF-8"

Hi Marcus,

Got it. Thanks for applying the patch and for the pointer on the Debian
comparison link.

Best regards,
Shubham

On Mon, 20 Apr, 2026, 4:51 am Marcus Hoffmann, <buildroot@bubu1.eu> wrote:

> Hi Shubham,
>
> On 4/19/26 19:30, Shubham Chakraborty wrote:
> > For details see the Debian changelog:
> > https://tracker.debian.org/fakeroot
>
> This page doesn't really directly provide a changelog as far as I can
> tell? It does link to the debian package changelog, but while debian is
> also the upstream here, the debian package changelog only, unhelpfully,
> states "new upstream version".
>
> The actual changes are these;
>
> https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.1.2...upstream%2F1.37.2?from_project_id=28340
>
> I don't think there's a proper upstream changelog though, unfortunately.
>
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> >   package/fakeroot/fakeroot.hash | 5 ++---
> >   package/fakeroot/fakeroot.mk   | 4 ++--
> >   2 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/fakeroot/fakeroot.hash
> b/package/fakeroot/fakeroot.hash
> > index 1f52d37f1a..9fc8e0a54e 100644
> > --- a/package/fakeroot/fakeroot.hash
> > +++ b/package/fakeroot/fakeroot.hash
> > @@ -1,5 +1,4 @@
> > -# From
> https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
> > -sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13
> fakeroot_1.37.1.2.orig.tar.gz
>
> As the upstream signed message explicitly lists the sha1sum, we should
> keep this updated here as well.
>
> > -sha256
> 959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224
> fakeroot_1.37.1.2.orig.tar.gz
> > +# From
> https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
> > +sha256
> 0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db
> fakeroot_1.37.2.orig.tar.gz
> >   # License files, locally calculated
> >   sha256
> fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> > diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> > index ea0edb7665..12d7f1c4a1 100644
> > --- a/package/fakeroot/fakeroot.mk
> > +++ b/package/fakeroot/fakeroot.mk
> > @@ -4,9 +4,9 @@
> >   #
> >
>  ################################################################################
> >
> > -FAKEROOT_VERSION = 1.37.1.2
> > +FAKEROOT_VERSION = 1.37.2
> >   FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
> > -FAKEROOT_SITE =
> https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
> > +FAKEROOT_SITE =
> https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
> >
> >   HOST_FAKEROOT_DEPENDENCIES = host-acl
> >   # Force capabilities detection off
>
>
> Applied with these changed, thanks!
>
> Marcus
>

--00000000000059bdb2064fda16b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hi Marcus,<br><br>Got it=
. Thanks for applying the patch and for the pointer on the Debian compariso=
n link.<br><br>Best regards,<br>Shubham</span></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 20 Apr, 2026, 4:51 am Marcus Hoffmann, &lt;<a href=3D"mailto:buildroot@bub=
u1.eu">buildroot@bubu1.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Hi Shubham,<br>
<br>
On 4/19/26 19:30, Shubham Chakraborty wrote:<br>
&gt; For details see the Debian changelog:<br>
&gt; <a href=3D"https://tracker.debian.org/fakeroot" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://tracker.debian.org/fakeroot</a><br>
<br>
This page doesn&#39;t really directly provide a changelog as far as I can <=
br>
tell? It does link to the debian package changelog, but while debian is <br=
>
also the upstream here, the debian package changelog only, unhelpfully, <br=
>
states &quot;new upstream version&quot;.<br>
<br>
The actual changes are these; <br>
<a href=3D"https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.3=
7.1.2...upstream%2F1.37.2?from_project_id=3D28340" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://salsa.debian.org/clint/fakeroot/-/compare/u=
pstream%2F1.37.1.2...upstream%2F1.37.2?from_project_id=3D28340</a><br>
<br>
I don&#39;t think there&#39;s a proper upstream changelog though, unfortuna=
tely.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/fakeroot/fakeroot.hash | 5 ++---<br>
&gt;=C2=A0 =C2=A0package/fakeroot/<a href=3D"http://fakeroot.mk" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">fakeroot.mk</a>=C2=A0 =C2=A0| 4 ++--<=
br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroo=
t.hash<br>
&gt; index 1f52d37f1a..9fc8e0a54e 100644<br>
&gt; --- a/package/fakeroot/fakeroot.hash<br>
&gt; +++ b/package/fakeroot/fakeroot.hash<br>
&gt; @@ -1,5 +1,4 @@<br>
&gt; -# From <a href=3D"https://deb.debian.org/debian/pool/main/f/fakeroot/=
fakeroot_1.37.1.2-1.dsc" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc</a=
><br>
&gt; -sha1=C2=A0 925958f4730b172f4e1ae5dbeb9734f3da95da13=C2=A0 fakeroot_1.=
37.1.2.orig.tar.gz<br>
<br>
As the upstream signed message explicitly lists the sha1sum, we should <br>
keep this updated here as well.<br>
<br>
&gt; -sha256=C2=A0 959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a41266=
42f53224=C2=A0 fakeroot_1.37.1.2.orig.tar.gz<br>
&gt; +# From <a href=3D"https://deb.debian.org/debian/pool/main/f/fakeroot/=
fakeroot_1.37.2-1.dsc" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc</a><br=
>
&gt; +sha256=C2=A0 0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718=
d98884db=C2=A0 fakeroot_1.37.2.orig.tar.gz<br>
&gt;=C2=A0 =C2=A0# License files, locally calculated<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe78=
2895abd91d64763f8e7=C2=A0 COPYING<br>
&gt; diff --git a/package/fakeroot/<a href=3D"http://fakeroot.mk" rel=3D"no=
referrer noreferrer" target=3D"_blank">fakeroot.mk</a> b/package/fakeroot/<=
a href=3D"http://fakeroot.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">fakeroot.mk</a><br>
&gt; index ea0edb7665..12d7f1c4a1 100644<br>
&gt; --- a/package/fakeroot/<a href=3D"http://fakeroot.mk" rel=3D"noreferre=
r noreferrer" target=3D"_blank">fakeroot.mk</a><br>
&gt; +++ b/package/fakeroot/<a href=3D"http://fakeroot.mk" rel=3D"noreferre=
r noreferrer" target=3D"_blank">fakeroot.mk</a><br>
&gt; @@ -4,9 +4,9 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -FAKEROOT_VERSION =3D 1.37.1.2<br>
&gt; +FAKEROOT_VERSION =3D 1.37.2<br>
&gt;=C2=A0 =C2=A0FAKEROOT_SOURCE =3D fakeroot_$(FAKEROOT_VERSION).orig.tar.=
gz<br>
&gt; -FAKEROOT_SITE =3D <a href=3D"https://snapshot.debian.org/archive/debi=
an/20250513T025019Z/pool/main/f/fakeroot" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://snapshot.debian.org/archive/debian/20250513T025019Z/=
pool/main/f/fakeroot</a><br>
&gt; +FAKEROOT_SITE =3D <a href=3D"https://snapshot.debian.org/archive/debi=
an/20260401T000000Z/pool/main/f/fakeroot" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://snapshot.debian.org/archive/debian/20260401T000000Z/=
pool/main/f/fakeroot</a><br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0HOST_FAKEROOT_DEPENDENCIES =3D host-acl<br>
&gt;=C2=A0 =C2=A0# Force capabilities detection off<br>
<br>
<br>
Applied with these changed, thanks!<br>
<br>
Marcus<br>
</blockquote></div>

--00000000000059bdb2064fda16b8--

--===============8655708240400911529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8655708240400911529==--
