Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E70CA0EE8
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFFE607F6;
	Thu, 14 Aug 2025 20:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rslEvFHeyUZ2; Thu, 14 Aug 2025 20:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338686081C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338686081C;
	Thu, 14 Aug 2025 20:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D78D31BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99D1404B1
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHJyBmb_uV_9 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE8D6404AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE8D6404AB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE8D6404AB
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b005a3bso6561205e9.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203537; x=1755808337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+kBAdEjpQc9JPFX5MajSwzO1b4xHCLxtdGjoFSopGE=;
 b=hnVwdp6M6MFo5g2O5sBDmQnTGWG5MW3NyU6RDKGnpSRtwMm8xqKEyQByvOM3oZ79YF
 FvStatlSalzAYMWS2o2n5A14+bvQyn6mw4j8fAjCXpI9E19yW2qJQNSihoZ5dWhsqs4B
 bkP/JMKanW+2+WJICdUAgdN3vMhvSBRWyCkb/aOBOvpaMZylWYyQ+1T4/xhMjU0+/sLv
 U/rMrioClUjiX4r7LaBABXcn01NQC/380kuIGJrBx8eAIfC5EhdhKZstRmggkSPxMMon
 MIpEyvSbN2x0CiVr86dPeRsB1jTNF4uWL7NkDHc97zj6D4fsZv6sbR2Yii+v1bHIoddz
 e1Tg==
X-Gm-Message-State: AOJu0Yyur7HNxk14nWfZgzVpimQxbft4FG4VDW3bHcVMuqn3CgM/1wJD
 6e7WzCvyORqe68ypC88BT9HyvD2F2ooEyBOaaIHkKbbPpbjviKfnktQB4n+BPmTF90cNsjo3f+T
 sTvoVapM=
X-Gm-Gg: ASbGncsDxnNzPw1uTz7D9inCwsYzJAE/MjCYAoTLXDhB9XlfuqCAbMRdg8mcmLvbZfu
 7OwDItfcCnxsJYvmpjS/yp9jkPeNYbStpzW45E7yW1dC/YLx5P+ozTgMs9Otp3OSLmjy4YlWB96
 rrPnrHCkjpFY2Q/QV4XGM32Yo6e/SBhGLVdB/7gmvf3ArA/Vf3o58SD8GCTMkpBTO/iazGMhtgQ
 pA4T8OV52wrLyEnHLlCqPQiDIpwQW5gt+iEm3gUmDNt3riquE7JTJzpf+EvxGiiQ24Q1qKWkV9z
 Ioyn6wCMr0ipVWkAslchhk2Qce+KqVhcCPpcV4WHBc0O8q60aQxt+kU/W6n9l16tKiduPklzSt6
 bmoMlOvM4BbebQA==
X-Google-Smtp-Source: AGHT+IHJm/0/rWKvUyHlo+QLaCBOS2owhJaMBaqy/zV9aMm9cMNoNGCumVZDvlnYlX4XWIDJcrwRmQ==
X-Received: by 2002:a05:600c:19ce:b0:459:dde3:1a37 with SMTP id
 5b1f17b1804b1-45a1b653f9fmr35164225e9.25.1755203536701; 
 Thu, 14 Aug 2025 13:32:16 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8ff860acbsm25670664f8f.51.2025.08.14.13.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:16 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:16 +0200
Message-ID: <20250814203216.2816915-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809210855.354805-1-thomas.perale@mind.be>
References: <20250809210855.354805-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203537; x=1755808337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+kBAdEjpQc9JPFX5MajSwzO1b4xHCLxtdGjoFSopGE=;
 b=PrWYJNb6g67bA8lPMLoP50LgjIa1a94rIdawqYJTSbOtA1KI3aZ18ZUFmKaz1K3Qiu
 VicRdeWpaZZ1XfqTxuKIYbBPeX+iK+oLIafWDGQI4H1DQucjgv3Bp2h1FCFnTVsdjneD
 vS2XBcVNvgoFHU+VVeIt+vclQiaZMCRmtUHE2wcwRMxoeIgupqhPnY58qPXwoeNvAjlz
 PIOsCuuOaitmCepduw/pSAKk94oX7AbRPQfSbMkcwCJuW5y/Peq3PfOlMQu8fpNNuYWQ
 7NA6x12Kwx1JqE8wrghj/Aw3U/yRFGLPXOSQbepztWZsmtMDGGhr7l+RD5UEtrONstBE
 kerA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PrWYJNb6
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pthreadpool: fix thread
 dependency
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
> On autobuilder config with BR2_TOOLCHAIN_HAS_THREADS not set the
> following error happens when building the pthreadpool package:
> 
> ```
> -- Looking for pthread_create in pthreads
> -- Looking for pthread_create in pthreads - not found
> -- Looking for pthread_create in pthread
> -- Looking for pthread_create in pthread - not found
> -- Check if compiler accepts -pthread
> -- Check if compiler accepts -pthread - no
> CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:233 (message):
>   Could NOT find Threads (missing: Threads_FOUND)
> Call Stack (most recent call first):
>   /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:603 (_FPHSA_FAILURE_MESSAGE)
>   /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindThreads.cmake:226 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>   CMakeLists.txt:143 (FIND_PACKAGE)
> 
> -- Configuring incomplete, errors occurred!
> ```
> 
> This can be reproduced with:
> 
> ```
> cat >.config <<EOF
> BR2_armeb=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PTHREADS_NONE=y
> BR2_PACKAGE_PTHREADPOOL=y
> EOF
> make olddefconfig
> make pthreadpool
> ```
> 
> Since the introduction of this package in [1], the dependency was not
> included. Since this package was part of the tensorflow-lite
> dependencies that required thread it was not an issue.
> 
> This patch adds BR2_TOOLCHAIN_HAS_THREADS in the dependency to avoid
> errors when built as a standalone package.
> 
> [1] f2486a6cf9 package/pthreadpool: new package
> 
> Fixes: https://autobuild.buildroot.org/results/35a/35aa100d72c6875350ad10c57f028f04052cbf79
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/pthreadpool/Config.in | 4 ++++
>  package/xnnpack/Config.in     | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
> index 194ae33f85..8d163b16de 100644
> --- a/package/pthreadpool/Config.in
> +++ b/package/pthreadpool/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_PTHREADPOOL
>  	bool "pthreadpool"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_FXDIV
>  	help
>  	  Pthreadpool is a portable and efficient thread pool
>  	  implementation.
>  
>  	  https://github.com/Maratyszcza/pthreadpool
> +
> +comment "pthreadpool needs a toolchain w/ threads"
> +	  depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
> index e4b92f61e8..794c5c47d2 100644
> --- a/package/xnnpack/Config.in
> +++ b/package/xnnpack/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_XNNPACK
>  	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo, pthreadpool
>  	select BR2_PACKAGE_CPUINFO
>  	select BR2_PACKAGE_FP16
>  	select BR2_PACKAGE_FXDIV
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
