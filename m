Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D084CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BCC61C95;
	Thu, 21 Aug 2025 19:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_YLc3MG-DHu; Thu, 21 Aug 2025 19:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CBE61C7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CBE61C7A;
	Thu, 21 Aug 2025 19:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3FE1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E40E261C25
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu32nWADhd9c for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D9A661C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9A661C1B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D9A661C1B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3c4e9efb88aso673064f8f.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804084; x=1756408884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFNHgDNNqKyF9Sh61yYNuqnUCcxdsgml4aaAUK7GiFc=;
 b=MaAnusLgPxfjAmKuupxDwLmIXl9ipjMiZ5o7AnZ4FO6pN4smZLAz2ii1WIuItTkAao
 MeDXD32xRF/fGMhKPJRwPQGnXymnshxEK3R0wutxlV484W7UhN6cgVtmToQwO+2E0kUX
 IS1JeRR2A/qycCjjGqgXS2oYhvgitN4WmChewwSC2nRrQONicWUK9oQ8oqBgSrT2nXMr
 oisydFzD8+nf+LxR4WyGNBEy1k4bd6/8jdiFerqL1PkoBLmogehi2VDXzYxSzvuir/DK
 u7NF/MU3FsEqgzM9iCKtqJbA1ud5SP1A8k00F8YY35Pj+4LLFccMc1W02bZdzm5jJOf1
 798Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbx4kbTc4VZzX62beKH3c+uqqoReUFmSfy/ZXKxtRrF/xgCmPgKnJqfU6MUgMR9t4lDX7C2qJc+t0=@buildroot.org
X-Gm-Message-State: AOJu0Ywap1lnEobCqwEtxHpQp/FVbq3Ac2m5xX56jZtdIi/f9bPJOD1b
 vRKYKcHBAbgddWte30NfKfuF8MhWHjnisisW1pgi5Y+a7+7Nl4Pvis0AF+5SBorjRko=
X-Gm-Gg: ASbGncvRbxkxQJnBb1/NkDOzGcvLrsblrEEsNf4t6tsAR76T4FIo2sCuHwzW3FDLpe9
 TLLKukUyGoIOVo3W+UlXG0sTCPunhR4kAoYdhjoI37U63hostPRyMZ0efTQFIAPzqvHtaj0t01D
 aKk77braXN6Yj9B+4SRUQgWJAuD8mh+rY19kM+9qV+AAQf1J2ZVrain4yfJz4YPDzma4r358/sg
 Pqyqsof0Hm0wgjiXnCeNsKeuhuDw5OQ0Dx81WYBWGgsHSkLo1duksGac+8kB1Y0UNcU3ghMVnss
 iuo8joLpl9C2/KLkw10yGGCYfBUfOHYnju0DCWIok8ec8ektUe85n9odb1HRzA55aH6Ooh6fKa8
 bpO9UpALmsGk7Zw==
X-Google-Smtp-Source: AGHT+IGotCoeUZ/8FOsUG5sn33sN5W8vtw/ZF4RjY5d1XR7ggZMyNBm7L3Y+qURItrNCUOlOGzF28w==
X-Received: by 2002:a05:6000:40ca:b0:3b7:9c28:f846 with SMTP id
 ffacd0b85a97d-3c5ddd7f2famr110536f8f.44.1755804084175; 
 Thu, 21 Aug 2025 12:21:24 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c07487a009sm12577299f8f.11.2025.08.21.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:23 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:23 +0200
Message-ID: <20250821192123.24616-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815154631.945926-1-ju.o@free.fr>
References: <20250815154631.945926-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804084; x=1756408884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFNHgDNNqKyF9Sh61yYNuqnUCcxdsgml4aaAUK7GiFc=;
 b=VWaumD55kFeOSpe4cWz+uwulELARaeeIjOdkoNfKDmS4M6H+2f/7fgi6NA/v+leItr
 o2P9HtViXnnLuvgs5u6Wt2Qtt0nvIwt6117Yk19YhOSz5qLM50gUDtGWKY+3R4SPNho9
 VChTaQBmUW8eV15N6WYmibgTLki/xaJN2dw91GLVX0lIAc8isFBKOICJBUUD30boe1/5
 BnelJHWwIHSJCLIlG6O0+6YXB4B8tvEDCNEZmEoVldjbFMsTtVVgdhIKuOoWShm7KjNt
 VHA67tYxbmwLQmNYENgBzE/SPEDzn5E+MD6QkRvsTQuoNlJ0SvVUcACrBx/A+qtMBBp7
 /ssQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VWaumD55
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_wine: fix test
 after bootlin toolchains update
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
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the tests.package.test_wine fails to build its Kernel 6.6.27 with
> gcc 15.1.0.
> 
> This commit fixes the issue by updating the test Kernel version to
> the latest 6.6.y version (6.6.102 at the time of this commit) which
> includes the fix for gcc-15.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686766
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/package/test_wine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
> index 4e5b4a8b11..8c7b80f522 100644
> --- a/support/testing/tests/package/test_wine.py
> +++ b/support/testing/tests/package/test_wine.py
> @@ -15,7 +15,7 @@ class TestWine(infra.basetest.BRTest):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_LINUX_KERNEL=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.102"
>          BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>          BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
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
