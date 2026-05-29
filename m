Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6314CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1C682661;
	Fri, 29 May 2026 08:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6vknfmSebJf; Fri, 29 May 2026 08:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78CB826C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043387;
	bh=WcUVGxGSO5a6H4+qhtMYXoVYe3ArcTsQs+pddbDepts=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o5jXd8PyEsZN/CCPLpR4gG9ovq2l0yooLmgkci7xypD38VekGIleYYa4wLc5XIB6C
	 w2unGD1EjhBVjl2lbj9bcosppGmRKwNPqjJUoiCtFOs3tUc2LaMYC0cD74cMStv4hC
	 EznTPSPdrFyvoxDfYMvKwTkQk27K2uiU7bZQuU7lUFC33XACB24GOW8wX7InXaxzqY
	 MD7GnfAPmRKdV6p5EKNMIItZzY5NQbFoNjLErAeI+B0Q0mWWC3sJ9cZKnwN/OS1PAL
	 lCWuIsps2hyWvgMH8sNWC477saZD940JtSz4DlJ19WTJWdHBpfLRNnFcth00T3vJga
	 +7W0BAvqRLQkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78CB826C2;
	Fri, 29 May 2026 08:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0866628E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBD5E4070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1gWBg7a5MXS for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9228406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9228406F3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9228406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso333980f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043383; x=1780648183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x5OIOoHmdxk3STGGbkMFY011aVHSXZS3cpKWHEABt5o=;
 b=CNcCzorr+f5Rgl9Ned+Cx1WMi2NG5ZPA0NtkC8OwmoFvjn+L46m8EhzgyZhPUC5el+
 slvS5rphDv+HoxdXHkVME1JbQ2u6QleHXdZ7eOEjNtvaDjXIIp4YC9PoxHq5fzQhnJib
 Y+r84EVuT0wCWZuhWHCOn5g6US1y8U/S5Q6XwQR+8WKIUr50Rsp/J3BxQilKq26rgyEE
 ajEbqhXTx7wA9EtImOYEGiXQW9YXVDv7cSz1IoY1mumztgCvnG+KNa/wOVuucUwt5uIb
 5C2jEEnQPtStZWCiwC9G80wz8smcIRb+lYtonKWCpDdX5oUyqkmUy7P3pFEQKWMi2OJW
 feWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/kzq0mjCQd+W/qlhzB4vSeC0uwlYa2cAo0oC2G+7KftbpTUAwWBhypMPjNteHCxn7ZjepIB70ak4Y=@buildroot.org
X-Gm-Message-State: AOJu0YyPtChaX994lSeAzRO91i20cJFo48HJV6dCQ6OanSSaGymAD5NM
 OdtksNeR+lrelI0sFZo3aAMoy83rTjZCrY+Nwe+oYhTsIFfxYCLgDh2ks05LjklWmvY=
X-Gm-Gg: Acq92OHQmpsQJr9T6M+qqNkLxX9juuSnbTNQSGD/8WPuJm/d9ZnAiIWGnEXM5f7X0il
 /gRmYpmqA2llKHawUtUIvlHmTaHfuhXROqWshcliWRL2xI0/WO5fYkm6MiZQfhSGKm9fPLVZZbc
 GqNjw/m4UwT/Z0Dzz9t4boSIMT1dPHUKyqeDUV+I0yNGqUXHTeZy5t7NH5l2dRbkOe6HYhQH5HK
 In0kNnQ4uQUoeC7ZUKxIeCjCBAubX0LEcODybWK/JSE1nP8Kcvx/uHyGhE15CU+lCBZKAfBbUa7
 kcYZuCgt6FVNnQRY2VJXze+4FhjIW1BxoNGy5k1FXu9B7v9Ij3X4nWsnyQIsojS+5YcnUSVKyRR
 okhfQ6Ls4Rq/SX9lgedQ32okVGwS1J0qk/AWqUCwKtvbm/GiQd1k2pONMLi3bWbU1u/+34nYsXu
 f9TYBOVAv998KHcey/8xiZzpz7dueOwPZ/2IyqbhpZMOIPe5MgjqssLv4oFw==
X-Received: by 2002:a05:6000:98e:b0:45e:891c:648e with SMTP id
 ffacd0b85a97d-45ef13ed46dmr3678725f8f.8.1780043382849; 
 Fri, 29 May 2026 01:29:42 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3556f51sm1802474f8f.25.2026.05.29.01.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:42 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:42 +0200
Message-ID: <20260529082942.57947-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426092637.2320150-1-bernd@kuhls.net>
References: <20260426092637.2320150-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043383; x=1780648183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5OIOoHmdxk3STGGbkMFY011aVHSXZS3cpKWHEABt5o=;
 b=fT+GIXCnnafnCg7aSawdDqpe+dA33NRVTCFViYszH+Urydfl4iN6na9S7K9RdAw1RV
 yZEGJn6LU4hyGt3r4fW8J0UH+GUR/0xwLkXfS5eI9O4KMnLL/yg/GEshgBKEnzfXAWMH
 vgBlrkPdXHoeQVxiHw4EaSBumB0N/+f0yWNooD31n8kcz9xkdx/JG+g6UBmayZIBXl3c
 d8CqoNLpm+3IWq/g97RF/OlpuBxFKi0YZT1b8KrvkljlRqB9FxHe5qjt+vUbCfYWeO8v
 TLOIHx1EWVt2fFdxsoK1LjV3T3PbrhtYX89UuTF+kDSaIkTTW/2c7YonxOX2Thh98OJp
 DrPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fT+GIXCn
Subject: Re: [Buildroot] [PATCH 1/4] package/gnupg2: bump version to 2.5.19
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
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000504.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index d607e9bb86..2aab6111b4 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
> -sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
> +sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
> +sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 1f7ff43e07..499532c551 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.5.18
> +GNUPG2_VERSION = 2.5.19
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
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
