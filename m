Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB5C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F69060815;
	Thu, 26 Jun 2025 19:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gfeBUl9tnn5; Thu, 26 Jun 2025 19:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA3C26123B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3C26123B;
	Thu, 26 Jun 2025 19:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3101C154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4F360815
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lU5f8gtxNg7o for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2F706079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F706079E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F706079E
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:29:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso14306715e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750966158; x=1751570958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v/g+5S7+U5DIalty0hV1zUY7ydXcuwiugL1x0+ryJp8=;
 b=LloztJcZ1XKZksrVQRVtUKD0wUpqExvrKCUAcMaDIVYIAhS5FswNOHf/ws/8+GnZZj
 HRH+mgaceKmHRewzyK6fwTS9VWUz/nT2BotM6EJ67sH6i6cujHyzeGskWCQrNNZXAj/p
 6Ra9z6tbn1LByA2rBEx7yjpDqzmYbxTRxB31Vq89biQixoVHCQclzVpj6P2P9Bm+bcWr
 s+ajS6BRakeHiNZRKYHP1qQ3XawIZTJORrtAQWv9WGrICj1DVz7MwrzJpg+qv8ID7Bga
 mj4TFfK5/cGofdkq7CHQ/lsiPFBw9LmbxKhaAXGoCRoSpwmq+fvzNtTLIodo4ISoyQRW
 XWLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpe1gxYEDcmHbwBSDwIE/PkCLdw5oui0BsCetysCp7x1cK4ZHO78cBcxb5hTNa+xxFIlCzB+1zVNY=@buildroot.org
X-Gm-Message-State: AOJu0YwWLIr1wYrdBaaKap4nm196764QmiXtLK13GeX7XVnYXpr1hw5h
 DrI30IBOEs32O7AkxivEvy5L2C7gPOWPfH44hpy7xAaR7+o1mPLkt+kHUczJVl5bHNA=
X-Gm-Gg: ASbGncs3+UIwrZgTu9WKgtgcptS+PZqLNYhPjk7MtC0bxdT11mfnFY8Z7J5Z3w2sR49
 5TARHKcZQJtwed8KpnKZHheojzRy3ZMWkcXn/Xl5fohlRHpufwjtSSPUW40MNcKGdB3SMMs60CV
 W5IQJ/cRROIH+m58i4c8L2EtWxb7qxRbnS/IOtGmkFtGn7KKduHuoNhEjkiBYZ5blh6aypxiZUg
 mg5617jlFLlcQb8BMAr0X3HdBhgngJzDHfIrf3utMdwRJ5vYWJvDwRh86AV93Pw+t8KIgi5b+ir
 hYnHz5Og13e0VznNhUR5IuDmCEkGEpg0OIqD0jYScbv8g/Trm0qQGxGNTkSWZoIAUpF3K7Kaml+
 Iz18dnzQuhu4DjGT5swbMmPYC96xeYVKu
X-Google-Smtp-Source: AGHT+IEIQ872zMLzs/kS6mNtFp5RhttnWRxc2pcoVrS6RMgC4okYejh+O8PRnoqpPEbgqtm91cvuSg==
X-Received: by 2002:a05:600c:4747:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-4538ee578admr6377315e9.8.1750966157836; 
 Thu, 26 Jun 2025 12:29:17 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7386sm696051f8f.20.2025.06.26.12.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:29:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:29:09 +0200
Message-ID: <20250626192909.11873-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620062637.20844-1-bernd@kuhls.net>
References: <20250620062637.20844-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750966158; x=1751570958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/g+5S7+U5DIalty0hV1zUY7ydXcuwiugL1x0+ryJp8=;
 b=LpRK/K87JxgDd+6lUzvubz+We5gJQmtldTX58pdoTm41sAFFuyfos+Lnc1i8TCbxD7
 +xwg3cYFB1/Par+xg18jA3aSQDbYlZf1PfND6HaIZ9GlUEB4h2J/7Rmh2F1FowSfYi38
 iisJMiQTe+eKxILr5kiXPiji94fcbQDr27JqP/vGry+7FPw9yR1zh7C8nM430h4MW+NZ
 3UelGHw9Qz3n8mddgNaDPMkLO6DhbQ9Nv2MySX2L4KgFK6BXASGgceKEI7XrzCiBiAAv
 ZsDHGAES9YM5Jmabz2Mo0AgUV2hPBVQmrEdDa5Uu/p8gztrHqSckIo7Sgt4h3pUMAuz/
 v3XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LpRK/K87
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 15}.x series
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
>  linux/linux.hash                     | 6 +++---
>  package/linux-headers/Config.in.host | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 0ac84aa4b4..3dcdbd5128 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.15.2" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.15.3" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 38ba9b474d..db1da163a0 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,7 +1,7 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858  linux-6.15.2.tar.xz
> -sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
> -sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
> +sha256  12b50c89925438d9cd7385a0cafc9c433e6562ac5df00a21889fce9f548d65b0  linux-6.15.3.tar.xz
> +sha256  a7f3fe381f67eca4172e9b63efb61a14bd7f9e1278e03603d0ff5a93f270c24d  linux-6.12.34.tar.xz
> +sha256  713981ea26b20b476ba4ce880b76b21294576788d5db1c2188b167bcb06ecc56  linux-6.6.94.tar.xz
>  sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index d16aa265d8..8a27e52c4c 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -448,9 +448,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
>  	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.15.2"	if BR2_KERNEL_HEADERS_6_15
> +	default "6.6.94"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.34"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.15.3"	if BR2_KERNEL_HEADERS_6_15
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
