Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1174CCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C8240F63;
	Thu, 18 Jun 2026 12:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dL_WwYYhcrwJ; Thu, 18 Jun 2026 12:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F7240F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781786981;
	bh=iRF4b8u67gDNQoYzDKLvWm6LTCjRMDeRFhmfo4qDNgg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n3r8zxispw/q6emm3Q4I8SnaVmF7k3VVkKFf4sSfr8Bawbv4cG2PlHI2OAnnzI7AI
	 8uIXRGqvKyFZA/SMUgstcPyI9A7DTj9Rh+zgaqj3luqTJ+syrIsqlEwis73O8K6TYB
	 BrSldFQLVg2L7MXVKSHx39TQ57S5HVvErBgddlxnwfZ5RfQDD/a2teu9BbPKuSp7Cm
	 LgKOr0girCLBf8DTYVPd0FfQu8fE3M2C+AQJRW90ZjXQlEKt2CYgbAd1NV/rxNJ7m7
	 18n+kvGo9zQwU1ZYTjSu3ndj02Rmeviu13X3P3Gn8gP5FDfaH4FP/p76EryZXZXlsB
	 /A7DKF30UoxEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F7240F51;
	Thu, 18 Jun 2026 12:49:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A6D131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C4040F51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_y4vXJ7qarY for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CF6B40F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF6B40F4F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CF6B40F4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso10364505e9.2
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 05:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781786975; x=1782391775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fYrEGNGj6q7EcitWsO39q6gjB9RVyPopijYueSMLN0k=;
 b=iUi8EMLzqRCla7G9GEbKRx0iPXRQWz6ErenTIeLlgfbfRUh5djf+LSsalkperv3WfI
 SpHJuPS0ej43zBbptd9BfiuSNeTKZBDnsdgA1Kc7ygMWPC9A2Pg+M6hHqx/ULeirfDEI
 iTj9IUhOhcSylIupjcSdTSHFbNDVzfreYdEYtXRq7YiotatlwPOZ1WS0VOySlWAujb7w
 xFf6Wf4zEo/wS2QRwIYSySRcU6RCH/6AuVt9aEKcZya7SUuMQ4jJ9BBDWJPISy+eWqBr
 hUrQZG+mv1o04+MxOMMZtTnRqhcMdLNkbIj6ahwBdZEfG1bXKziXV18aBFah3oKAWCgm
 beyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BZ0UZX2ec+Ehabo8FDhCrdS7EnEWdAi9An7eWLSX3SbuFT5Z7Dyw8GmcjKv8xwgZbpdlLidEwfGU=@buildroot.org
X-Gm-Message-State: AOJu0YxeybOUnf+Zl9ZIalFVdxJDS7let8d9P7tEUzlnsxqTtWNz0UP8
 KgoDvXJC7brfOAq/OQZka0nHzUViETOTsxNddE5Rr5zexzzWV92OkliXKCHSLRDgRrs=
X-Gm-Gg: AfdE7cmSv0i+Htf3WytRj4TyUIfIlNKdK17B0AtZSBYKjcM/6lVl2FUpDUYpE+K9QfO
 AoKdYsnRGXEM/iRmc0UhUE0XDS+4bNJaX5aKdsruc+Djsam1sQqQIZOJCZliCgCjKK7a08zonGP
 XtscckvlBYVkHxPsfnxgnW0wQG+asRJ8HW5eqHA1+DwEL531aE4L2wBWBGsJjoapi5eha/T8gHk
 k4M9Ujf5vMDXebanCIC+5Yrv0osA/48tGMdVAI6gFsXMP81RgScTAnMHHhKxsB0AH+eWOkNJsBa
 emGVRGsP69Ln27FHHzBdZwG9+GwfxYwmTj8+CHfMP2K7U01iiSdGoSVNfmxG7wEiq3IMatbEBux
 HNjXyebuWfD8HupDfYfmIFkHxD1FPOHXO6xrJWHWR9xIYnbId5h95uLCQH0/JWImCOJQEISeh15
 8Cd1eL
X-Received: by 2002:a05:600c:e547:10b0:491:9969:739d with SMTP id
 5b1f17b1804b1-4923822eed4mr40255875e9.29.1781786975262; 
 Thu, 18 Jun 2026 05:49:35 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c3fcfsm57011226f8f.26.2026.06.18.05.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 05:49:34 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:49:34 +0200
Message-ID: <20260618124934.134574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajOOhpts_SyBkW3C@waldemar-brodkorb.de>
References: <ajOOhpts_SyBkW3C@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781786975; x=1782391775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYrEGNGj6q7EcitWsO39q6gjB9RVyPopijYueSMLN0k=;
 b=L4CQINy9aookyHLCoGRP39Hx3eCydV6+gTEBBHva/wrUV/5djRSa6GZdvysihsQzs1
 g26Pk7pRVb0gGwrB4bQF/tZyy/SwBdVemZv8eyxykQLuaFUb0jcdnLSVtHFWJQViROXP
 +2OXT/JwPsK6eIcBvtSp/8QGczS8GZBVxkCSG6UZ6MuYOVnvFzYBiKLLPj4gteZ9A6nS
 tgZmgHZOLF5jAMH/SOlQ8FZBvjQH54Z8jyMfLkCRrsX6M6ZI1phsbdbrH56mGGKClQok
 bhzTWXXVv5mpALFChNLPRX9DdiBFuJBmx+tpi1jy6VDNs8AUZlkW99HgM+n+genEeZIO
 Zzew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L4CQINy9
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/openssl: security bump to
 3.5.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Will apply https://lore.kernel.org/r/<20260612-openssl-3-5-7-v1-1-093c128bb691@cherry.de>
with your comment.

Thanks for sending the update.
PERALE Thomas

In reply of:
> See here for changes:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.7
> 
> This release incorporates the following bug fixes and mitigations:
> 
>     Fixed heap use-after-free in PKCS7_verify().
>     (CVE-2026-45447)
> 
>     Fixed CMS AuthEnvelopedData processing may accept forged messages.
>     (CVE-2026-34182)
> 
>     Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
>     (CVE-2026-34183)
> 
>     Fixed NULL pointer dereference in QUIC server initial packet handling.
>     (CVE-2026-42764)
> 
>     Fixed AES-OCB IV ignored on EVP_Cipher() path.
>     (CVE-2026-45445)
> 
>     Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
>     (CVE-2026-7383)
> 
>     Fixed out-of-bounds read in CMS password-based decryption.
>     (CVE-2026-9076)
> 
>     Fixed heap buffer over-read in ASN.1 content parsing.
>     (CVE-2026-34180)
> 
>     Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
>     (CVE-2026-34181)
> 
>     Fixed possible NULL dereference in password-dased CMS decryption.
>     (CVE-2026-42766)
> 
>     Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
>     (CVE-2026-42767)
> 
>     Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
>     and PKCS7_decrypt().
>     (CVE-2026-42768)
> 
>     Fixed trust anchor substitution via cert/issuer typo in CMP
>     rootCaKeyUpdate.
>     (CVE-2026-42769)
> 
>     Fixed FFC-DH peer validation uses attacker-supplied q.
>     (CVE-2026-42770)
> 
>     Fixed incorrect tag processing for empty messages in AES-GCM-SIV
>     and AES-SIV modes.
>     (CVE-2026-45446)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 781701532d..8a7186d669 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
> -sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
> +sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 837c3f0346..a9e18f96ac 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.6
> +LIBOPENSSL_VERSION = 3.5.7
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
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
