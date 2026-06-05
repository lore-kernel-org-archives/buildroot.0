Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D574CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DA5610BD;
	Fri,  5 Jun 2026 12:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kss230hN_USV; Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493AA610B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663824;
	bh=IDmJT2dcmYkm2bOVwzsNUoqUedPu8TLQeOyVeM6d+Ns=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XvCxqoaD7pX2c6vAlDfFo++ctGWPlHPBMgdQbZlmkpKprwpMXRUbsKv+DPxmEIOJa
	 D7nXhjIPI7TjSz7x2IZvf1W65hF919S89ntwuexu5LisDno32k19uKmu5sgmlpVtxm
	 M6z41FE1fg7t1LcHCa5jXoDpANo1IQAWgFBkMrskhi0A/2S52kbC7n8ZbX3suvj+yG
	 3Yvm1ovpDns923/E6VV9X30EcciFz8Rng9DSRQAe4rxf3sDSl87CrMMDtPNYxuwTS5
	 GIi1RsP9n9UdSdlPM+xZcew5dkxGqulFW16sPhEdrWkpx3bO5/ISBKLN/SWUIb6X7q
	 J4LBAeNcHa8Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493AA610B7;
	Fri,  5 Jun 2026 12:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0DDF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA124037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZK7hcwAWcEb for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A6534037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A6534037E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A6534037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490a765d410so19866285e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663815; x=1781268615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/hCVNkwQT5hjg87Rm4TlrgkUkOt576JJYtGBiSLkRaU=;
 b=IRcGiFFxIKrmlyNfPYx5fZeRiTyrVNEhlHpKpuLK77nhCb+CbbFO80PbKABcwLTg+j
 W3PLtwK5TlbxGyncVcWaqFttdrZpXpftVA/EnwK14vfbzOxnxjIJJNaye0jV7EFYKzsh
 r+pQ4vYts5TqwVUpuGevRHeuFaO6uihSvm2mWMtC7UrPHFmFsMT1fPfAdTehMFE2CXkg
 xuh3OlLY2doERFLCG04f6Lji7KSB1xd3zPDUu4fgmOoiClsUSxyQqteodiw2qnTHMlge
 kydDfUTOSyUqzFDcEM5IUXSqUBAxhGjhYlwr42PdMX9R/TcWobgD0wck6WbF/00+DxAx
 juig==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DChYcpcNDmNpMHqP/9I05ZTDw/MYGQ4DlLqy9fyIU4oLrPoukr3MgvOWD49cwLKMf/Fgzz+xAEJo=@buildroot.org
X-Gm-Message-State: AOJu0Yx/GDlC6PUNU0rVJappoKajHG68fFwTHEguS2VkCm4KPTzAi8Lo
 uO/NEgR8LcgY8XlNC2YvtCR3SyD7QnExQ97+mV/ne7z1LLCj+h9n+6SpjwrSxjcAOT9TjuVM1dv
 q0h2Q
X-Gm-Gg: Acq92OE9pPuHhHJsOouBkBgG2XKgd0jJUfoOMpuNKn8WoQPYvPTBAOHU2EINwe4aQP+
 hOSF6EGWUQtCAiO6j8XtKlQOAB3c5+2ViNtcgmL0b9r5V3WBEnnVPLqh/mBw3x3jNHbvGPMdUSI
 xGB/3dSSI0M48z0BOfY0yYi9vf1m3CHnEnwH6c6fXE0DzATmMlnIUDzYpNkrd0Ka7PrKWuRZLkZ
 Dd/WAhRWPw6VjwmTfzJvVwDBCsaogHtdgX7Rk60fBFANvaP+Xrmyzjv05I0A34unPsjUYBnMNNY
 ZvS7fV7p7GbZFo1jvv4CE3EqJOI8Wuj4QJITqV2GVrB8O6bfnTzg1GNaoRZvi3bSZOOYlG0+nkt
 pxcKGDdl5/NqQbxmluJ7AUGm6gGbhwHcZ8xVbQ9KZQaJbmejKDKJBC5iHxKb4190L2uNtng8+bn
 8J4xhrBIGMcR/LdARLKJNeP1gVKQ==
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id
 5b1f17b1804b1-490c25b09a2mr57674005e9.16.1780663815241; 
 Fri, 05 Jun 2026 05:50:15 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fb24sm26781631f8f.34.2026.06.05.05.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:14 -0700 (PDT)
To: Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:14 +0200
Message-ID: <20260605125014.272815-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260326101033.587997-1-heiko@sntech.de>
References: <20260326101033.587997-1-heiko@sntech.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663815; x=1781268615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hCVNkwQT5hjg87Rm4TlrgkUkOt576JJYtGBiSLkRaU=;
 b=fLst9zw6D88+d/b76/7YrS7QgjLboSymZSUvaFB/HtNDSELPa4XuS7MMFyDScpmMRp
 fjCm3dl9+V7KJPdc9sE2uJ35CYjzCGWmoqEhYysn5jiIGnEUb68ykzbj0qD4HypVEloG
 GhAGUKfy5d0WKKKLKY6Yugy+Rd/lQs+U4pyqnNDKzTOTw1DDu+r3j5GSC3OGP5+IOc0Q
 MbpVBK70TZyezcWK75aPcgu8JgdS3sfHjELskSxdtJslYew3nQJnuKNhmUHZj+IfPETv
 NBPBux8cywcmb66/hj4+/CXtcb0atpJrhBPxGBou8ntzHJ4HvBkO7kLDmL/jo99MeoQK
 WoFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fLst9zw6
Subject: Re: [Buildroot] [PATCH v2] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
> Trusted-Firmware has been using a number of CPE identifiers in the past
> but especially after v2.4, the correct identifier would be similar
> to cpe:2.3:o:arm:trusted_firmware-a:2.12:rc0:*:*:-:*:*:*
> 
>   https://nvd.nist.gov/products/cpe/detail/65DEC230-1CD5-40DB-903A-22537D1E44FE
> 
> Add the relevant CPE fields to the trusted-firmware package.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> changes in v2:
> - remove lts- from lts releases
> - remove "v" from version, to actually match version used in CPEs
> 
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index b81ce0d827..c3c4a581da 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -5,6 +5,10 @@
>  ################################################################################
>  
>  ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
> +ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
> +ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
>  # Handle custom ATF tarballs as specified by the configuration
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
