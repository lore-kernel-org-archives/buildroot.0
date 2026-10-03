Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24683CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACC041485;
	Sat,  3 Oct 2026 13:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFIyHErI93BW; Sat,  3 Oct 2026 13:16:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0FC5541461
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791033408;
	b=QmlWx8hZ2i99L+3Lg68sZatvnHxY2RpMJ4Nq1n+eYJvrC27G4ElJLtyX+TwQZ6J1krfU
	 lCdsipozR/ewqhHaXt/3xs34FDd7u+VAF8cDevgnJkABCoqa4oi8DkAcv1k9qISUrhRCG
	 5OYGmT0AYTZqDe6Mxd5Thesb4UMHIBqqruoVozSVwAn6R7NwGnJBzsF1pJ+HCF/HsMYYa
	 zZEW59RfWEbAadF0ILlFpqs8VXHKYXIX8GR9LFzyEnlKp3Ck7dbjo48VG6j/pYRN/Ncdi
	 eQ2aTO5Pftf/iLWlYhBG7wdkZ2QaZTIZPTdT4KPGozuU1LYpVO3zSkZuJqTOPBAsUoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791033408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=12zBQk/y3+Vy1BReEenBbTXC9szsL9imYzfyqJAiwww=;
	b=r9rVt3BobCNoNJFvDbYy/INJxzvoaY/IFDtVIS1xF1s5F6CGMauDtHs6PMXwsI5jZbQT
	 XXyIgCQ4kBWGmlRiAebQlVBa9CbjsH4/QF4fDi2pCn6f0FA8mBlqef83EgQ/xTDlVIX9k
	 mkYv2KeG+zL6foW2nZnA88Bf93sA7Wy03DuyIlrb98T1fuyn0EcJHmPciub+gaB78c3w1
	 DcOBKvKlOWzsdy9OdCUvEOgEBu52SCwe9eyNSrV1GRluVgnD/5IFTfiSL4cGI5b6XmlNP
	 nmC8JTTjZVmo/yNfTodZl8QGWVi5QwLLNt1JsZayJkn068tPGtR4Oe4t0BDOt+VHDew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791033408;
	bh=12zBQk/y3+Vy1BReEenBbTXC9szsL9imYzfyqJAiwww=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nkYlRoQzWgmNEUECSE1+ymDbm5i9CN06Su/HOgM1wKZeuSbHlGUDxZ90/xED6Zj2y
	 HzvEPVY3zxjwttGxylsA57oveXeMNUS2kv9QELicpKp1OORnLDyBRRaqBK0b+NDqwb
	 T7OxTqYXxRgAxcynZ2OKVUMBL/qSHwBDVX1yxcip/5u3CFnfpnvgsfBtT2H1o5Jggi
	 2n/bR0+vUb39speuTOKFUAr4ss3uTD2WgbQdhaG2LM9+dlTVJ8BSCiPBV2h6UtjFEI
	 ed/M1wtefvUDi62yrwMhxKI7jo+KqXnPLiFUzdCH6u7ZNQWGobFHYHJGpbNPwIwMq6
	 qnCYkA6dS5WWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC5541461;
	Sat,  3 Oct 2026 13:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C5E2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C33D66067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiaXG4lcI4AI for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:16:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E816E6067D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791033393;
 b=Ut+8GnYIYCE0drJLPZH1VxmdvtwJvghiowQfecHpoWbLyXk3FrMh+qgILPslEvPU4v2w
 Ogk4EYVhH9c8f1bDyYIwwTRAdBWdXXWNs1JoezPMSsAiqz0/9AcuZKuyJ36A1iWLkv25m
 qPn9ozVwhEXeFQBsZg91lqG2sppzXSQqvXTD+heLB8afuodbQ2W9FXxd/aqse96bCByHJ
 /2ZQ77Gn6my+37J/EOfaSiJ5FC2bY+7jeeP01iiY+UvlaQHBTGE1+Jz8qR6pN8y0UWQqK
 3Cki498FEs7syQXkyzyaAy2LIatt/SM3K0+5LJi2GCnUDcnr9GrD4o+PdzNVxXE/VVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791033393;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=a61WnULIKlYwySxYKNgS5FSwb+kIaaQK/SkP5M7ItQg=;
 b=awsn74ryw10RvZBdUIN2JhmU14hUSFs09eywW6SwdxiM8k7mNLs+b0uTTiAPfNX4WXMp
 Y9bmACxoF7N4aH1Zl2kGzz3Z1a25qRUNIwzOHXY58+PptPD5MyNyIfA2W5VRG5eExYNPs
 6Hm2o1IuyJE7jRSdZEKKW+5zXrvq11n7P7F7Ue4vF8sXG8QMcP8EAkZtYQhWzDpelDloM
 5eUWxW+EMg0KCtcK7T3DI28RDxricmd3SmvtdVclDE6kMABcfCHI+FlKSUZKQcdQHsY4m
 jF3Va/FUmDV3X4VFpB4WLfPEwBRt1lZ26PCct/Q5Y9H7QxhwcrM1qnLgJoffJSilfoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FvT9K8kZ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E816E6067D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:16:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 479684E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:16:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 06BEE604FF;
 Sat,  3 Oct 2026 13:16:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34527103282A8; 
 Sat,  3 Oct 2026 15:16:27 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:16:27 +0200
To: =?utf-8?B?QmrDuHJu?= Damstedt Rasmussen <contact@bearware.dk>
Cc: buildroot@buildroot.org, Tudor Holton <buildroot@tudorholton.com>
Message-ID: <asD_xB8IAC3nT-i0@windsurf>
References: <20261002202935.943329-1-contact@bearware.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002202935.943329-1-contact@bearware.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/setserial: CPE ID for setserial
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bj=F8rn,

On Fri, Oct 02, 2026 at 10:29:34PM +0200, Bj=F8rn Damstedt Rasmussen wrote:
> This allows setserial to be checked for CVEs.
> =

> Signed-off-by: Bj=F8rn Damstedt Rasmussen <contact@bearware.dk>

Thanks a lot for your two patches. Could you provide in each commit
message some evidence that the added CPE vendor/product information is
correct?

> diff --git a/package/setserial/setserial.mk b/package/setserial/setserial=
.mk
> index 9beee349c8..bba8dfdb88 100644
> --- a/package/setserial/setserial.mk
> +++ b/package/setserial/setserial.mk
> @@ -10,6 +10,9 @@ SETSERIAL_SITE =3D https://snapshot.debian.org/archive/=
debian/20250307T084701Z/poo
>  SETSERIAL_EXTRA_DOWNLOADS =3D setserial_$(SETSERIAL_VERSION)-57.debian.t=
ar.xz
>  SETSERIAL_LICENSE =3D GPL-2.0
>  SETSERIAL_LICENSE_FILES =3D debian/copyright
> +SETSERIAL_CPE_ID_VENDOR =3D setserial_project
> +SETSERIAL_CPE_ID_PRODUCT =3D setserial

These are already the default values for those variables, so how does
this help?

If it's all a matter of telling Buildroot that the CPE identification
information has been checked, then:

SETSERIAL_CPE_ID_VALID =3D YES

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
