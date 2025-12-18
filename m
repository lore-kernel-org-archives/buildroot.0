Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB4D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2968410B7;
	Thu, 18 Dec 2025 16:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Cv2NakSwvnq; Thu, 18 Dec 2025 16:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7A8410BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075839;
	bh=rUk/HVduMC39JsaB/lvVBD03Py4E9S8+ZA8CSjATkCQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MhVbNP7NZAh9Gz8P+MXXqxX+lcz6OlAJSDfUBfMjFFtE06Yi91YBQYDeyQz66b0sS
	 VFMSwB3fmYcHU6Gd8A5goqqd8nPVeEDDwm8yDiNRZ7uiDE7qtwMwm/Q3ov9ydCAsfu
	 Bq8o0ujGjUGOWwEI4y8KcQwN9WEg74qKn/MmA3s3GIorIc+vABNZ7/ZWSgvj2pEM86
	 l2CbMwZGjP+kKTB1z2gZIb5LeTYm05O9r7h8E0SW9toWkPQkoWS5BzskpiOyfy2SDh
	 3g+DCABbY7sxCNUgVrkTxOpCSaOGIJhNpeKABLoeIZ+Mjtim4Yt1bS7tfEjNNXQq58
	 HHf66+ZUDcIQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7A8410BC;
	Thu, 18 Dec 2025 16:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2C51A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70CC3611B3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xA6BV6u329lt for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69E85611AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E85611AA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69E85611AA
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07291B97A1BF; Thu, 18 Dec 2025 17:37:14 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:12 +0100
Message-ID: <20251218163712.379310-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213115728.1277185-1-bernd@kuhls.net>
References: <20251213115728.1277185-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075834; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=NEuArxoNrqdiSuHEKqmAMEDTVnMW3ViKv6RdnNYgzS4=;
 b=QIjAh/jjAVZKZA/S+Ml73BwvXA1kBsX/uyL+Lyn9ososPjRjbOFhuorHj2rRx+v7hcpGk7
 pbsoWJvVPqgbKruuoQq1u9hWk0tGHmHltbhxiFlrB01ceJy3YXDCQuPZqhgf3P8n7qPaAr
 wDalh7/0dOnPIwODba1FmqZOku+je1f2PHgfaULxZG2XO1NEskSz+FgJtjKt5sXX9iCMGz
 lPxHB8bBxJo2aQeM4nGc1jsdOipWlrI7kk9huJHhJopbJswcO2+oPMELpwhj8i0OjPj3Bl
 Dw0SROVumrn7cEtxdA5TNdXJuJ+sFMPRAqTIZdMk3iCxHu3sIWekhAFcv0FHCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QIjAh/jj
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.4
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
> https://github.com/libarchive/libarchive/releases/tag/v3.8.3
> "Libarchive 3.8.3 is a bugfix and security release."
> https://github.com/libarchive/libarchive/releases/tag/v3.8.4
> 
> Switch to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libarchive/libarchive.hash | 5 ++---
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index f31b693c67..21fe7eaa25 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,5 +1,4 @@
> -# Locally computed after verifying the signature from
> -# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
> -sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
> +From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
> +sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
>  # Locally computed:
>  sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 8568847493..083e913033 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.8.2
> +LIBARCHIVE_VERSION = 3.8.4
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
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
