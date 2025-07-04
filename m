Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D047C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5603B812A8;
	Fri,  4 Jul 2025 06:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxJNnOyJsV9F; Fri,  4 Jul 2025 06:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91CB781426
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91CB781426;
	Fri,  4 Jul 2025 06:48:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C27857AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B416E813F8
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WltmNf4gCGCI for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 453868125E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 453868125E
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 453868125E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so470584f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611676; x=1752216476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IaqNzmkPZJtptioyds6Ds9Oc0Vz16BlKSfrz5Snbxk=;
 b=hfLluBaiQhkCoA1BPObgCRyIwYk9OHi0Xp2Edr+3d4jDYIxukg6qt56kEXXNEoz7IE
 SRkN3+fsZJPe+H0HXtVY3yZj5EGzEJBTS9CZTSAP4yx+3vlRGyfp3QVXiKgslCv5s4V6
 GsYBNMXsmOnWJypSv9sfxQXLl3jMqyLrbw5znhewzwzuTLVbiOtWICVy/ch/msyLe22A
 s556d2Njxu+7xfTuwy0sEYodknJyXCPWOMWhPRmIMDMFGJ/GIVBlJT/EGnjCw/bs/IS9
 IEPjIjJqdd4ChahmF3C5mwchoCLctXDcseXC4D//lIwPRG4vhwehRx+mkRY4DmJpPphs
 TmDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmDbjkT7JETvT4b4ov63TlDnT6pfFt2ajvX2/ffHIL7GNcGwY1ra8VnDjZpxeV+B6onv+s5Cmqwfg=@buildroot.org
X-Gm-Message-State: AOJu0YxclchOA80EnTzJ8/OtJ9C9KiXMnwhLQbN5as1sDChY3hjXII4u
 r52moVOJj9RKMduCOu8P6wR9tEhUWFLo9Ufo4NZ9OSas5PlyU6pQAyCb47mLW/Ho2Yc=
X-Gm-Gg: ASbGncsiPN+VR+70M3o4AGeVw75K9uvZrhBhmXvETZ8+Zy54RY8ZLzbRv4qwphzprfn
 ZHkvhke1qRwCoCGHcnJPtflR/zCub5RAGOpvJg+bKuTWnwVZd1PGoJGjLILmAFgKkpl/MEVFZRY
 8QN/9z478VTr5tlP46ncGxkOkWIfI2QFb4dNy/JiKvtW8rnI9YGD1dr0JHYvrwitWv3kk8Zg9ux
 GU2MgAYveW5KSeSmooj3i7Y6pkzk9juUOvaZ6FMJGQjAOdAw7Ce7qATfB0O284qhz2wsu8jWFTE
 7VUhYdNIveUheAbf+M0DfspHyV1eh8lmWMez0hK4j5eQvNqUOovGs2aqz8CUwTmPsgFbjojRlPx
 p81JlEXFCVQ==
X-Google-Smtp-Source: AGHT+IFl8gP3TmcGeoOyfcq++QcUDrxNGBpEmY65Fwmgm5dOpI+BTb/mAPFgh0YCBMsiXeH1KeIgQw==
X-Received: by 2002:a05:6000:2405:b0:3ab:27f9:e51 with SMTP id
 ffacd0b85a97d-3b497029481mr544629f8f.31.1751611676206; 
 Thu, 03 Jul 2025 23:47:56 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bde8c8sm47105845e9.31.2025.07.03.23.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:55 -0700 (PDT)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:54 +0200
Message-ID: <20250704064754.4065240-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
References: <20250624051736.2859733-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611676; x=1752216476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IaqNzmkPZJtptioyds6Ds9Oc0Vz16BlKSfrz5Snbxk=;
 b=J6YPCaegwG9YqIAI8Oo9Nv8MUCZOP4rj1UU3BkSd3fcv+EPESaNHkpdyD8Kk6HQMvM
 GVkGP8EgRXbxBnO3d5ByCfkNnMwyd27mpMhyAvO8lhDiI3avs2O4EDXgMVW0BXaiWBmj
 K2a9I1YUBFL22nRX8KnahSLglo+F9ijcQzTZ70Yj1ebVKuS1BDOxz6VfjJZdkw7EzcG9
 nCYIgKxNiWVJYmlaIpX2XBx2JLzgKgUDRaE1xNI9qOFgsNkXlJ62ft6Ic7jTVVZsondR
 7j7lvQ65KMpxKSPvG3pQFnney2JvBnWNA3OMgPSxIWCB38TKGdgIDg1zkPilJpkq0IeW
 XHbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J6YPCaeg
Subject: Re: [Buildroot] [PATCH] board/espressobin: Bump linux to v6.12.34
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
> Bump from v5.15.1 to the latest LTS, v6.12.34.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to 2025.05.x. Thanks

> ---
>  configs/globalscale_espressobin_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
> index 562e646b70..5b4f6dcf55 100644
> --- a/configs/globalscale_espressobin_defconfig
> +++ b/configs/globalscale_espressobin_defconfig
> @@ -1,12 +1,12 @@
>  BR2_aarch64=y
>  BR2_ARM_FPU_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.34"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
