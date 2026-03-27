Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5969910ED645
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DED461023;
	Fri, 27 Mar 2026 09:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7J3S2DQiPrx; Fri, 27 Mar 2026 09:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E789C6102E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605051;
	bh=sksNsaVvZ2MOnzeh27a5HgT8vOPwTxOKBe+hLjOvxvY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g80Qgb/+3Klk46kgnnqanbfsppVTbsVPEkAEcot7Z6xhd1fVej7Pc2nDbiez8kXo/
	 j5ezPNt7AwU4CP2kOhtc8vpVz9foFGyZ85qYuShZJgHVdGJTBvwbkTIkk/tNRPoEXT
	 LdgthvDaYPx7iwxfDpjifJWqdF1w3X5dNFtU3AhvjEtsw/i5Kt9C1QK7whS8cRq7UH
	 CpY0ZeH9CgVtZFO1dlD+qcILmaPuYc+8Qahe6D/3VSbGGvVeZhTh/FUrLs5PdiNQfr
	 3cEumnyfntt3WEmEkDvSrPmm+lJnegq4BXAM8+a5X+rsvq2GmRYIJVggoeEgCkOtvn
	 8JJXyViEu3usw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E789C6102E;
	Fri, 27 Mar 2026 09:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 084FD249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6FEC6102E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUgiQ43r44Vw for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6397561023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6397561023
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6397561023
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:50:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-66b05026e82so2993655a12.3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 02:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774605045; cv=none;
 d=google.com; s=arc-20240605;
 b=bgw/7L0zywJvjDNCR9f28LyjfIPYF6tSc/TzXvr7/lo80EWalUeFRYPXTZ/QqQqCBj
 FRCcxkC00eEX68Av+3ryGp8MRmVcc7SVLEsZo8nPRZLH3pTnF4TMiIAGEaCO6+S9oCLn
 iPa/iByKMoJ+GBVwRnmN/sbB1l9J7X0weTBBQ/wsAORnGSsZCtZ2uqEjATdn6SdJWMsq
 n7gt62PRxMVwccH2uCSGZ8e8VNoJaAKH08cEFi150jo216Bs0FWqPqoxQPILZlBU0Nj7
 LmZD1QJldLi6tnKYVPDCkB7lK0DRttbs+GTzVBKr0gc/skq9FdGSBNMbjphVh1iUEB1D
 zQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Bv0SNyR9g+Y2aC3U8DBsDem0YRUUfUaXD0p3Ig8SdQs=;
 fh=zNmwxmg1mdKa/EAOIj0l04pdFvwpMYMYQVl/OCpD6Xc=;
 b=KEKv2rvi1h9A5Ve1IOhr52MHBIVuLNvMJo7c4trZ0ZSmjxI+8YwidfhGGu9dPWDyyU
 veoJRDK0BVtZ6UMlTsak3nM+SrRAiIw49VzUPq70dIWzIxGTIuswMLSP2s4/vTSq72+1
 LKNisX+5Y8mGS/7kwQZ/QejzJErGShoGVTH9PiPuyhhaeTALETsudOZsTc0JxOZ7Zk3B
 UbBbg7ZGz6WA2aNTnMXvpLmFsEDhVn170kcXLmvwtYZCpOz8ItagPwgQadHGdx0L4K9e
 9Te3wg4qKqscg+BKMFbW6GhO3k6rYfxQIKVzzYDqy7DFHTjifsTaXKDN4fku+jqWSCCw
 4V/A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605045; x=1775209845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bv0SNyR9g+Y2aC3U8DBsDem0YRUUfUaXD0p3Ig8SdQs=;
 b=c/+HKe5Dk5j+hH30pkOyg/S8ZA6yyLia7+XZfXF4Xkl1A72+x4RMTb8x9RfIuINgSa
 BlOZap3Dt03Wd3aivSA57PMUUXNeqJeMPyt/d2MnefSusswsB61vmVwTZ2sGWehqRG5Z
 GKBWCHM8MeI0ID4Ey7nYrDhC+BZMhMfn2kBQXn4q0omDuFoASHZwhNlOdQS5ehR2x4dV
 fmwU/4SVBf3sgGojyT8fIsM3qNXT0rKGnI2+bmSKNBqjz+t0BAZiJjiBb2u0/KgVtqKz
 H5lQCuqFWexdyB4+wDV/1R4NSIoYfUeSa8N55L2wkL0JjBXDgDYll5EKsqDriJzKpgSM
 odkQ==
X-Gm-Message-State: AOJu0YxdQpWLccgdYruyWdd1NepaUtZPfg6W4oMOWk0xTcznrZxRAVHG
 1HPvHFHg2J/9E/SvsNPBhuELyGKWKCt4Ps3v9Ue1fhGXgMups8EOS/9GdKhWP23HtvBBB9+enPS
 Rx+6QC/oA0UMNulx/KU9sFtRQJJ9jK5s=
