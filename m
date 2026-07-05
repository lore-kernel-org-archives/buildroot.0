Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2CDC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 18:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D59681066;
	Sun,  5 Jul 2026 18:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xscgh8KRSvT; Sun,  5 Jul 2026 18:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D1FD81068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783276664;
	bh=ARuycvH+yRJN6gpkv+rJYeOlKN36H36Xpep/RqdTwTU=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CpqaCVsomoXggHtQfl2uqwt7HlOK6GoHacAdE0RGRVkckxHj2lCCQif0HMF9cf/tB
	 j5wECoW5T+VnOrSqYBUqlXSJ7hkD08UBNLJ6p+/xVaWNZUOLqHEYlHfonJ2NcYn/AK
	 3wxeQ7EL4GeVgeJ71qpCQ9i3RRCEqUxMDs0VW0+8G2KSX7aJ6ZdRkyuAB18W3tceb2
	 H6BqIpFWhd04aphnVWCArgmVHH0xD3u9z6BHNlGxJXsH2VIIJoeJSI1JiD8UGCofWI
	 BXlNROJIrOWoXDr36z8jjQO1nGcMumj/hGxCPjE+j6SN6KAghQSuIOnpWxkiSgd7I2
	 Xon2VDBoNF3VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1FD81068;
	Sun,  5 Jul 2026 18:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED697316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F7B81068
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyKg9w5XiQey for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 18:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=sofiane.hamam@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5503581066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5503581066
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5503581066
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:37:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-69a50b818c8so659098a12.2
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 11:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783276659; cv=none;
 d=google.com; s=arc-20260327;
 b=Yoz9x5f2Mk82ilN4pbcRuloxKWr235eA8bVX4xYb/DPJTz+LIFfBJwAtd6uCYNO1zc
 CPlOizSA8r9GLAHmdbDFWHLGKXQJYfeCLFa6IqlYXY2XLYtIgk2agb1hQJJUb3kbmMaD
 wU53EICg3wOf8CIPlCxP/ZLVaGJtWVvC8EITFZffkv64D1apYxbPEv7xkNetHJw0K7lA
 Zm8S2ny3XDnQ1q/xj7OOQ0r6tC9b8DVJ/Jtt2Wqf1QnXTTYQRkDqfpVx0BQ1uQ+1oYKK
 LyOHzUbQxZ21VBxDFdVgqDzg3A9GQfETRIUtxqf67DPWh9caJxeoGsusFTpEHC/8m4ON
 5cRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3Lgs2qz5EIH2+gzkHnRt1W7qGbxzyc8d4BvEofEW7/U=;
 fh=F7kfMvV/aQKKvgq0NXSaBvEQXk1yMQSWhEtyCJp9PyE=;
 b=PAQIkCzxd0BBOAM0kGYqFEwenyCkdgrhcXFydbKwAEv8IEMNzeJWKvjzPYkGvj/2Rj
 9WrXP9XrEL8k24hkRcNDOagywna2E9bJFBpGEsyJXAe+hmvKs3BL84FMyi+UsLrgXDO5
 vsL9epBbsKHd8JpzCu/HXl2snBV3F52XVHRg/vZZeJO4KmyCRPYLl80i2wEVdGhTt8tr
 uTZkHibgNuxl4/TNaIq/1pVSRswrNNiwLZ3RoGg9tQLBi3leqeO75NVKu0JJ9Jsgt986
 qFYr0AXijFjPDnj7stZejqCwlO+BQHlSUhPAWg/XBA7Dc9yKAzRs5xw2NV/m//DwOfzT
 RpBg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783276659; x=1783881459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Lgs2qz5EIH2+gzkHnRt1W7qGbxzyc8d4BvEofEW7/U=;
 b=ZlLZ5NzFGxgLVGr/QfAh1O5uWtZiI0B9PEUnpUFD3peYeHLC5uLRoR+XWknynqIivh
 UG2F9X7fy2eJH6Hjv9qZMYbhnlKJSovJxYOvgUHFfPwvXPJPhReeOYrAwH391l0Ch4Pm
 vCcDWVjebiIyE6qbSsDXIxa/peOm6U7eZAviCDZQ8US1Kuhx7pSMnxQuLoKi3iJO1ygF
 sZfSGPT6Nv/O/eLfOAwo/qhLznRB133/inr/i1tzUhSGChCq6xLUdhbOYkEyCSdUY534
 vUFdjO3b/UyNPWLDD8Ilrm7mCxhGXRwLFE9IuQg+FTCi5cEo/vecPfrLCsiPY4w/0YT0
 NMrQ==
