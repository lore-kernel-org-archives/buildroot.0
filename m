Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69251CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D3E8461B;
	Fri, 15 May 2026 17:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gjeguAHCtb7; Fri, 15 May 2026 17:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A09845C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867170;
	bh=W6PxzhbyD3HAHMwpmy5yHkbsI7nHMM+/hzyoEsV9r9w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n6ZQpTBSp6ooGSfUCJv7DvzPqCpirMjrvA+CmO1xRNj0sYcFD1goUr/80WNrWBlZQ
	 dE9wOJwK8KWPRtN2Tw567ToWUhVyycfq+gZELQpcLICrwCYcj1H7R2HX4XLQc4iWgF
	 POXr32t+dtlxX3v7Gm6/l3xAZMrbQ2dDf3m4LBPck0QQfIkc/Z6ypP8l896SXl2Yps
	 6oevqyINJP8cd2Medm+pdxghM7p1n7Qbxplo3TpICKTh4ISPc/E5YE3gZMUeMPe4+s
	 o9S2sInfJU/dUpYidniQ/QpKCzzWZYNFJ0VyMcjIDN6ahrG47tzeLWbwWa7uKQ4hZX
	 4uHcm40YIh+dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A09845C6;
	Fri, 15 May 2026 17:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F21D945B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F1384568
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pyz_kZ0jcv-H for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41674845E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41674845E4
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41674845E4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso29710f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867163; x=1779471963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O0N/cWVaEkenBDsP7plMXAyZVS3IszJ/07EJbVCD+bA=;
 b=fobrfa4Fu/1dB2WH0U8jXiMSLsHPIv+oUJvPMDITZVBsJWy5Ig2KKENkMHzVFhH1Wr
 e12eSCy1jWlHNBXhTtbo06f3qwhCPN/S9J/JNTMq6Mo3auNpA0gjW5VrNHQqzrJlVMM/
 zZ/KOHrlgr5VaXpm+EjuVbvt/0lhhDm39+rBymVHY3O2PTCvqI5YZtrWBDtud4aVcvV1
 hEMNGcqNLhFGpK7uC2jXxJfVbn2LtkRT9brYcggHgR7lYpYl0x5K6KFuQz4PvyD21MzU
 iQ6hViobbJufR35duIHRz+bFOM8JXsqH4WFCWSK3ih9BVe4yk2sq3vGYC5pAi8tz6Mkq
 H81Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ81w53AfSXgqWvguKzrVidYwHIGaSR1vlEC2JYCwohIDnyrwD+MKBYv8N9Z+XRFiQM1JhhOTN/BaRw=@buildroot.org
X-Gm-Message-State: AOJu0YxzkGBpjUbJgJ2tpsAMImKG6tNUpif/8dURA32k1nDaSpuOsMGR
 6Sr7/q/+rN6p5635iSz9TKb0bm+WSCO2ZnR/JazVyzUYt7C0u4yUuYuLlZBTdZCwNYc=
X-Gm-Gg: Acq92OGr4NgWdkXgbbpeGsw+mr7zcc5A3uQeQR0SLMxadtfqn2XwPZxjLgASR0QHrYx
 7Q6bDA+0gAm+9fqJXibNtK3sDlABwrPOf2aWgkninxlS4yKC5DMpG8FDmgkBBGWYpvto4wv0tnm
 /SIrV34nG5AJgnW/1ucEIVhBZG8d+Gvw8+9H8ExzTy9/wgpeQ62hM6/vXny0QthjMDv/pFVCqHt
 oDLhITevkNlg5JsvYa8ql0RwDR43SdThzlcMynyS2svPLYPUXC2XdxPQFdF6i4XfdOWhoqRp1SC
 +0QfCkcmtRe330ILyBIiCf2tfmev4OK7NqSR8dWJAJ9CXuarnp3muI37uLVrOYXkWsjK/gPlGmh
 x5sDj72fBPy2IB1AaOfPbQDb9Oxk3xhIROvh5mGPS2YLNSjwQV+Br+H77PiVs0jJMfepAFnwz5p
 W7nTK3J6AjOR8/2OXr9GhUDDjHTYj3cifI4tgAl7brfo61
X-Received: by 2002:a05:6000:2011:b0:45a:d2b0:7be8 with SMTP id
 ffacd0b85a97d-45e5c589e5amr6481845f8f.14.1778867163209; 
 Fri, 15 May 2026 10:46:03 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19c2dsm16202456f8f.21.2026.05.15.10.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:03 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:02 +0200
Message-ID: <20260515174602.529473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507195049.1002469-1-peter@korsgaard.com>
References: <20260507195049.1002469-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867163; x=1779471963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0N/cWVaEkenBDsP7plMXAyZVS3IszJ/07EJbVCD+bA=;
 b=ce6QSBd/8eFXy8azPs5wAHIYqvVCBgJ+ELmPSVpR14P2YBIebT1WNAGii9/QM9mcXr
 LiMN8l0n165Vy3TixFbCUFAIHDEwW7C6dCwfk2ThzFG7/d5oaHRtAk17r1ny2ixYsrQR
 jB/L91ZEFsbJW/1ZIydm2wcenURUXPJIXP91auPzSINejIdDw6GJMo7x/A4nKOcBkZxt
 v+LlQe8lhMCEvcDY5bQYg+k/TWw0Tvh6hTAyg1fNmAg2g5kN0e7Kcu0o5/ze3b+NsV4p
 KksZN+3OdJ/rlQg9qed+jOl7mHH4EjjCMbGB+IrtWIW4TUCxBE6T0Wu/XWHYCeqcrRV1
 89NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ce6QSBd/
Subject: Re: [Buildroot] [PATCH 1/2] package/go: security bump to version
 1.26.3
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
> Fixes the following security issues:
> 
> CVE-2026-33811: net: crash when handling long CNAME response
> CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
>                 SETTINGS_MAX_FRAME_SIZE
> CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
> CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
>                 filenames
> CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
> CVE-2026-39823: html/template: bypass of meta content URL escaping causes
>                 XSS
> CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
>                 than urlmaxqueryparams parameters
> CVE-2026-39826: html/template: escaper bypass leads to XSS
> CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
>                 Windows
> CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
> CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database
> 
> go1.26.3 (released 2026-05-07) includes security fixes to the go command,
> the pack tool, and the html/template, net, net/http, net/http/httputil,
> net/mail, and syscall packages, as well as bug fixes to the go command, the
> go fix command, the compiler, the linker, the runtime, and the
> crypto/fips140, crypto/tls, go/types, and os packages.
> 
> https://go.dev/doc/devel/release#go1.26.3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.02.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 77be843c83..69f2a3139c 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
> -sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
> -sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
> -sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
> -sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
> -sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
> -sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
> +sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
> +sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
> +sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
> +sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
> +sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
> +sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
> +sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 67948dc405..ebd0d418ef 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.26.2
> +GO_VERSION = 1.26.3
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
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
