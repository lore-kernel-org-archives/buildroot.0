Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25B8C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 21:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD1140583;
	Mon, 31 Aug 2026 21:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YefNZh2DFThc; Mon, 31 Aug 2026 21:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788213196;
	bh=XORRw0hV5UkTBSb9tv+1X3Jv2xsfsW4eKErZ8PFAS2I=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JUPyeHkY5tvj7iapzrq49VReGIcpqcHqtP2H5pytsOSbQprXaUSiDjCMzDdVlAqm1
	 W9kSU3cphomanTZbMg0Hu5hpUIeBGcxn6nuyC2Yc3KIwgQrKwexfNprvW6HX+OoaiN
	 F2CCjNaVw8CzHPtGwLa22Pf0S8KuKPazVErRQFB7/SUFrRWRL/KER3VVUeZJlI8dyc
	 anbSWa97nA7Bfzh9RHgRBUxWiv9VcNjYgmRT7OflrOSyTjzMIpVMnTmcMyK8qXD/1l
	 6AsvWi10w2QL/ezP9P5SSvWMst5TCgct1pbAaM7YhHczv5rfih+AtPbPKq7NE3xy7U
	 WeWgStbMfvdKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B094053F;
	Mon, 31 Aug 2026 21:53:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92F59363
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803A8400AB
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEuap1_1qgtz for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 21:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [IPv6:2607:f8b0:4864:20::b131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BC3240056
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:53:12 +0000 (UTC)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66e611e7c05so1956821d50.2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788213192; cv=none;
 d=google.com; s=arc-20260327;
 b=klKjVxMixDuNi+c8nO2G9BQUyrCyY6M0Lc++6HcfdLp6JuericAB2kwo9izooQTUXV
 7iNnscLxKQrcz7JlHv6WYEm0KxMo4HICCIZ6OXxM5KADYDZep21gnZdaJP6sqpgOvaui
 jCWIXNFIg5iPcqTFAD1T/gnA4qaardLDekBdzDgnpuftlX5HdIsfsCntP8+YNDJR789s
 xqGPPcMzMZrhFjQs1Z78FqBC4htPTL/3C/FbEF6sb4WEJU+U7qC2H7GvWDQd330dGpwB
 W5G452jRrmWxyg3AO1nLNYGC2d80I5jdegFYhxV8dI60OcxAX38pSax3fL2sINxU4xVf
 xhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AXk8AiD4Gay7DNpiGagJ6v73RaUEslZDwd33910xteg=;
 fh=USZ4LbkqCyZdCv66CXbLRe1TK7DTCwxauLQMPaZ2v8k=;
 b=BSya4WMfCrPzzuatH39Pr+akrwTylTYGHES/DOFO45m++7G0mDznS/WDaIanMNEGb8
 XrZeWGqP+56oyPCCBsCxu+K/OTAV0ZL1QN5yWPr+Wl43LTK23BcTPEaDmekqB/bH4rhX
 8o9KwFlZsHjyUKY93p8XWj5qzLmMRa8dEgdF4+gSgJabkfnrtS5Uwv7qmvqBXBPjbVna
 uCMZZwt3BFCtB71l4y/waY0hiSd+FAatJarFIMNh7bB3/4eSopoN6kuTw1QAtBPnHCOk
 BkKm/Nc6P9Fw7/imxaEmqtAaK4SlSHFdkoON1xDap2FPN8PZBw701hToEHe8rKLvFpqH
 xHpg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788213192; x=1788817992;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=AXk8AiD4Gay7DNpiGagJ6v73RaUEslZDwd33910xteg=;
 b=VYI1e2+nzR5Kj1So12+wFjppvNyBlu8P7Sqcd0gqbaUiWJHuzj8wBPpYr792jEqoj/
 wuophraKCzrwHWzjDQjcpevpB1MA0idXmBsgkKQjFiD/t/SbtqPxT07ryQvyNbV/SgV1
 Ljq805LHguhRV8PzcCLTEsX26VvJxHx2KpD+PK1Nn5W58NLZhv2gsDZS0dMWo+MhYkwz
 NJa65NX7FCx0qDpAvMyZQzHgZjDS0VSNFwyrU7gqTCpn9htAWuii9nGoVQ7awztDvjr9
 zZ/bpe3yfFj+zgTJ4txmqLBG8oEwpaojcyqpIaJNyehEWD0qaOrDFmGlFfn6o2ZcDWa4
 219g==
X-Gm-Message-State: AFuF++nTIYcxbpEz5IGiYHVgfynwzIL2zZBc53tdVtvJ/W4mdib9BqMT
 bdkMDEo0dgPdk33vYBeMZaf5dmyJ2fTcaRHdEtgibFdKWSnk5ZPNhoVCtiMZaGmoqjksHarN8wB
 1rBBi52ctkXOvI9uDPSvihLUG03ZLVyOkKNl550zM6Q==
X-Gm-Gg: AYBFou2G7VikCLz760lVzYeYdUzFbEXwMjywBZ8vxVBV/jWXJ5tZX3zL/N2h5jU1w8h
 gzyjJES5zdNQVrg8kMOiTgHn3NetzLrk14Gts9CudMF+IRxuLR1sCTETA2H6LagGaMkd2r+L90h
 7qBoHSq6++8SZFydkGYetjbgIXyFC8yU3CX0cv3Sp6IK4avQca4OaPY0zdJhhj9swuLuiwk290A
 zLlK+FV7ADTrgnW3JVM8+YNeKu11H5QtcnbTW4ftZ0QME9ZYcFFNwOVNB23kXRelAASftFnKTU0
 QiQp1H70++CUvaz0PvhjdyGvHtrAdtgLpvXId6RH96k=
X-Received: by 2002:a05:690e:4381:b0:668:9fa5:b9cc with SMTP id
 956f58d0204a3-66f8724115dmr1264645d50.0.1788213191008; Mon, 31 Aug 2026
 14:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
 <a9f23801296518260a25f1429b9985de@free.fr>
In-Reply-To: <a9f23801296518260a25f1429b9985de@free.fr>
Date: Mon, 31 Aug 2026 14:53:00 -0700
X-Gm-Features: AcwNN1V5t90qou-8J9XL4lAPNR5SJQ5IPwz2LrBRVyUC-1MFpGdt0JUVgFafj6g
Message-ID: <CAEpB38NM8KSuBsO97BM1X_DFsDVS2VamncmNAUbztJPF8hqxkg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Buildroot Mailing List <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Perale <thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: new major version 1.27
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
Content-Type: multipart/mixed; boundary="===============2167871570703438187=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2167871570703438187==
Content-Type: multipart/alternative; boundary="000000000000087519065a5ed4ee"

--000000000000087519065a5ed4ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,



On Mon, Aug 31, 2026, 2:48=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote:

> On 31/08/2026 02:10, Christian Stewart via buildroot wrote:
> > Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
> > satisfies the bootstrap requirement, so no bootstrap stage changes are
> > needed.
> >
> > Remove the workaround for https://github.com/golang/go/issues/77436,
> > which the go.mk comment scheduled for removal at this bump: restore the
> > plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.
> >
> > https://go.dev/doc/go1.27#bootstrap
> >
> > Signed-off-by: Christian Stewart <christian@aperture.us>
>
> Applied to next, thanks.
>
> Somehow, the lines of this patch were wrapped. So I fixed those to
> apply the patch.
>

Sorry - I was trying (once again, as I do every few years) to get Gmail API
sending working with git send email, and apparently it's impossible to get
it to stop wrapping the emails, Gmail is off by 1 on their wrapping logic
and ive not been able to find any workaround.

Best regards,
Christian

--000000000000087519065a5ed4ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Julien,<div dir=3D"auto"><br></div><br><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Aug 31, 2026, 2:48=E2=80=AFPM Julien Olivain &lt;<a href=3D"m=
ailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 31/08/2026 02:10, Christian Stewart via buildroot wrote:<b=
r>
&gt; Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still<br>
&gt; satisfies the bootstrap requirement, so no bootstrap stage changes are=
<br>
&gt; needed.<br>
&gt; <br>
&gt; Remove the workaround for <a href=3D"https://github.com/golang/go/issu=
es/77436" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/golang/go/issues/77436</a>,<br>
&gt; which the <a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">go.mk</a> comment scheduled for removal at this bump: restore =
the<br>
&gt; plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.<br>
&gt; <br>
&gt; <a href=3D"https://go.dev/doc/go1.27#bootstrap" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://go.dev/doc/go1.27#bootstrap</a><br>
&gt; <br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@apert=
ure.us" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt;<=
br>
<br>
Applied to next, thanks.<br>
<br>
Somehow, the lines of this patch were wrapped. So I fixed those to<br>
apply the patch.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Sorry - I was trying (once again, as I do every few years) =
to get Gmail API sending working with git send email, and apparently it&#39=
;s impossible to get it to stop wrapping the emails, Gmail is off by 1 on t=
heir wrapping logic and ive not been able to find any workaround.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"au=
to">Christian</div></div>

--000000000000087519065a5ed4ee--

--===============2167871570703438187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2167871570703438187==--
