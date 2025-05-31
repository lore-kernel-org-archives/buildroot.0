Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B62CC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160ED40AFB;
	Sat, 31 May 2025 16:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGsAXWrl1GTa; Sat, 31 May 2025 16:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7E4407E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7E4407E4;
	Sat, 31 May 2025 16:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00AEE127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62FD407E4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsAgcQdyUGXk for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03F41406DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F41406DA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03F41406DA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09CD91C00CA; Sat, 31 May 2025 18:47:45 +0200 (CEST)
Message-ID: <140c7107-b954-49f8-afe7-2cae1a54571a@rnout.be>
Date: Sat, 31 May 2025 18:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rZJisTT1eqDp6+6qOEXnuloEpo09VkoGqlZqnDB6t+M=;
 b=Sq8C2lOaIdqQP1yPOesDV6Ju4ezc/AIhqr676U9ejL3vSSjxPxng5f4FE2TiDZgoe+DVFL
 r//SP/w5icQ4bliMpTgMfnhTxV6RcVp0Pi7T5eA2MogleEO5SPH+ONCllZIrW0OUj7+vy6
 feFMJR5yH4wcLTZgCpcSos/HkUOnTP1wt0zs3Akrf4jcyX6aAC45gHPSb0CIwgfHL49PAa
 iOzlVx7eVih4N/jYpysJ7cCsBMwF11m25eSasFtSRq5DUECBCDbkPBkEf46fN9ME4dGYSU
 ALYXRv4xRfP1pnUsIHakc9eqceVxJdLLCTdfwQOA2fftbgXjpL0vjQd4RDhymA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Sq8C2lOa
Subject: Re: [Buildroot] [PATCH v2 01/12] package/python-fastapi: bump to
 0.115.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 17:12, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> v1 -> v2: fix version name in commit title
> ---
>   package/python-fastapi/Config.in           | 2 +-
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
> index d4a527c601..21997daf9a 100644
> --- a/package/python-fastapi/Config.in
> +++ b/package/python-fastapi/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_PYTHON_FASTAPI
>   	  FastAPI framework, high performance, easy to learn, fast to
>   	  code, ready for production.
>   
> -	  https://github.com/tiangolo/fastapi
> +	  https://github.com/fastapi/fastapi
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index a241937ce5..41b208a8a7 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  38428aff025530f61cd5b10efd764229  fastapi-0.115.8.tar.gz
> -sha256  0ce9111231720190473e222cdf0f07f7206ad7e53ea02beb1d2dc36e2f0741e9  fastapi-0.115.8.tar.gz
> +md5  af68daf64073e04653b314a895aee297  fastapi-0.115.12.tar.gz
> +sha256  1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681  fastapi-0.115.12.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index 2662f3ddaf..95961972fe 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.115.8
> +PYTHON_FASTAPI_VERSION = 0.115.12
>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6661dea100324e19a7721d5dc524b464fe8e366c093fd7d87
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/f4/55/ae499352d82338331ca1e28c7f4a63bfd09479b16395dce38cf50a39e2c2
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
