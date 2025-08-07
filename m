Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D62BC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6716940447;
	Thu,  7 Aug 2025 18:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMqUYFXX5F-m; Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2765E405C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2765E405C3;
	Thu,  7 Aug 2025 18:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D96C4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B31440560
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkyKWyd9HGKd for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 334E340565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 334E340565
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 334E340565
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so1061855f8f.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591066; x=1755195866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kiTkXsTzyuVeCzw8cbyGzWv1t/oqJD/SA7ifispkaI=;
 b=Rp0hqNB5M8rMiO1V86FkLMCK03JqYnjHOm2nwMKEnH0rFgwx9WzY/JWsbEFUHDrME+
 k/m8efgpXieeTPMf8s7Yd60VxkYajQgvd8Mj63D31JaKFiL4zsfrdPTx3AnIUKpZ5WWM
 CUMilg0kgl4Ol+omVLW3quHJhhFluggvdMLLpUl0Y03ZifwRZhJHIb+nLGt0bMC9cQmG
 VuqB8u76qjBuFKCDlBxh5fA+Bo8vhbz2CjApVIAfo0ZFK715v2yi7xH8iz8+dXzW35c+
 24EtqfdCy64GOpTWuHx0JCd0frAJ8beLs0OnMfJ5LIJw4sBk38xCq0/iEu9tLeHLI0Xl
 qcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR4nG+F5qCQM2EgVhSPXszOMkKqZQ8A+hyQ+R9dt9ssQJzve856cKwBK4tGd5GcNcLY8cKXv4coeM=@buildroot.org
X-Gm-Message-State: AOJu0YxP7WP+M9MIctPbmt/rBNI0r+bynMTKFfDaSZ3QkhkhTPbQNC48
 u84j5iSdpji7tQ918QoTpv9SxIi/jBpIFxOc5Sd8ul8w9CNmYIYehRwDT6MZFFrkYus=
X-Gm-Gg: ASbGncuC5tiO6wQnZD9FP8lU/PYLPyu5gEXSdQjknoPL8fGEfIXMuDX8BiroL2uFnqC
 /ukxEICLhrI+weaF4J0KYwF4Gi2pxjvknsY+SEkSdXLNnI3vU0xLnxqCAMJ1+LyS3VcfYYeOgqj
 Bc8HZnU83S3WhyLOzMQChG1zmvINPuLeVrjda3TnbbsGmj9QkFKTjTExI5c89fTkovuzNnpEeaS
 4pzNH3fvXtceEp8LbUTFAQDEyy9INqhOmyKyJeiypOMF+RiSJDpqJByhF6Fs9OprFe1mbKhdkh6
 UiUHgKf/O0QWWrDUC30giW5NLmUgdRZNRUe6x5E5LuDg1LRIPBtIFhhq0BFbir22xwZY2xnh9iT
 aSWu8/97UV3kIzw==
X-Google-Smtp-Source: AGHT+IHCBHbJu77bxGedNjJmnr7f30YGO8UXOLtEFn4vZPWKOYwCaBlNg4M8/6uKwrGpoBsIax0BMQ==
X-Received: by 2002:a05:6000:24c3:b0:3b8:d4c5:686f with SMTP id
 ffacd0b85a97d-3b900b83c71mr173092f8f.39.1754591066158; 
 Thu, 07 Aug 2025 11:24:26 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm28765185f8f.8.2025.08.07.11.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:25 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:25 +0200
Message-ID: <20250807182425.725341-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725174251.114514-1-bernd@kuhls.net>
References: <20250725174251.114514-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591066; x=1755195866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kiTkXsTzyuVeCzw8cbyGzWv1t/oqJD/SA7ifispkaI=;
 b=DYDhtj7qQaZKlUgP66VS1apymgPumMUNAxRMFoQivEsLMR0rE0Zed7h+Xj2/ujxq9Z
 yEb8Nva7DViX7M9i8iUr9tNizSRlXXSlDK7Poy5hnfVJ+7omP327k9+1WARDX0k8t3yq
 7+SE5KROTZNYokZv5FMpSRs2Kt3Uy/Xdodq42XfWhhCJ9h2Q4SoYsAPh997t/ok3vGkR
 Hf90AZHcWe7J+Ttxt4aFsOVv2zSNs+SNxCB41ZB6+lp54sPg6plFvREuRP4myBnBf1Ga
 EsWJWFFN1m+6tbM7OKEc2a6uFRglpc8sZvI5139xwoOGgY0GoSKg48lqurqPkB40gYur
 l2qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DYDhtj7q
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.65
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
> Fixes CVE-2025-54090: https://downloads.apache.org/httpd/CHANGES_2.4.65
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 748be01de7..ca9d1580ad 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.apache.org/httpd/httpd-2.4.64.tar.bz2.{sha256,sha512}
> -sha256  120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29  httpd-2.4.64.tar.bz2
> -sha512  299cb0d87a7e0e0a99d22bba7349b6b07c69222897410f9670af29896288d1f4e1da81d22ac9e1d8d6ea096e88044ab1dd34555b40a4b1b1cb3fd4b1d1897a7a  httpd-2.4.64.tar.bz2
> +# From https://downloads.apache.org/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
> +sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
> +sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 7e9fb522b5..cb029274c5 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.64
> +APACHE_VERSION = 2.4.65
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://dlcdn.apache.org/httpd
>  APACHE_LICENSE = Apache-2.0
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
