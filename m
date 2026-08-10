Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE20BC5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED784051C;
	Mon, 10 Aug 2026 08:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-H4k-K70Vql; Mon, 10 Aug 2026 08:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6963540522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786350661;
	bh=L5qMnlhcQ7yH5c9ULHBhVwK9uPKzaIS1bT7K1/OXee0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBUZdMBYwYufBiIvTxFF9luunMDyyVr/sVm5QeAmPf2K2XUcBKbUr+RnarVZrMnRg
	 gw7XS6+1WXwn7OT+h/SxVRFqL8+drCmMAswKvLMIl6BZhxguY+xXc/4oy66OueNkDK
	 ulQRrz5RLgUiRf5wSefJwqPsjbmjqyW+LMZbniDkYCD+Y+RaTPCqt69BUqZE4D/ycM
	 dK/J7mrySmASpLWVcuVQiOcNxw85aF03KGZ1Myr9BksTMojLWLDHVWGWFd1cMiEz1d
	 MAyqqLMRAdgPSrYzOl8HhgX2teeuTrg14GiE7ZGEPEc6aPR1Nip0ZPJim8Ezan1oVn
	 /jXf6cBjkmcHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6963540522;
	Mon, 10 Aug 2026 08:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C60023F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5107640522
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUwfA_rm32B0 for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=philippemontcho@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 509204051D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509204051D
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 509204051D
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:30:59 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-4569e871502so321730fac.1
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 01:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786350658; cv=none;
 d=google.com; s=arc-20260327;
 b=YXN0HdSKf+rNpBur+/KGgNis2GvxCY8SZ4xoefj5M20pucmFaqq0pU9GWEk8D3JDTy
 F682377BYhydNT17/JcWllTVS7qaGSuyLTZ4QOLJ+pnZTy5l09DRmSUvz43pfzUOU9Up
 bSfC0Ik3GtP+NYIygLXpCYePPN5yEGFK3LDwROjsveIso0eNYGvAQZo7u+NdPL7gxHLK
 aoWSHxj60d+UQMKsYMbHYI1349LOfqNMOH6MgVrBBk6U7RyFm9SdGnByMQS7Y8dto0eV
 u/STwAckrBxu2kwBRR73R2hpU5OJ3yw6NEWzngHSaUGQ7r5m8ALZW5VbkfL+ra5iaMcC
 8n7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=m6Z9QT4baR9nTFcSUbADewD/bQ6AK5OBb7xMRswiXsM=;
 fh=SZO4cigf61EkGPvD6DJKoM9LqLOMR56M+LsYh+L0F/w=;
 b=c4sU0JvO4OymrGi4u16A7fvCOdLjCOOgBgw1DHIvhWmxSLrwE91Aw5J2FVH31ew7ll
 WOv8ZhUWh1OGMrJvUoGNS7nKAIGqHuLU0WEmNQ26GDUcRt+OZxCz/G1e1h8W1W3hZljB
 AK7XLTlw+Z3YPBa69AeRdnsdXq+/7xr6p50dsKFnXNU7hKrLiIJgUaF9dSclO35Naf1f
 Z2UbNqqZiVIOH/LrP0a9rHwFtUbB4rU52ahQHfGs+Hbz6Ljj/GlKc+UjPfsAlmbA2Mcu
 y9JPWFewE9G2H9hCFcS3xwjMG9J5kjYO7cj9K8vC0OW9MLpQIujJLKdw96KnzwCT5MZY
 kchQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786350658; x=1786955458;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m6Z9QT4baR9nTFcSUbADewD/bQ6AK5OBb7xMRswiXsM=;
 b=KGE1Ip5ylmXOTs9b4fvZyjyqyp4x09hwF1Rvru8a+CgYWLGWxCbRBD2wlbhGMeLJUc
 b0TWrt0UBIJpxdTIP2iYUKh7rxoMvHQnYpWHZIVw1Y6C/HeeHVackkBBmslc5YNscCPG
 3RTYk64Bp6lpB2QGKEgtF+LWg6knWfMMAXQtMwRThO6McGVjWcPjnob5YNDc9P0+zIdo
 LYT+gwEuflLQb2as5ps+DnIse+KNNnt078am048X9qJkmHTDYTzdoosgqWq2LVRYm2NS
 vVCEiJPAVpRS/U8QNmB0aBJHQRTkmYzYCUMiUzZC4rZPquuC0XbanEa2zQmVVxbu/QGG
 4b/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrx0gXwGzg5IZcRXshzNOSqUWZ7jv6R47lJEJ92D34cxgVahhRLEE6pU8tEnAHMZFmTjHFikbHH0aA=@buildroot.org