X-Gm-Gg: ATEYQzxkk1j7G6Q6BYwGCooxbNcvJn0Nj+icQpH/nicdVrdmPMMX68vO27/c8/hfMvX
 zN6t9M/7zaJTuD1CB8slf4QCDEzSuRm0tCby3Z0u//ENyHVSptolxZKL1FK3jj515887LKQwF/X
 eA8wKrqjUHUzYKbT6RjL8Qhfz39DtXBzIN3msqujdiqLvu6QhNbw3yS9OOWYTAUHNRospMuhKaN
 2QOs2DvEN4gL/6R9pIfC4ghCx7VQnq0J/Ams/2WSleKpVAvP5kuo/lB+r71bfBjEksyrWKzlVqg
 c3JYo3UAsset2cV6RGLlapMc3vY1pGSRX/DB0+57yg==
X-Received: by 2002:a05:6402:524a:b0:660:f1a1:e8dc with SMTP id
 4fb4d7f45d1cf-66b28e6d5ffmr1034385a12.25.1774605044562; Fri, 27 Mar 2026
 02:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260303182128.1242999-1-chakrabortyshubham66@gmail.com>
 <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
 <8fff630f63cf5dbca36e7efe3a8f13ef@umbiko.net>
In-Reply-To: <8fff630f63cf5dbca36e7efe3a8f13ef@umbiko.net>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Mar 2026 15:20:33 +0530
X-Gm-Features: AQROBzB0ooPUm2i-5g9zt_zNdFyN14ZR9nq_iUTD2nX6nrXyCi9NRqqtM9fGIK4
Message-ID: <CABvxksyUBjmam1umdsPeoxBJ9STBvBP94jdJrH9E_iwNzHDYwA@mail.gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774605045; x=1775209845; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bv0SNyR9g+Y2aC3U8DBsDem0YRUUfUaXD0p3Ig8SdQs=;
 b=B5s/lY+UL3Y7+a1Dm8NfeDURDTGAezrtCWOXsQPq5vbB+Cuu63XcAfvfsu/itXW1nM
 wsj7FLeNrW2tRlSKaMQ7Y89Q5GNiLbm+xVztwGGorRETPyWeIy7+mx8f0fLQ+tN5SfZN
 fwHthIa0tdXchQtiYyrygLSM7icp6d+9jvbbto1fhO3pVz9ke39oAX5a6btOB/wlNWbv
 VrNRyHP9ICHVfftvOg6W+CLj/VHB8p3JWaSzmIsatILPu7f6ikIb0GUBCj/Ayb/VuIFB
 +S8E+Ox94Rm+rga41Vcc0XMd5Ngi4UpeQAiXRX4Ao6ThB3hOenksByCJhDmQfjgvTzhl
 AZkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=B5s/lY+U
Subject: Re: [Buildroot] [PATCH v3] package/icu: fix static linking with
 icu-uc
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
Content-Type: multipart/mixed; boundary="===============7618898338659122451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7618898338659122451==
Content-Type: multipart/alternative; boundary="0000000000004c3f91064dfe6ff4"

--0000000000004c3f91064dfe6ff4
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

I have sent a v4 patch which addresses the issue and is based on the
current Buildroot master branch.

Best regards,

Shubham Chakraborty


On Fri, 27 Mar, 2026, 9:57 am Andreas Ziegler, <br025@umbiko.net> wrote:

> Hi Shubham,
>
> On 2026-03-26 11:36, Shubham Chakraborty wrote:
> > Extend the existing patch to also add -lstdc++ to the Libs
> > field, fixing static linking issues with libicuuc.a.
> >
> > This combines the previous 0003 and 0004 changes into a
> > single patch, following review feedback from Andreas.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - Merge previous 0003 and 0004 into a single patch
> >   - Extend existing fix to also add -lstdc++ to Libs (static linking
> > case)
> >   - Keep original authorship and add my Signed-off-by below Romain's
> >   - Update commit message and description based on review feedback
> > ---
> >  .../0003-fix-static-linking-with-icu-uc.patch | 29 ++++++++++++-------
> >  ...atic-linking-with-icu-uc-static-musl.patch | 26 -----------------
> >  2 files changed, 19 insertions(+), 36 deletions(-)
> >  delete mode 100644
> > package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> >
> > diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > index 36a3d1f696..ec393254e8 100644
> > --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > @@ -3,9 +3,6 @@ From: Romain Naour <romain.naour@openwide.fr>
> >  Date: Wed, 22 Jul 2015 22:43:25 +0200
> >  Subject: [PATCH] fix static linking with icu-uc
> >
> > -During static linking with a C application and libicuuc.a,
> > --lstdc++ is required.
> > -
> >  Add -lstdc++ in Libs.private of icu-uc.pc.
> >
> >  Fixes:
> > @@ -13,14 +10,26 @@
> >
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
> >
> >  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> >  ---
> > - source/Makefile.in | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > +This patch currently addresses linking against stdc++ for
> > shared-library
> > +builds. Add -lstdc++ to the static build flags also, to fix 'undefined
> > +reference' errors when linking programs like xmlcatalog (libxml2)
> > +with musl static toolchains.
> > +
> > +Upstream: Inactive-Upstream [Buildroot specific]
> > +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > +---
> > + source/Makefile.in | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> > ---- icu.orig/source/Makefile.in      2025-03-13 19:31:23.000000000 +0100
> > -+++ icu/source/Makefile.in   2025-09-22 08:56:36.791792784 +0200
> > -@@ -279,7 +279,7 @@
> > -     @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' >> $@
> > +diff --git icu.orig/source/Makefile.in icu/source/Makefile.in
> > +--- icu.orig/source/Makefile.in
> > ++++ icu/source/Makefile.in
> > +@@ -279,10 +279,10 @@ config/icu-uc.pc: config/icu.pc Makefile
> > icudefs.mk
> > +     @echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data
> > libraries" >> $@
> > +     @echo "Name: $(PACKAGE)-uc" >> $@
> > + ifeq ($(ENABLE_SHARED),)
> > +-    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' >> $@
> > ++    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' -lstdc++ >> $@
> >   else
> >       @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
> >  -    @echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
> > diff --git
> > a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> > b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> > deleted file mode 100644
> > index e17f6ac775..0000000000
> > --- a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> > +++ /dev/null
>
> Your patch seems not to be based on the current Buildroot master branch.
> It cannot be applied, unfortunately.
>
> > @@ -1,26 +0,0 @@
> > -From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
> > -From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > -Date: Tue, 3 Mar 2026 10:00:00 +0000
> > -Subject: [PATCH] fix static linking with icu-uc (static case)
> > -
> > -During static linking with a C application and libicuuc.a,
> > --lstdc++ is required. The previous patch (0003) only addressed the
> > -shared library case (Libs.private). This patch adds -lstdc++ to the
> > -main Libs line for the static case to fix undefined reference
> > -errors when linking programs like xmlcatalog (libxml2) with
> > -musl toolchains.
> > -
> > -Upstream: Inactive-Upstream [Buildroot specific]
> > -Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ----
> > - source/Makefile.in | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> > ---- icu.orig/source/Makefile.in
> > -+++ icu/source/Makefile.in
> > -@@ -281,3 +281,3 @@
> > - ifeq ($(ENABLE_SHARED),)
> > --    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' >> $@
> > -+    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' -lstdc++ >> $@
> > - else
> > --
> > 2.53.0
>
> Kind regards,
> Andreas
>

--0000000000004c3f91064dfe6ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Andreas,<br><br>I have sent a v4 patch which addresses=
 the issue and is based on the current Buildroot master branch.<br><br>Best=
 regards,<br><br>Shubham Chakraborty<div><br></div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, 27 Mar, 2026, 9:57 am Andreas Ziegler, &lt;<a href=3D"mailto:br025@um=
