Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2887FCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F282160621;
	Fri, 19 Sep 2025 12:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6iBZyJBrPnf; Fri, 19 Sep 2025 12:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B113610B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B113610B0;
	Fri, 19 Sep 2025 12:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BDCE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AAA3828DE
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeDg5MGtRAAt for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A36F80EFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A36F80EFE
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A36F80EFE
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:59:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso13978935e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286754; x=1758891554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84WngJjEByjuqHs+rd9zRlS66HOyeoPjpkQdDD5yUiU=;
 b=Zf7UH/a3bA3xx7PjqnBSIkKmp38MMZ2nICuO3O7SVQUQinhA7dkdMwMFS/Th0dvoUG
 o/DYLKaE8O8c3mZaxd2ZNLrNUZppPOY4dPrBlCgZEf38A6RTx3/FkPZv1/LbWPx+hc5e
 T3aZyimLpDieYpuqSP3J3vLYtWpMtLLcY1L2MuYK4UukLcuADfR/nx7HLswF1aPCH2vQ
 btNTPmzjN7qozxCWCRd2TxCKxdTAE+SYHtXDUDpFzMQTPmx9hjNqcNP3IfICFiSisCLM
 aITXxTZm5xO8QdugMwXe4BUELz4Eb/YnYjmnEdKUgnY1eSK+m91GmnicjtEBGGCOdRz8
 lBzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzxa3XRDy5hWaQJ/39dg8+U/Dzujy8lD1CcfBqJwp2W604wkyvqYYSKCVMdpDDRhj/RnbUYoQgt34=@buildroot.org
X-Gm-Message-State: AOJu0YwRHpb6/3LZvloK7yi4lCPG+40bUsbeNtLipxqIKw+NmIXfJhti
 D78fz1sT8hv4HhyQcpXyyFshMfFzwvp4YaDj1PecCljssMhSmByOoUdjnUrhAPkZnyw=
X-Gm-Gg: ASbGncvhR5jGWwjOp29ievTLphfu1qAzmzDTN0Inhp2O2FL6rhyMwqRuMinpxD10TK+
 UyZy9GqIx27WYvdKBRfcxMhEJ91HaA9FG2hWfaHILmUG8970WuypQOUQRGVbEFHF8eZPD9npkGu
 rYV7s/BzJr65ajBf6w092WJRgrdwaNUluQd7+MGc7ePQ8eq75eAgVyv6Yzu8btayTCSDEBzhcbu
 F7v1H0H9FH79BExekyEX+MNFtAn+AyeugtHXNfUH3xuZ0rGTOr5r3khg1ww6VdFrsaEo0KFkgS0
 3b2/vCrqXGEGKyOEimOsO1EIlJblh/JZMSAkDciealhKb6gpX3liUyS/hUeUHqR1gtvEzhSEk9H
 Gi/4aY1ZYlFL8dKU=
X-Google-Smtp-Source: AGHT+IHYcdMCpL+Sqzg0U8S6+u23G7jnmK/fk5sq69P6HJ3pk+NU9rjLVDccwIIBB8T1UpLUmaIXLA==
X-Received: by 2002:a05:600c:4511:b0:45d:d515:cf42 with SMTP id
 5b1f17b1804b1-467f0498c81mr27341325e9.37.1758286754057; 
 Fri, 19 Sep 2025 05:59:14 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee074121b2sm7894569f8f.27.2025.09.19.05.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:59:13 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:59:13 +0200
Message-ID: <20250919125913.138214-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909124300.3839010-1-peter@korsgaard.com>
References: <20250909124300.3839010-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286754; x=1758891554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84WngJjEByjuqHs+rd9zRlS66HOyeoPjpkQdDD5yUiU=;
 b=LmEmIM1ln4dzQdggY7azwMijz8sG9IRreX2qc1jbbuTZ8Vxki4dmGXF1cI03RT9Cp+
 M3nSK/IEZZcqZFvL5R5Tuzgp5piI9H12TF6xBZNKAvy6/gTBuEiZE++SIF4lM6PKeMv6
 Tuk9Wg2hWL0cD/QpXPTqW9DnzaeVU25dQKc7+dwmsZDrd0K7oYVtb05SzqWdP6KkkilW
 VUg9jf8fyH7c2eLhILy1sQHzI0BlNZwhbrzQutgtm/ometUlYb3WTX8i1mUVG9YvH6Es
 nRySckR7tTgVGhQyhNdpbA+9O8RyJE1Z0vobEoS3y/hgJTYkTBDpvDUtKvUcSoiluT2f
 vN2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LmEmIM1l
Subject: Re: [Buildroot] [PATCH] package/fatcat: add upstream patch to fix
 CMake 4 compatibility
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
> Add upstream patch fixing cmake 4 compatibility:
> 
> CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
>   Compatibility with CMake < 3.5 has been removed from CMake.
> 
> Fixes:
> 
>  https://autobuild.buildroot.org/results/548e662429e7cf91bd48e447345374c6734f1de7/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.05.x & 2025.08.x. Thanks

> ---
>  ...m-required-version-to-3.5-for-CMake-.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> 
> diff --git a/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> new file mode 100644
> index 0000000000..31dfedda22
> --- /dev/null
> +++ b/package/fatcat/0001-cmake-Set-minimum-required-version-to-3.5-for-CMake-.patch
> @@ -0,0 +1,40 @@
> +From 2e3476a84cbe32598d36b5506c21025b3f94eb03 Mon Sep 17 00:00:00 2001
> +From: Alper Ak <alperyasinak1@gmail.com>
> +Date: Wed, 9 Jul 2025 19:30:26 +0300
> +Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> + compatibility
> +
> +Fix:
> +
> +| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> +|   Compatibility with CMake < 3.5 has been removed from CMake.
> +|
> +|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> +|   to tell CMake that the project requires at least <min> but has been updated
> +|   to work with policies introduced by <max> or earlier.
> +|
> +|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> +|
> +|
> +| -- Configuring incomplete, errors occurred!
> +
> +Upstream: https://github.com/Gregwar/fatcat/commit/2e3476a84cbe32598d36b5506c21025b3f94eb03
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d6a2649..8f3eadc 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 2.8)
> ++cmake_minimum_required(VERSION 3.5)
> + project(fatcat)
> + 
> + OPTION(DEFINE_WIN "Compiling windows" OFF)
> +-- 
> +2.39.5
> +
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