X-Gm-Message-State: AOJu0YxbxdtI+y+jr1k1msZB9GUdXWKCLfi1JiW70FAwI11yGYYiLOg+
 2BDvnpAiaFvQ63ETVWxELdaXGoVsAzKBTeRkjTy88wuIAXpSBMzvlLx5HxEgAVIxk8yVAXjzemN
 1car0lwk/t3mW5AuGDsECIrF5fYiNI8A=
X-Gm-Gg: AR+sD118y3gVjXP/pJuhNSr1mFjTtRfiiR4JNyKtXITHlqutXlQbXEkoWiEe4uxxt6O
 uU+pkT4js3E8GDVtNKRVaTtd+ipXbE+UCyb76xXPeV623HdpdiIczIva0SGp0ADT6mR5G2BXsam
 zFZzNyMOHeQyaxHrft8KvZjEgpNq+Cb30L1+XlwV/4rHzqXY7BHafMXPw/UrWH9b839TTnFunWw
 Y2WByCLKOm7GWS67SY3R5xiQASBABBhNvbioSiqwMS/V3en877vGtSewn20uDKdecY+K/Bywz8R
 UPGmTOeJAAfa3QrSgbd/vhW63et3xNJEZ+FqOM67sY+SZveUFHOddtax4NI3KvEQvDaqTG3ASQN
 e0MY1/buZAz4fP1hw7Fc9gaQ/Cl8jQRIRVOfOL1fzYor7p9730C0/Nr5e
X-Received: by 2002:a05:6808:13d6:b0:4a0:97bc:53a6 with SMTP id
 5614622812f47-4afadf11123mr22825674b6e.7.1786350658045; Mon, 10 Aug 2026
 01:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260805141803.1647733-1-philippemontcho@gmail.com>
 <0c800033-96f8-4e1b-9a80-2c6472512ded@gmx.de>
 <63f6f888cc951c77cca6a3be6cf2da00@free.fr>
In-Reply-To: <63f6f888cc951c77cca6a3be6cf2da00@free.fr>
From: Philippe MONTCHO <philippemontcho@gmail.com>
Date: Mon, 10 Aug 2026 10:30:50 +0200
X-Gm-Features: AUfX_mxkJQxdFWU5Y47I9pjzXmm6ahmmL28gdnO08yAn69H-BCpCTlK1pzrkjFc
Message-ID: <CAB86sFGGhsEjCC_myRPZ2pz1Nb5tqaro==jTX-WhEJunYGtipA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786350658; x=1786955458; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m6Z9QT4baR9nTFcSUbADewD/bQ6AK5OBb7xMRswiXsM=;
 b=dGYs+Gvwfivd3LSPmATaRNuOnVOmB0sYpGrX4/dpnawQ6wwGWunvm6kUCvo/X+P71P
 0hVwjR4IuEcfWwmyZ0jQDTDX0d9tvthUfyWe0KEJcwNb3unBeWCcCBTjU2DkeAdlpuyd
 Vt6Gm94ztFoYEiRMHrjW5WukPfgQqZ7rrppR4XgoYINhgF5ctLU9W7pk17+vQvmbc7iN
 31QrvR2LqSDzui7t3bfIapc3Iqfy6qIX2BBqDSVguHvTXgkf4DUSc+StGUihz5/13KnZ
 9BJeSf3zMoz35RrnVNXaOsrIVkkKrzIgSxynN8z1Z+DNcgFT1rSdUoYg7atRXzDaXyRq
 c6sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dGYs+Gvw
Subject: Re: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.8.1 and
 switch to meson build
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
Content-Type: multipart/mixed; boundary="===============6828583612329630597=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6828583612329630597==
Content-Type: multipart/alternative; boundary="0000000000006ac9cb0658ad2c68"

--0000000000006ac9cb0658ad2c68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,
Hi Fiona,

Thanks for your comments and explanations.
I will address the various points in the v2 of the patch.

Best regards,

Philippe.


Le sam. 8 ao=C3=BBt 2026 =C3=A0 09:14, Julien Olivain <ju.o@free.fr> a =C3=
=A9crit :

