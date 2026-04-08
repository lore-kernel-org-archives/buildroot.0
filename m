Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA8610F995A
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 16:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4052640DE5;
	Wed,  8 Apr 2026 16:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhIdhCREdEhp; Wed,  8 Apr 2026 16:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F4640DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775665560;
	bh=yH6EFvdOBhIKTrrGDfmmkEpoQnjVwZiysPbghUexcMw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ry5VJFeYNgDbvgR77B/jyMRNwh/rvHW7tI6zPPNYpGHJT22cpIqLF/XLajIJHdKxT
	 Y3FOIAX5DPljgV5edhfhVhfgYyIpaA7O3gYz0HqHTFTiLoGYZez3T46XzU86qB6wkg
	 979EwH7u48RYMGHICodnYcX6GgMpbza7JSFG2nCJI++HimFt8OOByBJSuyKUnJQtDz
	 xtEXH5ueEDgKGlxv8+M9DdKoJldP6irQq0aVYuVKWKdudo3CSrGEAhQfuPvaC4IJZm
	 0ABMPED+KPYlx6whDqtiNMzyHeUlq2Euasq6BpuS736IT1viwP77fCs6Cw07+NblLy
	 lVEoGn8PENlsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F4640DE6;
	Wed,  8 Apr 2026 16:26:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4B892C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCFF060F83
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rXqBVvAKk5h for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 16:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA61B60F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA61B60F74
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA61B60F74
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:25:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 84B744E42965;
 Wed,  8 Apr 2026 16:25:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4C838603CE;
 Wed,  8 Apr 2026 16:25:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C008C1045017C; 
 Wed,  8 Apr 2026 18:25:52 +0200 (CEST)
Date: Wed, 8 Apr 2026 18:25:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <adaBfHS5zHFDAzWV@windsurf>
References: <20260408095657.2560313-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408095657.2560313-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775665554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=YMDZI8XHQL/X9jsV86Fw0gw6xBMR329Xk4suzz/Xc2s=;
 b=E9Txd+VCeM1mey2hdltNzlp1nr+JR71SeD5YBQUWUYMU6OfmYUj8WVmWPsmwkn3YvvUbAY
 XSBSGoMWXXZHyXtjecOYm9/PWDjk/rkBVBLaoPJ1RZE+AGsz0zIOzuBBJPUswLe+RwkhJR
 pQrzH4PsFUHcaBzume6oNPHTO+jKBxjmuikKxbwPgBdaiQKwOSYZR3OfrK2yNEOEW4AdvG
 qCfJcMmHYSvB5xiD0jY4fi2cZzTFKOtlkQKg9yGoXxKLnwxEOFelEy5vwfncJtBKNPvQ40
 tFLUvV1iwzL2upu75q8Fb/8Xo1b38X5brHkSxe2TDmYVVPfVPnt3oaV2Nqs/5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=E9Txd+VC
Subject: Re: [Buildroot] [PATCH 1/2] package/libnl: enable host package
 variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 08, 2026 at 11:56:56AM +0200, Giulio Benetti wrote:
> host-libnl is needed for host-nfs-utils.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnl/libnl.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
> index a0441b7835..28374320ba 100644
> --- a/package/libnl/libnl.mk
> +++ b/package/libnl/libnl.mk
> @@ -13,6 +13,9 @@ LIBNL_CPE_ID_VALID = YES
>  LIBNL_INSTALL_STAGING = YES
>  LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
>  
> +HOST_LIBNL_INSTALL_STAGING = YES

This line doesn't make sense for a host package, so it should be
dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
