Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF93C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47840612A7;
	Thu, 26 Jun 2025 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCFzc65yxwXQ; Thu, 26 Jun 2025 19:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 516FA61277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516FA61277;
	Thu, 26 Jun 2025 19:54:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC68B154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2176403D0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IpMIfB8lpFH for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFF8F41991
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF8F41991
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFF8F41991
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so8287215e9.3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967670; x=1751572470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8aX6nw0Lt/YbofPkdPpKas3GJ41aiJSLWLtMuO2kAYs=;
 b=hNxoINt+MvsUgws28gAgSdEPcmPWqhpJvoUWM2j7uwHJDMjset1bwquJ/4t/K+kT7i
 P1ph3mPgl/Ibzq+rVopc8Y4NorU04Z9EQi9D5aQPp5olmcO7kG3y0oQS71xvdDeoaOBo
 EJ9HWqgpugSsFLogmmd+iTNRxiESUe+bW8adauY3EVV72rpQ6SUm8rbe45MJ7hPRUj//
 bfqHLqBc3tvkCTY6d2+Gr4KA9lwcpiPokVJP0yqDmh0en8tshUwc4+SNC0JYuZNvXByg
 c+vaSQDrPzgSyRNWdhX3CnGpHtO3GsguaVMrUGJoxO1YWTKpyZD/hROaqRi1pi9gZl0Q
 YQ+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5aqpbyL0mRklUH6+tyw1RuZ9IPQHm1lPCpMdJJPKYQen5qm0iPq/ZKd9l/pK4xrThoaTIZUqsXYc=@buildroot.org
X-Gm-Message-State: AOJu0Yy9IBkPBIEhniGCocSOjcpIjkswtjezYv08EmFyvfEmbl4XNMX4
 dVe9G1StizO1wOlkBem9PCdrMhJBVTfCyPIFO+4uwee8Y+SfJXXOW3eu8zFWj0w4yaLXgcCUZxm
 W1ovT
X-Gm-Gg: ASbGncsullQitOWRGcFCigKq+YjXTYJO1gHh6oJ//dS+Lxkw387lDHuYKlMthuO4TFx
 5E4oP41wnxzoYhLCwxZMfAUVgd12Icn7+pkKo10OwrZmfARy06BtR9xs+GP/aXkNzCBOz7kEZj6
 wo/MAb5Wwf8TBuq+hG+NGE5fiB4FpYi3FiEhweTUWBuNmTgVj+daWT7Cok4MH5J75mZcrUMWrIW
 MY2kLceU2BKGoxFTzoozMAs5i2DgBfDB7SmfmRt3Rg8FXlxH21I8x9Gi044cwmvJjBHzXtllg8U
 l661AUAIzGkBA7ajvIHwPaJCON6UvbmdJTwi7ucPrx7i59B3+higU03W3Q/k3RDQzav3i9AXeV0
 Fn5Xlp+Mwpd86duajt/Z+OgOTzHwz+jA1
X-Google-Smtp-Source: AGHT+IEN0CjjJw/tGrF6bL9Q+mQbxZYCkn4FGnA0HAq1xuOd0jID2z7OEc0F9s30Y2rtKfg/Bo2VSA==
X-Received: by 2002:a05:600c:4e02:b0:43c:f70a:2af0 with SMTP id
 5b1f17b1804b1-4538ee61fd0mr7590915e9.16.1750967669867; 
 Thu, 26 Jun 2025 12:54:29 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe043sm28254285e9.26.2025.06.26.12.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:20 +0200
