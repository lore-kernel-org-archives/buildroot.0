Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD808CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B45F8825DF;
	Fri,  5 Jun 2026 12:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omBNLrexQqWN; Fri,  5 Jun 2026 12:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72258266D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663783;
	bh=3P6dSF7SbZFHSzQatD/TARytNtr0FSmQ09eGuvFbcPs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rBcCeIlcTuzmXGINpTaPNgSwsPMgWu3zVfSy+frSUj/9mJ5PGJNSRRoScnpBPWzD+
	 8gIZqQZyWjhGDAfLzPJCc/Y064Tem9AKuTaKpZ3WtYmP7XBQRyTojaT/NNRmoQWzxC
	 PYB8IMaaog6MamzuSvTdsvNO1WKuRUBxinIZMFgTfeIDj3vnI/B9RTz/GiluVyasl0
	 +FO3EmARFUGJJrrhyeOR6nXOB/HyI8CBONQV4zH3dul2HbU++mNniw6gGOqq3WvjBA
	 e30Wvke2anVyMBTRO5p3s0tTL8TRBsEX86RsEb5TSZcguhuylYZf1cZRXcO6t6qSme
	 kvz4Q4AgMrJFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72258266D;
	Fri,  5 Jun 2026 12:49:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DC1388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4723082668
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrEfMESOtshZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BCD68261C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCD68261C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BCD68261C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso15571305e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663776; x=1781268576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vFxGWRjEzcHLd05eq2txmhVIXZO6Bua0P5bavkngYz8=;
 b=hE9s7NiCtIknb4wvFj7tyYMH/N5iiLe7d2/ZQGbQrzrrVfZAd8NN5ZDsbxkPHebv1Q
 nkmomujQH5DgstXXB8rVPy+Q1jDnkZI7Q3KO7FLhSv2H7shC9je0vF4NUAhUxZg88jqF
 wAQ3HCMOk4d5oQ8V6vnYnEy2Wr7MBXURrSdlIFE9nz0y2KFIcxRWC9W5uJ1ssz96qfbM
 n0QyGJ4U0LqsBKXoIA/FvdtS+gOL6HXA8VZ/UsZw7HZqYheBnD6bVQg1CqALeGslXUO4
 E7MnQMnP8Wix4vyGAKrewqB1q1sDMq6tfz9+sf0lOEaEkFtamngeum3sIk/vzzr9RTIh
 Yt4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jgBNqgqJIaiDkEkpK7eHnrkZOeHFna7KZoRQqB+MQgT6fZ1onzEfqaCP0Tqssb2ncbVX8Kq3olGE=@buildroot.org
X-Gm-Message-State: AOJu0YxvGtq0Zm41N3E2IU9SKYo9LcqR25PksGe9o362I+ME7t4TMA4L
 kWgEVYDu6cJPq9hB4MdPustkOnsUHAI5v5pYcJYXu3I7o282AIHGyaPDO0Ejv0w4ZF8=
X-Gm-Gg: Acq92OH8YZ4tPS5tCYM7mujO3KjZctsnv8ncNNw06n3YSq9L+duVgOUUTCl40hfjnWq
 l+fQYPXwefHQI1ETrxPAwbYKuz+lKuBxQ6IIx9AyVTARHkgVYKty0DRTmzinyGFMmNVq18/W32B
 +1hquhpCQNPg0c+9Qogon2DFEOqC0oTb9I8+z+VgWVwb3/VH48lgZyXiK1WU09Czpk67OnBSOsX
 MsWQ3sOa6Y/8xQ46UheDqjCj9b0cl6x/OqnOD5OdzAG+0v7Qp4om7Ij0Ha7mu95U7orU/x8MugW
 jlBt5AL969WpkWGdhRW+pWTeZOqNGx8u5VCi83HZUBhxwNwasuHjwNDwHZGpfu3eNkqOvVtQzjN
 FOJs/QwlYTUiDPY5d8fbO/ABWO5X2i7A+yfyYIUyo6d1lAQ0FOhj2NYWS8ua61u5Zq/pI+KNuOG
 RKCaHVouP9ltakfsDpZau9836xrw==
