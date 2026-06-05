Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144E4CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D924B41FAD;
	Fri,  5 Jun 2026 12:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVptjRXQRhzX; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E7141F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663840;
	bh=6qwQnliG++Xu3m1to5tIucQ8x2H6ALHrDnFEO3xFKvA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bRSEMtd9nuCQxg+8z0Iwdwl0hyuVzJgU6WF1Uk1MDG4z3s813oflFyOfT+DnlwMCl
	 37zasHffS2eMzMdU62yWaErUdHi8VkrAGguB5MruVG8BON5nqGQxkISmag/mhqa7FU
	 t09X8BhqNf0zhs2zBnV4ksLt0jxfBjQ17rNYmE7proFkUDCpPahrqwlJb05ToECkS0
	 jROx4XvN3qmQTWI4nvtULjPs02rv2nwKqe78mw/v3ztoyTb5ofxBIlTNgYFSqzzuUW
	 p3uKfZRjlUGQ6/Sa/3sb6nfCrcMIICDHG8x0k2q/INDg4o+S0cWv2eibshcAlwJWLj
	 nPC9kUL0C80qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E7141F9A;
	Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FAA5388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A281610F5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPuQhIujrNho for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A48F0610E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A48F0610E1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A48F0610E1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:31 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso1127400f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663830; x=1781268630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DddxxQOQoscT7VOWjZWcLyxzYtDom0FQn6qs2H9JRKQ=;
 b=XXEusLfZglruH4QbO7+xaYTIjGhxoOGBQ4K/eP+vSuTh+u1lVSayR6OxV7Gke5X4Bj
 qItYsMur7zHo7vpiUPBBxFcB4NQCW7wtXUrQ6FfaoIwF+URKCsG1Xty3RZfdplpLI8Ej
 cm1kpi3nlh9OXo+2NSkDXxEZXcE3xMFeqabp9xLhRirL+gDVY1IYnex1/72nW7hjzCsr
 0yCe26+PVl6x0rwpVoNhh8Q6qNWLJU0MzWqBJ2wCcDTJ/FiWG2svBRaXt2NY/ix3a8RD
 LHgNMsiFN0SrRjGA9N+7L0xocY+qQOWdrzq4v6uQjOs65+KDs1HEaT94vCULKLqhAA89
 LE3A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/l5D1QGZgRX7fbmzCLpzkGm/WMRtmWTV91v27F7OSrbwx1LkShn+8oiochyqqTBkzq6xj0DaoWCjs=@buildroot.org
X-Gm-Message-State: AOJu0Yx73MewZXTkN8UqgH7Cbt8PWZFN30BT2IyMlA2Op0Xgwhoo2Pni
 95c63yZxgP+JSx5y3MwKrML+8cyN6thW5m9IWHILFuPG2RotRlbJy0n+pIZZPL5PBmY=
X-Gm-Gg: Acq92OHJJ+PEGN4mraklQiQQWJn8Orq6Et3S+rFijZmHRM3KB+33Van/almly6SKlUI
 lAXpr6dOdnky/REI5qlIZ64lz7mvvrgkZ9ZDPyHx0maRlnfFC8SAZVWOcYuSQheNppOpQzHqXPr
 byc9VHio1fb/mBOSgQtOlKWjOgTqcTqcgi1moewyik74GSCTW5KN7WcxwEW/uRXaZvoSi5OXqfO
 iqDgk2OFljaicCKbY6Xek4/O1KBC3LRqY7KJpRWCS0iEE63Z6PK+vvMMiOyAKcxwxYVt64wjEHZ
 wJeMaQkj4PXmrluzIxu83IWVA5F7D1KXAlOv8Dh2Gno0QE6b7nLGJqD3LI6hf8iBG+8A/2OMAIt
 lTtZLYPVy9pdMI5B1ESAqH0GOIL664hgmyM9fQc/iJ9hCBcnlE7fEp1zIdAxYF/T4Jp62Xrl2sS
 FullyvT1ERjD0T1BnzqrCGH4g9MA==
X-Received: by 2002:adf:f089:0:b0:45e:f381:cd7f with SMTP id
 ffacd0b85a97d-460304f09eamr4008306f8f.5.1780663829619; 
 Fri, 05 Jun 2026 05:50:29 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm25719428f8f.0.2026.06.05.05.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:28 +0200
Message-ID: <20260605125028.273589-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418215536.55054-2-bernd@kuhls.net>
References: <20260418215536.55054-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663830; x=1781268630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DddxxQOQoscT7VOWjZWcLyxzYtDom0FQn6qs2H9JRKQ=;
 b=VNpf4TMsHi8WQffj4JeerASN92c7QPs8omAbZ9qylODLARwQ5b8zgOCJUCU69oztI2
 d69vVRi3LASR7GjlXcuB2Zq3CGTA+GypTjO2jvtTB7LjzGnWkgVhh/x6nJVta8tf1Idb
 rB7lJabci4npQOKPkXUC12WXrWD9G6XBq0Ia2uKQ1gG1F+Ak4cMlhIw63ecQkFyEBK+y
 UrFavpsfJsoizfVPDj+FQHRVv1snvSP5rvA7h1l33kV06veEONjxz5NFtB4QUR5BPrl7
 SWVXaoPhUt2YSfZ3oAM/7LS1aKID2fQPyQPSOXbfsegOlMnZ96+gDrNSNZKvRoXefmjS
 HlLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VNpf4TMs
Subject: Re: [Buildroot] [PATCH 2/3] package/jemalloc: needs MMU
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
> src/pages.c:79:33: error: 'MADV_DONTNEED' undeclared (first use in this
>  function)
>    79 |         if (madvise(addr, size, MADV_DONTNEED) == 0) {
> 
> The oldest build error found in the autobuilder logs dates back to 2024:
> https://autobuild.buildroot.net/results/adf/adf52f767c92ab1db7b817094a3929f3cf918e82/
> so a backport to LTS branches should be considered.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d6a/d6a9f7ff9d29eee9d9280364f872ffaa1544f192/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/jemalloc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
> index a128b8b376..ace3dccd1e 100644
> --- a/package/jemalloc/Config.in
> +++ b/package/jemalloc/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_JEMALLOC
>  	bool "jemalloc"
>  	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # madvise()
>  	help
>  	  This library providing a malloc(3) implementation that
>  	  emphasizes fragmentation avoidance and scalable concurrency
> @@ -25,4 +26,5 @@ config BR2_PACKAGE_JEMALLOC
>  
>  comment "jemalloc needs a toolchain w/ threads"
>  	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
