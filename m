Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E9C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79055419ED;
	Thu, 26 Jun 2025 19:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atCNp3XpuuCp; Thu, 26 Jun 2025 19:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBBD402D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBBD402D5;
	Thu, 26 Jun 2025 19:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB67154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD44419DF
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XStLQuVXkL-c for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F2F6402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2F6402D5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F2F6402D5
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:56:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so692804f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967760; x=1751572560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtfVTfCq4rLV+wJAhpshVXIocgpEl3A6LdiXJmdTl5E=;
 b=rPfRffwG4Xj2GvkGWovF42/MqgpcyAH1oRDTcxtOmVci7xxnCU1Om+fAHBu71tSg36
 gXg8nMW6qyjc06rHc+ZLxXG3RrzFtulA8r88vUq/ABOm/wlw0ASD88DHd7v28BHAefBc
 WnqAWtuHrp1JXBGxlvP9NKgZgJQs/BiG2nLDPccgHtiXULaoI5LCwO8iLWOUVZ6Qmviq
 wIOErRbfmF0BRw46Xqw/jBm3RLRmOB5MyjjA0vAeJJbxCc2bpmGrKcnz6bns8aYozlUJ
 85mRPBAr02sDdffNIk8EQHV0CmPaf+uscrUB5VcYNoSn1tmftIYeak9HeE3MBnJKtcPe
 bvMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEikYvWB0/3Jc2np4IHO8ddAeUZbIRoCZF5xEI5kdTNiGJUzdOPlqWFpAhfn+4bg7/DqY/LEZ0Kk0=@buildroot.org
X-Gm-Message-State: AOJu0Yxmb/VbVeXP9R0OTvR2jgaiSo12wH7m6xQNI534ck+H1F//du6k
 qlnaj9lOMLSKnwmKrGLgog75/29gSgfKkTRmTwSAR8Gg5Q8/L+YIA8aFSD+ZNlx8gQfdiuBKktO
 GjFBa
X-Gm-Gg: ASbGnctkO+u8H1S3H2sHsV4fNW80Ai3q1/xSjX6GlJIZ6gs/0NiohvvbbnUYqtv+dLp
 3H7RLuuOb6LwfON9+nn39Lt8BGWbw3VmES0cn8ML4bkhknBlAUEvmeBpYiIbhKk6nlVGjqNSphI
 vD+wbAnmJN2vYwo5g9fILYIf4T8Te1iUJVdWl3PWs73KKmaV2owP7E5BQDNOe5VfJttLRPoSdOf
 SvXO3jSABEozmxkfC42VYBRSKuIYiVMdvRz+eicgTpp17TAGBBSKHxvY0vPCmDLTPBHL2oC+Py6
 zXI7ePbevXMpGS/G0S+EC81g7eUC0utgqpg/6YTInZJHr2YXNdVCSK7HMwD5CjB9qVdrUtKTCMW
 Il8GrrIMLVRefJWluyfXzbC+rc3rcxRN3
X-Google-Smtp-Source: AGHT+IE4b5C6gJIBAfeSQtTk6c1A14H/Wx8dFrp0fqMuSnM7ByEV4qWgoydsusrUuiESZzj0zr++9A==
X-Received: by 2002:a05:6000:2013:b0:3a4:f70e:abda with SMTP id
 ffacd0b85a97d-3a8fda35a5bmr848989f8f.10.1750967760435; 
 Thu, 26 Jun 2025 12:56:00 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fb20esm755598f8f.36.2025.06.26.12.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:56:00 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:55:51 +0200
Message-ID: <20250626195551.16248-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620062637.20844-1-bernd@kuhls.net>
References: <20250620062637.20844-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967760; x=1751572560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtfVTfCq4rLV+wJAhpshVXIocgpEl3A6LdiXJmdTl5E=;
 b=X1GgvTYtqea4QK3LSS8TtS64Mi0ZfCAHrLCwiCnEHJ6ednCXUji4is7E7fVfBxsCyX
 rx2W3TvEgz8ls7wRyJilMGKQGveJC5aMxAGBQiy5wyGwpaDJIaeIHN512mgKw/8O2pUb
 2q15fUMSnOjJipKBYppk2yIL080Rt/S9hRbK22wNwjl2eEenCE0Ub7OKyaGnKeAq9VDt
 BkBTbzm4gD3yplHvanODXfMg3YhfpF9ZsRX0W/NwNF8+emT8cKCDZL3UoCR/We0YsOXN
 JpE1r1ONJV/Ysd9MdYS1V4lUuuezMbODU2pBNOlXUBvoA1u6SXQ+WjCQGW+ERDEtNOFx
 vFiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X1GgvTYt
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

Applied to 2025.05.x. Thanks

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