X-Received: by 2002:a05:600c:1d27:b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-490c25e10f9mr54655445e9.20.1780663776173; 
 Fri, 05 Jun 2026 05:49:36 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4004sm25929521f8f.9.2026.06.05.05.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:35 +0200
Message-ID: <20260605124935.271698-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530121047.637834-1-bernd@kuhls.net>
References: <20260530121047.637834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663776; x=1781268576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFxGWRjEzcHLd05eq2txmhVIXZO6Bua0P5bavkngYz8=;
 b=Ka46bvURsuISxAGOtBVbExhy3MgoSmVs0lbAznK0GQwRI0koswjOrL1PdPsKNbZY+u
 acNxbzN0ribXZssNdUucM5tFpLBDkQsDR6Y2eUtWBI7R/mJOJFNWveatSCc50pQpdojh
 Xd7fD8Dwd3l+0vi8bOhPLH4Xy4q97vgBf+TnLOZTXkSEQREBt7JuYyRc6FPjc0eQGtuH
 1QSSG0CTVdRFvdBSe4U6IWTJUHxZp/8cpvOaOF4PGA0BJpzX1yHr+AFgYdSEJjnb4RxQ
 02EhxC6lxC8c3nzY/t68BINB9EbD752jMWc7Vzg61LXuDnmwE8jHp50PBjOTrAZUhcfU
 q6zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ka46bvUR
Subject: Re: [Buildroot] [PATCH v2 1/1] package/xerces: fix build with
 recent versions of ICU
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
> Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
> bumped package/icu to version 77-1, the build of xerces with ICU
> support enabled fails:
> 
> In file included from /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/uset.h:38,
>                  from /home/bernd/buildroot/output/build/xerces-3.3.0/src/xercesc/util/regx/RangeToken.cpp:40:
> /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:55:
>  error: 'is_same_v' is not a member of 'std'; did you mean 'is_same'?
> 
> Indeed, ICU now requires C++17. Instead of using a patch from Gentoo[1]
> we use a backported upstream commit, limited to CMakeLists.txt, to raise
> the c++ version.
> 
> The build error was not recorded yet by the autobuilders but can be
> reproduced with this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XERCES=y
> BR2_PACKAGE_ICU=y
> 
> [1] https://bugs.gentoo.org/931105
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> v2: Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/986777fa7aba97eca6c0be1b669efdefaf7ea7de
> 
>  ...-C++17-C++14-or-C++11-when-available.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> 
> diff --git a/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> new file mode 100644
> index 0000000000..24f7aef6ef
> --- /dev/null
> +++ b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
> @@ -0,0 +1,32 @@
> +From 6883e346fa88f48022edf84328a09a4653b8c2fe Mon Sep 17 00:00:00 2001
> +From: Roger Leigh <rleigh@codelibre.net>
> +Date: Sat, 10 Mar 2018 21:27:27 +0000
> +Subject: [PATCH] XERCESC-2141: Enable C++17, C++14 or C++11 when available
> +
> +Upstream: https://github.com/apache/xerces-c/commit/6883e346fa88f48022edf84328a09a4653b8c2fe
> +
> +[Bernd: rebased for version 3.3.0, limited to CMakeLists.txt]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt              |   4 +-
> + configure.ac                |   9 +
> + m4/ax_cxx_compile_stdcxx.m4 | 982 ++++++++++++++++++++++++++++++++++++
> + 3 files changed, 993 insertions(+), 2 deletions(-)
> + create mode 100644 m4/ax_cxx_compile_stdcxx.m4
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4254f89bb..f5cdb55cc 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -32,9 +32,9 @@ if (POLICY CMP0067)
> + 
> + cmake_minimum_required(VERSION 3.12.0)
> + 
> +-# Try C++14, then fall back to C++11 and C++98.  Used for feature tests
> ++# Try C++17, then fall back to C++14, C++11 then C++98.  Used for feature tests
> + # for optional features.
> +-set(CMAKE_CXX_STANDARD 14)
> ++set(CMAKE_CXX_STANDARD 17)
> + 
> + # Use folders (for IDE project grouping)
> + set_property(GLOBAL PROPERTY USE_FOLDERS ON)
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
