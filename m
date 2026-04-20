Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EECBEA71B1
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 01:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ADB661019;
	Mon, 20 Apr 2026 01:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id by9E9MizimH9; Mon, 20 Apr 2026 01:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70FE6100D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776647916;
	bh=OiSMnRJKSMjqwFamcp+Ll41575z6/H+wb5g1iFrtwD4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSmrEKuTUcW8rbZKZc/MNHWXaMml9ll5XIqlNP2u/nVr+cRJSCv4Z/XAS9cffhCdx
	 gf6pVFJZDlXOGGgcE6zaURI0OJcSamIvNLADhQr34+t7bOkFoXibax/tjpmWeUBtAc
	 E6F7IOWJbG16zkBsAMHFNW6BNNd8CSAPJF5PRaw4GnD2Y3FHiw7qKNP8BU7KqX34uY
	 QTYB/11vXxT/ucDyJk7RXuQU/uCRKV8hLxpgaQrGgZ0KN2FC4yYeLm5d3lz1Fuq7iJ
	 g+h1wBSy+d6w8P3TKlyWgzYmRWpYArI/tonmlgaUcaOgluOpFFWzfoikjKkYkNfLbE
	 k/JV5yNxQGuXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70FE6100D;
	Mon, 20 Apr 2026 01:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 450C7355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 425448232F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hmkCo-1O_H7 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 01:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E20B822EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E20B822EC
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E20B822EC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 01:18:34 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-79cd8f8e261so13563767b3.3
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 18:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776647913; cv=none;
 d=google.com; s=arc-20240605;
 b=BmRTiylW4b6bBjV/4iaHq9iUebYWuQQXQJiVHjEkTyU1FySiX0rAfVxbuI0nEQOAaO
 6/YqFP++yBn0N3wK6BTj3eH8tviBfOgKynRCyPAP8OaJn5wfX7FI+vb3CmcQ1lnTCkZ4
 JRzlieO+kkDKPaD/lqL40u0ukMjQcS/Af2gzFHxp7wQvS2WcrujPVA7/LYdFaAVgSRWd
 fHIISLrmI8CS/wob8y5PMToeG35Uil5g4a/D3oNQZWNdCPnTYmtUExySD2OVLihEp8sg
 oIzpR4112zs8US39Cbws2odiS4LfXtuUwNvaU3xTQAskveG3Y8HnH2Kn6DtqrL4h3luy
 ogXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fQWjSJarVp6isAfP5/NvagPYMXn7Iy3qXs/7Io9px6I=;
 fh=vuKANBEoJhFBNXYk+JuQZxPnCedu5eGuX03vMBOBAsY=;
 b=XERnzQxSbyvxUw8qY7y2NxQgKwZAeKtBO/RgQJFyeMplF6gq+iFPeX//zk1q7qj4mm
 pAILslfMstUNGRUzkYdP8zBliA7o4PyTVfaJPDxlklVYKeSJ0khtmTcXHXQ0nRLnTSkC
 LnJmzBbhFRoLR0riyXcdzUDKzihP+lXcLRkgFOaHcfjAMhGR8/A9uSIvRk4PKWCDMkop
 rNIlMBgYOjyuCShkhf5vQWdaoOXcRheVMDLHhHLJdznRn7NNC3pJMsH56s596ve0cpI/
 1RvtgrqbwExZF4kTNLyYotVZOpKF3q3N2WVNfnHheSo/2jyo6nadSAOV1DTMLm0vSxNk
 I/Lg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776647913; x=1777252713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQWjSJarVp6isAfP5/NvagPYMXn7Iy3qXs/7Io9px6I=;
 b=ET48BPmfTrQoybyPsAmLWarUimWjzPdeOtMivaxkHn8Q2WNiEx6H0L+yqlPFRVl2Fh
 WqxVySnB8XGHlx1c7fKE98TIp+auPboGiTQ7BiX8M24ZPT7lOGt2XkWDb4dwft8mMkgl
 HsARRTQ7fMYkBm9Cc/vM4frVsmZiD5bfSOsvmEIj8k3n2XkR3qbbCR5Ry0NfmyL23QdB
 OZrSL7A5OADe7h52Ypuh2/Ek4LNW0QE9w0omaP1lQS3uZKjt6RIO8DK5J5vVZNDqqw4t
 UB+yGzpFKQaDOjLLecrL7PuW1mWL/5+44cWF99PzCbSnT3w6jilhnxD8t8Wd7yeTSsUn
 RSog==
X-Gm-Message-State: AOJu0YzpJ/lCMCuxbJvd9vXXi2vXpXitmEM6LrICU/e9vcfSjA/gzary
 uBCC09RjvRwM23f8N7W67m4GvBzon6S/nV7mweQhFD1smwB/bWne7A4DmZpC8MBGcCyr1tVTHxx
 0cBA5B2Onv8dxQOWR8UFLIytVIpSlb3Q=
