Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB528CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D9284633;
	Mon,  4 May 2026 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfVZStnxJc6s; Mon,  4 May 2026 14:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0168C8461C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906038;
	bh=pc5y09GWmgZEBup2TVUADQhxeL5AHyKmBb1pzFA1Bfg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E3FanGyYgzi6xd4FXAkaIql/vqKjX73eii/VOG43Ah0kuRC3ILmMCrLIgkmfLlrZH
	 pjuLDelDuSF2WPbR/IfT2pXfJc2DSFg77xhF0+EltfXjn8su0zEroDbswdKZhew5OI
	 3EMj37uHn5P3tiSvEg2HfA7T3iQ9TAuYM1x84c8G4jRvim2qeaSUaZ6Q3gnFbJFS/J
	 wk8TsL0xGGqGsvdeo2+QIoskngnfmYU6MiQEqVKYLp7k3/FJcaNptO6jxLaTpQJ79o
	 tE8bL/dSALAENxTGiaEoPM0A1YUjWnnAIefg9Xh4V+uvqL8nCCGcR0KuDRwS47153V
	 qWljejTS5Pgag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0168C8461C;
	Mon,  4 May 2026 14:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 601E225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1538D845B8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJ-vYV_nvjBS for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6BE38461D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BE38461D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6BE38461D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso44313355e9.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906031; x=1778510831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YbniFN+b6bJcYkzt5bIVKE4OrMMTlHLz7yGlhTNo2Ss=;
 b=ANklCxX1KUx0q4l3oOqV1rGqMM1pJZ4T9bBNAwrvGxpp/q320nuCfOkzqCJz3nzuh4
 JRysoHWAaHY/D5M3wwJcJFxRB79eq4TsEFNcZmaA2GZyw+9Uo3nq75OqpcGW02TdGT6L
 CzRezs9DSXsJBtQ/yn9fL9kTFDfe8fizY+x4aHHX8cAvU7Pi+BVzZwLSColmtZMG7vwo
 jELxzppxeAw91FmRjfdREq5OJcqMgLg8QTjLTn379cwqeVS7YPAmgczKPcA5WPbR8tKK
 +uGNyRMwVhrvImqhBGzLvRHKBS7kAP77/QwKGQmU+SyQqi/gr72evvgMU+Ln5AGJIulQ
 wQpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qG1UfOUtzXyATzus6mp3rPciGGPK1Oyro1Dvw/jKIupL8AcQkDaVAAsakIXb/ViGfeY0/I2k4ox8=@buildroot.org
X-Gm-Message-State: AOJu0YxAbsFlLYTXBaZyl+pkcn22mC/EyQV3WTtCpcRxj2nP+JCcO9w0
 CpItfVHwvvmkuVwz1r/kOdC0YSwGKQ0OzmycZDLKtJ+dNyIjo3B88wftkzoyPlmK8Mk=
X-Gm-Gg: AeBDietSuXE+Csm7i/6pkCYnV3qg2peIqJktR0lCeIxibIEsl4K51TvYbuO9Go+9TbF
 leOkAHfy1782B5CXstpfoISBCqMFsnO1u58g0qZh+0yq9XQReHXaoGhTM7AcNK9xXYMGUEDtfMj
 /Bv5q9EhLy9G5rYxqndW2540zItBZgko7Ts4AND9ZXfDXvaiu/+MztJUZsv24BdHgw+4ensyh2N
 oqbJ4RKn7eFjRZkeNuTfi+wDps0aWf8tHUxWC9MVcIw8da4uH0Ew+15HTQg5yp2zoc5jzZJuyGs
 mR+E7hvJNF0CRL6Jelv7+xyOFMMAiD+Ib4O4qTdXt1C4vR6f9rfziNvAjdgj9sNu7aqH82xeKqX
 IjUgMgxS4PQcU7nQe0ec4ZLBBlQmjzIqoxiVYz3h55lWixdDeaNWc4x28Fr9OGFo/3uJj3fITXU
 y04lto+A9r3XncNftG9Q5EGY/lGQ==
X-Received: by 2002:a05:6000:2512:b0:43d:77e1:6a66 with SMTP id
 ffacd0b85a97d-44bb33f1d66mr16673207f8f.8.1777906030725; 
 Mon, 04 May 2026 07:47:10 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ef50becsm26839855f8f.11.2026.05.04.07.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:10 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:09 +0200
Message-ID: <20260504144709.8832-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260211145304.4018549-2-buildroot@heine.tech>
References: <20260211145304.4018549-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906031; x=1778510831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YbniFN+b6bJcYkzt5bIVKE4OrMMTlHLz7yGlhTNo2Ss=;
 b=ajavVRAqZoYJpGsAkLCGvyagMnVj4KxmUjocqw0EGrbrIMuyAtLKnpVlXyo3gX5YyE
 RUm1qcL0llZrUZqdbVGa7NEfkHnh9g1nICaBtLFVJ0PKUcg+64Oz2i9EjrypTWOHQLhQ
 F2tvFwJyrinDHKG2yoCWx0twIOxSzsrkBDxRwgRbZrfHCgwUjMA6yKvYLWjQjIie305B
 YyDFD7ozDO/1d7xap7S8Z3mTO4cGY2KAi46dYdpEFDMrTIZYXPGWERYaLgmwV76EUJs7
 B5KPcNTaTaHTmEAAuvC2UfELgid70wlMC1NUHMkN2QdUGAF0nnTcqKMagk12bDYW7JLj
 Haew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ajavVRAq
Subject: Re: [Buildroot] [PATCH] package/log4cxx: bump to version 1.6.1
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
> Changelog:
> https://logging.apache.org/log4cxx/1.6.1/changelog.html
> 
> Remove dependency on Boost.DateTime because since Boost 1.77 it's
> not a dependency of Boost.Thread anymore and that's the only thing
> log4cxx actually requires as fallback.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x. Thanks

> ---
>  package/log4cxx/Config.in    | 1 -
>  package/log4cxx/log4cxx.hash | 4 ++--
>  package/log4cxx/log4cxx.mk   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
> index d9daf27eb6..8305217a48 100644
> --- a/package/log4cxx/Config.in
> +++ b/package/log4cxx/Config.in
> @@ -14,7 +14,6 @@ config BR2_PACKAGE_LOG4CXX
>  	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	help
>  	  Apache log4cxx is a logging framework for C++ patterned
> diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
> index d9e9af18cf..f6770e287c 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
> -sha512  0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c  apache-log4cxx-1.3.1.tar.gz
> +# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
> +sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
>  # Locally computed
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 4b85adbf92..57f9b1e844 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LOG4CXX_VERSION = 1.3.1
> +LOG4CXX_VERSION = 1.6.1
>  LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>  LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>  LOG4CXX_INSTALL_STAGING = YES
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
