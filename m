Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27FFD29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48C5414F8;
	Mon, 19 Jan 2026 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5i7M2phFnTj; Mon, 19 Jan 2026 15:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53F6414FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768837651;
	bh=fu8vaaHB7LpeEIL1zBWl+C9qge21pesGPceGTvce5tI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FKC3g8xWL3blXHAKY8PGolZ0TLoixX7j/fhBA8GAyDuUoG+ZNQH4NLzrw8Q1XyuNS
	 Fq9nMc3zF50ogOpdQpr3cUwKbm/uHi/3KJ02D8uoW0KquC2CYpZfi4f0n74EteCEND
	 S1Z7SFSgMHB/kw8BSlqQZz5nxpRE+qfSql+HCPQ0zRjUuCDLk+3E7ee2krSrBzqwnJ
	 s+WP5yYfuL1I56wdwYhoiyo9DdXNJ4g2EUnbM2gA3DXycH4sbfH70xObMvQPOE3vkA
	 Yt4PvVED1K2/aMcUhM0Sa2hyuMewNGXwPIJq1fzPsSL8FBvQVAUbRkJuDSc/86XX2o
	 aljw54B8c6lbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53F6414FB;
	Mon, 19 Jan 2026 15:47:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 814CA160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 651EF4017B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSfq32bYSpq9 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E4004007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E4004007D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E4004007D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:47:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA07BB97A967; Mon, 19 Jan 2026 16:47:24 +0100 (CET)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 16:47:24 +0100
Message-ID: <20260119154724.74018-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251106153917.1683677-1-peter@korsgaard.com>
References: <20251106153917.1683677-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768837645; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=HwmTFE6pUivxjfjkzlZ4lfgGaJVxaL6OvhgfUmKF9p4=;
 b=EdDhVwrd7TrpQtBlXCthH0isqWZjor0YnzIFlPv6RRn9U/uhI8OE5xrn9J3iMtYKEMsCoi
 nvG0Qyf8nwfVvZa89jrjpZ33k9PidQLOQa3fuC48SD9Cnv7/hXNVGxb2pl5Vgxq8Y1WaHU
 F14c83Hgx+/Nogs6X5EIhKWAWRrEk2BgzTjuAkflWN8H98J6sVQ9aH7VBdE8pQOzPR133p
 efS9NgfOw0HHJ0Dketl5773nqoofGLo3SVh+OH4vpKi8DxEGAhFnjISbUGxSMWclZJ/QHU
 /qSTuVMkdb2WfaV5FLO1ptAwjKBmL54z04CQIFd0RfVdMcnyiQY1ImlMuZQIHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=EdDhVwrd
Subject: Re: [Buildroot] [PATCH] package/libcurl: bump to version 8.17.0
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
> Brings a number of bugfixes and a (not applicable to Buildroot) security fix
> for wolfssl (by dropping support for it).
> 
> https://curl.se/ch/8.17.0.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 4cc4da4f26..786d030171 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.16.0.tar.xz.asc
> +# https://curl.se/download/curl-8.17.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d  curl-8.16.0.tar.xz
> +sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
>  sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 51b8c4d147..9e32c38d97 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.16.0
> +LIBCURL_VERSION = 8.17.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
