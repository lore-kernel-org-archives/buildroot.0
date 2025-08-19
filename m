Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873CBCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2479B40D09;
	Tue, 19 Aug 2025 20:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XljcNl6Pug2y; Tue, 19 Aug 2025 20:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3144240BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3144240BD5;
	Tue, 19 Aug 2025 20:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D17B9E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B86E560BF7
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vmsb8RAiA9C for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F8EA60872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F8EA60872
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F8EA60872
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:41:50 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2445806c2ddso49738645ad.1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 13:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755636109; x=1756240909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bcAae0K1dUUgjs55/4NeLXX6X42gakzE4BHScbXgKK8=;
 b=rD3QFBx3aXz4aNeWLpD4V12zvhbGi0L3XLSMBr8vYgW9cL7WqHMc2gRW0zk8cyRRGj
 2El1CPOvehEokhX7s0Y62cCwnmQ1gPwyYcE8yDOn4eebF+n5Ajjj8ZPp1JMiULdzT2EY
 iRuWgiNClJBgWlzT5ZBkU16wpg+gGVYmer7L7Z6n6n6OmZkypp4aTIWBYzYVIvn76mZH
 Hu5so6aK9TI6teqFww4zdx8U6y3cUehOIO0DrlpCqkvptww2j8/+7rO+eUgOr+BJ9WqU
 iceZqdejyiVXkWujYeuITAOYedSbZGnsTSjbnessGAMyuel6iXdlut5PbjadH6JADHfE
 a1YA==
X-Gm-Message-State: AOJu0YweD+l2OoTgzuUgN5t1eyIFo1gs9JM9Bp1H2PpstPEa9rCvgn+m
 adKr4jJ+aCwSU86vLvO91HYqjGSrG+klWL9JvMx4WlEn/sQp0rq8ICxjotRaQmczq65LRJDe69t
 tZrW3xtLShRh5Zxr6DE6PktaJO8/NEJQ5ZhaPkInKyw==
X-Gm-Gg: ASbGncu+TdzVcrpxKyc8SLNthJdOxxIAbAny+V09mQbi427IMyfd/2f2C/Vu4Hi+beo
 dFRTcqM5STaM4vnxxiVt74Fc8aHGISaSaj8VD80Ba6P335wz/e7CDLHRofcBl48A9hxWx4qqpKl
 y+swhjbcLKR83Cxz8a8yffKnrGmyPiCclDqTiYVS6jtdSNq71JZEBvA8YWsdWt3v7ReVt7tM3CM
 nWUOzQ=
X-Google-Smtp-Source: AGHT+IE7Zh9LBEKlypR7LLbmxHT+wHrtgIgif5vQX6wBV44b++kcgR4JQIM7lhip3btH3/uhFI5sCpmj3QChyTtlHcA=
X-Received: by 2002:a17:902:ce0b:b0:240:7c39:9e25 with SMTP id
 d9443c01a7336-245ef214755mr3476075ad.27.1755636109473; Tue, 19 Aug 2025
 13:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
 <20250819181451.3012126-2-michael@amarulasolutions.com>
 <20250819222414.3ea8948d@windsurf>
In-Reply-To: <20250819222414.3ea8948d@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 22:41:35 +0200
X-Gm-Features: Ac12FXzqmjJ1ugSjC1-MPiYWmKWANL848dQwPkey0861TE-WK743WznWEN1sHbY
Message-ID: <CAOf5uw=iUbu1PHrtvBonCfz0y-nvL9_v7FhNeUOEQ13bp+OAsQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755636109; x=1756240909;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bcAae0K1dUUgjs55/4NeLXX6X42gakzE4BHScbXgKK8=;
 b=DnjUpm1yNhfnIP0bkKyfVMfUZBVNofZ7QNx971buE6R6qi6aZE0+asM7l2lAoDtyl+
 9VGoWPlwPbvw31+YQw8+um/fqeZkjR0qSH/qlc2Gfy0TGUmGLiOfeDzsV2bsDP12R2AQ
 ihGq1PAYKLWXmxOwEx+3jfwrlq+ZR1r6qx1H0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DnjUpm1y
Subject: Re: [Buildroot] [PATCH 1/6] linux: add missing hash for linux
 6.12.36
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
Content-Type: multipart/mixed; boundary="===============0684208751278500493=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0684208751278500493==
Content-Type: multipart/alternative; boundary="000000000000a91242063cbde277"

--000000000000a91242063cbde277
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Aug 19, 2025 at 10:24=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
>
> Thanks for the quick turn around with the patches.
>
> On Tue, 19 Aug 2025 20:14:46 +0200
> Michael Trimarchi <michael@amarulasolutions.com> wrote:
>
> > diff --git a/linux/linux.hash b/linux/linux.hash
> > index f5e2d663d1..599d2bc6b3 100644
> > --- a/linux/linux.hash
> > +++ b/linux/linux.hash
> > @@ -1,4 +1,6 @@
> >  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> > +sha256
> 4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c
> linux-6.12.36.tar.xz
> > +
>
> Unfortunately, this is not how it works. Each defconfig should have its
> own set of hash files. Check out:
>
> board/freescale/imx8mqevk/patches/uboot/uboot.hash
> board/freescale/imx8mqevk/patches/linux/linux.hash
> board/freescale/imx8mqevk/patches/linux-headers/linux-headers.hash
>
>
The quick round was really helpful, so I need to respin only one time after
get all the tested-by

Michael


> and:
>
> BR2_GLOBAL_PATCH_DIR=3D"board/freescale/imx8mqevk/patches"
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000a91242063cbde277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Au=
g 19, 2025 at 10:24=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Michael,<br>
<br>
Thanks for the quick turn around with the patches.<br>
<br>
On Tue, 19 Aug 2025 20:14:46 +0200<br>
Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com" targe=
t=3D"_blank">michael@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/linux/linux.hash b/linux/linux.hash<br>
&gt; index f5e2d663d1..599d2bc6b3 100644<br>
&gt; --- a/linux/linux.hash<br>
&gt; +++ b/linux/linux.hash<br>
&gt; @@ -1,4 +1,6 @@<br>
&gt;=C2=A0 # From <a href=3D"https://www.kernel.org/pub/linux/kernel/v6.x/s=
ha256sums.asc" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/=
pub/linux/kernel/v6.x/sha256sums.asc</a><br>
&gt; +sha256=C2=A0 4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e5=
4f01ba8c=C2=A0 linux-6.12.36.tar.xz<br>
&gt; +<br>
<br>
Unfortunately, this is not how it works. Each defconfig should have its<br>
own set of hash files. Check out:<br>
<br>
board/freescale/imx8mqevk/patches/uboot/uboot.hash<br>
board/freescale/imx8mqevk/patches/linux/linux.hash<br>
board/freescale/imx8mqevk/patches/linux-headers/linux-headers.hash<br>
<br></blockquote><div><br></div><div>The quick round was really helpful, so=
 I need to respin only one time after get all the tested-by</div><div><br><=
/div><div>Michael</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
and:<br>
<br>
BR2_GLOBAL_PATCH_DIR=3D&quot;board/freescale/imx8mqevk/patches&quot;<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a><b=
r>__________________________________<br><div><br></div><div>Amarula Solutio=
ns BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>T. +31 (0)85 111 =
9172<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com" ta=
rget=3D"_blank">www.amarulasolutions.com</a><br></div></div></div>

--000000000000a91242063cbde277--

--===============0684208751278500493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0684208751278500493==--
