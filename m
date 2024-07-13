Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACB4C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6573540148;
	Sat, 13 Jul 2024 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm9RSE-kc11d; Sat, 13 Jul 2024 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15438401D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15438401D8;
	Sat, 13 Jul 2024 19:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28A161BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20206812E7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4tok-Etypa4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E825A812C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E825A812C5
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E825A812C5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:35:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52ea79e6979so3431108e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720899323; x=1721504123;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHmsY8yce1Hj12ieKVjpiVUCsnSPYAuqq204CvTM8lY=;
 b=lkIpSq05RuRn7BTYE4w52GB/DnF/1YwqC4cXI2x7DwSIhwlxPVVj6u6BEciKCJXabJ
 ths7QvhFHG6R4Oas8lW4Ymsro6XMTO3hlc+v1m5Zk7rANyd0U1CmKSV3DjEq+mke0yz7
 Q9fCl55AkyqGBpa8zaUuwLZWmzW/oLcjq/O1bUTfBCY3j0TXHyLO/q/M9bddn3Rwf7By
 GOFtVrVtFOCYK4pzDSMcN0xNBzPWcwdb4keFcMZLVkOcWMhOCewQcIxff9zP43tdkQ20
 9yGxGQgq1AfIlqOf/UN8pDRbXoUsILlcUQwiKJ1fSFZU4sBxIw0LxUvJE9KcO1lCT+a5
 svwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQ6icjxNdTxQ6a1wIGGCYGTAKcStO18SmlJoUbWv9uE+63z9ox70MmcbtHNKWLO7iooGb0UcBatznNhsFW3BI0r41uMFTag==
X-Gm-Message-State: AOJu0YyIxwz0lKk6uCxHm7ixjpA3d3KTuw1e685q23cr2PhIee97C9cF
 fu08IZ9neDZ6FqWrKnJgoNU/6FHCDZa2udeXQSn6LHxox7c5ZAAgk3JYl2b/eOE=
X-Google-Smtp-Source: AGHT+IEf1t5JDmcZQhziKxuoQ/v8K6UMk5jCFjMmu2pq2kVvn2XFgORIxtgFSjzYsQ0jtDF6qr/frA==
X-Received: by 2002:a05:6512:3c87:b0:52e:7f87:4e66 with SMTP id
 2adb3069b0e04-52eb99d4c1amr11454945e87.49.1720899322782; 
 Sat, 13 Jul 2024 12:35:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f09d1d8sm65013275e9.0.2024.07.13.12.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 12:35:22 -0700 (PDT)
Message-ID: <7f094818-0a0c-48a7-b1ad-adf2d2cfa26d@mind.be>
Date: Sat, 13 Jul 2024 21:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240711201938.887672-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240711201938.887672-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720899323; x=1721504123; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iHmsY8yce1Hj12ieKVjpiVUCsnSPYAuqq204CvTM8lY=;
 b=J9FoTzoEATtTV01cHH10DicA6VXoPdhzvqIp6787d+g1Fghp7OsQaVDhQrFATdNoUQ
 XOEKO5IZ9j5lPJWrWg2S6ZOg9pcQJm7CFZ5Taf2FSv3LHRUqFW9Atk9I2vNbD5Qpz+Tn
 2jDiOk0o6r4AfFr24TNGSLnqNYTh2UuXZFwT75Z9lRmQLnUcB+2U5hW26rExcZ7rWAFV
 WUH7QU14y0+aMvTy8VFJBy6XAmIsZWUODrjTkUiiiDxH/YXXRH18WLn3HWwnIcC0y/gS
 pNlrKEHRPRIeRReAjOUGr5celUb80D25iP7kR/fiqFCQwoNMaIsC62Yf5KSjd7ALQLZP
 n4/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J9FoTzoE
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: bump to version 26.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fabio Urquiza <fabiorush@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2024 22:19, Julien Olivain wrote:
> For change log since 26.0, see:
> https://bitcoincore.org/en/releases/26.1/
> https://bitcoincore.org/en/releases/26.2/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch master at commit 60c8807 with commands:
> 
>      utils/docker-run make check-package
>      ...
>      0 warnings generated
> 
>      utils/test-pkg -p bitcoin
>      ...
>      6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_bitcoin
>      ...
>      OK
> ---
>   package/bitcoin/bitcoin.hash | 6 +++---
>   package/bitcoin/bitcoin.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
> index 6b3008af86..9bd0843085 100644
> --- a/package/bitcoin/bitcoin.hash
> +++ b/package/bitcoin/bitcoin.hash
> @@ -1,7 +1,7 @@
> -# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS
> +# Hash from: https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS
>   # After checking pgp signature from:
> -# https://bitcoincore.org/bin/bitcoin-core-26.0/SHA256SUMS.asc
> -sha256  ab1d99276e28db62d1d9f3901e85ac358d7f1ebcb942d348a9c4e46f0fcdc0a1  bitcoin-26.0.tar.gz
> +# https://bitcoincore.org/bin/bitcoin-core-26.2/SHA256SUMS.asc
> +sha256  78d59418741f45cbdaa9bf20ebc49a5e95ff9f7172f72fc78d14307eaf341b3c  bitcoin-26.2.tar.gz
>   
>   # Hash for license file
>   sha256  a6331cd1f889397adfc0c3b0535682a20950c6cf8e5c712e9997a15ce98324e1  COPYING
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 2f8a1777a2..9ca29092ad 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BITCOIN_VERSION = 26.0
> +BITCOIN_VERSION = 26.2
>   BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
>   BITCOIN_AUTORECONF = YES
>   BITCOIN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
