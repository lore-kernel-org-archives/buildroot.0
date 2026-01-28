Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC4D3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D8A240C85;
	Wed, 28 Jan 2026 17:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECb6tILO1qbB; Wed, 28 Jan 2026 17:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0BA40C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621090;
	bh=NW23ijyfTk76cqJ3TFtrWTXrsBUQlgQd/59OSWehhbQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FDwcSkmfXHx6iZcs39thVc1auJ8J9XnWtOReEBZPIdSuGsrTHri7CNEetxH7EzSH5
	 qKsP6uXzOJy4laSUW1X3C7Vuut5/VE9PQaU1w4P75hrjtMNrKcxmmGxVOH+e5mBA2u
	 dT0QPlf/QRU9DRmFEBFH0bEup8bMUx6/ombf/nWQkVom6URZYW77tiDKwQNkM7xBVb
	 J93kXXXXT2AqpHVBywePVEfrKoYCDJiu6TRHeIyMMwZNGWsYIVWstbsqPYmj9hmyIk
	 hv/9pN18346giR78drCdAO+62rsbsw3UjrOZrUmg9YlYdOoAA7ptixUykuCS1v4PIS
	 WAndMvx8yBVEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0BA40C2E;
	Wed, 28 Jan 2026 17:24:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A15118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A618360784
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vks7kSgyu4G for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B71B60781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B71B60781
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B71B60781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FDC4B97AB22; Wed, 28 Jan 2026 18:24:33 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:32 +0100
Message-ID: <20260128172432.343213-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115210246.2892456-1-bernd@kuhls.net>
References: <20260115210246.2892456-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621073; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=N2TRB+hAXHv58o4tiiswU19N6DjeO8lLNkv1t9wZKvM=;
 b=B9nCG4pEK6YVBz1Lz1ymIKl2m+kU/ROm3zO3Lyt++PpH4rfzN2FQHXjnAkoCb4ZoiHTwEq
 WjN3K9e9vb0TRY7AZFyJ+vLXp1YxHuyn50c34NtlIoM0OFN+FBkjfK27Is9J/ZPIKMn4jG
 gcZ2ZaH388fagqxZ0C3SjuoR0Ksm84t68pcHD0f6MMNc4Z6XG69oJDEQA8ZejuloEoJLMW
 2RmqtpUWQIfxXjyWC4HGL+AzITuVSaS3wx1kkndYkCPgGYrW3TK0MnZhEuJk3yA36+v7+I
 ufVSq5IpTr/hQPeCLJfp5x0TRavXW2dGhOXKPYf0k3enuZ71eVB0elxvwm7e9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=B9nCG4pE
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump version
 to 1.6.54
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
> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.54/ANNOUNCE
> 
> * Fixed CVE-2026-22695 (medium severity):
>   Heap buffer over-read in `png_image_read_direct_scaled.
>   (Reported and fixed by Petr Simecek.)
> * Fixed CVE-2026-22801 (medium severity):
>   Integer truncation causing heap buffer over-read in `png_image_write_*`
> 
> Updated license hash due to copyright year bump:
> https://github.com/pnggroup/libpng/commit/9e4e247afbe809bac24bf70f531b23427e3f20ec
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libpng/libpng.hash | 8 ++++----
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 1e57e1dc33..4cf8718cc6 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
> -sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
> +sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
>  # Locally computed:
> -sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
> -sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
> +sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
> +sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 7b66f17bbf..d052fa7862 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.53
> +LIBPNG_VERSION = 1.6.54
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
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
