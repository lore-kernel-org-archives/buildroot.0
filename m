Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA9CCD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 18:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2789984A9B;
	Thu, 21 May 2026 18:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ-RO1PanVci; Thu, 21 May 2026 18:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CEE84A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779389342;
	bh=oabazznYhVyyTpLWs3PnfVGp7V1vmT+je4cI8oqcPtQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gscfgy/6TpYYM6rbkqvRskcPVh/QDfZiTdAgAJaw9QJKcCmItVKRr179eoxG5m/IV
	 7bNKpgnPA4hiA8qC+QlXa9iv5zq/tUZ4HEwh3eo8oo4sQt7Ik4Nq6VqMwb2KSoRzjr
	 I62Mg+F1tQc2vRj7zVGASoas61J7TGWMx5cYC2eHGBFJwkA90x5pqO+MMC1f1ilPCm
	 BBfWxIzBc8QGSm/ksqdJ+1/ZlhHXlK8MUwXkMaHhqbLj2I+e+c0ryXE1WExXuJKSx8
	 KYEqPaM6aOgfk7l0qmEyjkJOv67aW2YKP/p8jrSsubbin1jSiEKWi8vCQn4S+SnRdR
	 6U91Tn1d0t7QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CEE84A5F;
	Thu, 21 May 2026 18:49:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F039B3B9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1638406A9
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn_XukMpbvzn for <buildroot@buildroot.org>;
 Thu, 21 May 2026 18:48:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A28B040627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A28B040627
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A28B040627
 for <buildroot@buildroot.org>; Thu, 21 May 2026 18:48:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0465FB97C54F; Thu, 21 May 2026 20:48:56 +0200 (CEST)
Message-ID: <4949bf8c-8cdb-485e-b974-d9461312db38@rnout.be>
Date: Thu, 21 May 2026 20:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-2-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-2-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779389337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eLWhNxZtqn5a0p2OMcj+CZyhoham+eNMHVhb3pxsSzs=;
 b=IlLx5U3ii8cnhHRYXyzldTfEWVkf62VyDxXO4RqMCGpqSsTGw27RN3LnCT+9KJMLWZifqr
 TwkA7O2emWcTWzwR/QVVi8WQXlU42l5OxVrtGfOZ5Hpk9H5FonDgaPZJoGoURk0g/9/GdN
 bNuAkWOti+IdK5mrWXRlx/GJGZB3HTMy4rJIeuAGXTZ6yicmLhg+7UO0JUYh0SdjdyA1yZ
 O1cc2ACbLI3ZgeJbfkSl93rneLAxVBXn5WCHBOsJXu50nNRHZeKrPxg4LNkgvbpNkM7J5Q
 Kyfb85G8/RuPmDdr/u1T9uyfQ3bCcqfDNuwmVcCN2N5HYHpxkxOI/k/Qzg+GBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IlLx5U3i
Subject: Re: [Buildroot] [PATCH v7 2/8] package/wpewebkit: fix stale
 libepoxy dependency comments
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2026 04:03, Joseph Kogut wrote:
> wpewebkit depends directly on OpenGL ES and EGL support, but those
> dependencies are not imposed by libepoxy itself. Update the inline
> comments so they describe the actual dependency source before relaxing
> libepoxy's package-level EGL/GL dependency.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpewebkit/Config.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index c8602f1de6..c4ee5a27f7 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
>   	depends on BR2_USE_WCHAR # icu, libsoup3
> -	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
> -	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
>   	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>   	select BR2_HOST_CMAKE_AT_LEAST_3_20
>   	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
