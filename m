Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECCF3380C
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 08:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFC86147E;
	Tue, 17 Mar 2026 08:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSzw1VShuqEc; Tue, 17 Mar 2026 08:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F4D61481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773735103;
	bh=gZfweJ7k5vHtLWUJWe9pEkMuu0n5YYKeS2PCcIP1AkY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suhSTpOJjfKSN/ZncKjYaHLvq3IlBDv4q+voQLsiJ5D6DRczDY8IUCm2J8LX9GECI
	 IiQNntuQ1nM4wJXH0sPPHk87a5XSkyYbvrr4UuYw/9u08YlPCpAL7auJAYx6IVe9Dt
	 Lj2NsudYjKsxeLuB35WIue1AAqiO3CPAnuyUvj48jbLuuqsMUxfGkH4zUr6vjXpiXJ
	 Xq/uPUlH8XmpsdFpn/vCPI/yOBtuelQ1ZPZRR45DS/HvpJFN6m79jULFciTpDWARto
	 C5GW2uEiyM3eeq5ASKoWEG6IkJphYlTmiQUPH1BJFYU+PW9FmMFHuSH/PLnNp/BC6B
	 v5f3LROg07v2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F4D61481;
	Tue, 17 Mar 2026 08:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 353911B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF51415B0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-9wXkvEuORU for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 08:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1C8F415AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C8F415AB
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1C8F415AB
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:11:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b97c44417ffso195781766b.2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 01:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773735097; cv=none;
 d=google.com; s=arc-20240605;
 b=h982uunZR2zUQZJkl27xkPgecbJ51bZb/Xcuwh4Y15VIGv+h+6yyqVUEHN+/HxHjYi
 tKyleBLadyBtaAFAQY3hsiVkeMnyZEmc/dH8EYUGAXM0xbl95GOd7u9XdZzaUbz+ZKnn
 s68Xox+q3zkSlX+H1e5vm8eyj9a+XPFUKj+VobHHa+pvq65PDr15YW3EKNxUHJC4cGvp
 6WvrSDTExRlsTKZi5NbLF8eeZKLD+IPYkytArU0/pjKM4V712JCnPQkwrLb8+G2dCOwK
 C/bd3mmVk8LL7d+TRhzP4J+SHJPlywO54MjM+oFaDFEsp9xLZrWYhsWG5fVQxpanIBMa
 SmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MJaGTzmfxN99cR58r8HXcEcH279R4aQBdqnlI07/yJ0=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=dx5mgkTEnjIdwNaHl7AafEe5T2y4XWroSY9w1IwLwVQG99tsWROQRI2VweYqEQ3zAO
 NpowQveU+knO7Vzzp8BzbUrKdy/fXvT3nRjnlg4FQGg71RWjhdfRKMAg4Pz4K9P2xTqL
 6BSHHFYwxfvsAPz8UEvZjwy2lhdQT9C6JpVuFJpwxvige1ONKL/TrQsS2BcXWutNQyI+
 pySJf9CA32mrRhCmml/SybpN9zmUTRcKTp+gPXD4YDpWDePJ9Kyt6Ln0ut4aL/THcKsh
 RqMpO6SndSWONTdwdBKT+krjlFy+m82GvFK5b/R1Bis619n0pUVkU3043XDBzZENR7cD
 jrZw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773735097; x=1774339897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJaGTzmfxN99cR58r8HXcEcH279R4aQBdqnlI07/yJ0=;
 b=SghIHEUYI/7doC9f4O5D4wkU4syvriV2sIC62qG8QoGvbKqamOU3wfVRkrRSSYdklJ
 ytRlypsKVAf0TSXT13om7rGxXAoPelbwjYy9pjMz63rQJeRSJPnXw/xzcQrUJeo17HtS
 K5c7FQEblc1SKn6eLQ/+HxlwYypZbHcMEYsI6en5qtmBEM3t7wTp798aUX5qBZf7YuhS
 U9YDTFdGM5i3eJzkEU7spNWFcXD0Q/tiNoC5EKRo0Rl/DteI9DOETs+7A5mTIboYD1Az
 F7g8IsboTzvGl6C7iFoKdOnQguvPt+upAU8YPfOmx4T8o8QFtzlIkyxaX3+MNPb8M6r8
 6Zmg==
