Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C19FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAF4429F0;
	Sun, 26 Apr 2026 15:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdfpaBwoYhcw; Sun, 26 Apr 2026 15:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6558429F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777218443;
	bh=NXooEnwu+QNUfn6d6SPebc13JuiPxU6vVcyQ+WgBuMc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d9JUiZEfsrK4mEkRexvxZMUxNGhMrXd3DBnjYsDlUF96U3VESeQ+Oba5KacRSyhat
	 /uNwie/ul+flvEa3/ZxkNyRZFw2/n35lUJrG8mX+ZY+VdTfHLTVMtbgERboeXmVtJf
	 iuszRZnPi2f3UKOEsknceZ8M2VZzlkOXHVfe2fP+bikyWxFNFl/aPDroczH+q+8G/2
	 bS+G2sC0sHtab91XwJogmeqMZLrgE3gGGBk7+LJqZbZhF3NqFFQ5+fOVwndM67yZwx
	 jXFvvfWvGwLaJNe6QYSxZ9a+SRWyRoHy+IpV1p/OacdStax/LimHjP1el+/V+p6kSp
	 KtnAatNmZTmjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6558429F1;
	Sun, 26 Apr 2026 15:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12511231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBFB941FFD
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAgBBXaEUagt for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85BA44018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BA44018E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85BA44018E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:47:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1w8C0r3ysq-001icb; Sun, 26
 Apr 2026 17:47:18 +0200
Message-ID: <054e02bf-5cef-4d0a-ad3c-8c8b5e3ab829@gmx.de>
Date: Sun, 26 Apr 2026 17:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260426071829.369415-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260426071829.369415-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:QudpwmDEd+M4IBeqvcvRKKmeobE7UKAuC8fp6kH9kAsPpQSq4GI
 cv0gBuayBA/DP6dlsWsr/dr8htndtw9G51rye8zgsW70nFtsSs98EMfAqplgGOU3ik7QUcF
 7cnt5QCsfzjLZfavHfcIW0f1vvJE5C59ln716GyqunmOU6PXqW0V3YXyyUGxRqjOKSMI64u
 dq7jWhEVCQeP6crX3QKaA==
UI-OutboundReport: notjunk:1;M01:P0:JOI9r/vfreg=;PkzSdN/SvrjyHT6E5+DtOf+x1fa
 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
 fJoEB5RDQz3JnPbrGfNtwojN3WNYv7m1+U8A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777218438; x=1777823238; i=fiona.klute@gmx.de;
 bh=A5eMekJ750NkBGwk2a+IeM8al5ZjP1nmG7vIJGtGF5A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cxGPqESWunusbB0BlDbUh6LtO5jHlb4q3cU+k6dA0b47hGcCccMQAPD+GB3do+qW
 iCZ6As1db2YHn2dfIlJaYNUkqR5cX2oapO+NAvjXAZO+ELQjLVPdOOVscyKSSZ9+H
 i1GTZCANKt7mzQMoHP1v8Lf7YV3AbTNIWHLMLRP1zUYdVnkCtTnoU2bxYf6G/bUZZ
 slCee2VEdJIcNlsths5gPVvDrBLZzioVcojgvFMbVcZprV3aAmiVAT8UrApx7aM9H
 w3v0mmopZDRoddLtpPk+OuJBa4oZx+uRJBWunxcuEAX+Fgn0F3psqbcIqkd8AmLxU
 9UtYBR+YyW1J4PqSpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=cxGPqESW
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.3.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.04.26 um 09:18 schrieb Bernd Kuhls:
> https://cmake.org/cmake/help/latest/release/4.3.html#id2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

Aarch64 build with 6 cmake packages.

Best regards,
Fiona

> ---
>   package/cmake/cmake.hash | 4 ++--
>   package/cmake/cmake.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 5367ae2cd5..f531e73c31 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v4.3/cmake-4.3.1-SHA-256.txt
> -sha256  0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb  cmake-4.3.1.tar.gz
> +# From https://cmake.org/files/v4.3/cmake-4.3.2-SHA-256.txt
> +sha256  b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d  cmake-4.3.2.tar.gz
>   
>   # Locally calculated
>   sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 4fdd294f5a..0223e65551 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>   CMAKE_VERSION_MAJOR = 4.3
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
>   CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>   CMAKE_LICENSE = BSD-3-Clause
>   CMAKE_LICENSE_FILES = LICENSE.rst

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
