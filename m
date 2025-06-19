Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDABC7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B5D80647;
	Thu, 19 Jun 2025 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onSxkJZ117R3; Thu, 19 Jun 2025 13:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096638063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096638063A;
	Thu, 19 Jun 2025 13:52:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B9816B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E27540203
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKsVi_6yqbbE for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 594CB4005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594CB4005D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 594CB4005D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:52 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so834999f8f.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341170; x=1750945970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZhinPeqh4JaKE7nQsqIXMZHYnHgIdD6mcW4lNBZBihA=;
 b=iZfNioGk2TGEt2yOrEuV8MugbF8gT29ffESVbv9cUiq0nPae1Ih+g0dx2DwTrzS+qn
 hLS/7adHewfIXsQJb/YVaJ4pJCiVFyDGKR/PO9xf7b6iR8OLaVkurZZ5EKcvU56NDILC
 bNX9zFWUY6oIOZmQOYbLmBbbIeLvVaAoSnqk4RTvUIjNTwi/wDv9+MOYiZByHu5LB8w3
 tdc7T7KwfrnC++oUNGP579TtHZSm7VCuu3nd0RjAPJbNMXXIQknFgb7N01a3Nc2en63E
 C7RhjNc8WUmjMcVpAcMOVkhfJPMGJJxrmTzIpE+hPMJZQ5quQQ2TVVrVuI8F6QMk6ICL
 0CIA==
X-Gm-Message-State: AOJu0YyszUQ1SwiBBs3Nw08n1ByGV66aj3vg3euwlumR5hJEexm3bbPP
 a8sKYFnVMzwwi/uZKTgdVO6y5Qw2ilJSDWAYp3OI8KqQ4DS5I7M1+U7HwgXIz9qb8wnM8ggQj6X
 lrdCO
X-Gm-Gg: ASbGnctAnKNIxAaqw1OZiwmOMxU40D+VYjZDFaAuGDD9p1U+U26xIP4ZxQSbILlG52K
 InYF/zWDgAwdBEyWe8ulg0MyQ2P+8Mzu2+1Mal7rDNMm2rbhcApjwPM7GD6jAQ8uMeaBAIIsK9/
 ABL7PfRGQFP94yT9DHTItBRQvJAMwTT/E9FVLt0lmswz+LIAi1lg5sobRe2z/DwB0kb8QyJ3E3r
 239oDJM/3PQdLiix/h1R4RyJvJGMYPMDEvJsl9/dzY67blhmzWBckK4s2h3AIuqCmdLtv4malK5
 Aes15KNEGV3N22FbY83kS2tFoxqQvKxSZuEwW3wPezuRIrncQm5OK1adnD0iM+VyZEFCvRSt2BV
 i
X-Google-Smtp-Source: AGHT+IHxzxTAz3quAElyTiJ2Ebtw5YIaFcg1QuyIrH5kqpeOhD/UTlOA+XVJljwlxoTGzf1kK0B59A==
X-Received: by 2002:a5d:64c5:0:b0:3a5:24a9:a5d3 with SMTP id
 ffacd0b85a97d-3a5723747b5mr16077523f8f.17.1750341170064; 
 Thu, 19 Jun 2025 06:52:50 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e98b549sm29272325e9.19.2025.06.19.06.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:52:49 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:52:41 +0200
Message-ID: <20250619135241.405729-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341170; x=1750945970; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhinPeqh4JaKE7nQsqIXMZHYnHgIdD6mcW4lNBZBihA=;
 b=LV6yhwhCMVRRV7TatGp8MuslDwynVT1p2gLyGSbU4nHGKmmCClzpwDRKXyJ5yR9+Ua
 nFfpj0xzr6cKoOzP088X9BE0zGkxSXhLxFpcscxIopxsLz8tGEDp7MFuQAcsbVsC2DYv
 q3K2p2rg7hkArVrMNyIJPxK7tmOqMmmD1MLJRW1xRii84tCWh0Fb6mWgn99dDLfXs/0d
 j8kPWX6u3AhWBUwqQ8KworYnXt8vn3hvPcONh5SB85zWFnHbYSAx/BUWgjtbVZ5+mguj
 J42RV0GRfnU+TorpgV4srjwEs4b5wevb5HnXz1aajz44SDSE+baPDioIN5vJthvs6XRo
 9PFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LV6yhwhC
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{12,
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ddd6515446..ef81474ffc 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.14.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.14.11" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index b69793bf63..c6b3bb7ee1 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,6 +1,6 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
> -sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
> +sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
> +sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
>  sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
>  sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index efe50f98df..e2dc5f8075 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -445,8 +445,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
>  	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
>  	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.32"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.14.10"	if BR2_KERNEL_HEADERS_6_14
> +	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
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
