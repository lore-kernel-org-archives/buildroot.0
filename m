Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C45CF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60854815D7;
	Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNkaG8iKkKRZ; Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55AE81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439505;
	bh=jJVZPbVTfOC1wwMd0zRxtiJhS/3TY8qZozW/aTPHpHg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bTjmb9rEVZIffjbH7ygp4/Zpdm8FWqQja64wzp8Vs4wimK76UlEOnLHkfu1HJbxk4
	 //hlMbScjYOj+8dSDj2xH1H/RWVEvMHNXAuG3ZyLbrmAuFA96L4oToU3O8TlmBLo8j
	 JyIVrxTvwan9qMmiasrxLjQaUTpew4mhQL1W7a35USwkkW7Bv18CzY2i3ftxg77IUw
	 ap0K/Oa6aQR6rzTmKs7MFsLcGbrgJ0MGUl55flhWoJJpBS1JbUF4097OQ8LgRPx6pj
	 3HmCK0Xvp6zLCpHoxQBP+0DrwBGA2QIyK+zZB6yOcmYwW5EoJmvmWr+xpzzRqm9NyK
	 W+9kEap4RVy9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55AE81678;
	Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1354C259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE34381399
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b20aFW9CwmS8 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3F628134D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F628134D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3F628134D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso8864925e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439498; x=1777044298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T6Aprni+6jjaDfXKnCfN/b6TgFCoJmA2JQ0Sb88hBKg=;
 b=rbsseppMQ+OjtiPmfEKrCi9JtZzj13aeEWXQgXuLM6eG4D0pnT3CIfI8GgsbtYKw/L
 tkZi/72/9SmLrs+mVSksOLT42OyfrRqDzCcin8ayE04xcG5YFfOwziiaB1u4r8ymbhO8
 ZgAeMiE2l5uFnFsuA6j780iV3WU5w8Fx4pHWmsxSj7p1DQ1JLYZAUzXk4SnH2f2weniF
 f8nIDkUmxTAqU7AuBIQUNSdSKMv+ygeJRgN1Lzw4bQF+ApuAoHhIBFO67avswDv1nCT4
 Ua8CZJsVQZxBA6deyDgsjrYisWTT6r8y6dGYRb3npFLcbciIxyCYiUqSg/f3PSNtKYMx
 x/QA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xdsPFxkGh6F++t38neAfOB7K+TSjK0e4r5VMDECAPWb78/+UXY/gfrJadbS7rlkS526fPi+zvSYg=@buildroot.org
X-Gm-Message-State: AOJu0YwS9HzTo0EnyJ9Cjw1JElS1L+cfjiu65jCxPe6oFLTFOkUQjZFs
 K84ZqqXauAfqlqku0/rdcrhCeT0nss5n+SI6PGYQVqkMGktKZHeHYiBWILyr7jBPYCs=
X-Gm-Gg: AeBDietJ4ibCcaR6z0jfxmDFrzkZbIVpEtaE3jeaOBcndmShQ9Bqp8qec1E9bxqdD/v
 5lrmqeH1l1thDa6IJjJ/RJ68tpHzTcXQMOBG3IXn8RqnP07JaH3JCdn8dCwJ/9ZqMtcF7o5QvWu
 Ex/O/G6x/xadx5NcPu08lZPqVK9cSPj/DR1OvI5TzmoTdTwBXWxoU0nsgFO26jJkK7r9KJx2425
 FhRokrTdMzHCMr37H2tkonTfBBz0W8YSWBVeIrR11fwjub7xKL7d62S10APN5n7fxufCqBuqr5S
 7t+rTIde2SlHyay5vN1vajgllWdu4UXL8HH5LALG9vfAJccJs5V8LRA+4Rj8VNdVRGmbFdBB/F6
 Q/ojLluOw+zAWpGWb3LaP82mMr5cUd/f7DpNNi81H3fFBOdczCZlO01FrOegJZh+KvMtTeURsFY
 wYO2fQsL8G3N9z/zRRfeTFC8ZltKI=
X-Received: by 2002:a05:600c:8b68:b0:488:7f69:4abf with SMTP id
 5b1f17b1804b1-488fb75405fmr50986905e9.12.1776439497779; 
 Fri, 17 Apr 2026 08:24:57 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc16f93dsm73285195e9.3.2026.04.17.08.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:57 -0700 (PDT)
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:57 +0200
Message-ID: <20260417152457.313506-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410043308.42434-1-christian@aperture.us>
References: <20260410043308.42434-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439498; x=1777044298; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6Aprni+6jjaDfXKnCfN/b6TgFCoJmA2JQ0Sb88hBKg=;
 b=GCU9kakL3H8VYRu/p2+MzaTFN45ZXs1tRsZZ+Fs0KARsd+4pWgwyZP7e/J1ab4civr
 3rMmcXcSigoxGZfJ5+bor4774zYbLpncU+KWtfJY4kntAIXg/b7Etl5jxR8NTp0aM79j
 k+HqQ8I5myno0V2rFJTz5X7deXOMaZCEj2AeWL9KNjZyxNZc0Gy3FXCINXYvolKi2Yo5
 gt2vCFq8bzJBIwRY2blRK4VKDV0XvYOC43lwpFKPJe2UpGTTnh6e2gNqBB3QOs1+pSSg
 QnjhSIAesKD17QOjxDQ7E10xmDYs3nJh9BOV+FN8IXNyYErpGAfXLeQj225PnyVOgcY8
 ub3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GCU9kakL
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

Applied to 2026.02.x. Thanks

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