Message-ID: <20250626195420.15705-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617210244.1146420-1-bernd@kuhls.net>
References: <20250617210244.1146420-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967670; x=1751572470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aX6nw0Lt/YbofPkdPpKas3GJ41aiJSLWLtMuO2kAYs=;
 b=SGGqp25nDt/eNsrE3K5qWb+ieUBcF+yeWxyWWuZ0sE9JnQinugDrFJu3clcUWP13zo
 4Q6tGnnMTZ88U7SdHTtcwTQnJXmEFEuKAl1gYpuDvb4qx2x1zfmgzpisI6tsFMTqEUcd
 hU8IR5Kds19HGxvChsX+3GLxFsSt3gEQ6yuhFqJCl1KKBnPbZ+j09LmwsNGSJVREJOqW
 rPI1knAbZVHZkQ3m4Fd25DeNXvkuJNWfaEMAPxYNP6WH+EpRr7n37pi8pamVzquJ8cQu
 LjNIrn69MpGjMFmort3+zN+PFOvJjaVUDOHCuG+H1BxNghhVLVHjm4FcYU121x1L+dU9
 KRAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SGGqp25n
Subject: Re: [Buildroot] [PATCH 1/1] package/mjpg-streamer: bump version
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
> Add fix to build with cmake 4.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/mjpg-streamer/0002-cmake4.patch  | 34 ++++++++++++++++++++++++
>  package/mjpg-streamer/mjpg-streamer.hash |  2 +-
>  package/mjpg-streamer/mjpg-streamer.mk   |  2 +-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 package/mjpg-streamer/0002-cmake4.patch
> 
> diff --git a/package/mjpg-streamer/0002-cmake4.patch b/package/mjpg-streamer/0002-cmake4.patch
> new file mode 100644
> index 0000000000..ed7211ab81
> --- /dev/null
> +++ b/package/mjpg-streamer/0002-cmake4.patch
> @@ -0,0 +1,34 @@
> +From 0dd9cf8b23fa183a403794e15617237662104d1d Mon Sep 17 00:00:00 2001
> +From: Stephen L Arnold <nerdboy@gentoo.org>
> +Date: Mon, 29 Nov 2021 18:13:34 -0800
> +Subject: [PATCH] fix: update cmake build, fix install, add simple test and
> + versioning
> +
> +Signed-off-by: Stephen L Arnold <nerdboy@gentoo.org>
> +
> +Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/333
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[Bernd:
> + ported cmake version bump from upstream PR to fix build with cmake 4.x]
> +---
> + mjpg-streamer-experimental/CMakeLists.txt     | 102 +++++++++++++-----
> + mjpg-streamer-experimental/Makefile           |  15 +--
> + .../cmake/FindGphoto2.cmake                   |  20 ++--
> + .../cmake/mjpg_streamer_utils.cmake           |  22 ++--
> + mjpg-streamer-experimental/mjpg_streamer.c    |   4 -
> + mjpg-streamer-experimental/mjpg_streamer.h    |   9 +-
> + .../plugins/input_ptp2/CMakeLists.txt         |   6 +-
> + .../plugins/output_http/CMakeLists.txt        |   2 +-
> + 8 files changed, 117 insertions(+), 63 deletions(-)
> +
> +diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
> +index cf26620e..e6e67bc7 100644
> +--- a/mjpg-streamer-experimental/CMakeLists.txt
> ++++ b/mjpg-streamer-experimental/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8.3)
> ++cmake_minimum_required(VERSION 3.10.0)
> + set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
> + 
> + project("mjpg-streamer" C)
> diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
> index 164c9b2181..9b06bfebc2 100644
> --- a/package/mjpg-streamer/mjpg-streamer.hash
> +++ b/package/mjpg-streamer/mjpg-streamer.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
> +sha256  eb4de7fed9f8b15ee6d8ca2b0417aff2854cd018582b7090e28eb0aaa19bc808  mjpg-streamer-310b29f4a94c46652b20c4b7b6e5cf24e532af39.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
> diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
> index 46f3f50104..364dfac27d 100644
> --- a/package/mjpg-streamer/mjpg-streamer.mk
> +++ b/package/mjpg-streamer/mjpg-streamer.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MJPG_STREAMER_VERSION = 5a6e0a2db163e6ae9461552b59079870d0959340
> +MJPG_STREAMER_VERSION = 310b29f4a94c46652b20c4b7b6e5cf24e532af39
>  MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
>  MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
>  MJPG_STREAMER_LICENSE = GPL-2.0+
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