X-Gm-Gg: AeBDietVyPGd+ko0/4upsJDkNRGmGOEdSP5htWLfy8lUH7STSDKwJJhhGtbK4kIJVqi
 DdUde0yj/gJnx9EAMq9Ph8QpL/lqhdALULnPGC5z0RThha7LwHznDzhL2cFVKLrP7ertuxhCTio
 zQ415RoKD9yWe/N4wSenlxu+MAgfpEmm+njDxtgtfbgliUMKvJd8dkcIkyysqsmBtYZyJAMSzDe
 Nm9AnzR8JqyB4vDtJnixgIbfybJYrI67Dcf5lQsbJKtppOw+iR+PCjGbYckWfjoDlqFdSNo258W
 qEcIfILZe6YgxcCW
X-Received: by 2002:a05:690c:84:b0:7b1:2c46:9480 with SMTP id
 00721157ae682-7b9ecfe9c86mr118319497b3.34.1776647912834; Sun, 19 Apr 2026
 18:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260403085152.511498-1-chakrabortyshubham66@gmail.com>
 <e4ee930e-02d7-4008-9c97-3c50319c561b@bubu1.eu>
 <CABvxksxUY9ZC=PPSXdrjs8Vq5p12YJxWLHKWWJJZF-X=UvaheQ@mail.gmail.com>
 <a6dbb42a-b990-4248-9caa-aaa9385e83ce@bubu1.eu>
In-Reply-To: <a6dbb42a-b990-4248-9caa-aaa9385e83ce@bubu1.eu>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 20 Apr 2026 06:48:19 +0530
X-Gm-Features: AQROBzAPdrMs29Sh66E26W_wg5PH1pMsBclc-jJZECyFlyMcJxUjGSpDcrKfkm0
Message-ID: <CABvxkswK3Yz8Tww7KHLrXkBub81Jt2rrNkEND6BN735_pBFEOw@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776647913; x=1777252713; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fQWjSJarVp6isAfP5/NvagPYMXn7Iy3qXs/7Io9px6I=;
 b=SLO0EEOiDYN5SU/zqeugQamAq6Tw9GgG9W6KtPV3nP6Z68cJilwkIdJwO/MzZcZ4N4
 nsPnF+0Btqo3OicfXHjiPV8lVxzXJVS+kmuobVbczFJ29PzOH/syWlyF0WVk6i+Lb80f
 9GhwvrtEBCu9VG+JIleu3VKogxrlYGVNufF35XDhF87UXTUsicSHpS4ssLa0ZTRIK+xz
 4vUokn9rBxxW7edRGvVVT8ba6FeKNELhe2x4z/kTgzNHAOere6DsDadl2pSpvfQTpjzQ
 BKYn39Rv7U8+ptrzJsP5Gu6kzBfmTThz1PUAf9jWsVLtPA23NCPkhljraDnAkvYXsWgu
 VHZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SLO0EEOi
Subject: Re: [Buildroot] [PATCH] package/python3: fix build in static-only
 configurations
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
Content-Type: multipart/mixed; boundary="===============0162694530814249889=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0162694530814249889==
Content-Type: multipart/alternative; boundary="000000000000bc484b064fda130b"

--000000000000bc484b064fda130b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marcus,

This mostly comes from a practical need on my side.

I maintain a small repo of statically compiled binaries that I use inside
Android apps, where keeping runtime dependencies minimal is pretty
important. For that setup, I=E2=80=99m using musl and targeting fully stati=
c
builds. While doing this, I ran into the Python3 build failure in
Buildroot, which is what led me to dig into it a bit more.

From what I=E2=80=99ve tested so far, it looks like a usable static interpr=
eter is
possible for more constrained scenarios=E2=80=94especially if the required =
modules
are built in and there=E2=80=99s no need for dynamically loaded third-party
extensions.

Since I rely on static linking for portability and simplicity in my
workflow, having something like this working is quite useful for me. That=
=E2=80=99s
why I wanted to check whether the earlier limitations could be relaxed at
least partially.

Best regards,
Shubham

On Mon, 20 Apr, 2026, 3:29 am Marcus Hoffmann, <buildroot@bubu1.eu> wrote:

> Hi Shubham,
>
> please keep the list in CC in your replies.
>
> On 4/17/26 22:00, Shubham Chakraborty wrote:
> > Hi Marcus,
> >
> > I investigated the original reason for disabling static Python 3 suppor=
t
> > (commit 54915af7). At the time, the issue was that the interpreter
> > attempted to load standard library modules dynamically, which fails in
> > static-only configurations.
> >
> >  From my testing, this limitation can be partially addressed.
> >
> > I was able to build and run a statically linked Python interpreter usin=
g
> > |--disable-shared| and |--with-static-libpython|. By configuring |
> > Modules/Setup.local|, several standard library extension modules (e.g. =
|
> > math|, |_json|, |_struct|, hashing modules) can be built-in, avoiding
> > the need for dynamic loading with musl libc.
> >
> > I validated this on AArch64 using QEMU. The interpreter starts
> > correctly, and built-in modules work as expected. Basic operations and
> > selected imports succeed in this configuration.
> >
> > However, this setup is not yet fully equivalent to a standard Python
> > environment. Some parts of the standard library and general script
> > execution still require further validation, and third-party C extension=
s
> > are not automatically supported (they would require manual inclusion in
> > |Setup.local|).
> >
> > Based on this, it appears that partial support for static-only Python 3
> > may be feasible, but additional work is needed to determine whether it
> > is robust enough to re-enable in Buildroot.
>
> I think the question here is: would anyone want this? Do you have a
> usecase for this?
>
> >
> > If this direction is of interest, I can continue investigating and
> > prepare a patch series that:
>
> I'm confused now. You tried to fix a static-only python3 build failure,
> which is not something that buildroot currently supports/allows. How did
> you even encounter that? What is your reason to work on that?
>
> >
> >   * Re-enables python3 with |BR2_STATIC_LIBS=3Dy| (if deemed acceptable=
)
> >   * Adjusts module configuration to minimize reliance on dynamic loadin=
g
> >   * Adds a runtime test to better assess static Python behavior
> >
> > Please let me know how you would prefer to proceed.
> >
> > Best regards,
> > Shubham
> >
> Marcus
>

