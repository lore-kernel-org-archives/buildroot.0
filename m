Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C3ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B35240BAA;
	Sat,  3 Oct 2026 17:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRp-dgtt_5OJ; Sat,  3 Oct 2026 17:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E1A5640B84
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049988;
	b=O3ph0BuPVAG9Zjwhvr3+pONN81Y8HUDFSgTxgmlGUnCLwlNWq8JPa5ZQZ/lwq/BjpRF8
	 VBhqCn/2qua5HRazqwzCPZE4bbswliMIbiVE6KwLMqu+pj5ga2wsnmQWXtnn5TjQh7Oqq
	 g1uLbZKRc/YiN4tm8Zx+Bp3BsIUxnYi5Wa1SdW2LNEGpsAOTeWtcpGaFdHkGA0HJx1cn9
	 Q5eQM1AaA1Lx4Zh/B1BBGpawuCuUZSXYSpe6MBa8VSm5QDkp9oWNdZKwHZWArgrX3wBMt
	 PMWQCpqfIDOlvmZIa82d3dy98/G9M6MKUvmFATXQZnreR23xPcmDDXUJ8/kOMqikqSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049988;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7F7oyiO21yzDCy4Hb9lYX55xQ+Yi1KTZUPWzUgUMwps=;
	b=g3wbc5RouyK1tcJ6w1rha7LBnIKxh4zwgy4JhbJp7hs+K3W2X/lNWAutMI67lkOv7scu
	 NFQMUoT1jU+nNoc39FluZ8MeSdtTpjqOHM4NPd1M4+5d3lpZlP0YM8ycxIvwiVpLzT+mu
	 koMpAWI6j1LYQpJKqIHnehWZRHTr2MplUHa6MYCDzLzQIrY6lmbxMK1be2wPykiAaNSs8
	 32cHqcI4KAoszrz5+dFuM4NE//wr1g5hTzfcwcSUh5h6vcGuj449n6wRH2Y2aZWuTpK4b
	 VHfdMRqL99bAX8Fu1/3/SzdS6JFrvqqKjwkXXIEPBEcq3OI+wwD3vESadphVBtL9Hmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049988;
	bh=7F7oyiO21yzDCy4Hb9lYX55xQ+Yi1KTZUPWzUgUMwps=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nc4ZI2tXrhZHDC5YoKYn6Kh98lJG0mAaFSNsZmTP591hy2vYGaNO+8ok2E4Xy4BMi
	 zC5Uvt/a9ke7n/qBmwmY8fUI5xQwQqwuxpI1qadtuQJZN6McJvYya/F8TpffQi2yQ/
	 /ksdw4ZrhPWs2eY65jaBT5bQCAGKuJxz17l6+sxKsq611a4XuTpzd8em7pyWoOsEDa
	 f+fxWBTVyNsZU0G6AHYuX6Pb/bOEqcNo/9O5BOOnHd2UO2Kx8FrqwLnqJ3URACob0i
	 UXgYn4wOG6szZFCmMKh3sUbhFuG0qoUGfOwbOVaQ70x2OAZnqpQSWoiemDhqqkvtOM
	 waGja6Jtm/EBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A5640B84;
	Sat,  3 Oct 2026 17:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 039DF4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF7740098
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yls-W9N87DFd for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B5CEA40064
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049983;
 b=pdSsl5K9azqSQW2O2E+jXbOLR8E5ASkxBVjAZvW3HOYNjfTBag3SSQ2NRKC5E/lsJ+Uh
 xHBCxDtp5gYYoU0+o1dQ/j2yXmvkSXXYTE9NyVe7gS+3pqKvNGQaNKSfBqY21RwinQk9l
 7Tup/8CFnpHHVH+NraDiJACGTeiX8E7+NJ+fXKQ5v9hOmuZSxTS9mfZxFFUajU/qRhDfl
 uOimhr1zQ9ht5XJP0YiXILodVbzoefz/l+sKxYMBiuzClZM6fPyaErwTAjyVeXS8xjy+f
 geYzaiYMOA/jBcVB1yp+5piu7XUIsIeIeAcQjdYxLIIQcnQtnTomX+ugYrB4bOhp46A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049983;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=N+fSJs1fWmJanicHEOdhosWbrf9d8a2Nx7jwb1ei2aU=;
 b=YrZIrGfpcas8Hifwm0PXIcgPVDJZIauGVhrI6hEOINOqwrAFtbSTlXIS3juG/kV8R2i/
 ZzeY9yADPLM0TUx4NyYz4XE7prUlSiUPERm0HJ9Q5RSgrBVZNAMmWXk0q9r1ERCmXGGnP
 NwHX4/lYbtV6QubaCep6LBYK/rNLDh1uSGLY11bBX+cgusm3AQEsq//LCF/DSe2tkhgNd
 FGSc4WADgcHQ4fUUI4CVjMu0qNRb80R3oSIiGqvRRClTk9y7Y/q28tV/jhdYjAxF566xZ
 zj7SBCfhKJpBeBdCCM+ALLRVAhpJ3IgCGLuWIjK3TMm2Bfcg9AaPPQR6tqIE/x0lChw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a7XYMNBR; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5CEA40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:53:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 739A44E41138
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:53:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 206C2604FF;
 Sat,  3 Oct 2026 17:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46CCA10328170; 
 Sat,  3 Oct 2026 19:53:00 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:52:59 +0200
