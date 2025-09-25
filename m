Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAA4CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E836157A;
	Thu, 25 Sep 2025 20:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leK5IrxRtKxY; Thu, 25 Sep 2025 20:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3EB615EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3EB615EC;
	Thu, 25 Sep 2025 20:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00416177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0F94129D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xoa_DuZQILOD for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3DF940066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DF940066
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3DF940066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so7611125e9.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831425; x=1759436225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtiBFg1L+dDSAARXLQ8zzLnrzp/UGKBaaDK0Bkul6TI=;
 b=I3EzpkqEB4OHI5ywD5kJdFyBanagIeWkxdMtI7qRxk4uL+XnnlvU35U/g4zszfyTfT
 oHjwqNyX6aFAmzT3A0MUNa/siy2wubBL9WWHX5lK+V0wbPd3hjwMh62Vvqg881ZYYZcf
 s6VQjBr/AGX1+pu5jdXP+c7L1PPNmh9/IihoF1BfUlLHZw8IrYVK7Bnv+rEPpI+6aD5F
 H0W75iXdNeS3uP/39MtS3RduEUIvsUKC4sq7XVEEbVn2/n54xZ2FgX0UcSVdXMEvPKww
 MwrOg3Kd+9h00jowDBg0I6gWRsLypv5oyvU9ab5+dxd2pJP6EsctET36aaFL0x46mod0
 q1Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURAF/teySPW/koOUu5bU1VoRYBI6Z76asuQjo263aWB4gep1J0rxuW7BP0VFaUlhOT2EPljXcUkgc=@buildroot.org
X-Gm-Message-State: AOJu0YwbtNF433+DuGWoQnmALVvKTKBrLF+GxnPjsXWnfFvUdDX4BBE0
 hPlAQT4O5N1MxI8pdO9Mjyj5Cv1aLANHt93MEKYwWQfrmPufd6WMLgKE3FhLRSSZuaze1z0ZML6
 viqPgJSM=
X-Gm-Gg: ASbGncs/14CuLtcMo/95M4Yd+Jl4LDK10Q0rFv2hMhT8Rhl+z/O+9XY132mPT0oLz4C
 pGZL/dS7Q/XeD7B5MiPtYuOnkN1mybfjx86lsy8gRWw2RXAtMN48G1/eQiQSuJKRtp8WLd9qEt9
 NKpWXSUkEG6E2h1mc/TyHl/e41Y54vno6w7WCF5TdaEc1QfxnpF2pKixCVZyk2SafxxxXWhmUai
 3KSbcsz1KWU5/c14CmK8Toh1H2H63pQ4bjIhjJ8sl7YztJLr3uERz7DNsvP2uURJncipd4lvA7u
 6UC8GiV0lUU0P0Y2sXCPrmsIycl28xAXiUwiBwrh6rASlHAReMHEPQXluVeMldoIf53Y0cnJP1D
 JRQxA9WVFXGn8BUU=
X-Google-Smtp-Source: AGHT+IHJP3jJhNJkZKD8Hjf64rT3WqSCrokyGZ6RuYiSu5PDIWGo2/uzV/QZLgmCuyjryZ6FHGgYug==
X-Received: by 2002:a05:600c:4ecc:b0:46e:33ed:bca4 with SMTP id
 5b1f17b1804b1-46e33edbe6fmr37032285e9.15.1758831424832; 
 Thu, 25 Sep 2025 13:17:04 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab7d4e3sm88348835e9.23.2025.09.25.13.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:04 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:04 +0200
Message-ID: <20250925201704.44526-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921100352.2620720-2-dario.binacchi@amarulasolutions.com>
References: <20250921100352.2620720-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831425; x=1759436225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtiBFg1L+dDSAARXLQ8zzLnrzp/UGKBaaDK0Bkul6TI=;
 b=IN4+yD30uwdvBZGIJbDkzg7a/Z3GakIb/T3Ee19E1ytgF3Qjw0Qz01+Z4dYGokmjzx
 +1VJ7EubEDNGRlHZrhL45ftrAXbK7lwHLQpcvNAfzf6z/iKuV3jrWdRmnjutJCa3QveN
 J9zApHlR1ewjqxXwWFoJ1rEgq35ojuD4pWn2JpKGVQiRDMPzJawu4fyzJ7zfcdcVKErG
 X/TC9XCNA7aCAKFumHNCmySr/u4DN+ZhvVYy5U6/ee0iP0vYSUhfETHPeojbO7G8Bcgx
 koXcjYjTpRl005d5xtpQWI+kYlkchZbtRpU9XsKnnLHXGHwYrqNP/iM0RygwfB+euIH8
 8enw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IN4+yD30
Subject: Re: [Buildroot] [PATCH v2 2/2] package/atop: bump to version 2.12.0
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
> Patch 0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> was removed because it has been integrated with commit
> 631defdd22e3b6872c440d368d7acf459150eea5.
> 
> Release notes:
> https://www.atoptool.nl/downloadatop.php
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> 
> Changes v1 -> v2:
> - Bump from 2.11.1 instead of 2.11.0
> 
>  ...he-user-to-pass-additional-CFLAGS-an.patch | 32 -------------------
>  package/atop/atop.hash                        |  2 +-
>  package/atop/atop.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> 
> diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> deleted file mode 100644
> index 0fc8f142b14a..000000000000
> --- a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Mon, 5 Aug 2024 23:38:08 +0200
> -Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS and
> - LDFLAGS
> -
> -This is needed for some build systems. For example, Buildroot needs to
> -disable optimizations on some CPU architectures.
> -
> -Upstream: https://github.com/Atoptool/atop/pull/314
> -[Waldemar: rebase on top of 2.11.0]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 3a63f69..ab44eaa 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
> - PMPATHD  = /usr/lib/systemd/system-sleep
> - 
> - PKG_CONFIG ?= pkg-config
> --CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
> --LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
> -+override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
> -+override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
> - OBJMOD0  = version.o
> - OBJMOD1  = various.o  deviate.o   procdbase.o
> - OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o ifprop.o parseable.o
> diff --git a/package/atop/atop.hash b/package/atop/atop.hash
> index 8f0cb695814b..aeb9a469d7d3 100644
> --- a/package/atop/atop.hash
> +++ b/package/atop/atop.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  77650f79f9e388b6f5666dc113849894575a29bb4de21b8cd58767bf8a905154  atop-2.11.1.tar.gz
> +sha256  0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  atop-2.12.0.tar.gz
>  
>  # Hash for license file:
>  sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/atop/atop.mk b/package/atop/atop.mk
> index 155dec617747..b4a5bda52e40 100644
> --- a/package/atop/atop.mk
> +++ b/package/atop/atop.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ATOP_VERSION = 2.11.1
> +ATOP_VERSION = 2.12.0
>  ATOP_SITE = http://www.atoptool.nl/download
>  ATOP_LICENSE = GPL-2.0+
>  ATOP_LICENSE_FILES = COPYING
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
