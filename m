Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CB2CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54706153D;
	Fri, 29 May 2026 08:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DseSyyF6ozs2; Fri, 29 May 2026 08:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D662861528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043365;
	bh=Civ3Uce05ljfZ5OJfRAGWkHgodjNcAcfnHx+GWDdSvM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TbAU1fPfj0y3z4UPNmIgwAI3Wc5KjJNXy0f0KzWm0MXuXRP+Hih6Q+ntxFY41j1jJ
	 NIHgbIunOu98Dnw06jjGXmaUW7FV3oYlKUZxqqxbAFyOa8M3b0VAVGwAqsdjYiv2OL
	 KA7EBB6FwrPEPFfoN38n0oEJO1VuJQMgk9Yz6fDsU0UDCDPwdMs0MEcnT5XxD1E2e3
	 zphr3sCLZvI0M0fzn8IzeNLEiNqvLY7rBrQdKg7T+B61+bwPpPf6V+cex3I23gf/FP
	 RCN3LhQoOZECIGTX/97q6YH+N88mhBwmZVjEP0ZAqQfNeVo+4swldRWmOTy1rgF8Je
	 AL8kDQC9ACtNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D662861528;
	Fri, 29 May 2026 08:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4BF28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0934223D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9eaVx6yjkHQ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B637242221
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B637242221
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B637242221
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso46262095e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043359; x=1780648159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T3q2EnSZN0kwUSvFBnTG/sCLcfEp0M1YRlfKUQ9QPOM=;
 b=rMvnKI6mHqUTgCFbWMhZGb8VCzT/HJ7M3HqFKbXNpm2sItRUvdIr12PcSzB1SgR6sf
 tlXMQGclIm0NTzPw3JaEXq8pg3dB6JSDiuTsLuXUzT1sQLXVBlLFOGQAagGCNVwkA+dn
 wLj2RVAenDuwoiI1pUJ57UyN2qssvVQ2wCqemTsa7j/oqnMiYICcaDKvC36mZFiaaZ15
 uLmH5UwiQgVNmmlOFSRped9tdKrwIKhFN2pgACPKfXyjF7Y6+5jXgCibzOaqH94WGc7E
 FdVfZLhWlPmomvvr3TmBl09RizraKQTAfk98/0LN6NXyP+qRGIVtBMFLGZ4CSrNBS2+r
 Twqg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FkDvT/VYgTWmt/UbzcsxoVEK+SLLIpvg2ebC+EZWn3aa6/1NyUtcsk16Gs9L1okqQjHJNw1DoXa4=@buildroot.org
X-Gm-Message-State: AOJu0YxfBJVNeapUolcCXmfcsuL1sOv5Yk8kb9WEn3jOKKmhJ7ThSL1I
 33W8rjCcwd4XtWc50LsX7uGj33iCJzordG5ZXvhZk9dyR23EbNKEpNIQbtSPH3DuQQ0=
X-Gm-Gg: Acq92OHXtpl48OFxMRsYuktImFBNLx0/V+Z7w1yctO9rT9efEa1ccNX93sTd2Gk67EJ
 HMIf+EJL/RqoobioK9W5FD+ZyTLpMrQglUwhPFwWIluL9nIdKNhpET0CDSIQmN7+K+h7f1ok0no
 av7J5HP0p0CE7JkERkW/+64vk1+ICXbN3NgD4Ls2h9ndI4LnGLtZ7gu4fTLCszLrL0Urs2KD76a
 +0vov02NwD/uJRc+DYbqJTJfnS9iyisDWHZEZYlHiGRl2t3ae3+VIRLAu1d/75rKBW2rBf7boSS
 9Kb0Jbtc3UjnhQLNSV/kB42auJuo4xPDvV1AQFurMwVU1xBhfKSuFaI65dwSaUgC+NQadilN1Ek
 EUhVIa/1nQ/j3Y1UDHVEwW8wZnKlXhJiUmimhNjcz7TY0GJ8SujWl34k4kMwOQBI78PjJxBN4mf
 PGajNJ5ieqOusZb9iaMMvRibYD9uM+/XkzIgTqoHH/kJbiTFBQvvfzVJ9hjg==