To: =?utf-8?B?QmrDuHJu?= Damstedt Rasmussen <contact@bearware.dk>
Cc: buildroot@buildroot.org, Tudor Holton <buildroot@tudorholton.com>
Message-ID: <asFAhBaGeA7ewV9P@windsurf>
References: <20261003173657.1235590-1-contact@bearware.dk>
 <20261003173657.1235590-2-contact@bearware.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003173657.1235590-2-contact@bearware.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/openjdk: CPE ID for openjdk
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

On Sat, Oct 03, 2026 at 07:36:57PM +0200, Bj=F8rn Damstedt Rasmussen wrote:
> The CPE ID on version 21.0.2 in NVD:
> https://nvd.nist.gov/products/cpe/search/results?keyword=3Dcpe:2.3:a:orac=
le:openjdk:21.0.2:*:*:*:*:*:*:*
> =

> The automatically generated OPENJDK_CPE_ID_VERSION cannot be used
> because OPENJDK_VERSION includes a '+', e.g. "21.0.2+10". NVD will not
> accept a version number with '+'.
> =

> Signed-off-by: Bj=F8rn Damstedt Rasmussen <contact@bearware.dk>
> ---
>  package/openjdk/openjdk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index fbc860019c..95efe2ba19 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -17,6 +17,13 @@ OPENJDK_VERSION_MAJOR =3D 17
>  OPENJDK_VERSION_MINOR =3D 0.18
>  OPENJDK_VERSION_BUILD =3D 8
>  endif
> +
> +OPENJDK_CPE_ID_VENDOR =3D oracle
> +OPENJDK_CPE_ID_VALID =3D YES
> +
> +# Override automatic CPE ID because '+' in $(OPENJDK_VERSION) is not alp=
hanumeric or ._-
> +OPENJDK_CPE_ID_VERSION =3D $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MI=
NOR)
> +
>  OPENJDK_VERSION =3D $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(=
OPENJDK_VERSION_BUILD)
>  OPENJDK_SITE =3D $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-=
$(OPENJDK_VERSION))

Thanks for the v2! However this was causing some check-package
warnings, for valid reasons:

WARNING: package/openjdk/openjdk.mk:25: expecting package version to be set=
 before CPE_ID_VERSION
WARNING: package/openjdk/openjdk.mk:22: 'YES' is implied when a non-default=
 CPE_ID field is specified: OPENJDK_CPE_ID_VALID =3D YES (https://nightly.b=
uildroot.org/#cpe-id)

<pkg>_CPE_ID_VALID =3D YES is only useful when no other CPE_ID_*
variable is set. As soon as you set CPE_ID_VENDOR, CPE_ID_PRODUCT,
CPE_ID_VERSION, etc. we assume that someone has checked the CPE
identifier, and therefore we assume that the CPE identifier is valid
(and we set CPE_ID_VALID =3D YES). Therefore, setting CPE_ID_VALID =3D YES
is redundant in your patch.

For the CPE_ID_VERSION calculation, for consistency we like to see it
defined after the package version.

I fixed that up when applying. Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
