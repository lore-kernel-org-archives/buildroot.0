Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840ED2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0928445A;
	Tue, 13 Jan 2026 19:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YGQvxu3AOn9; Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22ED084449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333698;
	bh=5hhO85ZmBcN6oMB302INpOtguyGTn4PYAc9Yy87AOXU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ARGeQ6w88Sdd5TUyrXruq8GVLGS3lekgGTT8vb6xEDvVZdup5FFb/nJfYGCjnksel
	 LCI7ZV+yVa9N4TTDA8mQSI+Of97ivj3ARWSFYmAMmPRL3iHp624MXge5Fu9iGOgKVP
	 hghGI2hVXkZ+XhDGxf7KLLDorHxNSgs30lnsnyFAc+/872AY3u3Nh9YR4CmDCb7c5C
	 c6/bh7+D2J8Gpo6gBuO/oLaU03iy/lGafiMvYJ50jHOWV3LtKnJghYjZ1F6WkbHhwx
	 Rj0dL+RD8o/pcRZtXphFlMTBRoKcbmkmCdvyIR+cziYBJy85ALMrlGxsN+cF83WjBZ
	 /183ReOHm92Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22ED084449;
	Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7951C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DD140E57
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRhpe0tJObqR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D28140E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D28140E5D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D28140E5D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94C8BB97A863; Tue, 13 Jan 2026 20:48:14 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:13 +0100
Message-ID: <20260113194813.100564-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-13-thomas.perale@mind.be>
References: <20251230081917.18676-13-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333694; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Ybh71y2w3IrTH1EZPrSa6L1lwc7aSYYISL00W5rfOKc=;
 b=EWXASLYC5IKAsNJDvSQt73qH+bjWEf9oRnzSDOPtq2Ew4JWluPF56kuNEjP5uT14ccYQe8
 9rdbu6WeYsiHyrwDgiLbHRMkx3lqeWdTddpzaqknmoFsJHCO0CTkmW1818QVFFi0g1O55s
 C5ImwYGHOVeZYJBJEI2g/JpzGev3bOx3K+TESVrNecD8qDnLtAIpFKpYzyaJlsjMbqO+WM
 KxUukA9QPq5lIhLULUNI4S9gkHZsO0+BteoJJsBMP2PgF7dWJwL/gZaZNkIrcGtDVuYUOB
 pwixf5xfQn846zAwdg9nwqVF1EqqQuqh4/ZkeM+0nRIQ+EmCfHY1PnKJk0Qz0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EWXASLYC
Subject: Re: [Buildroot] [PATCH v2 12/15] package/glibc: remove stale
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
> The IGNORE_CVES entries introduced in [1] no longer match to the glibc
> package following the bump to v2.42 in [2]. The version boundaries
> specified on the NVD DB are specific to 2.40 & 2.41.
> 
> The CVE-2025-8058 though don't have any information available on the NVD
> DB and will remain on the IGNORE_CVES then.
> 
> [1] feaf53585a package/glibc: security bump to version 2.41-70
> [2] fb6256c0ef package/{glibc, localdef}: bump to version 2.42
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/glibc/glibc.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 924274a7d6..9c3ff7124e 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -25,12 +25,6 @@ GLIBC_CPE_ID_VENDOR = gnu
>  # allow proper matching with the CPE database.
>  GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
>  
> -# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
> -GLIBC_IGNORE_CVES += CVE-2025-5745
> -
> -# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
> -GLIBC_IGNORE_CVES += CVE-2025-5702
> -
>  # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
>  GLIBC_IGNORE_CVES += CVE-2025-8058
>  
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