> Hi Fiona,
>
> On 07/08/2026 22:02, Fiona Klute wrote:
> > Hi Philippe,
> >
> > I mostly agree with Julien's comments, but two additional points below.
> >
> > Am 05.08.26 um 16:17 schrieb Philippe MONTCHO:
> >> Release note:
> >> https://github.com/dgibson/dtc/releases/tag/v1.8.1
> >
> > The primary repository is clearly the one on git.kernel.org (the manual
> > doesn't even mention the Github one), so please link there instead
> > [1,2]. Also it's probably the more stable source. ;-)
>
> I would have accepted this Github URL because it is mentioned in
> CONTRIBUTING.md:
>
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/CONTRIBUTING.md?h=
=3Dv1.8.1#n9
> and libfdt/sbom.cdx.json:
>
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/libfdt/sbom.cdx.jso=
n?h=3Dv1.8.1#n39
>
> It seems the project is using both, so I'm fine with one or the other.
>
> [...]
> > [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.8.0
> > [2] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.8.1
> > [3]
> >
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/README.license?h=
=3Dv1.8.1&id=3D205fbef17b7b2f410e34ac79aa1559a8d492b66c
>
> Best regards,
>
> Julien.
>

--0000000000006ac9cb0658ad2c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div>Hi Julien,</di=
v><div>Hi Fiona,</div><div><span style=3D"background-color:transparent"><br=
></span></div><div><span style=3D"background-color:transparent">Thanks for =
your comments and explanations.</span></div><div><span style=3D"background-=
color:transparent">I will address the various points in the v2 of the patch=
.</span></div><div><span style=3D"background-color:transparent"><br></span>=
</div><div><span style=3D"background-color:transparent">Best regards,</span=
></div><div><span style=3D"background-color:transparent"><br></span></div><=
div><span style=3D"background-color:transparent">Philippe.</span></div></di=
v></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 8 ao=C3=BBt 2026 =C3=A0=C2=
=A009:14, Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Fiona,<br>
<br>
On 07/08/2026 22:02, Fiona Klute wrote:<br>
&gt; Hi Philippe,<br>
&gt; <br>
&gt; I mostly agree with Julien&#39;s comments, but two additional points b=
elow.<br>
&gt; <br>
&gt; Am 05.08.26 um 16:17 schrieb Philippe MONTCHO:<br>
&gt;&gt; Release note:<br>
&gt;&gt; <a href=3D"https://github.com/dgibson/dtc/releases/tag/v1.8.1" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/dgibson/dtc/releases/t=
ag/v1.8.1</a><br>
&gt; <br>
&gt; The primary repository is clearly the one on <a href=3D"http://git.ker=
nel.org" rel=3D"noreferrer" target=3D"_blank">git.kernel.org</a> (the manua=
l <br>
&gt; doesn&#39;t even mention the Github one), so please link there instead=
 <br>
&gt; [1,2]. Also it&#39;s probably the more stable source. ;-)<br>
<br>
I would have accepted this Github URL because it is mentioned in <br>
CONTRIBUTING.md:<br>
<a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/CONTRIBUTI=
NG.md?h=3Dv1.8.1#n9" rel=3D"noreferrer" target=3D"_blank">https://git.kerne=
l.org/pub/scm/utils/dtc/dtc.git/tree/CONTRIBUTING.md?h=3Dv1.8.1#n9</a><br>
and libfdt/sbom.cdx.json:<br>
<a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/libfdt/sbo=
m.cdx.json?h=3Dv1.8.1#n39" rel=3D"noreferrer" target=3D"_blank">https://git=
.kernel.org/pub/scm/utils/dtc/dtc.git/tree/libfdt/sbom.cdx.json?h=3Dv1.8.1#=
n39</a><br>
<br>
It seems the project is using both, so I&#39;m fine with one or the other.<=
br>
<br>
[...]<br>
&gt; [1] <a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=
=3Dv1.8.0" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/=
scm/utils/dtc/dtc.git/tag/?h=3Dv1.8.0</a><br>
&gt; [2] <a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=
=3Dv1.8.1" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/=
scm/utils/dtc/dtc.git/tag/?h=3Dv1.8.1</a><br>
&gt; [3] <br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/REA=
DME.license?h=3Dv1.8.1&amp;id=3D205fbef17b7b2f410e34ac79aa1559a8d492b66c" r=
el=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/utils/dt=
c/dtc.git/commit/README.license?h=3Dv1.8.1&amp;id=3D205fbef17b7b2f410e34ac7=
9aa1559a8d492b66c</a><br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--0000000000006ac9cb0658ad2c68--

--===============6828583612329630597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6828583612329630597==--
