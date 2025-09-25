Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9333CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08CE615B4;
	Thu, 25 Sep 2025 20:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kecwcw8GfVX0; Thu, 25 Sep 2025 20:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F776153B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F776153B;
	Thu, 25 Sep 2025 20:17:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 203E212D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 678456153F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6gsZoc9-yiF for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3920861525
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3920861525
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3920861525
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso8080175e9.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831413; x=1759436213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cd1ORgd9pmjv4Fi63whQH//VrgLJG5sUYglfbILlXks=;
 b=rciiSXrUmejNyVt/dTdbvZsVNnvSszFhnB7xG9EUn8D1Xxg3mxmF8k9zde8gE8kZWY
 VnbUCQ0/OhCa1ybNnrxfTpzSKv1XIbS7UhI/nLO0Ef0yH/amkXESsTsbvsw61Y4L9k09
 k93iN3tIJLvwEkJzKnE4jXimiAZvJPaOvzvPly7eoQFRBNQb3ujtudspF8u3/sqDgTGm
 NTHDFD5EoWz6ZSiGIjai+QktAmfQf7liCgR3segbf9Vv56btZ4j6PjIJEZl7+ZdMO/UE
 XuUtAIEQlEbuby4tjTgAcwUN4h6WdWy6kU3XEyf1GMgYUwndlDBfkkP/LOLmGBpZ0+4i
 CrEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt0rlDOzqO68HiaY/R2Tqh5ffmHIIJwoBRGek0HgKuBt6jRjS67hS6o76oin9zf7W/UidxZL4bD1g=@buildroot.org
X-Gm-Message-State: AOJu0Yw4Q4eoeaptJfdoOaHGIoy5ZzvR4NRc/gGSroAQas0r4aJkxyTz
 fvxw3VLk7c0Oq6hZEmdPXxYyuYUyV7FfcYoaejhBmez7p0aDxB0Z0s8s6ncYovBy+AM=
X-Gm-Gg: ASbGncsnVtKE9v7qjXZ4Nwrs3eKV4vEpd44slh6EsT9iMNBzWb6Y3tIXDyaqkzE0nOh
 rmUf6YkUaypu2evEJsS1LhKOhaJRdPlMaipWgbumbFqLLUTirK2Q0IeRSqdF6JOO2lB+0tM1qtB
 AqzWgzz3kcNLwILbhtD4QH2NgzGeVLFhglvvj5Oph1i/RPIbaEClfpwAWSyoT1qNljlNqRwP3YK
 ne/OWGdWIsp2vRwVRqzuV3Jaj0kpd3qTBw/ZMzfIJa3Uu1RK6HzVl5TcbrFWV6sAwNzf98h6cPo
 LaFirhjF4lYj8/s8btEccnLR9U+BuCg4fcQb5uPPx8lOSsrq/TxOqh/UP8Kjcm1+pcFIR1RSDEV
 5g53wUMAs1Y8GqsM=
X-Google-Smtp-Source: AGHT+IGNFYX1BYCDLk1hC0GtqTYa0IYHA9toPGURgnRqRhLeyM6Nn85S50gJKcsutrDxQZBFK63pqA==
X-Received: by 2002:a05:600c:292:b0:456:1b6f:c888 with SMTP id
 5b1f17b1804b1-46e329eaed1mr34794425e9.23.1758831413112; 
 Thu, 25 Sep 2025 13:16:53 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac55esm99349505e9.6.2025.09.25.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:52 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:52 +0200
Message-ID: <20250925201652.43855-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917151717.362991-1-titouan.christophe@mind.be>
References: <20250917151717.362991-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831413; x=1759436213; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cd1ORgd9pmjv4Fi63whQH//VrgLJG5sUYglfbILlXks=;
 b=dgRWGH+HrvZcbYDgB7DinL5iw1pAs7lBV4cjlXvSIXGbYWcEKy7F6ZaxeeHq5IVxBN
 ZIRT7ubhJFLFbIdyvWi3xOTirlvTMSBY9nqB75bPgkgfNPC7TNAVuLPaOvQqe9ITGfDW
 yFyGX8nzlXYIoVZQld4SzjwyXDD0we72n2/pvaRfX8ISQwGKOPkx3ZKWjoVmrntU18t3
 PBbTFrppT3A+pNipFarj/m4Teetxf39puMVyp47+seXubYCx4nnzO5gBZvsVpQg25yvg
 jgSLgE+o9I9pCF+oz46DFXR0TJfv9dn1gCBt7ow2LRkSSnZxthbK+6g22Vjyaa9zse/7
 U1Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dgRWGH+H
Subject: Re: [Buildroot] [PATCH] package/opencv4 (-contrib): security bump
 to v4.12.0
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
> This fixes the following vulnerability:
> - CVE-2025-53644:
>     OpenCV is an Open Source Computer Vision Library. Versions prior to
>     4.12.0 have an uninitialized pointer variable on stack that may lead
>     to arbitrary heap buffer write when reading crafted JPEG images.
>     Version 4.12.0 fixes the vulnerability.
>     https://www.cve.org/CVERecord?id=CVE-2025-53644
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/opencv4-contrib/opencv4-contrib.hash | 2 +-
>  package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
>  package/opencv4/opencv4.hash                 | 2 +-
>  package/opencv4/opencv4.mk                   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
> index b406f3d11e..dc9e810318 100644
> --- a/package/opencv4-contrib/opencv4-contrib.hash
> +++ b/package/opencv4-contrib/opencv4-contrib.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2dfc5957201de2aa785064711125af6abb2e80a64e2dc246aca4119b19687041  opencv4-contrib-4.11.0.tar.gz
> +sha256  4197722b4c5ed42b476d42e29beb29a52b6b25c34ec7b4d589c3ae5145fee98e  opencv4-contrib-4.12.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
> index 3961ca4a25..c1273237aa 100644
> --- a/package/opencv4-contrib/opencv4-contrib.mk
> +++ b/package/opencv4-contrib/opencv4-contrib.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update opencv4
> -OPENCV4_CONTRIB_VERSION = 4.11.0
> +OPENCV4_CONTRIB_VERSION = 4.12.0
>  OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
>  OPENCV4_CONTRIB_INSTALL_TARGET = NO
>  OPENCV4_CONTRIB_LICENSE = Apache-2.0
> diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
> index 6a3501b051..a39b199166 100644
> --- a/package/opencv4/opencv4.hash
> +++ b/package/opencv4/opencv4.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9a7c11f924eff5f8d8070e297b322ee68b9227e003fd600d4b8122198091665f  opencv4-4.11.0.tar.gz
> +sha256  44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d  opencv4-4.12.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index d3df1a39f7..9691eb78e8 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update opencv4-contrib
> -OPENCV4_VERSION = 4.11.0
> +OPENCV4_VERSION = 4.12.0
>  OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
>  OPENCV4_INSTALL_STAGING = YES
>  OPENCV4_LICENSE = Apache-2.0
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
