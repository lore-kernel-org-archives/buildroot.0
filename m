Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4BDC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 06:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4113D4064D;
	Thu, 11 Aug 2022 06:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4113D4064D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ht6TVoc3AUn; Thu, 11 Aug 2022 06:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51FC14019D;
	Thu, 11 Aug 2022 06:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51FC14019D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC8A1BF271
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FE160B8A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FE160B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMun-GTQeH8R for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 06:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7507B608F5
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7507B608F5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 06:32:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b16so21721245edd.4
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 23:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=Uml+333rxwQtvXmmso1+oTRA3jUd8kJSambnAgm2geE=;
 b=JrWF39TuBJT2u+MdFFaGFcPo6xDa1RHqSJQSV3CytiSysuTdXQwjD4ZX4GotkpinmE
 ROcO0KfuEJrrsa7rHfSJLDDqwmDCQHFm49AA2Yzqv3h4L/9t5h3OWCPXE695rO+yEeDK
 y/yaU3ip+dSMg4i4AW6GnGPeJsdUN1A8RyBJ7dU+BgAchPN/3dDBulQl9Xuj804Q7bbH
 3uAoZD9rYatdMY7wf/CenQN9ePQ1dT7+Rjt9+Xo1kAb5ZAAwHKhe7S85eBg6hHKFqzGR
 k6E2rCTTcsv6ZUAn8YUVzGMn2jk3pHXNEPpCbc1apKLTVGpuhwRJOq+yrpGCOoQepHb2
 4ABg==
X-Gm-Message-State: ACgBeo3wCZ0mDmeom+MeUi61NiqFcqoQ9qgF++VFChkVEEaruUgH/4mE
 5FsW3OtyffDs5SkQxAZ8Od7q3A==
X-Google-Smtp-Source: AA6agR4gROp6qbCyYuvHnBVgwZYLiIa3F4osooXl4ddx0QLWHVf+vh+ulq0kUkVcFpgFej0Mu9WuXQ==
X-Received: by 2002:a05:6402:348f:b0:43d:e568:97bd with SMTP id
 v15-20020a056402348f00b0043de56897bdmr28903122edc.279.1660199574383; 
 Wed, 10 Aug 2022 23:32:54 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 b4-20020a170906038400b00722e203633esm3127276eja.122.2022.08.10.23.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 23:32:53 -0700 (PDT)
Date: Thu, 11 Aug 2022 08:32:51 +0200
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: Hager Stefan <Stefan.Hager@ginzinger.com>
Message-ID: <YvSik7hqjHFVXzfs@nitrogen.local>
References: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
 <20220810163211.3694861-1-bram.vlerick@openpixelsystems.org>
 <AM5PR06MB315354DB88826A507A36BAE584649@AM5PR06MB3153.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM5PR06MB315354DB88826A507A36BAE584649@AM5PR06MB3153.eurprd06.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc;
 bh=Uml+333rxwQtvXmmso1+oTRA3jUd8kJSambnAgm2geE=;
 b=QCWjwLLQxMp61MNWVIgX/qs+yNhm4WZalmKTo13+5n/qre+sNf26hom6RxDa2gXS4d
 Dn7hs/HWtdrgHIvFoisobjcCnC8Quo53MXdEaQp5e9thM7laHtfSjtJg5dBbyn6Oi1mc
 1E2OThzW/Y8N15NwKHURwYnkLfSFI3QnXt2jLllV/eTCOiE1tp7W6Zjfp11ZJ48C107R
 cIE1+9qu/3kxMpdR8WfyHCgnpQOjjH4P/agPSCNKmuhfhLn6J3zEy3zbSRPd45LfM+a+
 GNqXHoX3/LuY7wyZ8hdft4DOoAusECFAbT2MHI5RIE1z8Zk1bgg5dW745FO85F1ah4fU
 PeGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QCWjwLLQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.15
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I agree it might be a good idea to add the SCR.txt to firmware-imx.mk.
However, I'm not sure if this should done as a part of a version bump?

Regards,
Bram

On Thu, Aug 11, 2022 at 05:44:43AM +0000, Hager Stefan wrote:
> Hi!
> =

> What about the license file SCR.txt in that package?
> This file describes the type of license grant: specially if section 2.3 (=
redistribution) of the EULA/COPYING can be applied.
> =

> Imho SCR.txt should also be added to firmware-imx.mk  as well as the hash=
es to the corresponding file.
> =

> Best regards
> Stefan Hager
> =

> From: buildroot <buildroot-bounces@buildroot.org> on behalf of Bram Vleri=
ck <bram.vlerick@openpixelsystems.org>
> Sent: Wednesday, August 10, 2022 18:32
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Cc: Bram Vlerick <bram.vlerick@openpixelsystems.org>; Refik Tuzakli <tuza=
kli.refik@gmail.com>; Gary Bisson <bisson.gary@gmail.com>
> Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx: b=
ump version to 8.15 =

> =A0
> New version contains updated binaries which are part of the NXP
> 5.15.5-1.0.0 Yocto release.
> =

> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> ---
> =A0package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
> =A0package/freescale-imx/firmware-imx/firmware-imx.mk=A0=A0 | 2 +-
> =A02 files changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/packa=
ge/freescale-imx/firmware-imx/firmware-imx.hash
> index 98a0e73048..c86e4244ef 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
> =A0# Locally calculated
> -sha256=A0 6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322=
ef=A0 firmware-imx-8.12.bin
> -sha256=A0 ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15=
ee=A0 COPYING
> -sha256=A0 50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b7=
1c=A0 EULA
> +sha256=A0 937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08de=
b3=A0 firmware-imx-8.15.bin
> +sha256=A0 35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a=
31=A0 COPYING
> +sha256=A0 30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0=
a4=A0 EULA
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package=
/freescale-imx/firmware-imx/firmware-imx.mk
> index 211a43c4ca..2d1818334a 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
> =A0#
> =A0######################################################################=
##########
> =A0
> -FIRMWARE_IMX_VERSION =3D 8.12
> +FIRMWARE_IMX_VERSION =3D 8.15
> =A0FIRMWARE_IMX_SITE =3D $(FREESCALE_IMX_SITE)
> =A0FIRMWARE_IMX_SOURCE =3D firmware-imx-$(FIRMWARE_IMX_VERSION).bin
> =A0
> -- =

> 2.31.1
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
