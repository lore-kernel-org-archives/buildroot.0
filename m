Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC173D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C487561252;
	Thu, 18 Dec 2025 16:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHVi1HKhUZ9N; Thu, 18 Dec 2025 16:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E095961247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075884;
	bh=5TK+L9bUJDk27y98T/GogR9ZZSZhlN/UvQzR2h9PEh4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XoJtOt18+/td2XaIgntOZJN+NaTxlHt28JbCtWrl0PNE5TEqNQ3LjAkQFTa63i9jV
	 g4J3doFyGwgJzTxUADsBQTTvrbPVpUoaOE/9olHF/s+Dfm67cdC7Nt6T016hEZ7loC
	 avl2HEqgm2Yd4aH+8+CCRBqmYk1h6Kx8Xtx4ot3UE2mvVV1n2f0QiEY1CXq+7cN2oy
	 LHVrcecE6c2SoSiyG6g0MKIMipOPf3p8PzXYO+nP4z045zMfTzTeGQfI8f2Vv9C20n
	 YrX0zNVnEEJ8p2lv6CN+VKicVjEkx9MNEfTMkVK3aNtixSg1I/HL5JiJ1iAbDfHHF2
	 5todnIT5mDZDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E095961247;
	Thu, 18 Dec 2025 16:38:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42694361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E2F83DC8
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70fp36npMkc3 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB72A80BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB72A80BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB72A80BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99B50B97A32C; Thu, 18 Dec 2025 17:37:56 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:55 +0100
Message-ID: <20251218163755.379921-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211191953.3189198-1-bernd@kuhls.net>
References: <20251211191953.3189198-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075876; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=q4zYUBZcGhZbxXpoI1egHt0lNiy+BJbQfyNFPeNJfvI=;
 b=UF7mfHCPdiXKsXFY5YEPrR++vPVzDgScPBnWkKxvHJqvGy9OjLbYp7PMN+brczmZSmJRDE
 nGJfHEQECR0G5AF6Wmn1kjPN2G5LEH2fpXJ5CFRAOqF8x4BC6Sk92P+u5ICC1jmyYV40Uz
 O5KIucBToUliyvv5G3b0Ud5Sn4C++h+muAJbpijSHWSfyQhqaUlL9c47jryV0/hlxejyAF
 aLFhYDh4RZFepJ//A6WhyZJkynbogeCu/Hqz138HFOg7p3uXOsSm8EAyjteRHZqL9LzlvV
 t1xZasAFilWGN2VFwnP7yo4C/AQFDKhR2Q6MVFlmtdFeiNAdKYEkunviixqFOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UF7mfHCP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: security bump
 version to 4.61.0
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
> https://github.com/fonttools/fonttools/releases/tag/4.61.0
> 
> Fixes CVE-2025-66034:
> https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-fonttools/python-fonttools.hash | 4 ++--
>  package/python-fonttools/python-fonttools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
> index 49f1ca0235..b83663e8fb 100644
> --- a/package/python-fonttools/python-fonttools.hash
> +++ b/package/python-fonttools/python-fonttools.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fonttools/json
> -md5  b4b79d23865d50084d4c05defa186fc9  fonttools-4.60.1.tar.gz
> -sha256  ef00af0439ebfee806b25f24c8f92109157ff3fac5731dc7867957812e87b8d9  fonttools-4.60.1.tar.gz
> +md5  55a7d3d40e191410bbe604d0d795baa4  fonttools-4.61.0.tar.gz
> +sha256  ec520a1f0c7758d7a858a00f090c1745f6cde6a7c5e76fb70ea4044a15f712e7  fonttools-4.61.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
> diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
> index 3094b1985c..592ef51354 100644
> --- a/package/python-fonttools/python-fonttools.mk
> +++ b/package/python-fonttools/python-fonttools.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FONTTOOLS_VERSION = 4.60.1
> +PYTHON_FONTTOOLS_VERSION = 4.61.0
>  PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
> -PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/4b/42/97a13e47a1e51a5a7142475bbcf5107fe3a68fc34aef331c897d5fb98ad0
> +PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/33/f9/0e84d593c0e12244150280a630999835a64f2852276161b62a0f98318de0
>  PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
>  PYTHON_FONTTOOLS_LICENSE = MIT
>  PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
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
