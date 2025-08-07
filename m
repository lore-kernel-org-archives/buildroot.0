Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98192C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6104062F;
	Thu,  7 Aug 2025 18:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esDEAXfl6xv4; Thu,  7 Aug 2025 18:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E539F405D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E539F405D6;
	Thu,  7 Aug 2025 18:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F08C44C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D7D400B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul99SPh8dl1l for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E168140087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E168140087
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E168140087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459e794b331so8584595e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591089; x=1755195889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UXARyUhgVCwJDRmjKt4fQ6uHg77+Ce7waxq7MQCliIA=;
 b=HJ7gs9tA0pnF5lapWc6PzaELFRGK/31/wvWni2UjAHJ2cdXJXY5RFc1BUZS7xSBfZ6
 FLscrgUkeyyGDSAn+cPHHriQ679F5XvicpJeA8CMo5BHdGrR5zIDKQh0VvdR7Ia6C3w4
 Dp6eKUIIpc18kf/gjlUqZfRt9Sqix1VZYqYb78FIXDhKfiRdivmYpbMd7WannvutkwPb
 dhzIqs/F1JL2slmpF0K1z40mJlFdOpnpV9LolWfUdqXa+Xy19CKzR3pL71Nnf1Gb9SeN
 xNdmrkYcy1huzGuV2XY56s7K2/HMN1KeQEzJJVH4BjuKFPatultiKw+xd7lols/cdHS2
 djpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwd6YOQZMVpDhhvXpMdmROTwsEHfh09HW2KKKPUwKr4s4NS7LRu/z2tz0n6FBbYIxUkBhmX1MFmK4=@buildroot.org
X-Gm-Message-State: AOJu0Yz9uuvzia7tiXWFgst1jYuXG85QWAQGM7fmmHQEDENnYnsCMe+N
 E0ZVW2KGZW3eEHIiyy60w4bMAQQNyJ6CGfqwhEy25y48XEg88KWA4/k4vv/8pZ1+2Fw=
X-Gm-Gg: ASbGncsk2QfSslQ0sszjzk8QkzssJ50TZTW1u2tdxsZFitMsGgeTqDyjDSXPaTwD9l7
 pk4hHjEbO2xeQgt1X3KXwpZtpTwoaHoN+qtN0F+9HO9lTyY8mZf6dyF2fIwTCmRpRQ1k3HiF+sK
 9Wt1cZKwmj+Jclgu0E45W2UN6Iu0H14fj3RPnaFTCAY94hmGtts+cr9E7EyYBXNJC3BWhGjvFwI
 8vm6I2D+1Lzt7ylTlqOLuY7nX16jIxa8K44tslqDHn33rBBBh+ffihKuL5Hp1TJKo2j47RrqJxG
 IdfV8o5yLy2ZY4R+KrcZcwqwn6notSZd+4aQPtBVI1egBgy2rUWVMeWcOuB3RAnmMBGOCHszAOT
 xk9uQYFs63JHyEg==
X-Google-Smtp-Source: AGHT+IFafmz8toVOLe8a4bfQLB5gbYd2wPG7DcYQlsEUCBgOVeGtlxHIY2PLmS8pWlCzBRV4qi4y6Q==
X-Received: by 2002:a05:6000:24c2:b0:3b8:f356:a2a9 with SMTP id
 ffacd0b85a97d-3b900b54f17mr168377f8f.46.1754591089016; 
 Thu, 07 Aug 2025 11:24:49 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c475067sm27381661f8f.58.2025.08.07.11.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:48 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:48 +0200
Message-ID: <20250807182448.726429-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801195152.2612477-1-bernd@kuhls.net>
References: <20250801195152.2612477-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591089; x=1755195889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UXARyUhgVCwJDRmjKt4fQ6uHg77+Ce7waxq7MQCliIA=;
 b=bD+IKHB71FQONkWJFkWLsU0vC1+gnAQctTbbLmGOm/aVPJVrqvDiC1Rp/JJtH05CTL
 PvaXB+R9mqvjed/nO3TSRU+PCLNaprCDKXC881DsJn3BMNQN82wk8Zbq/7cnUDPw3DgN
 ThpofcRadpaU/LJkp25AboT7ZJTygte+vIEK4kdLuOPRiPab2Lqujn9MemCE/cihe0u8
 OqsvPYF0Y3/uRI4vVvkkB/34g9a0I6VsMp3n+qguGrqfYAfaBHhn8sibg7NSYxoBTtJg
 VuR/95wkGCPp+ZWQROtyqSQyHyB1IA7+U4tbwAjvIkJ9h+XLq8VetTTPwTzT6ESslFzU
 JSJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bD+IKHB7
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 15}.x series
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  linux/linux.hash                     | 7 +++----
>  package/linux-headers/Config.in.host | 6 +++---
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 8401af95e4..dd6febc25c 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,9 +1,8 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>  sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
> -sha256  d37e92bc16b962a3025df156647bdad90b2db4ff36c7a6137817fe81ef3f28a6  linux-6.15.8.tar.xz
> -sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
> -sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
> -sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
> +sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
> +sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
> +sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
>  sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 37a44c2e3c..b49eeb1e94 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -456,9 +456,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
>  	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.15.8"	if BR2_KERNEL_HEADERS_6_15
> +	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.15.9"	if BR2_KERNEL_HEADERS_6_15
>  	default "6.16"		if BR2_KERNEL_HEADERS_6_16
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
