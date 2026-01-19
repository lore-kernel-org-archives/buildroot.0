Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ADCCCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C064024C;
	Mon, 19 Jan 2026 10:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UG6jZdnkAui; Mon, 19 Jan 2026 10:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3A94025B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817385;
	bh=GEh7DIjBZiLSrsQaI34UN6IcxEYokd+IXE/7pSrsOhE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cPbTc55b4LtLjNFd7QPa+1YuvWxRYRt6SOcjgG2bQI7DXqCg15joWZz56h4T+eBiZ
	 I4U9IrzpIYsoBloGqf3WERsthVapc5HA9Sh2+BiA00in+at4HRzvtjDjGfgC+/QIq1
	 Y9Pj5Pegv5jObz073X+7iYgJ6b397y8GHriB906x2XXLWynecJjHFPscrPfuS6YuhA
	 84uJWX+Qz36R60v32tPykY3OXCtyg3jucUsjiDyY9W0eJf0N5WMOWXx7EGbmi/FV09
	 YQal09VCQWHeky8H8jyJBvyeUWZFlkJQxsTPGzQeQzpbrokWaa16uurcX9pqiHLnq9
	 Aq4r1nR/zPkRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3A94025B;
	Mon, 19 Jan 2026 10:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96879160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85D0140D82
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKI6z9bFYHEi for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D86340D0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D86340D0D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D86340D0D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8375AB97A968; Mon, 19 Jan 2026 11:09:32 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:31 +0100
Message-ID: <20260119100931.13194-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110180729.2240224-1-bernd@kuhls.net>
References: <20260110180729.2240224-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817372; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=sR5SgPDSKwjqZss11WFs1ToHvB4FbcfyWpvuU8XF/mA=;
 b=Xj0CtetvJ4muYRlnhRY+1/nH3GjBhJXl7qDx2pVtj9371C9E71b8OH/f+9aoqYjattT5yh
 vV8L+6qk+izmrvGglzYircGo/JVs24mt6aJaqf/TpKg8WoacKJs4GL7bdy5b3cYCNkAtj0
 LuMvwexEAZv7+/HH5s291Qr4dUFRxtofM3FwWBe/Gwa+bqa8WhNN88qba8IKPU257uTN9b
 I0zUDcMuPJCslh+8NEMmqGDfUYFGbbsRVcKyolEgytyVvJ9AFlhyZgNHOaPkmr+b5na1wm
 amZ5Mky6r1DEn0H62pzTwLhOMdDtctj1CyBfrx/j8zNsAuKLCgfvPOojk9kkAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Xj0Ctetv
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.18.0
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
> https://curl.se/ch/8.18.0.html
> 
> Fixes CVE-2025-13034, CVE-2025-14017, CVE-2025-14524, CVE-2025-14819,
> CVE-2025-15079 & CVE-2025-15224: https://curl.se/docs/vuln-8.17.0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 786d030171..de3f2402e9 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.17.0.tar.xz.asc
> +# https://curl.se/download/curl-8.18.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
> +sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
>  sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 6924631735..e1e5a7facb 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.17.0
> +LIBCURL_VERSION = 8.18.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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
