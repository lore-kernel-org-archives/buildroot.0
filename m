Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAA3EB48EB
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 09:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627AA41D56;
	Thu, 12 Feb 2026 09:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYemHtBQiD-A; Thu, 12 Feb 2026 09:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4166241D69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770888364;
	bh=YtCLzcP6eDotCuSKyS0hXnZ8wwZweAJJkqsXmkQkcwE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TEO0adZfEOjEpagmmO19XdCrNax90xTNV5sqKoo3F1EM+IMEOrQXzUIR99iM3Hz1N
	 ClwoEc12cWtpSjXb0HTY1gHzyjCLUyiTKjnkGw0CCASGvWrsqY2nYxjeBjSq7yFaNN
	 aE7sH6QFrDR+/yOAbmMJB45WpdYzi+SM6PGv0zOk+uYol+IG6OeYihbY6/+T8hRKxU
	 kONp9J4HGdAjtfyX3KASE5xQYq37jILYZvyvBzYnYNjHvSE13qdYbMsHgy2Zttum5p
	 BaS/oocl+wJd5gwk5mFpkowvWMdDiKgeD6OCsT+iNUs3BLzsou5zhz9PnfdSgUnVB9
	 0Wqz1nXxZkDsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4166241D69;
	Thu, 12 Feb 2026 09:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA62BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD57842E3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTFXj-f2sqMv for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 09:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D458811DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D458811DA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D458811DA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 09:26:00 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 332C62C831BE;
 Thu, 12 Feb 2026 10:25:58 +0100 (CET)
Message-ID: <75a6e0f4-5faa-4349-a833-c597241b2ed6@bubu1.eu>
Date: Thu, 12 Feb 2026 10:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260212080625.2408593-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20260212080625.2408593-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770888358; bh=YTWWDKOOpXGpGFqRsSHFMVyc2om7wdKEvM+HURevzv8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=iF2aH0FPuhrwNSKCMl4IOQzGfHG+MXjFvbuXxn+MC/GikSVloLxaaM+EWiVMtPSds
 4hQ20yAR/meetw85T0yTLE2awFJ6bCSbRDYTasoYi3xkTQI/bHAIdsw+GZXOaw5RuS
 O45GIbTXBevf8atGiSNYYp9AYj9iIN7/VD+r+Rp/NlWBNsC/cjgqx8wwbYuxsv1TzU
 20JPZelpWRWf2M2GWgW3qp7p5h+zSOKc7FvEq46UFyxizI1zJ/T8nUJ7wtWteXh9BK
 nQnj3eHTcy/nnute+Ur+PsNNNzjsXHLgcreJlTVQ9c2mzDGhXu6UOQwJFt9qpk4NPp
 o1Hk6LgkzCsRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=iF2aH0FP
Subject: Re: [Buildroot] [2025.08.x] package/python3: security bump to
 3.13.12
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should have been 2025.11.x not 2025.08.x.

Marked as not applicable in patchwork.

On 2/12/26 09:06, Marcus Hoffmann via buildroot wrote:
> This release fixes the following security related issues:
> 
> * gh-144125: BytesGenerator will now refuse to serialize (write) headers that
>    are unsafely folded or delimited; see verify_generated_headers.
> * gh-143935: Fixed a bug in the folding of comments when flattening an
>    email message using a modern email policy. Comments consisting of a
>    very long sequence of non-foldable characters could trigger a forced
>    line wrap that omitted the required leading space on the continuation
>    line, causing the remainder of the comment to be interpreted as a new
>    header field. This enabled header injection with carefully crafted
>    inputs.
> * gh-143925: Reject control characters in data: URL media types.
> * gh-143919: Reject control characters in http.cookies.Morsel fields and values.
> * gh-143916: Reject C0 control characters within wsgiref.headers.Headers
>    fields, values, and parameters.
> 
> Full release notes:
> https://docs.python.org/release/3.13.12/whatsnew/changelog.html
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/python3/python3.hash | 5 ++---
>   package/python3/python3.mk   | 2 +-
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index fddfcc1a4d..89282fb41b 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,4 @@
> -# From https://www.python.org/downloads/release/python-31311/
> -md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
> +# From https://www.python.org/downloads/release/python-31312/
> +sha256  2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593  Python-3.13.12.tar.xz
>   # Locally computed
> -sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
>   sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0189a505b4..d81a3a27c4 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
>   PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>   PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>   PYTHON3_LICENSE = Python-2.0, others

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
