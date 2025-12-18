Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DFDD6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF2840402;
	Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdN9qtanGh9h; Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02286410A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075830;
	bh=unFxzISxY+4TqDKdTKx39MCGs0LCfibrlibZbOmF7P4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CGLERxkei9k5Wj8YX9juBqnxbjapmRcFwn4Jd+FOxQRbMKJtloIolDNK7r7jMpZt4
	 YlCJtgvcZqC23DpRDdEm6K2qMdEkjjMmA7qjXw5m920b5UI1AiL9WX/4j+VVZbOAzc
	 3RmDq819fFptbhAgK6WlZ710+YUnbQ5ouIfaBkOHG2jtIXZo8vtaMunL0AptjLX1y3
	 E5M98oyg0fhW4OhKbXSyuRmt09BW0zx6/L5nP4RgUpIj0aKI2cv+fNHCN/V32B+6WM
	 BHiehpXyxm/PvekUI4++8vvHhcfj2QWHyKY6EzhzIrUhOctI7kDr3pvLZoNBBfAdMZ
	 Dq7/z0HKZX+NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02286410A5;
	Thu, 18 Dec 2025 16:37:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 009AF1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E70AE40CB0
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmnZOWmf15Vg for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C70AF40077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70AF40077
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C70AF40077
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A4C5B97A297; Thu, 18 Dec 2025 17:37:04 +0100 (CET)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:02 +0100
Message-ID: <20251218163702.379150-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209122541.849522-1-buildroot@heine.tech>
References: <20251209122541.849522-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075824; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=vJwmiLXDsI9mgWugZuAtgkbvedPCMBkyz5YL7B9X5RM=;
 b=O8EiPfVccJ/v6ADqtQ9l+AA4N82+jfnnE6FK0bRL5QAqC/TF9ILjUetIJwxz8g8toxt3Vh
 bFn0zfSPPOgWyL/Rj40HAeSDpJ//t7sNDEy9yt1cmz/pStY9DEzc+sg1LBwkCdMZT8FuZf
 wfJPc4KZMsaHL+1yFn+q1sgId+1l+9/6JT4pnba3sBIKp+2wwrN7oXRiR9Q39xmyX3kKB3
 4oqQM5NYQRMnjS6WlLDtyVkfA5kNxEdniimtmTmWK9dKXWDFkyS9mGJDJYe/WuTD7gSpEw
 j99zXbbNZzXu4PFZ47JdH/u6UZrJvCeJWtuBMMVWwUYH473Igl+A/WrNlazKrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=O8EiPfVc
Subject: Re: [Buildroot] [PATCH] package/grpc: remove BUILD_CSHARP_EXT option
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
> the CSharp Extension was removed in grcp 1.47.0 [0]
> and the option in the CMakeLists was dropped in 1.58.0 [1].
> So remove this option for host-grpc as well.
> 
> Fixes:
>   CMake Warning:
>     Manually-specified variables were not used by the project:
> 
>       gRPC_BUILD_CSHARP_EXT
> 
> [0] https://github.com/grpc/grpc/releases/tag/v1.47.0
> [1] https://github.com/grpc/grpc/commit/3a2bd221ef1166ae7d7bba3f700ff92ce3df5e86
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/grpc/grpc.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 39be4f583f..d8681f33ce 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -75,7 +75,6 @@ HOST_GRPC_CONF_OPTS = \
>  	-DgRPC_SSL_PROVIDER=none \
>  	-DgRPC_ZLIB_PROVIDER=none \
>  	-DgRPC_BUILD_CODEGEN=OFF \
> -	-DgRPC_BUILD_CSHARP_EXT=OFF \
>  	-DgRPC_BUILD_PLUGIN_SUPPORT_ONLY=ON \
>  	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
>  	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
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
