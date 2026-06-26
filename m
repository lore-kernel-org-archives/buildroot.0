Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F876C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445B66107D;
	Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG3FqGDLyOGv; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F42610A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485770;
	bh=zODX7cFlvMXfceuhhnDsUn0YFXDMBPNGrAZlM2gWGCo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i+2Y4wos3y6SO3/AKmB1hojrS7BxZCSLkwlsTQ4BF8Ry15rMbKdqYGgglJtuHnQci
	 20totm8RZeSLbwSSttmBNtMe5R7WY2FVoVzgH9ZZLodPSal4cILnXppaZLce4XXvJu
	 z+/7xC8syOO7XnUH9hS0IhSDGBZ4KQ0W72Vwq3xcAHAxoxFqNgLNbqr2rAUBrnjyaE
	 zPtg6gSiyLlmlMcJQpRU0lpP7r2jlhOQxhepexX+o2+usCn8CQdSJnciTUdeecIbKG
	 dhgnj/jfIMyWHO0TfW0IAf9jFevhdwSfyO7wb2K0H8Y//ZuEIBqzgj1etffOoDdTRi
	 FKoJa9vN+RYRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F42610A7;
	Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17CF4231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F29411C3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzIDPBtUlIvd for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F344B411C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F344B411C2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F344B411C2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so7391835e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485762; x=1783090562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RwiOWPScxUdlWVSR6+8oH1LgGAW2n5EOw7EKnFnNIcg=;
 b=G0UoRMyuKAJlB7xWjUJkwdUCy2yL0cGU4QlPSH6GNioS6RrJRdS4x3idu9+PXYzWY5
 SgL7wspcO5rG3XboLwRCRVh6f+iRz/sPY9s2w3c4PGnNRXmjoedH6nMe/2vWBhmNeAaG
 38SXab9gLKZcofDENuNjEI/nFplx7tsEQAMwVV2jy0LmMOqKQ+D0evl0lS0X1yFsA6xX
 GpMx+qo7TmGfCJJYxX5VD69eKalrU/QbOUJU0xrxb+pTdxDHodIQUhQArYWM9UTO2vCn
 N+ZLULpc7G7L07fXXRsnMvX6R/RVDG882O2CBt7PrlpXnZhCuINq9IaVwP3DDoZqGvIX
 kb0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Y4LYC0M2O5u9F2uUCOCJaH5iLpK0s9vr9OR/2p1++kb9M0CRmjc8jzX7UBJeG8nWp/HFdYbYJhdM=@buildroot.org
X-Gm-Message-State: AOJu0YxzSoSwGyfyPWRq0mdVFgbdlVYcyb+vkPrun7bix5Quj8qTLQD7
 ou10r+84GFJkkxJxXrCeh1PT80Bto4jOF9TSIux5152aSzPntLjNukUymWrS2/d9KZA=
X-Gm-Gg: AfdE7ckECXdx7i6MTdGq0qsl3oAbUt4qaLMkrp9t+irANHNBTTCIlj93+CpsqTyQGOv
 LadLy2weHDEUNkoHNQF4B8f6YETKuWL0L4kio1BJlmZzugMhs8RsLMhXHUjKN4QckAcfhtVW03e
 JvXr58G9b1RznsTrD2q0aBmjj6KJxpSlJQXpe+p7hYo7Djod2WwkXrTmhJLW6WVifGhLFY8gNQU
 McENUEDdMVF2Z4pOz+u3l8fjdzmsubwnjGXFA4n7hSkWx6OIBugfr7gkZmR9BKvzq5Q5m7HNqwu
 lyhBx3XCdOwFBPhlmwmZCDwnRgBo70czIZwVaZRH4lMMS2xDvulSl1ecyFRnHQN/p9KTHvzt+kJ
 hNebSiIjKW/bfcDbu0K1SFO767jfwtbbb8R7rotqdWfG4AXJFwLGBkJBjMGMurdWudyeQtQCSJx
 HCJzGOzwpu8X4ExHw=
X-Received: by 2002:a05:600c:3b28:b0:48a:906b:14ca with SMTP id
 5b1f17b1804b1-4926687e77emr101173995e9.20.1782485761856; 
 Fri, 26 Jun 2026 07:56:01 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d93eesm24589321f8f.20.2026.06.26.07.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:01 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:01 +0200
Message-ID: <20260626145601.343585-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615202559.1465158-2-bernd@kuhls.net>
References: <20260615202559.1465158-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485762; x=1783090562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwiOWPScxUdlWVSR6+8oH1LgGAW2n5EOw7EKnFnNIcg=;
 b=bwfByDQy9jmBY0Ah9kykwOXaihj7H/inps3UwVFSKBEUO3s9fn+etrLTYUCOLCGB2Y
 kp08FchWkWvKeysgbyZ/ysyFCbBTYaTPH66/exR7enEJKxdfAkKP+MXxx5cBm784mtSm
 MtKOXPvNn+7ioGfGWMc6SRDQu8h1z6EyD59hOEY4RwpJdvXIZlJd7a0fY0Xo2YWPPl6F
 eOgFBFl3tb/yz3TfNNO4cDR2auIMawCkoouM4vNlWxTx0LaUd6x30dkpnqxxV87Aqvp7
 LuOlzeJplBEXzUWZJnFZYypCcJY0yrZWUD1Cn8WEziDONi/S7+cugphzhkjjGrASyLWG
 oQ8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bwfByDQy
Subject: Re: [Buildroot] [PATCH 2/5] linux: select host-openssl for all
 architectures when building latest CIP version
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
> This is a follow-up for buildroot commit
> bba86304b0ac4ae266cfb52e54a239b0850b10ca to extend the fix to CIP
> kernels.
> 
> Fixes:
> aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
> aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
> arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
> arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
> armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
> microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
> mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
> or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
> riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
> s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
> sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
> sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
> x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/
> 
> Supersedes
> https://patchwork.ozlabs.org/project/buildroot/patch/20251101102346.109307-1-bernd@kuhls.net/
> and includes Edgar's comment.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668
> 
>  linux/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index bbd0e491cd..0baa52de0f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -187,9 +187,11 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
>  	bool "Use the architecture default configuration"
>  	# We know that the default configuration on many architectures
>  	# requires host-openssl, so select it for the latest kernel
> -	# version. This is mainly needed to fix autobuilder testing.
> +	# version and the latest CIP version.
> +	# This is mainly needed to fix autobuilder testing.
>  	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
> -	       BR2_LINUX_KERNEL_LATEST_VERSION
> +	       BR2_LINUX_KERNEL_LATEST_VERSION || \
> +	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	help
>  	  This option will use the default configuration for the
>  	  selected architecture. I.e, it is equivalent to running
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
