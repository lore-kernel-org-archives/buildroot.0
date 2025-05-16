Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321FDC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8580418D2;
	Fri, 16 May 2025 10:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pk9MVfADlX0c; Fri, 16 May 2025 10:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C3841806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C3841806;
	Fri, 16 May 2025 10:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A3413D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4CD0822D9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAiHJWsacVtR for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF6098224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF6098224A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF6098224A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:43:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FE651C10F6; Fri, 16 May 2025 12:43:20 +0200 (CEST)
Message-ID: <a137459e-bcd9-4be3-99b0-1d3ccf89922b@rnout.be>
Date: Fri, 16 May 2025 12:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250428132909.878530-1-titouanchristophe@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250428132909.878530-1-titouanchristophe@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GQQhhsMDDlHtb+ykW5FjQT9ZPw3hApZF1XVPf2fpq4w=;
 b=DtsFDIzrbxe59AS5qzhkUB559mVFH400+K7mhv1vQz9vQW+xgFfH/RIEJBIJ/O30K5cftJ
 SfrQ/XNwX9Xp3GsasLMl3Yb4pS9NAErdfq6Ql9SQWjVD07B4WWDFn5dLFNwkUb9jrJ3zaT
 NR6qwLiQ9LAkpTQKXbBJm8u55i6Fm947m3GUalFPGFbkZSVHj3+YODT8nB6FTimDgah4N5
 aPFhCOXMR4l3CrUSO0S+T5ddNwWr40x5XBt5dYjjGUhCpkjMMUXlC9N3eQliww6+qQ3bwh
 XP9WFaiveOks8CXVbN8VB+ryl7HIguVbtqCnDKTAQwEgM2Tcc0pxyA15QMEFgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DtsFDIzr
Subject: Re: [Buildroot] [PATCH 1/1] package/waf: bump to v2.1.5
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



On 28/04/2025 15:29, Titouan Christophe wrote:
> From: Titouan Christophe <titouan.christophe@mind.be>
> 
> Tested with `./utils/test-pkg -p ntpsec` (ntpsec is a waf-package)
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/waf/waf.hash | 6 +++---
>   package/waf/waf.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/waf/waf.hash b/package/waf/waf.hash
> index 543bea5d7b..8255ed4f60 100644
> --- a/package/waf/waf.hash
> +++ b/package/waf/waf.hash
> @@ -1,7 +1,7 @@
>   # Locally computed
> -sha1  9ee587d802ffd15a2e7cae579560d00754db4fad  waf-2.1.1
> -sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf-2.1.1
> +sha1  523f645690747501b19e0d107a044de514ba80b4  waf-2.1.5
> +sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf-2.1.5
>   
>   # The waf script also contains its license, but is renamed `waf` in the extract
>   # step, so this is a synonym for the above, to check WAF_LICENSE
> -sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf
> +sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf
> diff --git a/package/waf/waf.mk b/package/waf/waf.mk
> index a12d15a228..88b8d9096e 100644
> --- a/package/waf/waf.mk
> +++ b/package/waf/waf.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WAF_VERSION = 2.1.1
> +WAF_VERSION = 2.1.5
>   WAF_SOURCE = waf-$(WAF_VERSION)
>   WAF_SITE = https://waf.io
>   WAF_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
