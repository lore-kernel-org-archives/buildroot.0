Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E30D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0E2F40DE8;
	Tue, 13 Jan 2026 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIeNHVgpK-Kb; Tue, 13 Jan 2026 19:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A970B40DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333632;
	bh=5asBSM/dE1jZLgGzDVBllXpz9QjXGBCtP+AaPaZrXqw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AdGB9FrKUwP6u0w31r5E12xwsXM5ZKkmm3Ynrxe1SZkcrIPgIN4mID8wYMW9lu70m
	 f0OLoZ544sOsTrCqiqPJYShjX0JXkI1GvvSLDb/eEv7RkmkUMEODRZauYADd2Nc/Ub
	 6m/kO8Lr34XYGTfKi2yv9bdCyPvyBQdVpkxyW/5wqwa1qYRYZOOsBK1YkTOzpckuO/
	 aAzuQQmTWJLWPff/03iA6s64T0dM77d8jxV4Jvx3UaGIu8J8I/S7lt9/GsM0lEYHHs
	 QFZwE/8Lh+DbxUwuMm2iJySTu9PvC/VK6HTCgg8UgH++ihEgoxhGl3J/ZkxqjaNQBy
	 ytnPYWcwUu2wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A970B40DDD;
	Tue, 13 Jan 2026 19:47:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3443E1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F63B84333
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYlZ5tfPk727 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04F4984325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F4984325
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04F4984325
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2727DB97A863; Tue, 13 Jan 2026 20:47:08 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:06 +0100
Message-ID: <20260113194706.99467-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-8-thomas.perale@mind.be>
References: <20251230081917.18676-8-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333628; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qrrG1Jjjag6ipuq5ljkBq4sQR3bXIFRF72rfoyN2PQI=;
 b=C4dN1Z5VOgg78fEJ0/+SKUStvb/NmoUcY9KNuEQ+GBQ404N9JjMQxD6nmOmR3PGrk2Sgvf
 ErqtG7KbkasQTY7H6awkCAa2wN/VCxbv9k5yuuEMLC7NHzdOT3+DoCXvKfy7MJcqd566YB
 bqFJzEWbSD1nXDDCouOLubAfuDIrcLZNRxhqmFHqugdo6eMJtFIGgESf7M3koM88BB71Ww
 8vXNS74FstjYtHriG/hVt6Ttdk2WOm9WNaBbwhax3HC2D4UV6FuoLPcUstXMpdf2zaYm6G
 G06rLMYCsHeuakT0y6ygYW2WNHVB2L3gC37bSXsEVuGLnOGXv5cdrzHXMRPNaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=C4dN1Z5V
Subject: Re: [Buildroot] [PATCH v2 07/15] package/pixman: remove stale
 IGNORE_CVES
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
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> The CVE-2023-37769 is then no longer matched to the pixman package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/pixman/pixman.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 63d9ccd10b..d02bb0a260 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -26,12 +26,6 @@ PIXMAN_CONF_OPTS = \
>  	-Dlibpng=disabled \
>  	-Dtests=disabled
>  
> -# Affects only tests, and we don't build tests.
> -# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
> -# "not sure why NVD keeps assigning CVEs like this. This is just a test
> -# executable".
> -PIXMAN_IGNORE_CVES += CVE-2023-37769
> -
>  ifeq ($(BR2_X86_CPU_HAS_MMX),y)
>  PIXMAN_CONF_OPTS += -Dmmx=enabled
>  else
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