X-Gm-Message-State: AOJu0YxOLmj9GvcR1Y/n3lINHtpIF9s/s8airGF5Oplsym+X0jK4er2X
 DcT/3nnuLrgbAwExn4BU+kDV3xRx75/ENm5lt0pMQqLBvJOh8Qbp6z9FeKwZoY9aToHP0FMd2c9
 nQfPJMcd7OaFCfQ0lXvMUfWQYaaBDy/4=
X-Gm-Gg: ATEYQzwRCKDR9RGuhLWVntctMm3uHF2bMDiJNV1qaIMlpxupd+CwtpkKuPXTkpyNqSC
 AfLaytoPgvPKTwd0apRL3UmiwUE13EaBG/zEyGCLUl+tTLU4IXTsm7xhaWeOhIGboIiYpD1tRxj
 gvMCwKHNcumpQkEYlfBM7CrN6aDaBaokWBCD5tFcg3F4YhL9X1gTJfsz7rqdwCg6dLxdrw0ATBO
 YOntXviTIJCkUfsduaN9VVT6lVAg6T7Z8Y1ALPmswOGBFrY+cXH585BDEu8b3ch1G8wiOFMQX+v
 EFcPI1+rB00uQFwqu2lwp2w46eKoZKbRYoPOAWoeYg==
X-Received: by 2002:a17:907:6ea4:b0:b97:b19a:1e63 with SMTP id
 a640c23a62f3a-b97b19a23c8mr538084666b.33.1773735096913; Tue, 17 Mar 2026
 01:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260317074923.981623-1-chakrabortyshubham66@gmail.com>
 <abkJYg9QXlB-Lrii@windsurf>
In-Reply-To: <abkJYg9QXlB-Lrii@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue, 17 Mar 2026 13:41:25 +0530
X-Gm-Features: AaiRm52x5ABjiYUXsuR-pggtwL_7bVrN8mOgbdJF50mEft1HZuBDlOJRj7IW134
Message-ID: <CABvxkszOWB5WVYyqnktqvyYp=9tOyha17vB4xTUtOm1ERhcc7A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773735097; x=1774339897; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MJaGTzmfxN99cR58r8HXcEcH279R4aQBdqnlI07/yJ0=;
 b=Qy4y+ULx6Qhobp0OriS9r2naQCweGJuYdOizVmEV/HaFfhnh4FSAtFXcw3xi6JFNxo
 de1XnzzLCAKWSfovg/eVQ9gxE8z+stVpbtSLaeW3O78qiNOiPm3n4++dcXj4iQYTqf88
 INdEcbUls0nFUGVac5A/tDYaLJ/ZStjui01N9qvhF+hYdQ23BOLweCKTgYQowXosBO9B
 aBNXmnzc6DsBDlBHJka8FWJz+MUzIPyFfMuTKIiITvye700dYznRN1SThANY9oYSqj22
 WBnxRJuHAdMiWSM2Tp7HFxcxbfZX3AypG3BQjRnqA3jT/a+96ewvipyW7we+IWhXFVSZ
 888g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qy4y+ULx
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
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
Content-Type: multipart/mixed; boundary="===============8775447939130950718=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8775447939130950718==
Content-Type: multipart/alternative; boundary="000000000000609503064d33e2d3"

--000000000000609503064d33e2d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

 Thank you for the quick feedback and for pointing out this critical issue.

I didn't consider reverse dependencies. The scenario you described
(uninstalling openssl breaking ntp) is a
serious problem that makes the current implementation unsafe.

I see a few potential approaches to address this:

 1. Add dependency checking that refuses to uninstall if reverse
dependencies exist (similar to package managers like apt/dnf)

 2. Implement cascade uninstall (uninstall the package and all its reverse
dependencies)

 3. Add a --force flag with clear warnings that this may break other
packages

 4. Simply document this as a "use at your own risk" feature for advanced
debugging scenarios

I wanted to ask: would any of these approaches be acceptable for Buildroot?
Or is the fundamental issue that without proper
dependency tracking during uninstall, this feature is too dangerous to
include regardless of warnings/checks?

I'm happy to implement proper dependency checking if that would make this
feature viable,
or I can withdraw the patch if you think the approach is fundamentally
flawed.
Thanks again for your time reviewing this.

 Best regards,
 Shubham

