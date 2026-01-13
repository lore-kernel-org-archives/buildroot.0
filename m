Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D98D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A49C40E78;
	Tue, 13 Jan 2026 19:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiI6UJX0te91; Tue, 13 Jan 2026 19:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4273040E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333714;
	bh=YOu7DiDbnDZKGpgW70kWRQ+v6KPSequvB72tuFa8M0Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MnXqPqu+QwDK39pG/qsn0aRTpUrbO1BtG61irRbNHHQ3IbOAwZMfP+YQrhMopANVS
	 MziaFb8Yz6Q1Bmmx2/PeUmq+9Ion7Yisw43iv/UCeBcm9fmdSGuxiqva+1S89be1Eo
	 Cd/1qtn8Wu653KQTcUv2NnNsZO1AXEdYOz13WuOq8pzFbOhcEu0IqIzyGkTL17kfO3
	 oWx/QS5iH5A7CMyJKfbOsI1mmMVQnThWHEqbqEy7n39N5jAAys1xYS4d8/c0PIl+2y
	 XxxB0b9x1ejNzb2UF6enA+ZGaIS9Ske/SSpUPZ12m5nBbSr4RZtViwVIAejo0so9UQ
	 Oo1bOoQcJZ8zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4273040E7A;
	Tue, 13 Jan 2026 19:48:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7C8B231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E10840376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WztCPGnnzAEu for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8184F40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8184F40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8184F40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1A8EB97A863; Tue, 13 Jan 2026 20:48:26 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:25 +0100
Message-ID: <20260113194825.100822-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=v12H3nHLvsF2HDTBEmKXZzmOjU/8DR/NkcFefEUN7Wk=;
 b=ZkNa0wDIA/KrVPPzj7DKaEnuV3S5ncJr7PoJbu2liRQpDxCIq6GlvInK6HRr1A948ez47q
 +HWB5r6WVBFJYKfK5f8np0Vfnse4haG7w5us7nrl4ygbK0pgVu9u5hVej7OhAz0WPl90AA
 jNKOISmDUjNiSjIX9BTeekc8Q1IQ9hYFKRjtFd/wdY2oGWQeabYsXFYF03FWZTxmCF4bNq
 O17EW0ikRgYN3YUh4pQFBYZxJ40pvPa8n0X2TrzDJRj9U+bALCk2jbReq+hlsegFISz0JY
 /4cTE4+OvrfR6zdbb5GeDpcRe+xD5v2zvznYUhAdeEV36KpvRzbTVuAjOew1ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZkNa0wDI
Subject: Re: [Buildroot] [PATCH 01/11] package/mender-update-modules: fix
 kernel header dependency
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
> Commit f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman:
> raise kernel header requirement to v4.14") raised the kernel headers
> dependency of podman from 3.17 to 4.14, but forgot to propagate this
> change to the mender-update-modules podman option, causing the
> following kconfig warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PODMAN
>   Depends on [n]: BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
> 
> Fix this by properly propagating the dependency.
> 
> Fixes: f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman: raise kernel header requirement to v4.14")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  package/mender-update-modules/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index e71309c3d6..1158bb42b2 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -132,7 +132,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # podman
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
>  	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
>  	depends on BR2_USE_WCHAR  # podman
>  	select BR2_PACKAGE_JQ # runtime
> @@ -150,13 +150,13 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
>  
> -comment "podman support needs a toolchain w/ headers >= 3.17, threads, wchar"
> +comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_USE_WCHAR
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