X-Received: by 2002:a05:600c:c3cc:20b0:48f:d5b2:7c42 with SMTP id
 5b1f17b1804b1-4909c0b3407mr24871195e9.17.1780043358637; 
 Fri, 29 May 2026 01:29:18 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cd87sm1718542f8f.24.2026.05.29.01.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:18 -0700 (PDT)
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:17 +0200
Message-ID: <20260529082917.57298-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260410043308.42434-1-christian@aperture.us>
References: <20260410043308.42434-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043359; x=1780648159; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3q2EnSZN0kwUSvFBnTG/sCLcfEp0M1YRlfKUQ9QPOM=;
 b=Kk5feTSykshwRCoo/1gmK59utwgbZORXQvE4vMiloFp+MNdan5Mz7GhGtVZ2SM4PHR
 mypgk3Q1/eot0MJdyjqFxzStnagDGXaZJAui+K7BmKjDBKgJWn5gTfyVTOUyjyo8ohRv
 isoIddzXufG1tnyK9aIupkOHzOCN0HCd2LeEYaaf6B86aktlpKpUpFVMoU9xxgVMwwFF
 4/Ai1KjHpirC1x8SAmc4B3LKzNomI9SgPq6kh5nNNlUjYIriHpA7fTWDLo+m85F0wmSG
 5GiBHJLHBhlQJ3MgCjmcFTFDzFPvPk4P6loXGUX5scU3sT614/EP9C0bmEHb5sCChG1y
 OKGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kk5feTSy
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.26.2
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
> go1.26.2 (released 2026-04-07) includes security fixes to the go command, the
> compiler, and the archive/tar, crypto/tls, crypto/x509, html/template, and os
> packages, as well as bug fixes to the go command, the go fix command, the
> compiler, the linker, the runtime, and the net, net/http, and net/url packages.
> 
> CVE-2026-32289: html/template: JS template literal context incorrectly tracked
> CVE-2026-33810: crypto/x509: excluded DNS constraints not properly applied to wildcard domains
> CVE-2026-27144: cmd/compile: no-op interface conversion bypasses overlap checking
> CVE-2026-27143: cmd/compile: possible memory corruption after bound check elimination
> CVE-2026-32288: archive/tar: unbounded allocation when parsing old format GNU sparse map
> CVE-2026-32283: crypto/tls: multiple key update handshake messages can cause connection to deadlock
> CVE-2026-27140: cmd/go: trust layer bypass when using cgo and SWIG
> CVE-2026-32280: crypto/x509: unexpected work during chain building
> CVE-2026-32281: crypto/x509: inefficient policy validation
> 
> https://go.dev/doc/devel/release#go1.26.2
> https://github.com/golang/go/issues?q=milestone%3AGo1.26.2+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to 2025.02.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index bae223882a..77be843c83 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb  go1.26.1.src.tar.gz
> -sha256  da75d696c6b9440fe9fb6418429f29eaeee947707ee8c6ddb567c558051a1cc2  go1.26.1.linux-386.tar.gz
> -sha256  031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a  go1.26.1.linux-amd64.tar.gz
> -sha256  a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7  go1.26.1.linux-arm64.tar.gz
> -sha256  c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda  go1.26.1.linux-armv6l.tar.gz
> -sha256  f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45  go1.26.1.linux-ppc64le.tar.gz
> -sha256  60fe623ef63e6338c055ec0e0e3f4fa85c97a056de2d2f6ee38591e2bfa9cdde  go1.26.1.linux-s390x.tar.gz
> +sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
> +sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
> +sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
> +sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
> +sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
> +sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
> +sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 6c57be0ad7..67948dc405 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.26.1
> +GO_VERSION = 1.26.2
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
