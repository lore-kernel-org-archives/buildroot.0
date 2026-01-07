Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE51D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E2240CF8;
	Wed,  7 Jan 2026 17:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6hu1-mVIjTd; Wed,  7 Jan 2026 17:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDA440D61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808168;
	bh=0dlp+wPGKjim9IIQO5fap8KIPiL6kN0KTeNXP9wg8ew=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DdrBDevDRMAJpZMxzxALeJok2kjd5BJY3E26kaWLvDAwgzqW3RXPvqt05tbr20HTd
	 O3GZgSeLNURszgWJ2G7T/47qWdPP6fpAgAHnzuR9G9+pi8cLqsNtKl1fsvYcUIvqmr
	 2noB/yL9XolKp07yVjuKq1vsGJbclWzq7VtP+w8E+LpuZrczmwnXfo37XL92rwvI9E
	 Tgw0UKlkn8b6bBDvTJJQwCBmATmuEqKQw7Pm1xFOZoamlw/8P/gD7gRsN6ikZYZhqx
	 ofhvczNoZeHuT1sTLpARvQG71ev43cbkrqrcq1u+svq/OUQLZc8dYAMeL2+7mfxIaZ
	 OyRB/HpI+OHfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBDA440D61;
	Wed,  7 Jan 2026 17:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9B325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16F440D0E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddw4NrbcSW9j for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2939C40D4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2939C40D4C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2939C40D4C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 48DB2B97A192; Wed,  7 Jan 2026 18:49:24 +0100 (CET)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:22 +0100
Message-ID: <20260107174922.225211-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217110219.64233-1-thomas@devoogdt.com>
References: <20251217110219.64233-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808164; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=YM9kISNxOAIsIdHyIWW929eV6hrNdzCX8u9YLBKEqkw=;
 b=j/nGGYhYBv4bqcQQuRzxgcosu7Tlvz13luHi/LPz6C4nMvAcyz7VWx70HynQc28QaDEi/I
 KblNesxOHY13uc5ZKS+bDj2ScvusyQx1bGstbGHS5wXeAc27pclGcZmpehnHjQBqHozCCG
 jeHkwb+NBiRh3G43aIP2ZUt1pedEeq5H6Nrr8EE2sAjORsWVGedS+5emZ+6cPocgdhduGk
 nXXG6RiAO3BdlayFlseulKiBsurEKhb+pbIT+A0H9lmHqHr9oPOkC8f4GclqPHCnxzJ2FI
 Epangg2ACplDO8tP4czW6ehBsJUDJNInOoU5dgZ7UoiQFLi5ee9mLbGKdjTHKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=j/nGGYhY
Subject: Re: [Buildroot] [PATCH] package/libfcgi: security bump to 2.4.7
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
> This is a security bump to fix CVE-2025-23016.
> 
> See https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libfcgi/libfcgi.hash | 2 +-
>  package/libfcgi/libfcgi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
> index 348b0b6867c..be9e3e8db96 100644
> --- a/package/libfcgi/libfcgi.hash
> +++ b/package/libfcgi/libfcgi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
> +sha256  e41ddc3a473b555bdc0cbd80703dcb1f4610c1a7700d3b9d3d0c14a416e1074b  libfcgi-2.4.7.tar.gz
>  sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
> diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
> index e0ef6da55c8..da84ba6297b 100644
> --- a/package/libfcgi/libfcgi.mk
> +++ b/package/libfcgi/libfcgi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFCGI_VERSION = 2.4.6
> +LIBFCGI_VERSION = 2.4.7
>  LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
>  LIBFCGI_LICENSE = OML
>  LIBFCGI_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
