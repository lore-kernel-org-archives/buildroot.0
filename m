Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F3FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830486152E;
	Fri, 29 May 2026 08:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0Y2KKuS-JJF; Fri, 29 May 2026 08:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E316153B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043369;
	bh=nNlVGJpAoaoUddiSYBsCHWbK+O58BZHssgVadBNRqm8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R5tFMsibVndEssg7KL1Qx08qw/9y9kgGfIYD7AIBIncsMJK2yB8Iu7F0MUFr82svs
	 UEdX77JvZswIVTa25CSHnO5awJsvDcmxLRTEQKvEee2rKaKaqXIqPoC81MkdbTq7y9
	 4AIfym6dAEul57XnNNXDuyWvEhVfnx2KaX9U4hEHreUOzqJuEYe9DMKljgEe4R2/46
	 4kJYhsmGPvpcqm40RtLajEfHDi2oh4iKKGf7i4zX+5rJb/O145a+KRcnt8TjZRujWN
	 tAq5QzDd0VTfH/vgTh45o1AJ/1WhUhxj4rnTJh3oyV4bwZek5XOoKDIGQMW1+uq2jr
	 pHXVGqnti6yDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E316153B;
	Fri, 29 May 2026 08:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3455288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D3E4070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5jF-wVuNaNy for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98F24406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F24406F3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F24406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso21326595e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043360; x=1780648160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hu4yCWt9kjv4s31Tq1NxTOClI/hIF5tJASCuS3Ntlpg=;
 b=X3idchGmpINDV/BMD07wkaHSWJo5sUk8rn8VkxBgQku293XNemFCh4ySYoNvpy50Cl
 5sJX+dkZ4F8RNXqRyYQ9WRzz2qY5qmIUoEDouBzjj1Bu4NpEOBVQ4pu996QZ8eMiyotf
 heDi+qCkroC7IPWDnu7am+4YxqDukU6tYr8MGhhcOBdKuqnPrGRGCR0xriAhVFhOWSor
 ER9ddWEmRnnYP+VuHNX/UUpfOZPVSYknzecrqaEmCMdYTctMhAn285wAuCGwYLaxENjT
 4sptZVHcuR/QD1Y2lYQlB0P2LaEf1Pv4jkuS4sMj0DMEC+kEjGPv+qrQv2eHtIe8Sdog
 LtiQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8njkCwgM33EM81a2o1PtKI2UtOmqyhOknsDavPHVAeofL0FmcNXvBQwIp9W4nIzZybdJNvgOi4dG0=@buildroot.org
X-Gm-Message-State: AOJu0YxOFblZOrJy1HVI7qUn5jK5ImMTI/Ow0Ptup9lMmGRgmz7OH3mf
 3enFqcTBLj0lYRX6vnI4sqy/kFg7sRRL05vbjHOSXEv0DPx+G6AJGQVUa/+UZYhSy/s=
X-Gm-Gg: Acq92OFxt6mpX9FqXNhwAsm7Juv1J6JkXYVlEW+vlM57/vrJipYXWAyRCXtqQ07iH3r
 GNRkHu4JZvoI3jCOPBsctVEOqnNoHZYXCRoQ6QONggmnNp78nuE73WtDcO4NgVcL/Vhr/BntQYR
 0vMd9OXDXgwdfF+OM38hAOZn98GScS7dEqNjN+Vxm85Nr8OYITUOBHY/1LGvVlF93u8NlXwCbPB
 1giPKKHt+FrY/QIchu3/Z/4p22+BUOBOoBOAjM0BxdPZ/Q2DB+58u87kYg9/+4GfM+SnaDpOyTl
 Yu3Br1qYiQ2bVWKiBS0HdTRYq+qSDnO9IJRK9Kp3Oqmh2XYBZbxraun+OpddurrAD14eey+qUf3
 2B1EMp+3jhAJw+gbVwOFHjFsF+n3TQLK+WX0UQUeslc6x0g98G6kgNEtfCgPvdNyUVGjMFztY4s
 dJjU5zK45vUC1fEugyTjnQXoap/jXWowJcVgXvjIsb+mbR58AWxEXBee/LEw==
X-Received: by 2002:a05:600c:c059:20b0:490:4f07:6d15 with SMTP id
 5b1f17b1804b1-4909c0a8741mr23771415e9.17.1780043360425; 
 Fri, 29 May 2026 01:29:20 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb4acsm22151895e9.9.2026.05.29.01.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:20 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:19 +0200
Message-ID: <20260529082919.57410-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507195049.1002469-1-peter@korsgaard.com>
References: <20260507195049.1002469-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043360; x=1780648160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hu4yCWt9kjv4s31Tq1NxTOClI/hIF5tJASCuS3Ntlpg=;
 b=IlsnyKte4jaQWnBDOwncChMGZ5VrgaYhg7itTG6fPYiAhN9paanATtay0szIxxIF9X
 AU9U+68DJrKswWddMq+jdQrOLwd+e90P113c3U49huE9tcgRuKBSisL7ahUr+4R9Yjpq
 zsOAf4DSSxWUHy9RGL/PrG7wy5dL+xAZEkvq6pPKkXI3oqugVzGmW381RJDmw43l+lWP
 fSvhUs2nnhFM7biIdWn0oYtgaFhUmvnuue6maAx4+axjda1w+sSRLvjw5l1i1rX+2vyC
 vz8YeWrvJyJdcHdJA8Qrtz4SsvgFICH/a3YcNWxOe4efy7H/9VmgZI+XAjiPATa7OD/e
 ZA4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IlsnyKte
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

Applied to 2025.02.x. Thanks

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
