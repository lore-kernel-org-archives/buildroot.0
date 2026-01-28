Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34488D3F09F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CE040C88;
	Wed, 28 Jan 2026 17:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5yNh4juApWb; Wed, 28 Jan 2026 17:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CA340AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621088;
	bh=5IG6dl1znvzjtZVkewWKlv5eEy52fhNFwRQZsTxoFOw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nNP4X+WchnxAfOpLwTMbEaOH83yFAUVa9kKMhqtwfnT3amzp83L+ctV0G8bAmSh5p
	 dGoG3ETGKcIixkN/TyuifqmP15KOONFnV0MMjBQkFQ6adU/zntNrPrD8NMpqs3lqXq
	 qHT2cTGK3ddXlVX58s3QCyRZq1BJe61QeStGfmgpF9HxqxUIh162v0TX9tcrVGlcRo
	 k9gVN+jzdFYeV5NT4sFxqPfNSZZbuebjsJ7+YWsOJZflTHMDIZas1tb23TDyavI0sW
	 POVD4i9/34Q7a63uHEbxSZOPSdllUOY6J6KlcjX/0PyKm15OL5gBisgaontx5rFILa
	 PG5TvIX8/Lw9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CA340AFD;
	Wed, 28 Jan 2026 17:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A4AA1AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0041F60782
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW_84tVQ1clf for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E12D860781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12D860781
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E12D860781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 694ABB97AC12; Wed, 28 Jan 2026 18:24:31 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:30 +0100
Message-ID: <20260128172430.343160-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114173925.1877799-1-bernd@kuhls.net>
References: <20260114173925.1877799-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621071; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ydGzQJHsQnUc0b9oGnnPDkdTJ026V4Ny2n+Xv1rTQTE=;
 b=iD7DMlDWhFHAkGt9T703tPNzCGRWu5KqybSl12Se9C4cakJPDMJ6kcXU09TyWcJ683iEaK
 vQDMzglvUJjTQZjFlvwBMqIEdepXnSe5Rfa9vXzTjECK7F8oPRhe51PK11YGVjiHtPRC8j
 tFtTR08r4K5oLkFBU7qP8i5XgAWGIiFRXhaqWV4xStz2eaBGAW610dTPqG1UZ+v9Sfbq2O
 ihnedbwwzZIrQdOecc/nIdA9iGhJ7/W9+XX1yGiB/zIquIqpVPFALZaJc+LJCxK5Y1m9r0
 FWrHHm7vNE3rm1B+c3LIKn48VE/bWlSmX5sVznDeWG0nNbMIFwE/4rLBW2LkUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=iD7DMlDW
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: update tarball URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The project moved its repo to codeberg.org:
> https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html
> 
> Updated tarball hash after verifying that no files changed, only the
> directory name changed from rp-pppoe-4.0/ to rp-pppoe/
> 
> Fixes:
> https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/rp-pppoe/rp-pppoe.hash | 2 +-
>  package/rp-pppoe/rp-pppoe.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
> index 97bb61eaf8..89f9f5c33f 100644
> --- a/package/rp-pppoe/rp-pppoe.hash
> +++ b/package/rp-pppoe/rp-pppoe.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
> +sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz
>  sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index 98325e7d49..562e0311f0 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  RP_PPPOE_VERSION = 4.0
> -RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
> +RP_PPPOE_SITE = https://codeberg.org/dskoll/rp-pppoe/archive
> +RP_PPPOE_SOURCE = $(RP_PPPOE_VERSION).tar.gz
>  RP_PPPOE_LICENSE = GPL-2.0
>  RP_PPPOE_LICENSE_FILES = doc/LICENSE
>  RP_PPPOE_CPE_ID_VALID = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
