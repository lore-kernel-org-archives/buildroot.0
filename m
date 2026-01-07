Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB871D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80A140AC8;
	Wed,  7 Jan 2026 17:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJYgyvvlxMRq; Wed,  7 Jan 2026 17:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C5540D01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808190;
	bh=X4al6ebyGc0VCWCgms2dicoFk0jARml0yQWU7+Y/5SY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MG/77bJpcwfKCBa9U6seGgEDqqFLNVZIzjJGuQlKZZKY7+XKNQnFbCkvkpO+uRyks
	 QX0eeaF2K139C8LCVAsZUZExJINxMm6uAir0k6aF6VxxeKpfQaZVEvyttzQnrWig7X
	 oLgXz+Wu8cUkO8MrybyMt9aGeogNIj8p6p9lvlyFXF+Wl1v43DqQ+980B87TRdrwzB
	 y0CjJN5yPSJtHCdaX21qTMGq7BgB6NqaMMxlyjyxtCzwgmHEncvjSYH+59gxR1FF9p
	 Fu1RZV9kUofdVhi7FwEWTeQrOfOzi8pwuVGcuduAYJnDSbbnJB0vvP/Sr2bK4Yqaxm
	 Pr01Y1yUAgKHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C5540D01;
	Wed,  7 Jan 2026 17:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D5125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D27308233C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT8v366zSgXz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC82082337
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC82082337
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC82082337
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 17:49:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C30A3B97A192; Wed,  7 Jan 2026 18:49:45 +0100 (CET)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@busybox.net
Date: Wed,  7 Jan 2026 18:49:43 +0100
Message-ID: <20260107174943.225509-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220083916.348329-1-francois.perrad@gadz.org>
References: <20251220083916.348329-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808185; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=RkDd+Avflf0M1SREVQpuyg40Eu+uDFkM3SiMLTvPhYw=;
 b=X8IA0yHlmt6cVx9hOLY/OhNsucdI1BA7vr4Tmf7MBiKK4HLqA1srFMayzzJsSMlo+OKR0q
 DakIsi+RvK3RTnsHZmk3V7uqnEt0IrR1froWuUmtPzi76cCG2F099nqvTmdQJr3mVjTIGK
 nAP6UbA686ACDXGsc4dq5/niM1gtJdaKHb6LPzr1SuhYk/RJdMCUZ9wBmhqXz1DCK3ogwr
 2U5D0sVZChqrShe9zCvDKfJk6DVFbTcU7dhzqpd+enM/TKBelaT4GNtX+1WFZyZVD9b8Qw
 +ijKR8PKWde6hlsKAAePIONAIv0LrP2A3ceY0tw1l8Tj77/u3BXLlVCqMUFVBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=X8IA0yHl
Subject: Re: [Buildroot] [PATCH] package/linenoise: security bump to version
 e26268de5e56bfaad773786471844578fe9f7f4b
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
> fix CVE-2025-9810: TOCTOU  in linenoiseHistorySave
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/linenoise/linenoise.hash | 2 +-
>  package/linenoise/linenoise.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
> index 9a1436eb8..3f82ba0ff 100644
> --- a/package/linenoise/linenoise.hash
> +++ b/package/linenoise/linenoise.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
> +sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
>  sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
> diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
> index fd2c4c703..05f8aa484 100644
> --- a/package/linenoise/linenoise.mk
> +++ b/package/linenoise/linenoise.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
> +LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
>  LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
>  LINENOISE_LICENSE = BSD-2-Clause
>  LINENOISE_LICENSE_FILES = LICENSE
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
