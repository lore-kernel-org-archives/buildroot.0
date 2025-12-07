Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B72D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 15:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD75607AA;
	Sun,  7 Dec 2025 15:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEbrlMgClX84; Sun,  7 Dec 2025 15:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5C560710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765122433;
	bh=oMRbtSPBUt0QSD0Lg3fwkd+8EncMlg57e4RdvnFB4l4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=clTJ75eMeafo+JpCnwEYo7uoq2dBG5KzFT0YHdofZYX24meEI2TooTUAYOehWGtc5
	 QULXOEuXuFVuRENk2rZCYjV7M0x32whqyy0sQRdStkyFQiGKWwhynK4It2UukGKZGK
	 mEzAEw6M1j38Urf8xLz2dlreCjYDlrnKfGGNorf2q3z2mfBlO9ZDhBW6pPpjcbKWt8
	 tc1DTovc83kUDJ8f/0ONwfw9+HP+S/v56uotGGty8V5BZAv0OJuyonEwAAe4Y4j6et
	 YR5eR2sA7aSrlESbBAx+tw6eZtex66IIxC3AyREq2pCsILyEOgjRmTEn88d9vVMtoT
	 jait1egvnEHew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5C560710;
	Sun,  7 Dec 2025 15:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 321F22CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E1940296
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAj2TqR7tgha for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 15:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 057AF4031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057AF4031C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 057AF4031C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:47:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D34092003CC;
 Sun,  7 Dec 2025 16:46:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 16:46:53 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 16:46:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>, Davide Viti
 <zinosat@gmail.com>, Eero Aaltonen <eero.aaltonen@vaisala.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, Rahul Bedarkar
 <rahulbedarkar89@gmail.com>, Romain Naour <romain.naour@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Stefan Hager
 <stefan.hager@ginzinger.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251203214709.2321976-20-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
 <20251203214709.2321976-20-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3a12e04586be258444c2d5be26e8bab1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765122426;
 bh=o7A4c850jZoLWtKUiS3AofijejqPxFIztQv+L+QoTws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RydhO0TzS19A9+Osf4CIDGxRO16MWwdv8yJKHN5bh6ER+GSTHmmXZWP9mhcDvVOmy
 H1pOR8TIZ3kS5EoAFVSudMwOLEXMuo4kcL2L3rjxBjAPFobxbLjI3WIHODI6LAk/ZK
 CamxLurSu37sWCsu0pzNWUMaCZQH1oyRiShI0NJr/brxjv3aPCK6g5ApAyDPRabH7T
 GDNMKLqXCwetWTRIEjhpGnrakrGb3Mx0xr9TUeqMSbsc2/s/o8lsFTLQou1rcTHXLf
 MTBS2AzroBswnChR2yyMwNgHfINFioWQDkNcG3MJsQEUsDOVvQ2jJxEavmu3LcHogO
 MKI8x4G5T49Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RydhO0Tz
Subject: Re: [Buildroot] [PATCH/next 20/21] package/read-edid: fix cmake 4
 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 03/12/2025 22:47, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/read-edid/0004-cmake4.patch | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 package/read-edid/0004-cmake4.patch
> 
> diff --git a/package/read-edid/0004-cmake4.patch 
> b/package/read-edid/0004-cmake4.patch
> new file mode 100644
> index 0000000000..4adf1ce300
> --- /dev/null
> +++ b/package/read-edid/0004-cmake4.patch
> @@ -0,0 +1,10 @@
> +Fix build with cmake 4

This package patch generates check-package errors:

package/read-edid/0004-cmake4.patch:0: missing Signed-off-by in the 
header 
(https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
package/read-edid/0004-cmake4.patch:0: missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)

Could you send an updated patch addressing this issue please?

> +
> +--- read-edid-3.0.2/CMakeLists.txt.orig	2025-12-02 08:53:55.032171422 
> +0100
> ++++ read-edid-3.0.2/CMakeLists.txt	2025-12-02 08:54:25.324940568 +0100
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required (VERSION 2.6)
> ++cmake_minimum_required (VERSION 3.12)
> + project (read-edid C)
> +
> + option(I2CBUILD "Build I2C get-edid implementation" ON)
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
