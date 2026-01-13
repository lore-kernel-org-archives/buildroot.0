Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71131D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A9884464;
	Tue, 13 Jan 2026 19:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De4DBj_i4CUr; Tue, 13 Jan 2026 19:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55DDC84491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333711;
	bh=n+kvOXOb+ee+NkU8+2ma85yPJM0Vb2Gh9SnXJEGT4nM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KGP885Gf55y6t8xpZCsutYaBQmsT01ALhP4AwCtjYPKkFzQJjdVgzGflb0wM3/fQ5
	 nmUv8UDZDaxco30+taUlCgL6ldos+Afqz4L3zuTaYUN2bDdlcjSL32G/P27qIFLYJB
	 aghcE5Se6bm7x9+PbUur7XroclZ33ywvvJqleJP0uEK9yPAleJBs898qUsEoHUtk05
	 km9IxInmg79mckQN922OgwQ/7r4zTJg+sbglsaYu0enf/prDCFt4AgAAvwKra4cF48
	 EgPVEpvQBwUgqangzg3o7PO/GWyAqKc6Ryr4lV7m3um7QFGYb1ckqQmCsnUltWiA9V
	 VGx2zpbvDkD0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DDC84491;
	Tue, 13 Jan 2026 19:48:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 587BE1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4952D40376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyNlfGb6mNaC for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2647440373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2647440373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2647440373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5023BB97A863; Tue, 13 Jan 2026 20:48:24 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:22 +0100
Message-ID: <20260113194822.100773-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-7-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-7-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333704; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=MEK0iQJpyfZkmc74i1izaPX8xa/9+dKIVdq3vn/gBd4=;
 b=ZSvkwwW1O1hjXI1WHprTFTOJBZKj2B+Qhy1nS1zMGb0344nXJChYD9UYPcqeCpZaVD8lce
 ZMcqgrkx90BY8h640jttwLd1xyklFKmQUC9K6BRQr8g50tRYG3yb/mptdP5R5JbZPSjrNe
 I8/eDfGyzQYBxiATVymjbcHS2c1Yt9YWpRI5rVf032kgbXX2OdzYvwSDnv1gEjQHo587tk
 d2Rfj9xbEH9LpBQ3ZrU8oF86FQ7hJlBWUs5BJvjlgYw1sWgiTEDTnmODCyB2dv30qqgSb/
 G4w6J8TSQJpP3legDR+pi8T9lMFeLclHfSEzTnKAzcNs9JE4RzFErEnowlZ8EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZSvkwwW1
Subject: Re: [Buildroot] [PATCH 07/11] package/mender-update-modules: fix
 dependencies of BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
> Since this option was introduced in commit
> a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules:
> new package"), its dependencies have been incorrect. It selects
> BR2_PACKAGE_PYTHON3 without replicating all its dependencies, so we
> fix that.
> 
> Also, it did have the !BR2_STATIC_LIBS dependency propagated, but not
> mentioned in the Config.in comment, so we fix that as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  package/mender-update-modules/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index 1158bb42b2..88e0805976 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -173,6 +173,8 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
>  
>  config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
>  	bool "rootfs version check"
> +	depends on BR2_USE_WCHAR # python3
> +	depends on BR2_USE_MMU # python3
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
>  	depends on !BR2_STATIC_LIBS # python3
>  	select BR2_PACKAGE_PYTHON3 # runtime
> @@ -195,8 +197,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
>  
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/rootfs-version-check
>  
> -comment "rootfs version check needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +comment "rootfs version check needs a toolchain w/ threads, dynamic library, wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
>  	bool "rpm"
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
