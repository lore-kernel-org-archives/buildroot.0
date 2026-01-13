Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A29D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB5F40DCE;
	Tue, 13 Jan 2026 19:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XepREvIAmyAA; Tue, 13 Jan 2026 19:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70FEB40DCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333624;
	bh=mIwg5JkbBlBihtC/gezQ080N64xvVgRlyiDaklVTD6M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bDNxPnrbxRl49JwV2HCebcTYYLjv7xhQscRu5V4SQqwn+ccDj7nPuE3Wf9iaXrrrR
	 /QAgCUJS0I+mleU1uYyFgvdBCfPz/ZsFMVTPjMmYl/zT6aLY15aRi/tsgEgBCWwniP
	 YZhcfneEtFpg++mwBJlPWF03Wec+PLHy+B9HkUreMCiwhHhhp6CzMNJstTF7/e3mNP
	 Y1w0mmuPLv5KK3h2waQ4Wq4BaUw1RL9X9/sOhAWj1p6S3yt/E+al8e4QRY1BoIJm3x
	 s3CY6Ym8KxqFvi0sTkBWUupskO7Esuod/sMeW7tM8WiW7yvlenzP8zjaa9KR60r7OQ
	 4aTs7jxuZeeqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FEB40DCF;
	Tue, 13 Jan 2026 19:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE627231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44E5842E9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVV4rrYhQM63 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C83BA842E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83BA842E8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C83BA842E8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAA9FB97A863; Tue, 13 Jan 2026 20:47:00 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:59 +0100
Message-ID: <20260113194659.99288-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-10-thomas.perale@mind.be>
References: <20251230081917.18676-10-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333621; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=RY35rNq0M6Qw4T4r5PEdKmMt1BHkwW4NTTiJqVMW9Ws=;
 b=MmC3m3KyCWosv6KySGa4kxNb37/D5NztrkrlLcHJ/5yIdSWYPWsmJEs3bDPlNmylFmgeki
 CQqSSVs1vYh7bv/zEqqIJszrngFVC73m6H+otIMng46s2lTwJmeqmvGlvqzadpXm+haWDO
 Mvu1obRm2UDhExGTY7gvAmkSpXLmknXKYFMBOvmK47XuDX5d4VoJOUj37rh32W22IMhuTy
 Erdf0ymxOHqi2vppRJZdITgTyzMeBVHBmsHo9rG/X+QNonf3ZMK4AqtKNh+L+E9MggfsDt
 DF3AiN/gfiEh2awB+9hbcKam1+CNGuQHF3UfSTEJpGm5ktMniQh4+Kd6/8Oh1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MmC3m3Ky
Subject: Re: [Buildroot] [PATCH v2 09/15] package/libcurl: remove stale
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
> The CVE-2024-32928 introduced in [2] is then no longer matched to the
> libcurl package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> [2] 7e739d49b2 package/libcurl: ignore CVE-2024-32928
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 9e32c38d97..6924631735 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -25,10 +25,6 @@ LIBCURL_CONF_OPTS = \
>  	--disable-ldap \
>  	--disable-ldaps
>  
> -# Only affects Nest products.
> -# https://nvd.nist.gov/vuln/detail/CVE-2024-32928
> -LIBCURL_IGNORE_CVES += CVE-2024-32928
> -
>  # threaded resolver cannot be used with c-ares
>  # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
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