On Tue, Mar 17, 2026 at 1:29=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Tue, Mar 17, 2026 at 01:19:19PM +0530, Shubham Chakraborty wrote:
> > Buildroot currently does not track which files are installed by each
> > package in output/staging, output/target, output/host, and
> > output/images directories. This makes it impossible to cleanly remove
> > a package without performing a full rebuild.
> >
> > This commit adds:
> >
> > 1. A new Python script (support/scripts/pkg-uninstall.py) that reads
> >    manifest files (.files-list*.txt) tracking package file installation=
s
> >    and removes all files belonging to a specified package from a given
> >    directory.
>
> Thanks for your patch. Unfortunately there's a reason why this hasn't
> been implemented, because it simply doesn't work. Think about the
> following scenario:
>
> 1. Make a build with BR2_PACKAGE_NTP=3Dy, BR2_PACKAGE_OPENSSL=3Dy
>
> 2. Run "make openssl-uninstall"
>
> 3. ntp is now broken on the target, because the ntp binary is linked
>    against libopenssl.so, but libopenssl.so is no longer on the target
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000609503064d33e2d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,=C2=A0</div><div dir=3D"ltr"><d=
iv><br></div><div>=C2=A0Thank you for the quick feedback and for pointing o=
ut this critical issue.=C2=A0</div><div><br></div><div>I didn&#39;t conside=
r reverse dependencies. The=20
scenario you described (uninstalling openssl breaking ntp) is a=C2=A0</div>=
<div>serious=20
problem that makes the current implementation unsafe.=C2=A0</div><div><br><=
/div><div>I see a few potential approaches to address this:=C2=A0</div><div=
><br></div><div>=C2=A01. Add dependency checking that refuses to uninstall =
if reverse=20
   dependencies exist (similar to package managers like apt/dnf)=C2=A0</div=
><div><br></div><div>=C2=A02. Implement cascade uninstall (uninstall the pa=
ckage and all its=20
   reverse dependencies)=C2=A0</div><div><br></div><div>=C2=A03. Add a --fo=
rce flag with clear warnings that this may break other=20
   packages=C2=A0</div><div><br></div><div>=C2=A04. Simply document this as=
 a &quot;use at your own risk&quot; feature for=20
   advanced debugging scenarios=C2=A0</div><div><br></div><div>I wanted to =
ask: would any of these=20
approaches be acceptable for Buildroot? Or is the fundamental issue=20
that without proper=C2=A0</div><div>dependency tracking during uninstall, t=
his feature=20
is too dangerous to include regardless of warnings/checks?</div><div><br></=
div><div>I&#39;m happy to implement proper dependency checking if that woul=
d make=20
this feature viable,=C2=A0</div><div>or I can withdraw the patch if you thi=
nk the=20
approach is fundamentally flawed.=C2=A0</div><div>Thanks again for your tim=
e reviewing this.=C2=A0</div><div><br></div><div>=C2=A0Best regards,</div><=
div>=C2=A0Shubham</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2026 at 1:29=
=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Tue, Mar 17, 2026 at 01:19:19PM +0530, Shubham Chakraborty wrote:<br>
&gt; Buildroot currently does not track which files are installed by each<b=
r>
&gt; package in output/staging, output/target, output/host, and<br>
&gt; output/images directories. This makes it impossible to cleanly remove<=
br>
&gt; a package without performing a full rebuild.<br>
&gt; <br>
&gt; This commit adds:<br>
&gt; <br>
&gt; 1. A new Python script (support/scripts/pkg-uninstall.py) that reads<b=
r>
&gt;=C2=A0 =C2=A0 manifest files (.files-list*.txt) tracking package file i=
nstallations<br>
&gt;=C2=A0 =C2=A0 and removes all files belonging to a specified package fr=
om a given<br>
&gt;=C2=A0 =C2=A0 directory.<br>
<br>
Thanks for your patch. Unfortunately there&#39;s a reason why this hasn&#39=
;t<br>
been implemented, because it simply doesn&#39;t work. Think about the<br>
following scenario:<br>
<br>
1. Make a build with BR2_PACKAGE_NTP=3Dy, BR2_PACKAGE_OPENSSL=3Dy<br>
<br>
2. Run &quot;make openssl-uninstall&quot;<br>
<br>
3. ntp is now broken on the target, because the ntp binary is linked<br>
=C2=A0 =C2=A0against libopenssl.so, but libopenssl.so is no longer on the t=
arget<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000609503064d33e2d3--

--===============8775447939130950718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8775447939130950718==--
