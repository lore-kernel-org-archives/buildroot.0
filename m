Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01D1CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C823061068;
	Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKO0COCcSdIf; Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00E3961046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E3961046;
	Fri, 19 Sep 2025 12:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CF7D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745F76104C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zv9IIaPDXAQV for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66271610AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66271610AA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66271610AA
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45decc9e83eso20957005e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286588; x=1758891388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ln5dsCj0Jm/VCYrNfGhcqZLvxbuknVTjURJi0yuMdFU=;
 b=hCW6ffcBNc5hN7qt3HKyErhDOTl1LUFcln8L424Quui3YgxI1+HQU01eMgbJP9mfvP
 p8k0B1tnmgquejRCPZVgISkFkZtYSa5M5ltwo+yFO7tf5nDqy2LNT5qjfWc0J57SYynz
 O4xJkyeRkhik6AT4xJAz2+Sp/STU7oPERsfnyCZD5HglMYSP3q1cKNFcropP7X+XJDvK
 bNkvXl3r+Nwdnyvn9pKlOj9qEipJXBykNWyMjHi5Gae3uIutnSnRPdI+CTh4d6OmZhpf
 +Mf1R8OfFPJ45P87OTM72W9cQEq2/z58I/gIjh8tMIiMB59rjOXLbsDlMNNJ3Z+2XeOc
 3piA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqHrHJdnOrGbIDDVoJEvFEOQVz3DhT9R30BwTRLimMoMiXPouPFf1lHUBQTIK9gNrNLqlRoSh3lYw=@buildroot.org
X-Gm-Message-State: AOJu0YwQpw8LxPBngHsf0An9R1JgserWdYSUaj+F0/QIjGFLDs96mAFV
 rXECANzJi/Wv5sNshoMxJvyStuhMqZgsL2yn2fcLkp1GK2udDYoyqx5iYhyIMPGenQwe6RZZNJB
 sWx3sYIA=
X-Gm-Gg: ASbGnct0gzX01tfmSkg/YSI8CT3S1dW4cXlDRoBHmy8MTd9XSP7D96UOdOJlvD+FYvY
 ezzYtu6kexdBBqyEXXnVWuZLdLekz9tQJMIdS/19zrZ0Uv4uEH5DEpLbw3kRw2rmUm7+Il1N4bm
 NXACQSt8MHzV4Q+IZbiVscP8uZuHEBhi7FX1oSKToeILnf0M0tlkxXN5xGxM/p1FJB0eAZMvpY8
 6Rz1fzZemppAj7FKsM6x6WLoS2zeWs56cbT4kqTnJZhGmJxKY7cpOUUl2fEvXKlfjzIALgRv3d5
 KKaRvWVTNnSvUvFGbQN3tQAgVwXvf9r89LhSce3eMpJNI9CLCUHUaH2Ca6iVFOF9MQAcUG0+bCf
 ho9L/sFnzrOyxXKU=
X-Google-Smtp-Source: AGHT+IHYskOx0Yc3N2asI0O9VxqB6Y1/tKCk8XLue4PeNhnyvdJLT9H7nh3PI2P+SIhI9p/NebwzsQ==
X-Received: by 2002:a05:600c:4e91:b0:45d:d9d1:80a3 with SMTP id
 5b1f17b1804b1-467eb603270mr28280355e9.37.1758286588394; 
 Fri, 19 Sep 2025 05:56:28 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm129125385e9.23.2025.09.19.05.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:27 +0200
Message-ID: <20250919125627.136679-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911171334.593571-3-bernd@kuhls.net>
References: <20250911171334.593571-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286588; x=1758891388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ln5dsCj0Jm/VCYrNfGhcqZLvxbuknVTjURJi0yuMdFU=;
 b=CZS8kGtIrEH+R3eIVpNErrIbpKQ1zy4vFXy0bs2SOlue9crNolQkDcEDuZnp/JWQhA
 6dvRcVAeGUxMgu/kT/JYri7leksshqMUcRSUKAEEBlzzyYxXjG1TyEMKjKln/agfZAbE
 SoufwCGxYBieOSiWtk7aoUwOeO7ceD0X7Rtp/ZkfSIBNzWjw1sC3F78K19Pi5qC3Wx0a
 PKNmMod8RymsvwHhVLRAxbo1ywF8R9ZO3rIhu+OvP0IyHy4BruSg61iuiAfzJokYoQ9p
 ZATx1DimXTeclqfCLRfTKw4+QP3wq3mX6tk+Ta13hCGbVWcfJdyYDQNqn+K8gUnQsn7J
 lJfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CZS8kGtI
Subject: Re: [Buildroot] [PATCH 3/3] package/libcurl: security bump version
 to 8.16.0
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
> Changelog: https://curl.se/ch/8.16.0.html
> 
> Fixed CVEs:
> CVE-2025-9086: https://curl.se/docs/CVE-2025-9086.html
> CVE-2025-10148: https://curl.se/docs/CVE-2025-10148.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 2e36917382..4cc4da4f26 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.15.0.tar.xz.asc
> +# https://curl.se/download/curl-8.16.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609  curl-8.15.0.tar.xz
> +sha256  40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d  curl-8.16.0.tar.xz
>  sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 1cfdda27d2..0aa88044bd 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.15.0
> +LIBCURL_VERSION = 8.16.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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
