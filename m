Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E3D3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B61B40C92;
	Wed, 28 Jan 2026 17:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_OnbGDVfE7n; Wed, 28 Jan 2026 17:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6014640C9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621103;
	bh=6jy/f1OCMTRhY8oIlzc4Cn73rytRUrXuhdQ26co+NwI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrpzxacRyNmMybTo6vFy9I0KzVISRoAcA8iJu/UaCT6qO/Wh06gYBzhj562z77HVg
	 C+zJMxuZzuMXpza6KbN9SgNNTHrnJSuTVYVq3KqOIpiXAPTp/M6BRPzenjYW4mCFnt
	 /GsWOBZuGDx22J8f+hAGxE9BMfAUI2l6hx5dT4PPp5ZM6hH0M10xd2oCiGSw5jve4g
	 R5RhRvqa/s2zKPEPsOfZ+rwnToRff0k8o9Lt/PkoBGHZdN/QHj6rY3pzRzaA+7zAgB
	 J4XmHoSEi0PsPXtD7V5vtyARTkB1iZQkDeCuXHjn/iEcXafqSkx5J77hsBsH4AvZkG
	 mUK19AYNdXR7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6014640C9E;
	Wed, 28 Jan 2026 17:25:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3271AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEE8B40A5D
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hgh7ZgVIlPOh for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB5CD40C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5CD40C92
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB5CD40C92
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA240B97AB22; Wed, 28 Jan 2026 18:24:52 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:51 +0100
Message-ID: <20260128172451.343386-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112210929.3767530-1-bernd@kuhls.net>
References: <20260112210929.3767530-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621092; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=6KE4914KvcKf7/85mA/1wIxTujQjcS2MioAsWOh/26E=;
 b=DENZbDOncoLoJKMperCCFgrbBsxXY8JIMd2zn5Ng0Df1iXUtuIQ+vvq5zANIC3wL6gqbov
 qDHtxA/9INDdUcqwsO7h5tuxUr1WA/w1kibz001oRjfNNdpo7tYqiGxaK904WlFhEsOx/g
 6wopuUwAtv3H6QE9VNIOMj1yZArFD/klVdxieLgryICOtWY+oaR5qYPgqLP4CzgCfO6c5y
 uVGVMAtiOyMiYYTKN5Cvt+W62iK/fvClYzdqIJWf2Z4JD696dwZz73tydtTIGBKppzMbGz
 Rdj3NViGikDGlG3QnghjmCgjVZ/urAgeFCXves2fG/HaL2iIB6khVQWb1l0XnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DENZbDOn
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 30.2
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
> https://bitcoincore.org/en/releases/30.2/
> 
> Updated license hash due to copyright year bump:
> https://github.com/bitcoin/bitcoin/commit/ed0774bd08b83813f162be33672b7d6c7fff9933
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/bitcoin/bitcoin.hash | 8 ++++----
>  package/bitcoin/bitcoin.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
> index 4f4061ed77..89fe6ce280 100644
> --- a/package/bitcoin/bitcoin.hash
> +++ b/package/bitcoin/bitcoin.hash
> @@ -1,7 +1,7 @@
> -# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS
> +# Hash from: https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS
>  # After checking pgp signature from:
> -# https://bitcoincore.org/bin/bitcoin-core-30.0/SHA256SUMS.asc
> -sha256  9b472a4d51dfed9aa9d0ded2cb8c7bcb9267f8439a23a98f36eb509c1a5e6974  bitcoin-30.0.tar.gz
> +# https://bitcoincore.org/bin/bitcoin-core-30.2/SHA256SUMS.asc
> +sha256  6fd00b8c42883d5c963901ad4109a35be1e5ec5c2dc763018c166c21a06c84cb  bitcoin-30.2.tar.gz
>  
>  # Hash for license file
> -sha256  7c4a87f43afaf667b4c2187af92ebdd27310a24cec113f973e058e3300a76002  COPYING
> +sha256  b028769f3852a9368ab10bd754ff01ebb741f84a2fa658c9aff82a631bc6ecfc  COPYING
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index e23ef45050..89dacaf9c7 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BITCOIN_VERSION = 30.0
> +BITCOIN_VERSION = 30.2
>  BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
>  BITCOIN_LICENSE = MIT
>  BITCOIN_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