X-Gm-Message-State: AOJu0YzV4VXtm7yR1RempGPkI2s1P0CsCiGxrxyK6s+H6iJmjisIuCsw
 JtbllALQS0Tlz0WSXGPNgPTc2IA1WXxa6q/eKCUI/bL3Um0KdAVKwuf2aIFMMMJeevuKpTbRO41
 1nIUxRTN+Om2dKgFBlEMEWse1OfV3vvS4Q12sozxIg9E/5FxCBAdE8LTDDH8c
X-Gm-Gg: AfdE7cnTbq47jhSFy/OXtE6EtBzjbDVBDM1OgOTx1LPTcH78Djo63bYxE3Ca+mIEhXi
 Lsex0jHvJ6LDTVFkwDqwFBwD3hMu/AGlhILwNOQXNxh5QfuzdwGJrI8Nd638DrlUqOzlVvXicgx
 JbYOENIS0Sd9QXc8DRlyVhUzsmU+1AMZK16e0tMWr4YD0h9B140fhQHO1o04IeocguMgtEO1CW4
 9hxnHjRK7qnfUv73u50HkA2/PtaX2PWJwIuUzq8ALek5wUm0+4djxDTnfHKfcBAoTtZz65hjkC9
 twv/+kHiQMCh9g==
X-Received: by 2002:a05:6402:3219:b0:698:9251:2f87 with SMTP id
 4fb4d7f45d1cf-69a1a4b7765mr2624269a12.39.1783276659140; Sun, 05 Jul 2026
 11:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260705160851.817019-1-sofiane.hamam@smile.fr>
 <c2b38f84845c057f48715f66fd035010@free.fr>
In-Reply-To: <c2b38f84845c057f48715f66fd035010@free.fr>
Date: Sun, 5 Jul 2026 20:36:48 +0200
X-Gm-Features: AVVi8CcrXvBQMVujrSgmTxzRxvzhYrotBqp_aDcq6Bs04bxvkmtQfejDXsVA44I
Message-ID: <CAMa4Ta+H5n1ORkf1YBCD6rXrw2AQqDDyX_jFW=R4kG6AcPG=Kg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783276659; x=1783881459; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Lgs2qz5EIH2+gzkHnRt1W7qGbxzyc8d4BvEofEW7/U=;
 b=RvhOLONEorYrNCwsWm07pB9M2ZBTKqCWaio6e3cZD3z3m3wfs2KM7EXo+/vR4guXJh
 WHsystG7JOilnyC+nJVbtTrAtnhmFlXdWAUvGl87Zb6gL4adwqnr5YKjj3QtXmx+nmsl
 enNQUuSKTIRtnkHHX9SXeFO49wm4x91AZGbH4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RvhOLONE
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx95frdm_defconfig:
 add support for freescale FRDM i.MX95 board
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
From: Sofiane HAMAM via buildroot <buildroot@buildroot.org>
Reply-To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: multipart/mixed; boundary="===============8047384821040079920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8047384821040079920==
Content-Type: multipart/alternative; boundary="000000000000cdff370655e1737a"

--000000000000cdff370655e1737a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I didn't see the patch series.

