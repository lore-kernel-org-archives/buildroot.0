Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008D9D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0A441119;
	Thu, 18 Dec 2025 16:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D70DSIAUPeyM; Thu, 18 Dec 2025 16:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC26241122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075887;
	bh=OZXrl8RA6E1VVDnfRlWHQVdrB2k4q5jUh8Pz75Cd2rM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rREGLOL26awdYUcA8WGsaofikjU+qtDrdIigLVFRjRoiuvwmsz02pIEoBwWbtnIlD
	 Fk/aWWUbQJkqXvuO1ztquCMMHPBPiYQ/hTNLzbJ0T12T/YDlPoTftYYLiJ4AZVw3eO
	 CzK2O4fKvtAW+SuFzMJ8SA6prVLsM/ysn2UPA3Au+qovVWqA1JS56sOMqEfg5wM0e4
	 GCxedES2uBQPcgGM69lLO+argsppPwdlFdcd4jOiP7iobfbuKuzCwS6CnGJfVkbJP4
	 rEfXgquDs+Iys7xi7vlpJV4pNR2ZAeEOwKKlRRRSTOjXegk8wdLQWwpnGX6pM1xOmJ
	 3hCSOAKgl0S5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC26241122;
	Thu, 18 Dec 2025 16:38:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1D6361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F2DF80BA7
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSw-1olRwdsj for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E85A80BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E85A80BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E85A80BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:38:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF44AB97A297; Thu, 18 Dec 2025 17:37:58 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:57 +0100
Message-ID: <20251218163757.379967-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211121411.210875-1-buildroot@bubu1.eu>
References: <20251211121411.210875-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075878; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=9c1DFchuZNI6wIaej8HZzr5FfmY5EIjJV+ar+VbcwxQ=;
 b=VQX5jivd3Zrm3TKzzZ8F9vMuEYRGN2XWJ0eZzHv1G1xjn0YRD+261Fr0LdO9hSNM4+pWD3
 5/1HaRi6bOTm6bsYeIv4RsA3OCHwKaHnKECyMfCTn/d+8kdVVV8m/NKexpSO9ArMmPSOCT
 /gAFd7317nMb/TlFgGYtwAFvzzTRnl39QnOS1GJgTgi/V9Z+qANPqbyCrxgLMCB9HE/YYC
 1GNpb/260sG1v6gpjqpnIUahPlayYLSiknoqY1WEBqJmtTYk4FaJh8a/7SEnKqidpQ08dz
 Xg/yGLPX6CqT0pf2SMUqyJxwDu/c1MOZ8OmoZf2ss/J8glgyXAxFQ3e7jHVmQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VQX5jivd
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 2.6.1
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
> Version 2.6.0 fixes the following security issues:
> 
> * CVE-2025-66471 / GHSA-2xpw-w6gg-jr37 [1]:
>   Fixed a security issue where streaming API could improperly handle
>   highly compressed HTTP content ("decompression bombs") leading to
>   excessive resource consumption even when a small amount of data was
>   requested. Reading small chunks of compressed data is safer and much
>   more efficient now.
> 
> * CVE-2025-66418 / GHSA-gm62-xv2j-4w53 [2]:
>   Fixed a security issue where an attacker could compose an HTTP
>   response with virtually unlimited links in the Content-Encoding header,
>   potentially leading to a denial of service (DoS) attack by exhausting
>   system resources during decoding. The number of allowed chained
>   encodings is now limited to 5.
> 
> 2.6.0 also contains the removal of a deprecated but apparently still
> widely used API. 2.6.1 reintroduces this API. [3]
> 
> Full 2.6.0 Changelog: https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#260-2025-12-05
> 
> [1] https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37
> [2] https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53
> [3] https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#261-2025-12-08
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x. Thanks

> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
> index f4162882f7..9376221040 100644
> --- a/package/python-urllib3/python-urllib3.hash
> +++ b/package/python-urllib3/python-urllib3.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/urllib3/json
> -md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
> -sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
> +md5  52150787074f43057a0e691c7ebe00d8  urllib3-2.6.1.tar.gz
> +sha256  5379eb6e1aba4088bae84f8242960017ec8d8e3decf30480b3a1abdaa9671a3f  urllib3-2.6.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
> diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
> index 9ec6c7f3c0..5b68dea6bc 100644
> --- a/package/python-urllib3/python-urllib3.mk
> +++ b/package/python-urllib3/python-urllib3.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_URLLIB3_VERSION = 2.5.0
> +PYTHON_URLLIB3_VERSION = 2.6.1
>  PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
> -PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
> +PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/5e/1d/0f3a93cca1ac5e8287842ed4eebbd0f7a991315089b1a0b01c7788aa7b63
>  PYTHON_URLLIB3_LICENSE = MIT
>  PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
>  PYTHON_URLLIB3_CPE_ID_VENDOR = python
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
