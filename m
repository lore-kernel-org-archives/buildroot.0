Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7C3CCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB3580ACE;
	Mon, 19 Jan 2026 10:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYy5oKm3gyPz; Mon, 19 Jan 2026 10:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 820F58083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817383;
	bh=fGzZVlaSN7ZGjYS+lZ+yzpDR5NDf3urBFFvNpnmSJf0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lUxWblMGg6KkflOwJdUbUKoa+F9u0QI66ChxKZk3Rhrlp19SIAnSaqJc+YIC4DpHr
	 TZqXT0TP0tU+kAKLjJctYRDTTgDRvot/LwtGGDxsHyAk11hmGFzyrk6eYrRJ6rC4e9
	 9gUSG9v4EpqODRKff/UQPR8iXdz7vQPi2H83vzXXvdfvQqIY7FvoLnQMpaiNIoB6xl
	 ftj+bkc8middKWkWA4C1BFA7vZ7SaFeo3i3HXka9jAPIZl3KPsZPsBG4q+jpvVsF2g
	 9kvjEBt7J5vBk4J5WD4q4N2HH4U/YR+E41ngZk6c4ZE5yX+Zu1MiNLcFAKIIl4bwHB
	 jcGYwnaYJztzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820F58083A;
	Mon, 19 Jan 2026 10:09:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B88BE160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EA4807EF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIXn7DYKrhhp for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 070ED80786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070ED80786
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070ED80786
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FF26B97A96A; Mon, 19 Jan 2026 11:09:31 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:30 +0100
Message-ID: <20260119100930.13144-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110180754.2248793-1-bernd@kuhls.net>
References: <20260110180754.2248793-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817371; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=BiLUsVsvKo+LG/rV+XeM8yCLn/3Ekok53wD8FEbUqiY=;
 b=pBfsq8nTszixmHP8NVojPkA4Iq6t5IUSEeO2I62EsD+a2Y7EjfmWkqbfmbL4kDJInXcudI
 Mvxisj0hVAxW3+n9oX9NBC1Dn8PXNBCh/lnqIJVeHJx8Wdy5dX8Mpoc1ypbH9ac6/f6DuC
 4UZuzWH7z1hB9N7S7Unz8F4fhLj48jSdLsfGap5RKcPsjJPh9aeXhoQ1AV8ZTuLZX4Awsi
 9XQbxjU3iLncaWa0H7vxUx1fhrva8nJ98tK++L9s/jquY+AB89F+FhhbONY7ojGosNP77F
 EbK12O96dJ6+xQ/GDp852eLY1Mz3JgLaoR/x81+V36y4aq3a4UZPC3mj9gb5yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pBfsq8nT
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: bump version to
 3.8.5
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
> https://github.com/libarchive/libarchive/releases/tag/v3.8.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libarchive/libarchive.hash | 6 +++---
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index 1a61d254f7..db7ed95bd9 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
> +# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
>  # After verifying the pgp signature from:
> -# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
> -sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
> +# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
> +sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
>  # Locally computed:
>  sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 083e913033..f3e90e5910 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.8.4
> +LIBARCHIVE_VERSION = 3.8.5
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
