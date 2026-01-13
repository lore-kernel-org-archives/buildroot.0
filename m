Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428C4D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169198436A;
	Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5_B_WUrymB6; Tue, 13 Jan 2026 19:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E6184367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333642;
	bh=i6wMN0KGj0jiuXh2rPTLBqdvNFQfTY/Siksf5iHsjGA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZVaCG7BK+jc3IvVj0f3aphGl3bJattsp1pKVxtrNevWZ1AT3d4hUo+PxKmRItCsdC
	 h8hKcUU0gMxC1ge8iaq11OsuehMyqForZbDam1+YSDV0fD51pGQrILk7cw1a3Y2m6z
	 i+Z5/eTOJq3q6wpOLcP+UABy0D0wH1IX0ELfpvtx6In1FzlRxhY5IQFUhLYBSxEg2u
	 EEK6a+MyUG7sIyCkjuH2p/sza4f/CMQdJxadFX1okfxQ+cmT1LRm9QIOwAMoECHxXh
	 R348y3h62brt7z05NiIPZT2QW/whIIvZ4TDryyDzkyWeJRqrdkXhJxcyeJwVyP9nwa
	 BoPZn2xB5xt5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E6184367;
	Tue, 13 Jan 2026 19:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A5E1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7693C84359
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXlgQKsGOpRY for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 753D184342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 753D184342
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 753D184342
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9CAA1B97A885; Tue, 13 Jan 2026 20:47:17 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:16 +0100
Message-ID: <20260113194716.99658-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-5-thomas.perale@mind.be>
References: <20251230081917.18676-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333637; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hHULYs1IiKyj9oSSActQWR7RtSkalole3cE/nHExlv8=;
 b=gpBHXEaa78hu5yXwL9xW+UNIaY+vxL+rta6wgGXSKy+CxUUYpkXCY7STq6GvKS9movqiV+
 FMrgRbBOs0yrUUnrty0w1o6FXOQwoVHJQRBGlFM2qnm62oEdO3uPHHkzA/mK21e7CppQlA
 KLTkts5BPvbyyOqgeSFBYwD3UziXU+EgwrOQdNROnuob9o5g0o//vMWxRF5FPTRYITUq+N
 5Hj2jG0Xovs2cZD/t+uzudLhbL5yod0WMt9tgR5YqNOUPuM5E5aJXY/bjqE702GsTHRWr6
 rY8Ams9tdZ/YOCAsVEEhj6yccIxnc//PyX+q55h6UO7OgfSQ4ljxKpPTMqYVBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gpBHXEaa
Subject: Re: [Buildroot] [PATCH v2 04/15] package/tiff: remove stale
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
> The Buildroot commit [1] introduced this IGNORE_CVES entry that was due
> to a bad NVD entry.
> 
> The NVD database has now fixed the annotation [2] and it can be removed.
> 
> [1] 740412aefc package/tiff: ignore CVE-2025-8851
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-8851
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/tiff/tiff.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index 32bebcf95f..e64a6baf83 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -13,9 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
>  TIFF_CPE_ID_PRODUCT = libtiff
>  TIFF_INSTALL_STAGING = YES
>  
> -# Fixed in 4.7.0
> -TIFF_IGNORE_CVES += CVE-2025-8851
> -
>  # webp has a (optional) dependency on tiff, so we can't have webp
>  # support in tiff, or that would create a circular dependency.
>  TIFF_CONF_OPTS = \
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
