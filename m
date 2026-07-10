Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC5C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A8E940B25;
	Fri, 10 Jul 2026 13:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7osbN_jVFmr; Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDBE40AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691491;
	bh=Q+t4PmMRM+n0r0v37hOZog5WgNlXjfEmhDwiqPpOPWk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OfWRXC0pk4u8iktevAwBHoDOMQZuH3iP5hoxAG7w8gIDCLj1T1SaB4cAAUySaHBtX
	 cBx0VXgcL3S2m9pkRaJNUOR4GPuRQXFhJiSXyKLabDm8ypUcWXCaXQx3YA5uMSn6mS
	 vpMcdiwxQmHlEoCQJcqAYiDIFvMR27FXYy80je+QD4VQNhbIeNefO6lYIx3IucsOox
	 FD6xjMzfyZXOT4XXWmecBowh1MI8CcCBVvPAt6grXfgOjVxbUHCHPHaDRfpmcgJCzo
	 ZlNi7oaQZyKGBvrBshoxxY7Kv1mfSE6vmLoQQwMaEbYdL9VQJC0rv0tw816vGBbGlv
	 gowUbvkk68eyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDBE40AF4;
	Fri, 10 Jul 2026 13:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F4222FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD2640120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d131bA3n-JTp for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33D04400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D04400D1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33D04400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso991364f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691486; x=1784296286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ljVuDdK3tVVvbdgdHhfm8QZ5BelTq/EoUiYOCbAQVvQ=;
 b=EQ1H0spr0MnJEu4G+dG2ygKbIVgKSIGr/1SJ2/Plccph89Fl2sVGOFSsxWAkYb41E5
 SdhvdTu6EXUBoFDyHAAgvqKvVarCbVuBMSlQBbH4leDSgc22mKRrhVfT+V88nGJWKn4V
 LawS7GU+Lc1fDx61+PZRWKokYM20E7TI4S7C59ciaPvcOBW+03Cxx9dGhcFEhfj1jHdS
 GcUB7P21P9u8K8m4/2WRbHCyDN2mOxdPe4p1S8RjvLIvcNxmL6i9M8XTyMgbg7K5TTQu
 R4d0r9DaASI1mYC/LOYAaR8Lw96GxUIxExR2m3GgzFcg98R16dZZirUzOPUQbgIYtYl4
 wQlA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5S9SREtFjuMI2HpWxKpulpYPhBhhgBbjFyxLyaWmJZdUeKvbpjTRx3uXPQ/nv3a3d1dOarU+FrFk=@buildroot.org
X-Gm-Message-State: AOJu0YxMHcXs7FC5FKs2SkuHjYv9oejdUQcpIFiGsw9H7fzflCXZfZxP
 fMB3wckjX0pcH4kOcWMzuAaw/KQ5kk1N9Qi+ojDljyltJe38+1W4rPJhSNQqHKLuOIQ=
X-Gm-Gg: AfdE7clkEEyTshu2SvfqCaXs7ykfvDINieGTcn+T90ftxd20/kAh+FPgzyH3TdOrVSv
 2Yz0QZl3ecHRI06JIYZ7nF0cuZuJ6QcB9UTtlK8oNSoRVzE12OixexDZbfTtpVz6MC46Bx/AJfJ
 B1Kud5ujuxBmqM32LbG77gfn3USxuvLlKs5tQw+J1f5fG5HRPdZZSNwbIkiRNORjDm3GxCghRRM
 fbfFUuys/8s+cHqlhifn2CKnGIYgZuluup5IZ6V2u22NleR5F55EdayjJenbr9lykGLTfoYTH9K
 rMHtHyvLIT7rtcva8PMXNvyT4es1NYPYy3eJxyMQEn54zdC91dweNpzFijvZZuTgzuI5DdzSJaA
 f/rgshy4lllCz3pasvh1bXEY67lAbeuY1uFWmWfdVBmguosTTH/ntkWkbVxkn45TlVZnZWQPuAo
 QzztInBuLkEnDVRD6p
X-Received: by 2002:a05:6000:1ac7:b0:475:f0c2:759f with SMTP id
 ffacd0b85a97d-47df0797978mr12838189f8f.48.1783691485908; 
 Fri, 10 Jul 2026 06:51:25 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d780csm60527809f8f.11.2026.07.10.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:25 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:25 +0200
Message-ID: <20260710135125.758936-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706141151.421766-1-titouan.christophe@mind.be>
References: <20260706141151.421766-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691486; x=1784296286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ljVuDdK3tVVvbdgdHhfm8QZ5BelTq/EoUiYOCbAQVvQ=;
 b=h5OJ4Q2C5HG+RE2hT0Miin1sFwwEhhh/QpkAYIh9XOSVcefwdb5VC5y+9EazDFiAqk
 h9QeT21GBUrIrChu5934rKSrW1kH647pCne77JChnO76uk+AAg57eTZakv1V8tmRBAPQ
 YeL/E1CaPWoxKrNDEznZgNiG8eMrm3WrO9xr+Y9iZLxBvdDVe7+LPtFazr6aBQuu+3yi
 dqTpXNpNPNaR7j+MN69BKgfSkIvOumISxprI8hXxJiiq6bWRbFPcaX79BhkXNcD8HkFU
 WbsSdH7IKcAipHPLWyblBoPFfhGJD/FL5GHB5XGm06wD8Y0wpqqkARj093ErEIrWs5LF
 xHRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h5OJ4Q2C
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/php: security bump to
 v8.3.32
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

In reply of:
> See the release notes: https://www.php.net/ChangeLog-8.php#8.3.32
> 
> This fixes 2 vulnerabilities:
> - CVE-2026-12184: Segfault in file_get_contents w/ a https URL and a proxy set
> - CVE-2026-14355: Memory corruption (zend_mm_heap corrupted) in
>                   openssl_encrypt with AES-WRAP-PAD
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 978987ee46..11c0b2e6b0 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  66410cee07f4b2baeb0843140bb2a2b52ef930b5cf9b3d6e6d158b33aae8fa37  php-8.3.31.tar.xz
> +sha256  8698ec1f9402fa5e5e872ae3d0916b62f5f27503c1fbfc9cc3521e113355ea92  php-8.3.32.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 7d9cd3cb11..9ce3b280ac 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.31
> +PHP_VERSION = 8.3.32
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
