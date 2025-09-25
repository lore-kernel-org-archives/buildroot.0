Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E78CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D65D6153A;
	Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B81HcrsUy4qw; Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8440861538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8440861538;
	Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A1BC12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4647A41196
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBeQJv7YajTb for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7662411E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7662411E7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7662411E7
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso8661035e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831400; x=1759436200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A8vBHaIYk6mCK7e7s2CiJFOoHPomwMMgrxjXzjtXGTw=;
 b=WqlnOvV4/4/0Lp2aklAQd1Q3DsOmohSGR/MI3Rh0mM0nz3RKpRScnn1yv1G597s2X7
 mzZa2R2zwQVpiLjyc823DzwkdNf5EZppcFyFIDdsjmDyCRvtXPhaxXqFG7tI6pJfx+hY
 oHA/CFibgoeYZn2S7ZVVyz+k/7R17bM5YMqpzyda3EoRNN7HnURgDsVTvxIPzamC3ZPH
 1ARB20OqtyUI3nvURnT7Q5W4QWvpehFFd22QUAu1M5/sqCWxBnyBwx1QHf7mPWFK8YwC
 dM7088jEaDs6xtOcNwXU+RKpL23it9jSihxYuIqx1oc+5c/PhAl49X/D2SToBbgV2f7N
 FK5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGktNMqpuA9txuCuha1HUaK9EqVlGzCqCko3smucuZakKMj1XYHKDFb2pImctktzaaUj1KSfrwuTc=@buildroot.org
X-Gm-Message-State: AOJu0YzHNUmm73aLSGDq8KYdan/l0BTQN/yvdp6hSOQIR2P9lInOonMg
 bYQfJIQ/fqus8g2Gobe1fdkQWZeCoouz8SzVnKYjGGfl05UTw1aBL4X+Y1YVdtvNM8c=
X-Gm-Gg: ASbGnctlLp5TAZ0GWm86nS+6wtaVOwxG1jrvsb0SoOL/JnUnLixoNtiqISSe30srFJA
 Norig6m1xXyf9dm/6puZx7QyJAYjabx8XLZEq27V4Vf5CE9xuIaKxIRZkNGKmBSvbkG0iatm834
 L482rsWa+++hYZvE3+wBxl56GZyhG9tXfBrEnmQJX5sPkdXgISdcrL+4nGvvIGbPaQ0nZNgi/Ln
 mabZ6JsNcimYLhHzRdt7v8yFMGF/q/pnqqJieyq1MfR0opWXfEpeMP+O8+wPHeCAGHTLOKf6Szp
 hO844K55DSgasJQZkgjOGTA6ZE7hFx8ZPLVqfdUoc341auq98O95JFe2huEA0iVlEkewK81leP3
 TmZhQtEw+DeRiVeY=
X-Google-Smtp-Source: AGHT+IFAP7/GyjUYGxR5CBpLnyG32REpG92ylE8w+wwEJaFZUmnPILMW3geUUG1DUsd4sSPWyd/H7g==
X-Received: by 2002:a05:600c:4511:b0:46e:1d07:5cac with SMTP id
 5b1f17b1804b1-46e3292451amr49060035e9.0.1758831399673; 
 Thu, 25 Sep 2025 13:16:39 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31ea3sm87505185e9.12.2025.09.25.13.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:39 -0700 (PDT)
To: yegorslists@googlemail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:38 +0200
Message-ID: <20250925201638.43126-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250914210811.489994-1-yegorslists@googlemail.com>
References: <20250914210811.489994-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831400; x=1759436200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8vBHaIYk6mCK7e7s2CiJFOoHPomwMMgrxjXzjtXGTw=;
 b=e1h+/4WGsdhyrjdMG1eB8EJxUogBQHtgd34wMO+T3vc3SV/zt92dVRXeDjdQOqqjr9
 5nYE0JxZqahi3gGd9WugyGNTIRXXdsVAEye4kFXRaDjDDnUOyh9DDcVi38e/pxoyvNkQ
 mzWBklRUCV+w25VZx4/8TKiYi5ZeC2kKi3MyCVEsaxHLrnWlK0Y8nh/k6gY7CzjtFESK
 HOgU8KNqAKCR6ckivhlfCfRC2c3S/rlLYpTeWQUtN16cqUpfZs8LHEpRRdKVs28JldtE
 fq9ee6ik9i/ZvSks/JeL/jXG/cw3X//BiQxNxG6GEq9APobqHG+2MikMSUI50wkZ8yA3
 XREw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=e1h+/4WG
Subject: Re: [Buildroot] [PATCH] package/libxmlrpc: add BR2_USE_MMU
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
> Build fails with:
> server.c: In function 'ServerDaemonize':
> server.c:1590:13: error: implicit declaration of function 'fork'
> [-Wimplicit-function-declaration]
>  1590 |     switch (fork()) {
>       |             ^~~~
> 
> Hence, add BR2_USE_MMU to avoid building with toolchains without MMU
> support.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10464159f2a9ff41ea0921a45ce12ecd0fa50ae7/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/libxmlrpc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
> index 33d512328e..fa1b1674da 100644
> --- a/package/libxmlrpc/Config.in
> +++ b/package/libxmlrpc/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBXMLRPC
>  	bool "libxmlrpc"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBCURL
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  XML-RPC is a quick-and-easy way to make procedure calls over
>  	  the Internet. It converts the procedure call into an XML
> @@ -24,4 +25,5 @@ comment "cli tool needs a toolchain w/ dynamic library"
>  endif # BR2_PACKAGE_LIBXMLRPC
>  
>  comment "libxmlrpc needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