biko.net">br025@umbiko.net</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi Shubham,<br>
<br>
On 2026-03-26 11:36, Shubham Chakraborty wrote:<br>
&gt; Extend the existing patch to also add -lstdc++ to the Libs<br>
&gt; field, fixing static linking issues with libicuuc.a.<br>
&gt; <br>
&gt; This combines the previous 0003 and 0004 changes into a<br>
&gt; single patch, following review feedback from Andreas.<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v2 -&gt; v3:<br>
&gt;=C2=A0 =C2=A0- Merge previous 0003 and 0004 into a single patch<br>
&gt;=C2=A0 =C2=A0- Extend existing fix to also add -lstdc++ to Libs (static=
 linking <br>
&gt; case)<br>
&gt;=C2=A0 =C2=A0- Keep original authorship and add my Signed-off-by below =
Romain&#39;s<br>
&gt;=C2=A0 =C2=A0- Update commit message and description based on review fe=
edback<br>
&gt; ---<br>
&gt;=C2=A0 .../0003-fix-static-linking-with-icu-uc.patch | 29 ++++++++++++-=
------<br>
&gt;=C2=A0 ...atic-linking-with-icu-uc-static-musl.patch | 26 -------------=
----<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 36 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 <br>
&gt; package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch<br>
&gt; <br>
&gt; diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch <br=
>
&gt; b/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; index 36a3d1f696..ec393254e8 100644<br>
&gt; --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; @@ -3,9 +3,6 @@ From: Romain Naour &lt;<a href=3D"mailto:romain.naour@=
openwide.fr" target=3D"_blank" rel=3D"noreferrer">romain.naour@openwide.fr<=
/a>&gt;<br>
&gt;=C2=A0 Date: Wed, 22 Jul 2015 22:43:25 +0200<br>
&gt;=C2=A0 Subject: [PATCH] fix static linking with icu-uc<br>
&gt; <br>
&gt; -During static linking with a C application and libicuuc.a,<br>
&gt; --lstdc++ is required.<br>
&gt; -<br>
&gt;=C2=A0 Add -lstdc++ in Libs.private of icu-uc.pc.<br>
&gt; <br>
&gt;=C2=A0 Fixes:<br>
&gt; @@ -13,14 +10,26 @@ <br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/210/2107f9dfb39eeb65=
59fb4271c7af8b39aef52" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef5=
2</a><br>
&gt; <br>
&gt;=C2=A0 Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@o=
penwide.fr" target=3D"_blank" rel=3D"noreferrer">romain.naour@openwide.fr</=
a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - source/Makefile.in | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +This patch currently addresses linking against stdc++ for <br>
&gt; shared-library<br>
&gt; +builds. Add -lstdc++ to the static build flags also, to fix &#39;unde=
fined<br>
&gt; +reference&#39; errors when linking programs like xmlcatalog (libxml2)=
<br>
&gt; +with musl static toolchains.<br>
&gt; +<br>
&gt; +Upstream: Inactive-Upstream [Buildroot specific]<br>
&gt; +Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortys=
hubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham=
66@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + source/Makefile.in | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in<br>
&gt; ---- icu.orig/source/Makefile.in=C2=A0 =C2=A0 =C2=A0 2025-03-13 19:31:=
23.000000000 +0100<br>
&gt; -+++ icu/source/Makefile.in=C2=A0 =C2=A02025-09-22 08:56:36.791792784 =
+0200<br>
&gt; -@@ -279,7 +279,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &q=
uot;${ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; +diff --git icu.orig/source/Makefile.in icu/source/Makefile.in<br>
&gt; +--- icu.orig/source/Makefile.in<br>
&gt; ++++ icu/source/Makefile.in<br>
&gt; +@@ -279,10 +279,10 @@ config/icu-uc.pc: config/icu.pc Makefile <br>
&gt; <a href=3D"http://icudefs.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">icudefs.mk</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;Description: $(PACKAGE_ICU_DESCRIPTIO=
N): Common and Data <br>
&gt; libraries&quot; &gt;&gt; $@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;Name: $(PACKAGE)-uc&quot; &gt;&gt; $@=
<br>
&gt; + ifeq ($(ENABLE_SHARED),)<br>
&gt; +-=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; ++=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; -lstdc++ &gt;&gt; $@<br>
&gt;=C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Libs:&quot; &#39;-L$${libdir}&#3=
9; &quot;${ICULIBS_UC}&quot; &gt;&gt; $@<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 @echo &quot;Libs.private:&quot; &quot;${ICULIBS_D=
T}&quot; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; diff --git <br>
&gt; a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch <b=
r>
&gt; b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch<br=
>
&gt; deleted file mode 100644<br>
&gt; index e17f6ac775..0000000000<br>
&gt; --- a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patc=
h<br>
&gt; +++ /dev/null<br>
<br>
Your patch seems not to be based on the current Buildroot master branch. <b=
r>
It cannot be applied, unfortunately.<br>
<br>
&gt; @@ -1,26 +0,0 @@<br>
&gt; -From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortyshubham66@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham66@gmail.=
com</a>&gt;<br>
&gt; -Date: Tue, 3 Mar 2026 10:00:00 +0000<br>
&gt; -Subject: [PATCH] fix static linking with icu-uc (static case)<br>
&gt; -<br>
&gt; -During static linking with a C application and libicuuc.a,<br>
&gt; --lstdc++ is required. The previous patch (0003) only addressed the<br=
>
&gt; -shared library case (Libs.private). This patch adds -lstdc++ to the<b=
r>
&gt; -main Libs line for the static case to fix undefined reference<br>
&gt; -errors when linking programs like xmlcatalog (libxml2) with<br>
&gt; -musl toolchains.<br>
&gt; -<br>
&gt; -Upstream: Inactive-Upstream [Buildroot specific]<br>
&gt; -Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortys=
hubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham=
66@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - source/Makefile.in | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff -git icu.orig/source/Makefile.in icu/source/Makefile.in<br>
&gt; ---- icu.orig/source/Makefile.in<br>
&gt; -+++ icu/source/Makefile.in<br>
&gt; -@@ -281,3 +281,3 @@<br>
&gt; - ifeq ($(ENABLE_SHARED),)<br>
&gt; --=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; -+=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; -lstdc++ &gt;&gt; $@<br>
&gt; - else<br>
&gt; --<br>
&gt; 2.53.0<br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--0000000000004c3f91064dfe6ff4--

--===============7618898338659122451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7618898338659122451==--