--000000000000bc484b064fda130b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><p>Hi Marcus,</p><p>This mostly comes from a practic=
al need on my side.</p><p>I maintain a small repo of statically compiled bi=
naries that I use inside Android apps, where keeping runtime dependencies m=
inimal is pretty important. For that setup, I=E2=80=99m using musl and targ=
eting fully static builds. While doing this, I ran into the Python3 build f=
ailure in Buildroot, which is what led me to dig into it a bit more.</p><p>=
From what I=E2=80=99ve tested so far, it looks like a usable static interpr=
eter is possible for more constrained scenarios=E2=80=94especially if the r=
equired modules are built in and there=E2=80=99s no need for dynamically lo=
aded third-party extensions.</p><p>Since I rely on static linking for porta=
bility and simplicity in my workflow, having something like this working is=
 quite useful for me. That=E2=80=99s why I wanted to check whether the earl=
ier limitations could be relaxed at least partially.</p><p>Best regards,<br=
>Shubham</p></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, 20 Apr, 2026, 3:29 am Marcus Hoffmann, &lt;<a hre=
f=3D"mailto:buildroot@bubu1.eu" target=3D"_blank" rel=3D"noreferrer">buildr=
oot@bubu1.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Shub=
ham,<br>
<br>
please keep the list in CC in your replies.<br>
<br>
On 4/17/26 22:00, Shubham Chakraborty wrote:<br>
&gt; Hi Marcus,<br>
&gt; <br>
&gt; I investigated the original reason for disabling static Python 3 suppo=
rt <br>
&gt; (commit 54915af7). At the time, the issue was that the interpreter <br=
>
&gt; attempted to load standard library modules dynamically, which fails in=
 <br>
&gt; static-only configurations.<br>
&gt; <br>
&gt;=C2=A0 From my testing, this limitation can be partially addressed.<br>
&gt; <br>
&gt; I was able to build and run a statically linked Python interpreter usi=
ng <br>
&gt; |--disable-shared| and |--with-static-libpython|. By configuring | <br=
>
&gt; Modules/Setup.local|, several standard library extension modules (e.g.=
 | <br>
&gt; math|, |_json|, |_struct|, hashing modules) can be built-in, avoiding =
<br>
&gt; the need for dynamic loading with musl libc.<br>
&gt; <br>
&gt; I validated this on AArch64 using QEMU. The interpreter starts <br>
&gt; correctly, and built-in modules work as expected. Basic operations and=
 <br>
&gt; selected imports succeed in this configuration.<br>
&gt; <br>
&gt; However, this setup is not yet fully equivalent to a standard Python <=
br>
&gt; environment. Some parts of the standard library and general script <br=
>
&gt; execution still require further validation, and third-party C extensio=
ns <br>
&gt; are not automatically supported (they would require manual inclusion i=
n <br>
&gt; |Setup.local|).<br>
&gt; <br>
&gt; Based on this, it appears that partial support for static-only Python =
3 <br>
&gt; may be feasible, but additional work is needed to determine whether it=
 <br>
&gt; is robust enough to re-enable in Buildroot.<br>
<br>
I think the question here is: would anyone want this? Do you have a <br>
usecase for this?<br>
<br>
&gt; <br>
&gt; If this direction is of interest, I can continue investigating and <br=
>
&gt; prepare a patch series that:<br>
<br>
I&#39;m confused now. You tried to fix a static-only python3 build failure,=
 <br>
which is not something that buildroot currently supports/allows. How did <b=
r>
you even encounter that? What is your reason to work on that?<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Re-enables python3 with |BR2_STATIC_LIBS=3Dy| (if deemed=
 acceptable)<br>
&gt;=C2=A0 =C2=A0* Adjusts module configuration to minimize reliance on dyn=
amic loading<br>
&gt;=C2=A0 =C2=A0* Adds a runtime test to better assess static Python behav=
ior<br>
&gt; <br>
&gt; Please let me know how you would prefer to proceed.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; Shubham<br>
&gt;<br>
Marcus<br>
</blockquote></div>

--000000000000bc484b064fda130b--

--===============0162694530814249889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0162694530814249889==--