The main differences are firmware and uboot and kernel versions : (my patch
versions on the right, Laurentiu's picked versions on the left)

imx-mkimage-lf-6.12.49-2.2.0                             imx-mkimage-
lf-6.6.23-2.0.0
firmware-ele-imx-2.0.4
  firmware-ele-imx-2.0.2
linux-imx,lf-6.12.49-2
  linux-imx,lf-6.18.20-2.0.0
imx-atf,lf-6.12.49-2.2.0
 imx-atf,lf-6.18.20-2.0.0
uboot-imx,lf-6.12.49-2.2.0
uboot-imx,lf_v2026.04
imx-sm-lf-6.12.49-2.2.0
44f76dcb32945a60e08ea0133700b820349efbd3
(latest as of june 3 2026 from main branch https://github.com/nxp-imx/imx-s=
m
)

My patch isn't using imx95-bootloader-prepare.sh, I enabled binman in uboot
Kconfig, the nxp-imx/uboot-imx/arch/arm/dts/imx95-15x15-frdm-u-boot.dtsi
and imx95-u-boot.dtsi describe the layouts of the final flash.bin.

Regards


On Sun, Jul 5, 2026 at 6:24=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrote:

> Hi Sofiane,
>
> Thanks for the patch.
>
> On 05/07/2026 18:08, Sofiane HAMAM via buildroot wrote:
> > Add board support for FRDM i.MX 95 Development Board.
>
> There was already a patch series for that board proposed at:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D490838
>
> Could you describe in what ways your submission is different?
>
> On my side, I was waiting for the board to be publicly available so I
> can
> order one, to test this defconfig. I'm still waiting for my unit.
>
> >
> https://www.nxp.com/design/design-center/development-boards-and-designs/F=
RDM-IMX95
> >
> > Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
>
> Best regards,
>
> Julien.
>

--000000000000cdff370655e1737a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I didn&#39;t see the patch series.<div><br><div>The=
 main differences are firmware and uboot=C2=A0and kernel versions : (my pat=
ch versions on the right, Laurentiu&#39;s picked versions on the left)</div=
><div><br></div><div>imx-mkimage-lf-6.12.49-2.2.0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<span style=3D"background-color:transparent">imx-mkimage-</span><span=
 style=3D"background-color:transparent">lf-6.6.23-2.0.0</span></div><div>fi=
rmware-ele-imx-2.0.4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0firmware-ele-imx-2.0.2<span style=3D"background-color:trans=
parent"></span></div><div>linux-imx,lf-6.12.49-2=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0linux-imx,lf-6.18.20-2.0=
.0</div><div>imx-atf,lf-6.12.49-2.2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0imx-atf,lf-6.18.20-2.0.0</div><div>uboot-imx,lf-=
6.12.49-2.2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uboot-imx,lf_v2026=
.04</div><div>imx-sm-lf-6.12.49-2.2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0<span style=3D"background-color:transparent">44f7=
6dcb32945a60e08ea0133700b820349efbd3 (latest as of june 3 2026 from main br=
anch=C2=A0</span><span style=3D"background-color:transparent"><a href=3D"ht=
tps://github.com/nxp-imx/imx-sm">https://github.com/nxp-imx/imx-sm</a></spa=
n><span style=3D"background-color:transparent">)</span></div><div><span sty=
le=3D"background-color:transparent"><br></span></div><div><span style=3D"ba=
ckground-color:transparent">My patch isn&#39;t using=C2=A0</span><span styl=
e=3D"background-color:transparent">imx95-bootloader-prepare.sh, I enabled b=
inman in uboot Kconfig, the=C2=A0</span><span style=3D"background-color:tra=
nsparent">nxp-imx/uboot-imx/arch/arm/dts/imx95-15x15-frdm-u-boot.dtsi and=
=C2=A0</span><span style=3D"background-color:transparent">imx95-u-boot.dtsi=
</span><span style=3D"background-color:transparent">=C2=A0describe the layo=
uts of the final=C2=A0</span><span style=3D"background-color:transparent">f=
lash.bin.</span></div><div><span style=3D"background-color:transparent"><br=
></span></div><div>Regards</div><div><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 5, 2026 =
at 6:24=E2=80=AFPM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" targe=
t=3D"_blank">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Sofiane,<br>
<br>
Thanks for the patch.<br>
<br>
On 05/07/2026 18:08, Sofiane HAMAM via buildroot wrote:<br>
&gt; Add board support for FRDM i.MX 95 Development Board.<br>
<br>
There was already a patch series for that board proposed at:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D49=
0838" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/pro=
ject/buildroot/list/?series=3D490838</a><br>
<br>
Could you describe in what ways your submission is different?<br>
<br>
On my side, I was waiting for the board to be publicly available so I <br>
can<br>
order one, to test this defconfig. I&#39;m still waiting for my unit.<br>
<br>
&gt; <a href=3D"https://www.nxp.com/design/design-center/development-boards=
-and-designs/FRDM-IMX95" rel=3D"noreferrer" target=3D"_blank">https://www.n=
xp.com/design/design-center/development-boards-and-designs/FRDM-IMX95</a><b=
r>
&gt; <br>
&gt; Signed-off-by: Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.hamam@smile=
.fr" target=3D"_blank">sofiane.hamam@smile.fr</a>&gt;<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000cdff370655e1737a--

--===============8047384821040079920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8047384821040079920==--
