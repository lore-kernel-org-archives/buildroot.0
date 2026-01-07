Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2584D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7457B4086F;
	Wed,  7 Jan 2026 17:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32InWfTYn7Ee; Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8278E40975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808494;
	bh=Ax/G/MBD2de8jmMgZ7GY9OR20M21dXhsIscanlhhVg4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OeqrK37eZ5Maz6f/nBePauptinY85dQ2lH7SMbmJUOpD+gJCs8rXTYRocKh5VbVxT
	 H3edxZXeCPS0oZm4CpxDqYfJ0OoFJych9Dq0smpCN27LEsvMBttbNSrZLSXq47t00E
	 DKgGsSlPJEgY/V/Hof1OMNJ7M6nGUzJrpZIXjaKOGaVQO72B21p2W5eCcwktU3SGIM
	 pKInNm8YGvk3Sl0CBrsRpNyr/GmIsmfl3mQyTcrRZO9ajIAEIzCs2bBouo8TBocRDr
	 GISDSJI2JujxDlzqohiar3N1gz/xSYKDr9qToh1W0W+oMGqmtfeCRNgZ1ayjfoeIhN
	 iIDC82rzIIRjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8278E40975;
	Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2566325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CCF440975
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntlCB1T_yU1I for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2EA34086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EA34086F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2EA34086F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7F67B97A704; Wed,  7 Jan 2026 18:54:50 +0100 (CET)
To: yann.morin@orange.com
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:25 +0100
Message-ID: <20260107175425.229461-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <91327a6c3076c7ac166f5b097c08e0e90e7cb438.1764572247.git.yann.morin@orange.com>
References: <91327a6c3076c7ac166f5b097c08e0e90e7cb438.1764572247.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808491; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=TNxlCr0fFM/oCoNKONYn9v/5w8el0lSDI4O1c4n57l0=;
 b=cJMThwptTSBWghLCXAG4aeytlqmKdLI3wMUFr3yEuoouvmwxO6DbzhvyLhj454tFPd6yZ4
 Rc9TfTKisMgnTJMBLNdL/2L1JLio2+T5LY//J7rEz45+iSmJt6UYCznJcyowcTDmtgqbOs
 9hMBHcI/XCChu1jPcEXBTRHWQWZTzLwb+ry40mblci9h0Xk2CxzwfdJxRTPhzuG6ygSiHS
 ZsC60kPkzsT7eg54JO6X0QCKVG5kx7CUP81DcE8d7DKGtWmf2RlbrVF+FGVimlxx+/Kmw+
 5w0UnHP8Gi/XPvZZANrlajs9osugQrB1x4FKgNuku/LHrrYcF4gOGBxwu99w9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cJMThwpt
Subject: Re: [Buildroot] [PATCH] package/skopeo: needs NPTL
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
> So far, skopeo inherited the thread dependency from its runtime
> dependencies. However, skopeo uses pthread_getattr_np(3), which
> is only available with NPTL on uClibc. glibc and musl have had
> it for ages (and only implement NPTL anyway).
> 
> Fixes: https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.11.x. Thanks

> ---
>  package/skopeo/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
> index 0de9b16047..b0229873d4 100644
> --- a/package/skopeo/Config.in
> +++ b/package/skopeo/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_SKOPEO
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
> -	depends on BR2_TOOLCHAIN_HAS_THREADS  # btrfs-progs, lvm2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS  # lvm2
>  	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_BTRFS_PROGS
> @@ -17,10 +17,10 @@ config BR2_PACKAGE_SKOPEO
>  
>  	  https://github.com/containers/skopeo
>  
> -comment "skopeo needs a toolchain w/ threads, sahred libs"
> +comment "skopeo needs a toolchain w/ NPTL, sahred libs"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| BR2_STATIC_LIBS
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
