Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC0C71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 12:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86E4B41570;
	Mon, 28 Aug 2023 12:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86E4B41570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxzjmLgBGv7A; Mon, 28 Aug 2023 12:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569D1415C0;
	Mon, 28 Aug 2023 12:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569D1415C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACBE11BF575
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 12:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CEAB81F3E
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 12:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CEAB81F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLnBYBAMzyZu for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 12:11:45 +0000 (UTC)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5727F81F3D
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 12:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5727F81F3D
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso2987163276.1
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 05:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693224704; x=1693829504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FryKvsNR7BWxXJP0CFvGP3B281g2EqUD2zkK5wIyM4=;
 b=g7JK7bFkahTsNuI2FOuyZosuwN+BASNEDUXHuvIie2b75iIcUiXwmuy1Fc2kz6eIR5
 8hBvGWGNaPqdO8qG2jdUE8J7alnQ17VRvty/MBZCTrL4vxV5lA+wIBjqQRxC37Gg0MEV
 6ahTVjf9bKZ+P/jjOgBkqaRpEQVz2EPxzELRkhc8ClBZgVA2SPamYTSJ7iyAR/c/5TD9
 dFmg9JgQbbzfYdjvB313nwz1ecRhp1iQb+QuoaPnu7wooUbYHStWMU7EA6/relYvi6T4
 NGCuyue7D4oNvKUbZ+tIiiObfx46gvjgWTeFt8GVjUujjkZeNAM78a7zCoiOr/mqyq1Z
 v51w==
X-Gm-Message-State: AOJu0YyhQ2wvUpNZW6+hZv/WE3EIIPZ8jXmg8LhDRGctCEfyHnXjX8+A
 xPbssY0gmq5Z4b3V5YPbh6coFIRc/G/zNY4clgLdJkvD
X-Google-Smtp-Source: AGHT+IHb6Y4UisFqkBMFPBpL9blPjRmT5gvJWqHgDoAxSaoTaj1qXnRfCHbM6sk0BxP/NNB0ItHH/kdXLMNDEm1cyAI=
X-Received: by 2002:a05:6902:1023:b0:d7b:3298:8e12 with SMTP id
 x3-20020a056902102300b00d7b32988e12mr1603191ybt.7.1693224704120; Mon, 28 Aug
 2023 05:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
In-Reply-To: <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
From: Robert Smigielski <ptdropper@gmail.com>
Date: Mon, 28 Aug 2023 08:11:34 -0400
Message-ID: <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693224704; x=1693829504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3FryKvsNR7BWxXJP0CFvGP3B281g2EqUD2zkK5wIyM4=;
 b=nLdD6l6gtnbXBHqvAp3r6/xjA87PEV8SRy0Zi7QScT729MZqgSaz27+nk5/F9LRz7n
 iSrFx330Cgnn5HJ6O8ZpqyBBHTGgcI79sfrPA4xBAFs/n0l5hPGS5aTh1KmRGxSvDnoA
 cC7XWHJumURil64ssRsfNPzsIJFlS/BINfQbQwOUpGdbCIc7on9pXYmMRBjM31aiMjev
 I/yX87YqnM9MVbkGpblsGqb4FIdSK6hNHsLMRcC64RMsedJIAPAWGCzgTNTiuTmnPo/F
 ZBkgf9y0g1jd6mNANuLPdNAOoJVeJC3pUYgfiTkWP5DPMBOA4vEr/ZW/vQHqqXIvGmD9
 arpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nLdD6l6g
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Content-Type: multipart/mixed; boundary="===============8732905519466352146=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8732905519466352146==
Content-Type: multipart/alternative; boundary="000000000000039b160603fa9994"

--000000000000039b160603fa9994
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My focus is dependency track as the tool, I use to scan the software bill
of materials. I use it at work to check on the status of a variety of
projects. Historically, it supported only server and software as a service.
With the Buildroot interface you can also pull in data from your board
support packages. And that's exactly what I'm doing. I have added those
specific software bill of materials to my set of projects in dependency
track.

At this time I'm reading up on the difference between CPE and PURL. While
we have CPE information in their currently, it may be beneficial to have
PURL for some of the packages. I'm still new to the concept of what those
two formats provide. Your feedback is most welcome. Glad you are finding
this useful.

Robert Smigielski

On Mon, Aug 28, 2023, 7:38 AM Michael Nosthoff <buildroot@heine.tech> wrote=
:

