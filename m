Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD63C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9892B825BF;
	Wed, 10 Aug 2022 12:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9892B825BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sv1SD-5XMgG5; Wed, 10 Aug 2022 12:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF55A82503;
	Wed, 10 Aug 2022 12:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF55A82503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63BC41BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE696108B
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE696108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdLE9VtIUS9c for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:40:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21176107A
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F21176107A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:40:25 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id 13so12689094plo.12
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 05:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=PyDByQ9x0E1osacUzzo4DUeKOZsQAsGFsFgbTao8R2w=;
 b=rVum64qswioTLTQes0CkJL4EuzjmAKwWnBNKVPiyKYFpMQXYfkKw73oo0ff0f+Nqtg
 mXsyzDm4x1XZq/8CTlllEQMArVUNRBagiSDWxKtUcusY1apwlFkK/R/aCLUpGFpYkZJy
 4ef539Mg5zYeYkM3N6zTGLsq1hs5Ym7sVA2WjDLY4jMn+V5BCsKofWwZhmFdU99Bw0vT
 K6PJIe+zaQPHAtOAZie4AO052A/jDAseEchHzwGHHrstkWLDb+PNvBg6CCf2EM8D9i69
 +lr3v9nglh/uw44fKQdWrTYul+yVUzM+04CiOtpWJnF0tNqkfKcpZCl+jnMdo873bNZG
 1/1g==
X-Gm-Message-State: ACgBeo3hHzRkg4/F0Z4v9McQrQD8MDLJQLMF7FQy+WGjKVm5i8bLcjGy
 Zj3DkFc/UR924/Cs/qk+l/t+3W++ALrQbg==
X-Google-Smtp-Source: AA6agR7P2ukpUW1kbOz9lPa5P6vcoPXiz2Nt8Lw4WgaqJqv5DCB04zMCgr3+gmgmbHOodVbLbhhD/A==
X-Received: by 2002:a17:903:4051:b0:16d:b32f:3c6c with SMTP id
 n17-20020a170903405100b0016db32f3c6cmr27463556pla.13.1660135225312; 
 Wed, 10 Aug 2022 05:40:25 -0700 (PDT)
Received: from p1g2 (lfbn-idf1-1-1140-105.w82-125.abo.wanadoo.fr.
 [82.125.243.105]) by smtp.gmail.com with ESMTPSA id
 h32-20020a63f920000000b003fbb455040dsm9645520pgi.84.2022.08.10.05.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:40:24 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:40:20 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <YvOnNCFjnstEnxmN@p1g2>
References: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220810122741.3661557-1-bram.vlerick@openpixelsystems.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=PyDByQ9x0E1osacUzzo4DUeKOZsQAsGFsFgbTao8R2w=;
 b=Ig+2G20mzJ6uE8txeWYOylvYDeL1V0r8Et9uQaexykx5wxgWTt1fLXjgQF2Ga8nZSV
 J5YiZm2tGe4pir6kR5V1Q6bBebVCH/QTQlJQjZnvKPms2nKonXFLOwYnNd3xt4wZkO1v
 k0i5Dbk+1G1zEhSWH8qTi/KbrAVIyoNZ+ojCA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Ig+2G20m
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.14
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
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bram,

Thanks for your contributions. I have a few remarks below.

On Wed, Aug 10, 2022 at 02:27:40PM +0200, Bram Vlerick wrote:

Please describe here what the update is about, what release it matches
etc... You can look at the Yocto layer for details about the changelog:
https://github.com/Freescale/meta-freescale/commit/cb3baf51

> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index 98a0e73048..b6bcbb8b84 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
> +sha256  bfe9c57857e8442e7eb26ba3e1020733b09a7c9b83952ad4822980546c58a7f4  firmware-imx-8.14.bin
>  sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
>  sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA

Are you sure you've checked the COPYING/EULA sha? From the Yocto change
I'd say they need to be updated.

> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 211a43c4ca..3619c6b794 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIRMWARE_IMX_VERSION = 8.12
> +FIRMWARE_IMX_VERSION = 8.14

Why 8.14, why not 8.15 like the Yocto layer?

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
