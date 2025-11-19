Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07DECF3187
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 10:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69CB161036;
	Wed, 19 Nov 2025 10:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs0lvBMRwb_m; Wed, 19 Nov 2025 10:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B13360888
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B13360888;
	Wed, 19 Nov 2025 10:34:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E10FB37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D296360E4C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFMJdT0ZKIhP for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 10:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CC7860888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC7860888
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CC7860888
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:34:09 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 98D702C893F8;
 Wed, 19 Nov 2025 11:34:06 +0100 (CET)
Message-ID: <e403bfaf-d3da-4866-8564-febe8c65a169@bubu1.eu>
Date: Wed, 19 Nov 2025 11:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>, buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
References: <20251119082846.2193337-1-pkerbrat@free.fr>
Content-Language: en-US
In-Reply-To: <20251119082846.2193337-1-pkerbrat@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763548446; bh=kMgNAmUtUtFJoGTSL/DWvHAkMag0HfsBNU13M1PDS8I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VsiTwhO4WxnK1J+RMoJ5FrInn6peIG3YKZbEXRN68i0DOJAHqRCEraO4z9wTP3VXT
 c3G+iSLZaJmi5XrWAOEFe1Ogi6KWdGA4eWPgj3yXQVkIC7u6divscTyjBJ+ELMrD+Q
 sQu1EcjGtHcz04j6XEHcpXk94DAdDRCl2cDbKQzS1+laZQ+GgdTFNTJ92I5o1TGT7J
 JkkpYeD9nXm3crb57hHY4Me9oDSUaxL0frSo4WyYRNa1fNVZZHuBc93bIYqejNWQOr
 LDp5lrN+kFpQV8/lzfjHR/TfXsk6bn3izMlrl4U8nWxa+fAa8pyWOkxutqnF3T6Vrr
 ufKaWuDuMnCLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=VsiTwhO4
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: bump to 1.15
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

Hi,

On 11/19/25 09:28, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog: https://github.com/rauc/rauc/releases/tag/v1.15
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>


> ---
>   package/rauc/rauc.hash | 4 ++--
>   package/rauc/rauc.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index 6795bc9485..c0eee0d8d8 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  f48c85573d82bf9378e907f6eba0cbe4f2021839a1e9fe3f8431f61dd54ef42c  rauc-1.14.tar.xz
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> +sha256  4ae0b5246c668acb544ce0230a3bada81c78e8afd4755e5afa2218cbd686fd70  rauc-1.15.tar.xz
> +sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING

COPYING changed due to this commit: 
https://github.com/rauc/rauc/commit/fe86f277258dfe96d0f9ac9bfa930733598d7160


> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index d20b0121df..10d4a2db95 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RAUC_VERSION = 1.14
> +RAUC_VERSION = 1.15
>   RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>   RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>   RAUC_LICENSE = LGPL-2.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