> Hi,
>
> On 28. Aug 2023, at 08:00, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> "Robert" =3D=3D Robert Smigielski <ptdropper@gmail.com> writes:
>
>
> Hi,
>
> Announcing CycloneDX support for the embedded / IOT / MIOT world. Using
> your Buildroot output, my project produces CycloneDX SBOM files for suppl=
y
> chain management and vulnerability management. I am a long time Buildroot
> user now in the device security space. Glad to provide CycloneDX SBOM
> support for Buildroot users.
>
>
> https://github.com/CycloneDX/cyclonedx-buildroot
>
>
> https://pypi.org/project/CycloneDX-Buildroot/
>
>
> I=E2=80=99m just returning from vacation so it will take some days but I =
will
> happily try this out.
> I recently built my own show-info to cyclone-dx python script but from
> skimming through
> your package this looks way better than mine.
>
> So without further checking already: thanks for taking on this task!
>
>
> Thanks! I think I have seen it earlier, where I noticed that it only
> worked on the legal-info manifest - But we have quite a bit more
> SBOM-related info in Buildroot nowadays visible in show-info. I see that
> you are now also using this info for the CPE data, so that is good.
>
> So what is the status of this project? Anything missing? Anything you
> are missing from Buildroot? What (open source) tools can consume the
> generated SBOMs and do something interesting with it?
>
>
> There are multiple tools which can work with the cyclone-dx format and
> from what
> I=E2=80=99m reading this might become the =E2=80=9Cde-facto SBOM standard=
=E2=80=9D.
>
> What we are currently evaluating is Dependency Track (
> https://dependencytrack.org/).
> It=E2=80=99s not perfect but it checks your SBOM frequently for new Issue=
s and
> generates
> management friendly Dashboard Views. In the end this is pretty new for
> most of us I guess.
>
> Regards,
> Michael
>
>
>

--000000000000039b160603fa9994
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">My focus is dependency track as the tool, I use to scan t=
he software bill of materials. I use it at work to check on the status of a=
 variety of projects. Historically, it supported only server and software a=
s a service.=C2=A0<div dir=3D"auto">With the Buildroot interface you can al=
so pull in data from your board support packages. And that&#39;s exactly wh=
at I&#39;m doing. I have added those specific software bill of materials to=
 my set of projects in dependency track.<br><br>At this time I&#39;m readin=
g up on the difference between CPE and PURL. While we have CPE information =
in their currently, it may be beneficial to have PURL for some of the packa=
ges. I&#39;m still new to the concept of what those two formats provide. Yo=
ur feedback is most welcome. Glad you are finding this useful.<br><br><div =
data-smartmail=3D"gmail_signature" dir=3D"auto">Robert Smigielski</div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Aug 28, 2023, 7:38 AM Michael Nosthoff &lt;buildroot@heine.tech&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"line-break:=
after-white-space">Hi,<br><div><br><blockquote type=3D"cite"><div>On 28. Au=
g 2023, at 08:00, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com=
" target=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt; wrote:</=
div><br><div><div><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">&q=
uot;Robert&quot; =3D=3D Robert Smigielski &lt;<a href=3D"mailto:ptdropper@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">ptdropper@gmail.com</a>&gt; =
writes:<br></blockquote></blockquote></blockquote></blockquote></blockquote=
><br>Hi,<br><br><blockquote type=3D"cite">Announcing CycloneDX support for =
the embedded / IOT / MIOT world. Using<br>your Buildroot output, my project=
 produces CycloneDX SBOM files for supply<br>chain management and vulnerabi=
lity management. I am a long time Buildroot<br>user now in the device secur=
ity space. Glad to provide CycloneDX SBOM<br>support for Buildroot users.<b=
r></blockquote><br><blockquote type=3D"cite"><a href=3D"https://github.com/=
CycloneDX/cyclonedx-buildroot" target=3D"_blank" rel=3D"noreferrer">https:/=
/github.com/CycloneDX/cyclonedx-buildroot</a><br></blockquote><br><blockquo=
te type=3D"cite"><a href=3D"https://pypi.org/project/CycloneDX-Buildroot/" =
target=3D"_blank" rel=3D"noreferrer">https://pypi.org/project/CycloneDX-Bui=
ldroot/</a><br></blockquote></div></div></blockquote><div><br></div>I=E2=80=
=99m just returning from vacation so it will take some days but I will happ=
ily try this out.</div><div>I recently built my own show-info to cyclone-dx=
 python script but from skimming through</div><div>your package this looks =
way better than mine.</div><div><br></div><div>So without further checking =
already: thanks for taking on this task!</div><div><br><blockquote type=3D"=
cite"><div><div><br>Thanks! I think I have seen it earlier, where I noticed=
 that it only<br>worked on the legal-info manifest - But we have quite a bi=
t more<br>SBOM-related info in Buildroot nowadays visible in show-info. I s=
ee that<br>you are now also using this info for the CPE data, so that is go=
od.<br><br>So what is the status of this project? Anything missing? Anythin=
g you<br>are missing from Buildroot? What (open source) tools can consume t=
he<br>generated SBOMs and do something interesting with it?<br></div></div>=
</blockquote><div><br></div><div>There are multiple tools which can work wi=
th the cyclone-dx format and from what</div><div>I=E2=80=99m reading this m=
ight become the =E2=80=9Cde-facto SBOM standard=E2=80=9D.</div><div><br></d=
iv><div>What we are currently evaluating is Dependency Track (<a href=3D"ht=
tps://dependencytrack.org/" target=3D"_blank" rel=3D"noreferrer">https://de=
pendencytrack.org/</a>).</div><div>It=E2=80=99s not perfect but it checks y=
our SBOM frequently for new Issues and generates</div><div>management frien=
dly Dashboard Views. In the end this is pretty new for most of us I guess.<=
/div><div><br></div><div>Regards,</div><div>Michael</div><br></div><br></di=
v></blockquote></div>

--000000000000039b160603fa9994--

--===============8732905519466352146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8732905519466352146==--
